<?php
session_start();
include '../config/koneksi.php';

if (!isset($_SESSION['admin'])) {
    header("Location: ../login.php");
    exit;
}

$totalWisata = mysqli_num_rows(mysqli_query($conn, "SELECT * FROM wisata_jogja_final"));
$totalLike = mysqli_num_rows(mysqli_query($conn, "SELECT * FROM favorit"));

$like = mysqli_query($conn, "
    SELECT nama_wisata, COUNT(*) AS total_like
    FROM favorit
    GROUP BY nama_wisata
    ORDER BY total_like DESC
");
?>

<!DOCTYPE html>
<html lang="id">
<head>
<meta charset="UTF-8">
<title>Dashboard Admin</title>
<style>
*{box-sizing:border-box}
body{margin:0;font-family:Arial,sans-serif;background:#eef3f9;color:#12375d}
.sidebar{width:260px;height:100vh;background:#23477f;color:white;position:fixed;left:0;top:0;padding:35px 30px}
.sidebar h2{font-size:28px;margin-bottom:35px}
.sidebar a{display:block;color:white;text-decoration:none;font-size:18px;margin-bottom:15px;padding:13px 14px;border-radius:12px}
.sidebar a:hover,.sidebar a.active{background:#155d9b}
.main{margin-left:260px;padding:45px 55px}
h1{font-size:34px;margin-bottom:25px}
.stat{display:grid;grid-template-columns:1fr 1fr;gap:22px;margin-bottom:22px}
.card{background:white;padding:28px;border-radius:18px;box-shadow:0 10px 25px rgba(0,0,0,.06);margin-bottom:22px}
.card h3{margin-bottom:18px;font-size:22px}
.card h2{font-size:30px}
table{width:100%;border-collapse:collapse;margin-top:20px;border-radius:12px;overflow:hidden}
th{background:#0b3f70;color:white;padding:15px;text-align:left}
td{padding:15px;border-bottom:1px solid #e5eaf2}
tr:hover{background:#f4f7fd}
.empty{text-align:center;color:#888;padding:20px}
</style>
</head>
<body>

<?php include 'sidebar.php'; ?>

<div class="main">
    <h1>Dashboard Admin</h1>

    <div class="stat">
        <div class="card">
            <h3>Total Wisata</h3>
            <h2><?= $totalWisata; ?></h2>
        </div>

        <div class="card">
            <h3>Total Like</h3>
            <h2><?= $totalLike; ?></h2>
        </div>
    </div>

    <div class="card">
        <h3>❤️ Wisata Paling Banyak Di-Like</h3>

        <table>
            <tr>
                <th>No</th>
                <th>Nama Wisata</th>
                <th>Total Like</th>
            </tr>

            <?php if (mysqli_num_rows($like) > 0) { ?>
                <?php $no = 1; while ($d = mysqli_fetch_assoc($like)) { ?>
                <tr>
                    <td><?= $no++; ?></td>
                    <td><?= htmlspecialchars($d['nama_wisata']); ?></td>
                    <td><?= $d['total_like']; ?></td>
                </tr>
                <?php } ?>
            <?php } else { ?>
                <tr>
                    <td colspan="3" class="empty">Belum ada wisata yang di-like.</td>
                </tr>
            <?php } ?>
        </table>
    </div>
</div>

</body>
</html>