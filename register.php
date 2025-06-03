<?php
require 'config.php';
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $nombre = $_POST['nombre'] ?? '';
    $email = $_POST['email'] ?? '';
    $password = $_POST['password'] ?? '';
    if (!preg_match('/^[A-Za-zÁÉÍÓÚáéíóúÑñ ]{3,40}$/u', $nombre)) {
        $error = 'Nombre inválido. Usa solo letras y espacios (3-40 caracteres).';
    } elseif (!preg_match('/^(?:[a-zA-Z0-9!#$%&\'*+\/=?^_`{|}~-]+(?:\.[a-zA-Z0-9!#$%&\'*+\/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\.)+[a-zA-Z]{2,}$/', $email)) {
        $error = 'Correo electrónico inválido.';
    } elseif (strlen($password) < 6) {
        $error = 'La contraseña debe tener al menos 6 caracteres.';
    } else {
        $hash = password_hash($password, PASSWORD_DEFAULT);
        try {
        $stmt = $pdo->prepare('INSERT INTO usuarios (nombre, email, password) VALUES (?, ?, ?)');
        $stmt->execute([$nombre, $email, $hash]);
        header('Location: login.php');
        exit;    } catch (PDOException $e) {
        $error = 'Error al registrar: ' . $e->getMessage();
    }
}
}

?>
<!DOCTYPE html>
<html lang="es">
<head><meta charset="UTF-8"><title>Registro</title>
<link href="https://fonts.googleapis.com/css2?family=Titan+One&family=Zain:wght@400;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="style.css"></head>
<body>
<div class="container">
<h2>Registro de usuario</h2>
<form method="POST">
    Nombre: <input type="text" name="nombre" required><br>
    Email: <input type="email" name="email" required><br>
    Contraseña: <input type="password" name="password" required><br>
    <button type="submit">Registrarse</button>
</form>
<?php if (!empty($error)) echo '<p style="color:red">'.$error.'</p>'; ?>
<p>¿Ya tienes cuenta? <a href="login.php">Inicia sesión</a></p>
</div>
</body>
</html>
