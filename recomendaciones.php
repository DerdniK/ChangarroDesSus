<?php
if (session_status() === PHP_SESSION_NONE) session_start();
require 'config.php';
function obtenerRecomendaciones($pdo, $usuario_id) {
    // Obtener productos en el carrito
    $sql = 'SELECT producto_id, tematica, personaje, estilo FROM productos p JOIN carrito c ON p.id = c.producto_id WHERE c.usuario_id = ?';
    $stmt = $pdo->prepare($sql);
    $stmt->execute([$usuario_id]);
    $carrito_ids = [];
    $tematicas = $personajes = $estilos = [];
    foreach ($stmt->fetchAll() as $row) {
        $carrito_ids[] = $row['producto_id'];
        if ($row['tematica']) $tematicas[] = $row['tematica'];
        if ($row['personaje']) $personajes[] = $row['personaje'];
        if ($row['estilo']) $estilos[] = $row['estilo'];
    }
    if (!$tematicas && !$personajes && !$estilos) return [];
    // Prioridad: personaje > tematica > estilo
    $where = [];
    $params = [];
    if ($personajes) {
        $where[] = 'personaje IN (' . implode(',', array_fill(0, count($personajes), '?')) . ')';
        $params = array_merge($params, $personajes);
    }
    if ($tematicas) {
        $where[] = 'tematica IN (' . implode(',', array_fill(0, count($tematicas), '?')) . ')';
        $params = array_merge($params, $tematicas);
    }
    if ($estilos) {
        $where[] = 'estilo IN (' . implode(',', array_fill(0, count($estilos), '?')) . ')';
        $params = array_merge($params, $estilos);
    }
    $sql = 'SELECT * FROM productos WHERE (' . implode(' OR ', $where) . ')';
    if ($carrito_ids) {
        $sql .= ' AND id NOT IN (' . implode(',', array_fill(0, count($carrito_ids), '?')) . ')';
        $params = array_merge($params, $carrito_ids);
    }
    $sql .= ' LIMIT 6';
    $stmt = $pdo->prepare($sql);
    $stmt->execute($params);
    return $stmt->fetchAll();
}
if (!isset($_SESSION['user_id'])) {
    header('Location: login.php');
    exit;
}
$recomendados = obtenerRecomendaciones($pdo, $_SESSION['user_id']);
?>
<!DOCTYPE html>
<html lang="es">
<head><meta charset="UTF-8"><title>Recomendaciones</title>
<link href="https://fonts.googleapis.com/css2?family=Titan+One&family=Zain:wght@400;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="style.css"></head>
<body>
<div class="container">
<h2>Tal vez te guste:</h2>
<?php if ($recomendados): ?>
    <div>
    <?php foreach ($recomendados as $p): ?>
        <div class="card">
            <img src="<?= htmlspecialchars($p['imagen']) ?>" width="100"><br>
            <b><?= htmlspecialchars($p['nombre']) ?></b><br>
            <?= htmlspecialchars($p['descripcion']) ?><br>
            <b>$<?= number_format($p['precio'],2) ?></b><br>
        </div>
    <?php endforeach; ?>
    </div>
<?php else: ?>
    <p>No hay recomendaciones por ahora.</p>
<?php endif; ?>
<a href="index.php">Volver a la tienda</a>
</div>
</body>
</html>
