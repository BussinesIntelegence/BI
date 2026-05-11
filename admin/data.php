<?php
session_start();
include '../config/koneksi.php';

if (!isset($_SESSION['admin'])) {
    header("Location: ../login.php");
    exit;
}

$search = $_GET['search'] ?? '';
$kategori = $_GET['kategori'] ?? '';
$urut = $_GET['urut'] ?? 'nama';

$where = "WHERE 1=1";

if ($search != '') {
    $s = mysqli_real_escape_string($conn, $search);
    $where .= " AND (nama_wisata LIKE '%$s%' OR kategori LIKE '%$s%')";
}

if ($kategori != '') {
    $k = mysqli_real_escape_string($conn, $kategori);
    $where .= " AND kategori LIKE '%$k%'";
}

$order = "nama_wisata ASC";
if ($urut == 'rating') $order = "rating DESC";
if ($urut == 'visitors') $order = "visitors DESC";
if ($urut == 'revenue') $order = "revenue DESC";

$data = mysqli_query($conn, "SELECT * FROM wisata_jogja_final $where ORDER BY $order");
?>

<!DOCTYPE html>
<html lang="id">
<head>
<meta charset="UTF-8">
<title>Data Wisata Admin</title>
<style>
*{box-sizing:border-box}
body{margin:0;font-family:Arial,sans-serif;background:#eef3f9;color:#12375d}
.sidebar{width:260px;height:100vh;background:#23477f;color:white;position:fixed;left:0;top:0;padding:35px 30px}
.sidebar h2{font-size:28px;margin-bottom:35px}
.sidebar a{display:block;color:white;text-decoration:none;font-size:18px;margin-bottom:15px;padding:13px 14px;border-radius:12px}
.sidebar a:hover,.sidebar a.active{background:#155d9b}
.main{margin-left:260px;padding:45px 55px}
h1{font-size:34px;margin-bottom:25px}
.btn-tambah{display:inline-block;background:#23477f;color:white;text-decoration:none;padding:13px 20px;border-radius:10px;font-weight:bold;margin-bottom:28px}
.card{background:white;padding:24px;border-radius:16px;box-shadow:0 10px 25px rgba(0,0,0,.06);margin-bottom:24px}
input,select{width:100%;padding:14px 16px;margin-bottom:16px;border:1px solid #d6dce7;border-radius:10px;font-size:15px}
.filter-actions{display:flex;gap:14px}
button,.btn-reset{border:none;background:#23477f;color:white;text-decoration:none;padding:12px 20px;border-radius:9px;cursor:pointer;font-size:15px}
.btn-reset{display:inline-block}
.table-wrap{background:white;border-radius:16px;box-shadow:0 10px 25px rgba(0,0,0,.06);overflow-x:auto}
table{width:100%;min-width:1000px;border-collapse:collapse}
th{background:#23477f;color:white;padding:15px;text-align:left}
td{padding:14px;border-bottom:1px solid #e5eaf2;color:#111}
tr:nth-child(even){background:#f4f7fd}
tr:hover{background:#eef4ff}
.aksi{display:flex;gap:8px}
.btn-edit,.btn-hapus{color:white;text-decoration:none;padding:8px 13px;border-radius:7px;font-size:14px}
.btn-edit{background:#23477f}
.btn-hapus{background:#c8322b}
</style>
</head>
<body>

<?php include 'sidebar.php'; ?>

<div class="main">
    <h1>Kelola Data Wisata</h1>

    <a href="tambah.php" class="btn-tambah">+ Tambah Data</a>

    <form method="GET" class="card">
        <input type="text" name="search" placeholder="Cari nama wisata / kategori..." value="<?= htmlspecialchars($search); ?>">

        <select name="kategori">
            <option value="">Semua Kategori</option>
            <option value="Budaya" <?= $kategori == 'Budaya' ? 'selected' : ''; ?>>Budaya</option>
            <option value="Alam" <?= $kategori == 'Alam' ? 'selected' : ''; ?>>Alam</option>
            <option value="Pantai" <?= $kategori == 'Pantai' ? 'selected' : ''; ?>>Pantai</option>
            <option value="Wisata Air" <?= $kategori == 'Wisata Air' ? 'selected' : ''; ?>>Wisata Air</option>
        </select>

        <select name="urut">
            <option value="nama" <?= $urut == 'nama' ? 'selected' : ''; ?>>Urut Nama</option>
            <option value="rating" <?= $urut == 'rating' ? 'selected' : ''; ?>>Urut Rating</option>
            <option value="visitors" <?= $urut == 'visitors' ? 'selected' : ''; ?>>Urut Visitors</option>
            <option value="revenue" <?= $urut == 'revenue' ? 'selected' : ''; ?>>Urut Revenue</option>
        </select>

        <div class="filter-actions">
            <button type="submit">Terapkan</button>
            <a href="data.php" class="btn-reset">Reset</a>
        </div>
    </form>

    <div class="table-wrap">
        <table>
            <tr>
                <th>No</th>
                <th>Nama Wisata</th>
                <th>Rating</th>
                <th>Visitors</th>
                <th>Kategori</th>
                <th>Revenue</th>
                <th>Aksi</th>
            </tr>

            <?php $no = 1; while ($d = mysqli_fetch_assoc($data)) { ?>
            <tr>
                <td><?= $no++; ?></td>
                <td><?= htmlspecialchars($d['nama_wisata']); ?></td>
                <td><?= htmlspecialchars($d['rating']); ?></td>
                <td><?= number_format($d['visitors']); ?></td>
                <td><?= htmlspecialchars($d['kategori']); ?></td>
                <td><?= number_format($d['revenue']); ?></td>
                <td>
                    <div class="aksi">
                        <a href="edit.php?id=<?= $d['id']; ?>" class="btn-edit">Edit</a>
                        <a href="hapus.php?id=<?= $d['id']; ?>" class="btn-hapus" onclick="return confirm('Yakin hapus data ini?')">Hapus</a>
                    </div>
                </td>
            </tr>
            <?php } ?>
        </table>
    </div>
</div>

</body>
</html>