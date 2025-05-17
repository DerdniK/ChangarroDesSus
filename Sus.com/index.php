<?php
session_start();
require 'config.php';
// Filtro de categoría
$categoria = $_GET['categoria'] ?? '';
$categorias = ['posters' => 'Posters', 'botones' => 'Botones', 'stickers' => 'Stickers'];
if ($categoria && isset($categorias[$categoria])) {
    $stmt = $pdo->prepare('SELECT * FROM productos WHERE categoria = ?');
    $stmt->execute([$categoria]);
} else {
    $stmt = $pdo->query('SELECT * FROM productos');
}
$productos = $stmt->fetchAll();
?>
<!DOCTYPE html>
<html lang="es">
<head><meta charset="UTF-8"><title>Changarro de Sus</title>
<link rel="stylesheet" href="style.css"></head>
<body>
<div class="container">
<h1>Changarro de Sus</h1>
<?php if (isset($_SESSION['user_id'])): ?>
    <a href="carrito.php">Ver carrito</a> | <a href="logout.php">Cerrar sesión</a>
    <?php if (isset($_SESSION['is_admin']) && $_SESSION['is_admin']): ?>
        | <a href="admin.php">Panel Admin</a>
    <?php endif; ?>
<?php else: ?>
    <a href="login.php">Iniciar sesión</a>
<?php endif; ?>
<hr>
<!-- Topbar de categorías mejorada -->
<div class="topbar">
    <b>Categorías:</b>
    <a href="index.php"<?= $categoria==''?' class="selected"':'' ?>>Todos</a>
    <?php foreach ($categorias as $key => $label): ?>
        <a href="index.php?categoria=<?= $key ?>"<?= $categoria==$key?' class="selected"':'' ?>><?= $label ?></a>
    <?php endforeach; ?>
</div>
<div>
<?php foreach ($productos as $p): ?>
    <div class="card">
        <img src="<?= htmlspecialchars($p['imagen']) ?>" width="100"><br>
        <b><?= htmlspecialchars($p['nombre']) ?></b><br>
        <?= htmlspecialchars($p['descripcion']) ?><br>
        <b>$<?= number_format($p['precio'],2) ?></b><br>
        <form method="POST" action="carrito.php">
            <input type="hidden" name="producto_id" value="<?= $p['id'] ?>">
            <input type="number" name="cantidad" value="1" min="1" style="width:40px;">
            <button type="submit">Agregar al carrito</button>
        </form>
    </div>
<?php endforeach; ?>
</div>
<?php if (isset($_SESSION['user_id'])): ?>
    <hr>
    <?php include 'recomendaciones.php'; ?>
<?php endif; ?>
</body>
</html>
