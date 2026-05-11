<?php
session_start();
include '../config/koneksi.php';

if (!isset($_SESSION['admin'])) {
    header("Location: ../login.php");
    exit;
}

if (isset($_POST['simpan'])) {
    $nama = mysqli_real_escape_string($conn, $_POST['nama_wisata']);
    $rating = $_POST['rating'];
    $visitors = $_POST['visitors'];
    $kategori = mysqli_real_escape_string($conn, $_POST['kategori']);
    $revenue = $_POST['revenue'];
    $deskripsi = mysqli_real_escape_string($conn, $_POST['deskripsi']);

    mysqli_query($conn, "
        INSERT INTO wisata_jogja_final (nama_wisata, rating, visitors, kategori, revenue, deskripsi)
        VALUES ('$nama', '$rating', '$visitors', '$kategori', '$revenue', '$deskripsi')
    ");

    header("Location: data.php");
    exit;
}
?>

<!DOCTYPE html>
<html lang="id">
<head>
<meta charset="UTF-8">
<title>Tambah Data</title>
<style>
*{box-sizing:border-box}
body{margin:0;font-family:Arial;background:#eef3f9;color:#12375d}
.sidebar{width:260px;height:100vh;background:#23477f;color:white;position:fixed;left:0;top:0;padding:35px 30px}
.sidebar h2{font-size:28px;margin-bottom:35px}
.sidebar a{display:block;color:white;text-decoration:none;font-size:18px;margin-bottom:15px;padding:13px 14px;border-radius:12px}
.sidebar a:hover,.sidebar a.active{background:#155d9b}
.main{margin-left:260px;padding:45px 55px}
.card{background:white;padding:28px;border-radius:18px;box-shadow:0 10px 25px rgba(0,0,0,.06);max-width:850px}
input,select,textarea{width:100%;padding:14px 16px;margin:8px 0 18px;border:1px solid #d6dce7;border-radius:10px;font-size:15px}
textarea{height:130px}
button,.btn-back{background:#23477f;color:white;border:none;text-decoration:none;padding:12px 20px;border-radius:9px;cursor:pointer}
.btn-back{display:inline-block;background:#777;margin-left:8px}
</style>
</head>
<body>

<?php include 'sidebar.php'; ?>

<div class="main">
    <h1>Tambah Data Wisata</h1>

    <div class="card">
        <form method="POST">
            <label>Nama Wisata</label>
            <input type="text" name="nama_wisata" required>

            <label>Rating</label>
            <input type="number" step="0.1" name="rating" required>

            <label>Visitors</label>
            <input type="number" name="visitors" required>

            <label>Kategori</label>
            <input type="text" name="kategori" required>

            <label>Revenue</label>
            <input type="number" name="revenue" required>

            <label>Deskripsi</label>
            <textarea name="deskripsi" required></textarea>

            <button type="submit" name="simpan">Simpan</button>
            <a href="data.php" class="btn-back">Batal</a>
        </form>
    </div>
</div>

</body>
</html> 