<?php
session_start();
include '../config/koneksi.php';

if (!isset($_SESSION['admin'])) {
    header("Location: ../login.php");
    exit;
}

$id = $_GET['id'] ?? 0;

mysqli_query($conn, "DELETE FROM wisata_jogja_final WHERE id='$id'");

header("Location: data.php");
exit;
?>