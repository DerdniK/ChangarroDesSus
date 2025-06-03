<?php
session_start();
require 'config.php';

// Redirigir si no hay categoría seleccionada
if (!isset($_GET['categoria'])) {
    header('Location: index.php?categoria=todos');
    exit;
}

// Obtener la categoría seleccionada
$categoria = $_GET['categoria'] ?? 'todos';

// Definir categorías válidas
$categorias = [
    'posters' => 'Posters',
    'botones' => 'Botones',
    'stickers' => 'Stickers'
];

// Obtener productos
if ($categoria !== 'todos' && isset($categorias[$categoria])) {
    $stmt = $pdo->prepare('SELECT * FROM productos WHERE categoria = ?');
    $stmt->execute([$categoria]);
} else {
    $stmt = $pdo->query('SELECT * FROM productos');
}
$productos = $stmt->fetchAll();
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Changarro de Sus</title>
    <link href="https://fonts.googleapis.com/css2?family=Titan+One&family=Zain:wght@400;900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
</head>
<body>
<div class="container">
    <h1 class="titan-one-regular">Changarro de Sus</h1>

    <?php if (isset($_SESSION['user_id'])): ?>
        <a href="carrito.php">Ver carrito</a> | <a href="logout.php">Cerrar sesión</a>
        <?php if (!empty($_SESSION['is_admin'])): ?>
            | <a href="admin.php">Panel Admin</a>
        <?php endif; ?>
    <?php else: ?>
        <a href="login.php">Iniciar sesión</a>
    <?php endif; ?>

    <hr>

    <!-- Topbar de categorías -->
    <div class="topbar">
        <b>Categorías:</b>
        <a href="index.php?categoria=todos"<?= $categoria === 'todos' ? ' class="selected"' : '' ?>>Todos</a>
        <?php foreach ($categorias as $key => $label): ?>
            <a href="index.php?categoria=<?= $key ?>"<?= $categoria === $key ? ' class="selected"' : '' ?>><?= $label ?></a>
        <?php endforeach; ?>
    </div>

    <div class="productos">
        <?php foreach ($productos as $p): ?>
            <div class="card">
                <img src="<?= htmlspecialchars($p['imagen']) ?>" width="100" alt="<?= htmlspecialchars($p['nombre']) ?>"><br>
                <b><?= htmlspecialchars($p['nombre']) ?></b><br>
                <?= htmlspecialchars($p['descripcion']) ?><br>
                <b>$<?= number_format($p['precio'], 2) ?></b><br>
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
</div>
</body>
</html>
