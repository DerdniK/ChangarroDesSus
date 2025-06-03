<?php
session_start();
require 'config.php';
if (!isset($_SESSION['user_id']) || !isset($_SESSION['is_admin']) || !$_SESSION['is_admin']) {
    header('Location: login.php');
    exit;
}
// Agregar producto
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['agregar'])) {
    $nombre = $_POST['nombre'] ?? '';
    $descripcion = $_POST['descripcion'] ?? '';
    $precio = $_POST['precio'] ?? 0;
    $categoria = $_POST['categoria'] ?? '';
    $imagen = $_POST['imagen'] ?? '';
    $tematica = $_POST['tematica'] ?? '';
    $personaje = $_POST['personaje'] ?? '';
    $estilo = $_POST['estilo'] ?? '';
    $metadatos = json_encode([
        'tematica' => $tematica,
        'personaje' => $personaje,
        'estilo' => $estilo
    ]);
    $stmt = $pdo->prepare('INSERT INTO productos (nombre, descripcion, precio, categoria, imagen, tematica, personaje, estilo, metadatos) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)');
    $stmt->execute([$nombre, $descripcion, $precio, $categoria, $imagen, $tematica, $personaje, $estilo, $metadatos]);
}
// Eliminar producto
if (isset($_GET['eliminar'])) {
    $id = (int)$_GET['eliminar'];
    $stmt = $pdo->prepare('DELETE FROM productos WHERE id = ?');
    $stmt->execute([$id]);
}
$productos = $pdo->query('SELECT * FROM productos')->fetchAll();
?>
<!DOCTYPE html>
<html lang="es">
<head><meta charset="UTF-8"><title>Panel Admin</title>
<link rel="stylesheet" href="style.css"></head>
<body>
<div class="container">
<h2>Panel de Administrador</h2>
<a href="index.php">Volver a la tienda</a>
<h3>Agregar producto</h3>
<form method="POST">
    Nombre: <input name="nombre" required><br>
    Descripción: <input name="descripcion"><br>
    Precio: <input name="precio" type="number" step="0.01" required><br>
    Categoría: 
    <select name="categoria" required>
        <option value="posters">Posters</option>
        <option value="botones">Botones</option>
        <option value="stickers">Stickers</option>
    </select><br>
    Imagen (URL): <input name="imagen"><br>
    Temática: <input name="tematica"><br>
    Personaje: <input name="personaje"><br>
    Estilo: <input name="estilo"><br>
    <button type="submit" name="agregar">Agregar</button>
</form>
<h3>Productos existentes</h3>
<table><tr><th>ID</th><th>Nombre</th><th>Acción</th></tr>
<?php foreach ($productos as $p): ?>
<tr><td><?= $p['id'] ?></td><td><?= htmlspecialchars($p['nombre']) ?></td><td><a href="admin.php?eliminar=<?= $p['id'] ?>" onclick="return confirm('¿Eliminar?')">Eliminar</a></td></tr>
<?php endforeach; ?>
</table>
</div>
</body>
</html>
