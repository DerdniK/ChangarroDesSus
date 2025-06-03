<?php
session_start();
require 'config.php';
if (!isset($_SESSION['user_id'])) {
    header('Location: login.php');
    exit;
}
// Agregar al carrito
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['producto_id'])) {
    $producto_id = (int)$_POST['producto_id'];
    $cantidad = (int)($_POST['cantidad'] ?? 1);
    $usuario_id = $_SESSION['user_id'];
    $stmt = $pdo->prepare('SELECT * FROM carrito WHERE usuario_id = ? AND producto_id = ?');
    $stmt->execute([$usuario_id, $producto_id]);
    if ($row = $stmt->fetch()) {
        $stmt = $pdo->prepare('UPDATE carrito SET cantidad = cantidad + ? WHERE id = ?');
        $stmt->execute([$cantidad, $row['id']]);
    } else {
        $stmt = $pdo->prepare('INSERT INTO carrito (usuario_id, producto_id, cantidad) VALUES (?, ?, ?)');
        $stmt->execute([$usuario_id, $producto_id, $cantidad]);
    }
}
// Eliminar del carrito
if (isset($_GET['eliminar'])) {
    $id = (int)$_GET['eliminar'];
    $stmt = $pdo->prepare('DELETE FROM carrito WHERE id = ?');
    $stmt->execute([$id]);
}
// Obtener productos del carrito
$stmt = $pdo->prepare('SELECT c.id, p.nombre, p.precio, c.cantidad FROM carrito c JOIN productos p ON c.producto_id = p.id WHERE c.usuario_id = ?');
$stmt->execute([$_SESSION['user_id']]);
$items = $stmt->fetchAll();
$total = 0;
foreach ($items as $item) {
    $total += $item['precio'] * $item['cantidad'];
}
?>
<!DOCTYPE html>
<html lang="es">
<head><meta charset="UTF-8"><title>Carrito</title>
<link rel="stylesheet" href="style.css"></head>
<body>
<div class="container">
<h2>Carrito de compras</h2>
<a href="index.php">Volver a la tienda</a>
<table><tr><th>Producto</th><th>Cantidad</th><th>Precio</th><th>Acción</th></tr>
<?php foreach ($items as $item): ?>
<tr><td><?= htmlspecialchars($item['nombre']) ?></td><td><?= $item['cantidad'] ?></td><td>$<?= number_format($item['precio'],2) ?></td><td><a href="carrito.php?eliminar=<?= $item['id'] ?>">Eliminar</a></td></tr>
<?php endforeach; ?>
</table>
<p><b>Total: $<?= number_format($total,2) ?></b></p>
</div>
</body>
</html>
