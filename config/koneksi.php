<?php
$conn = mysqli_connect("localhost", "root", "", "wisata_jogja");

if (!$conn) {
    die("Koneksi database gagal: " . mysqli_connect_error());
}
?>