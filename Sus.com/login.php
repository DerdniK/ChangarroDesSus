<?php
session_start();
require 'config.php';
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $email = $_POST['email'] ?? '';
    $password = $_POST['password'] ?? '';
    $stmt = $pdo->prepare('SELECT * FROM usuarios WHERE email = ?');
    $stmt->execute([$email]);
    $user = $stmt->fetch();
    if ($user && password_verify($password, $user['password'])) {
        $_SESSION['user_id'] = $user['id'];
        $_SESSION['is_admin'] = ($user['email'] === 'admin@admin.com');
        header('Location: index.php');
        exit;
    } else {
        $error = 'Credenciales incorrectas';
    }
}
?>
<!DOCTYPE html>
<html lang="es">
<head><meta charset="UTF-8"><title>Login</title>
<link rel="stylesheet" href="style.css"></head>
<body>
<div class="container">
<h2>Iniciar sesión</h2>
<form method="POST">
    Email: <input type="email" name="email" required><br>
    Contraseña: <input type="password" name="password" required><br>
    <button type="submit">Entrar</button>
</form>
<?php if (!empty($error)) echo '<p style="color:red">'.$error.'</p>'; ?>
<p>¿No tienes cuenta? <a href="register.php">Regístrate</a></p>
</div>
</body>
</html>
