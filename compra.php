<?php
session_start();
require 'config.php';

if (!isset($_SESSION['user_id'])) {
    header('Location: login.php');
    exit;
}

$usuario_id = $_SESSION['user_id'];
$total = 0;

$stmt = $pdo->prepare('SELECT c.cantidad, p.nombre, p.precio, c.producto_id FROM carrito c JOIN productos p ON c.producto_id = p.id WHERE c.usuario_id = ?');
$stmt->execute([$usuario_id]);
$items = $stmt->fetchAll();

foreach ($items as $item) {
    $total += $item['precio'] * $item['cantidad'];
}

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['nombre'])) {
    $nombre = $_POST['nombre'];
    $telefono = $_POST['telefono'];
    $email = $_POST['email'];
    $direccion = $_POST['direccion'];
    $ciudad = $_POST['ciudad'];
    $codigo_postal = $_POST['codigo_postal'];
    $tarjeta_numero = $_POST['tarjeta_numero'];
    $tarjeta_nombre = $_POST['tarjeta_nombre'];
    $tarjeta_expiracion = $_POST['tarjeta_expiracion'];
    $tarjeta_cvv = $_POST['tarjeta_cvv'];

    if (empty($tarjeta_numero) || empty($tarjeta_nombre) || empty($tarjeta_expiracion) || empty($tarjeta_cvv)) {
        die('Faltan datos de tarjeta.');
    }

    $fecha = date('Y-m-d H:i:s');

    $stmt = $pdo->prepare('INSERT INTO compras (usuario_id, nombre_cliente, telefono, email, direccion, ciudad,codigo_postal,total,fecha,tarjeta_numero,tarjeta_nombre,tarjeta_expiracion) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)');
    $stmt->execute([$usuario_id, $nombre, $telefono, $email, $direccion, $ciudad, $codigo_postal, $total, $fecha, $tarjeta_numero, $tarjeta_nombre,$tarjeta_expiracion]);
    $compra_id = $pdo->lastInsertId();

    foreach ($items as $item) {
        $stmt_detalle = $pdo->prepare('INSERT INTO compras_detalles (compra_id, producto_id, cantidad) VALUES (?, ?, ?)');
        $stmt_detalle->execute([$compra_id, $item['producto_id'], $item['cantidad']]);
    }

    $stmt = $pdo->prepare('DELETE FROM carrito WHERE usuario_id = ?');
    $stmt->execute([$usuario_id]);

    header('Location: gracias.php');
    exit;
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Finalizar compra</title>
    <link href="https://fonts.googleapis.com/css2?family=Titan+One&family=Zain:wght@400;900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
</head>
<body>
<h2>Resumen de tu compra</h2>
<?php if (count($items) > 0): ?>
    <table border="1">
        <tr><th>Producto</th><th>Cantidad</th><th>Precio</th></tr>
        <?php foreach ($items as $item): ?>
            <tr>
                <td><?= htmlspecialchars($item['nombre']) ?></td>
                <td><?= $item['cantidad'] ?></td>
                <td>$<?= number_format($item['precio'] * $item['cantidad'], 2) ?></td>
            </tr>
        <?php endforeach; ?>
    </table>
    <p><strong>Total: $<?= number_format($total, 2) ?></strong></p>
    <a href="index.php">Volver a la tienda</a>
<?php else: ?>
    <p>Tu carrito está vacío.</p>
    <a href="index.php">Volver a la tienda</a>
    <?php exit; ?>
<?php endif; ?>

<h2>Datos del cliente</h2>
<form method="post" action="">
    <label>Nombre completo: <input type="text" name="nombre" required></label><br>
    <label>Teléfono: <input type="text" name="telefono" required></label><br>
    <label>Email: <input type="email" name="email" required></label><br>
    <label>Dirección: <input type="text" name="direccion" required></label><br>
    <label>Ciudad: <input type="text" name="ciudad" required></label><br>
    <label>Código postal: <input type="text" name="codigo_postal" required></label><br><br>

    <h3>Pago con tarjeta</h3>
    <label>Número de tarjeta: <input type="text" name="tarjeta_numero" required></label><br>
    <label>Nombre en la tarjeta: <input type="text" name="tarjeta_nombre" required></label><br>
    <label>Fecha de expiración (MM/AA): <input type="text" name="tarjeta_expiracion" required></label><br>
    <label>CVV: <input type="text" name="tarjeta_cvv" required></label><br><br>

    <button type="submit">Confirmar compra</button><br>
</form>
</body>
</html>
