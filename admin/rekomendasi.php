<?php
session_start();

if (!isset($_SESSION['admin'])) {
    header("Location: ../login.php");
    exit;
}

include '../config/koneksi.php';

$search = isset($_GET['search']) ? $_GET['search'] : "";
$sort = isset($_GET['sort']) ? $_GET['sort'] : "skor";

$allowed_sort = ['skor', 'rating', 'visitors', 'revenue'];

if (!in_array($sort, $allowed_sort)) {
    $sort = "skor";
}

$max = mysqli_fetch_assoc(mysqli_query($conn, "
    SELECT 
    MAX(rating) AS max_rating,
    MAX(visitors) AS max_visitors,
    MAX(revenue) AS max_revenue
    FROM wisata_jogja_final
"));

$query = mysqli_query($conn, "
    SELECT * FROM wisata_jogja_final
    WHERE nama_wisata LIKE '%$search%'
    OR kategori LIKE '%$search%'
");

$hasil = [];

while ($d = mysqli_fetch_assoc($query)) {
    $nr = $max['max_rating'] > 0 ? $d['rating'] / $max['max_rating'] : 0;
    $nv = $max['max_visitors'] > 0 ? $d['visitors'] / $max['max_visitors'] : 0;
    $nrev = $max['max_revenue'] > 0 ? $d['revenue'] / $max['max_revenue'] : 0;

    $skor = ($nr * 0.4) + ($nv * 0.3) + ($nrev * 0.3);

    $d['skor'] = $skor;
    $hasil[] = $d;
}

usort($hasil, function($a, $b) use ($sort) {
    return $b[$sort] <=> $a[$sort];
});
?>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Rekomendasi Admin</title>
    <link rel="stylesheet" href="../assets/style.css">
</head>
<body>

<div class="wrapper">

    <div class="sidebar">
        <h2>Admin Panel</h2>
        <a href="dashboard.php">Dashboard</a>
        <a href="data.php">Data Wisata</a>
        <a href="tambah.php">Tambah Data</a>
        <a href="rekomendasi.php">Lihat Rekomendasi</a>
        <a href="../logout.php">Logout</a>
    </div>

    <div class="main-content">
        <h2>Ranking Rekomendasi Wisata Yogyakarta (DSS)</h2>

        <form method="GET" class="search-box">
            <input 
                type="text" 
                name="search" 
                placeholder="Cari nama wisata / kategori"
                value="<?= htmlspecialchars($search); ?>"
            >

            <select name="sort">
                <option value="skor" <?= $sort == "skor" ? "selected" : ""; ?>>Sortir Skor DSS</option>
                <option value="rating" <?= $sort == "rating" ? "selected" : ""; ?>>Sortir Rating</option>
                <option value="visitors" <?= $sort == "visitors" ? "selected" : ""; ?>>Sortir Visitors</option>
                <option value="revenue" <?= $sort == "revenue" ? "selected" : ""; ?>>Sortir Revenue</option>
            </select>

            <button type="submit">Cari / Sortir</button>
        </form>

        <table>
            <tr>
                <th>Ranking</th>
                <th>Nama Wisata</th>
                <th>Rating</th>
                <th>Visitors</th>
                <th>Kategori</th>
                <th>Revenue</th>
                <th>Skor DSS</th>
                <th>Detail</th>
            </tr>

            <?php 
            if (count($hasil) > 0) {
                $rank = 1;
                foreach ($hasil as $d) { 
            ?>
            <tr>
                <td><?= $rank++; ?></td>
                <td><?= htmlspecialchars($d['nama_wisata']); ?></td>
                <td><?= $d['rating']; ?></td>
                <td><?= $d['visitors']; ?></td>
                <td><?= htmlspecialchars($d['kategori']); ?></td>
                <td><?= $d['revenue']; ?></td>
                <td><?= number_format($d['skor'], 4); ?></td>
                <td>
                    <a class="btn-small" href="../detail.php?nama=<?= urlencode($d['nama_wisata']); ?>">
                        Detail
                    </a>
                </td>
            </tr>
            <?php 
                }
            } else {
            ?>
            <tr>
                <td colspan="8" style="text-align:center;">Data tidak ditemukan</td>
            </tr>
            <?php } ?>
        </table>
    </div>

</div>

</body>
</html>