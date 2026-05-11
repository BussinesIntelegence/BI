<?php
include 'config/koneksi.php';

$max = mysqli_fetch_assoc(mysqli_query($conn, "
    SELECT 
        MAX(rating) AS max_rating,
        MAX(visitors) AS max_visitors,
        MAX(revenue) AS max_revenue
    FROM wisata_jogja_final
"));

$dataWisata = [];
$query = mysqli_query($conn, "SELECT * FROM wisata_jogja_final");

while ($d = mysqli_fetch_assoc($query)) {
    $nr = $max['max_rating'] > 0 ? $d['rating'] / $max['max_rating'] : 0;
    $nv = $max['max_visitors'] > 0 ? $d['visitors'] / $max['max_visitors'] : 0;
    $nrev = $max['max_revenue'] > 0 ? $d['revenue'] / $max['max_revenue'] : 0;

    $d['skor'] = ($nr * 0.4) + ($nv * 0.3) + ($nrev * 0.3);
    $dataWisata[] = $d;
}
?>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Favorit Saya</title>
    <link rel="stylesheet" href="assets/user.css">
</head>
<body>

<div class="app">
    <div class="header">
        <h2>Favorit<span>Saya</span></h2>
        <a href="rekomendasi.php" class="btn-nav-fav">⬅️</a>
    </div>

    <div id="listFavorit" class="ranking-card"></div>
</div>

<div id="detailModal" class="modal">
    <div class="modal-box">
        <span class="close" onclick="closeDetail()">&times;</span>

        <h2 id="modalNama"></h2>
        <p class="modal-kategori" id="modalKategori"></p>

        <div class="modal-info">
            <div><b>Rating</b><span id="modalRating"></span></div>
            <div><b>Visitors</b><span id="modalVisitors"></span></div>
            <div><b>Revenue</b><span id="modalRevenue"></span></div>
            <div><b>Skor DSS</b><span id="modalSkor"></span></div>
        </div>

        <h3>Deskripsi</h3>
        <p id="modalDeskripsi"></p>
    </div>
</div>

<script>
const semuaWisata = <?= json_encode($dataWisata, JSON_HEX_APOS | JSON_HEX_QUOT | JSON_HEX_TAG | JSON_HEX_AMP); ?>;

function loadFavoritPage() {
    let favorit = JSON.parse(localStorage.getItem("favorit")) || [];
    let container = document.getElementById("listFavorit");

    if (favorit.length === 0) {
        container.innerHTML = `
            <div class="empty-fav">
                <h3>Belum ada favorit</h3>
                <p>Klik tanda ♡ di halaman rekomendasi untuk menambahkan favorit.</p>
            </div>
        `;
        return;
    }

    let html = "";

    favorit.forEach((nama, index) => {
        let wisataIndex = semuaWisata.findIndex(w => w.nama_wisata === nama);
        if (wisataIndex === -1) return;

        let wisata = semuaWisata[wisataIndex];

        html += `
            <div class="ranking-item" onclick="openDetailByIndex(${wisataIndex})">
                <b>${index + 1}</b>

                <div>
                    <h4>${wisata.nama_wisata}</h4>
                    <p>⭐ ${wisata.rating} | 👥 ${Number(wisata.visitors).toLocaleString()} visitors</p>
                </div>

                <div class="ranking-actions">
                    <strong>${Number(wisata.skor).toFixed(4)}</strong>
                    <button class="btn-fav-list active" onclick="event.stopPropagation(); hapusFavorit(${wisataIndex})">❤️</button>
                </div>
            </div>
        `;
    });

    if (html === "") {
        container.innerHTML = `
            <div class="empty-fav">
                <h3>Data favorit tidak ditemukan</h3>
                <p>Hapus favorit lama lalu tambahkan ulang dari halaman rekomendasi.</p>
            </div>
        `;
    } else {
        container.innerHTML = html;
    }
}

function openDetailByIndex(index) {
    let wisata = semuaWisata[index];

    document.getElementById('modalNama').innerText = wisata.nama_wisata;
    document.getElementById('modalKategori').innerText = wisata.kategori;
    document.getElementById('modalDeskripsi').innerText = wisata.deskripsi;
    document.getElementById('modalVisitors').innerText = Number(wisata.visitors).toLocaleString();
    document.getElementById('modalRating').innerText = wisata.rating;
    document.getElementById('modalRevenue').innerText = Number(wisata.revenue).toLocaleString();
    document.getElementById('modalSkor').innerText = Number(wisata.skor).toFixed(4);

    document.getElementById('detailModal').style.display = 'flex';
}

function closeDetail() {
    document.getElementById('detailModal').style.display = 'none';
}

function hapusFavorit(index) {
    let wisata = semuaWisata[index];
    let favorit = JSON.parse(localStorage.getItem("favorit")) || [];

    favorit = favorit.filter(item => item !== wisata.nama_wisata);

    localStorage.setItem("favorit", JSON.stringify(favorit));
    loadFavoritPage();
}

window.onclick = function(e) {
    let modal = document.getElementById('detailModal');
    if (e.target == modal) modal.style.display = 'none';
}

document.addEventListener("DOMContentLoaded", loadFavoritPage);
</script>

</body>
</html>