<?php
include 'config/koneksi.php';

$nama = $_GET['nama'];
$query = mysqli_query($conn, "SELECT * FROM wisata_jogja_final WHERE nama_wisata='$nama'");
$data = mysqli_fetch_assoc($query);
?>

<!DOCTYPE html>
<html>
<head>
    <title>Detail Wisata</title>
    <link rel="stylesheet" href="assets/style.css">
</head>
<body>

<div class="container">
    <a href="rekomendasi.php" class="btn">Kembali</a>

    <div class="card">
        <h2><?= $data['nama_wisata']; ?></h2>
        <p><b>Rating:</b> <?= $data['rating']; ?></p>
        <p><b>Visitors:</b> <?= $data['visitors']; ?></p>
        <p><b>Kategori:</b> <?= $data['kategori']; ?></p>
        <p><b>Revenue:</b> <?= $data['revenue']; ?></p>
        <p><b>Akomodasi:</b> <?= $data['akomodasi']; ?></p>
        <p><b>Deskripsi:</b></p>
        <p><?= $data['deskripsi']; ?></p>
    </div>
</div>

</body>
</html>