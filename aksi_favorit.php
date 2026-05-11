<?php
include 'config/koneksi.php';

$nama = $_POST['nama'] ?? '';

if ($nama != '') {

    // cek sudah ada belum
    $cek = mysqli_query($conn, "SELECT * FROM favorit WHERE nama_wisata='$nama'");

    if (mysqli_num_rows($cek) == 0) {
        mysqli_query($conn, "INSERT INTO favorit (nama_wisata) VALUES ('$nama')");
    } else {
        mysqli_query($conn, "DELETE FROM favorit WHERE nama_wisata='$nama'");
    }
}

echo "ok";
?>