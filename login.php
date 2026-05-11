<?php
session_start();
include 'config/koneksi.php';

$error = "";

if (isset($_POST['login'])) {
    $username = $_POST['username'];
    $password = $_POST['password'];

    $query = mysqli_query($conn, "SELECT * FROM admin WHERE username='$username' AND password='$password'");
    
    if (mysqli_num_rows($query) > 0) {
        $_SESSION['admin'] = $username;
        header("Location: admin/dashboard.php");
        exit;
    } else {
        $error = "Username atau password salah!";
    }
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Login Admin</title>
    <link rel="stylesheet" href="assets/style.css">
</head>
<body>

<div class="login-box">
    <h2>Login Admin</h2>

    <?php if ($error != "") { ?>
        <p class="error"><?= $error; ?></p>
    <?php } ?>

    <form method="POST">
        <input type="text" name="username" placeholder="Username" required>
        <input type="password" name="password" placeholder="Password" required>
        <button type="submit" name="login">Login</button>
    </form>

    <a href="index.php">Kembali</a>
</div>

</body>
</html>