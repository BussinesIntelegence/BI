<?php
include 'config/koneksi.php';

$search = $_GET['search'] ?? "";
$kategori_filter = $_GET['kategori'] ?? "Semua";
$sort = $_GET['sort'] ?? "dss";

$search_safe = mysqli_real_escape_string($conn, $search);
$kategori_safe = mysqli_real_escape_string($conn, $kategori_filter);

$max = mysqli_fetch_assoc(mysqli_query($conn, "
    SELECT 
        MAX(rating) AS max_rating,
        MAX(visitors) AS max_visitors,
        MAX(revenue) AS max_revenue
    FROM wisata_jogja_final
"));

$where = "WHERE (nama_wisata LIKE '%$search_safe%' OR kategori LIKE '%$search_safe%')";

if ($kategori_filter != "Semua") {
    $where .= " AND kategori LIKE '%$kategori_safe%'";
}

$query = mysqli_query($conn, "SELECT * FROM wisata_jogja_final $where");

$hasil = [];

while ($d = mysqli_fetch_assoc($query)) {
    $nr = $max['max_rating'] > 0 ? $d['rating'] / $max['max_rating'] : 0;
    $nv = $max['max_visitors'] > 0 ? $d['visitors'] / $max['max_visitors'] : 0;
    $nrev = $max['max_revenue'] > 0 ? $d['revenue'] / $max['max_revenue'] : 0;

    $d['skor'] = ($nr * 0.4) + ($nv * 0.3) + ($nrev * 0.3);
    $hasil[] = $d;
}

if ($sort == "rating") {
    usort($hasil, fn($a, $b) => $b['rating'] <=> $a['rating']);
} elseif ($sort == "visitors") {
    usort($hasil, fn($a, $b) => $b['visitors'] <=> $a['visitors']);
} else {
    usort($hasil, fn($a, $b) => $b['skor'] <=> $a['skor']);
}

$top5 = array_slice($hasil, 0, 5);
$lainnya = array_slice($hasil, 5);

function fotoWisata($nama) {
    $nama = strtolower($nama);

    if (strpos($nama, 'borobudur') !== false) return 'assets/img/candiborobudur.jpg';
    if (strpos($nama, 'prambanan') !== false) return 'assets/img/candiprambanan.jpg';
    if (strpos($nama, 'breksi') !== false) return 'assets/img/Tebingbreksi.jpg';
    if (strpos($nama, 'vredeburg') !== false) return 'assets/img/FortVredeburgMuseum.jpg';
    if (strpos($nama, 'tugu') !== false) return 'assets/img/tugu.jpg';
    if (strpos($nama, 'castelo') !== false || strpos($nama, 'castle') !== false) return 'assets/img/castillo.jpg';

    if (strpos($nama, 'paralayang') !== false) return 'assets/img/bukitparalayangwatugupit.jpg';
    if (strpos($nama, 'ireng') !== false) return 'assets/img/gunurirengpatuk.jpg';
    if (strpos($nama, 'sungai mudal') !== false) return 'assets/img/sungaimudal.jpg';
    if (strpos($nama, 'kobango') !== false) return 'assets/img/Puncakkobango.jpg';
    if (strpos($nama, 'hutan pinus') !== false || strpos($nama, 'mangunan') !== false) return 'assets/img/hutanpinusmangunandlingo.jpg';
    if (strpos($nama, 'sumber kluthuk') !== false) return 'assets/img/sumberkluthuk.jpg';
    if (strpos($nama, 'teras merapi') !== false) return 'assets/img/terasmerapialam.jpg';
    if (strpos($nama, 'kaliadem') !== false || strpos($nama, 'jalur lahar') !== false) return 'assets/img/kaliadem.jpg';

    if (strpos($nama, 'jogja bay') !== false) return 'assets/img/jogjabay.jpg';
    if (strpos($nama, 'blue lagoon') !== false) return 'assets/img/bluelagoon.jpg';
    if (strpos($nama, 'kedung pedut') !== false) return 'assets/img/AirTerjunKedungpdut.jpg';
    if (strpos($nama, 'kedung manglu') !== false) return 'assets/img/airterjungkedutmanglu.jpg';
    if (strpos($nama, 'galaxy') !== false) return 'assets/img/GalaxiWaterpark.jpg';
    if (strpos($nama, 'grand puri') !== false) return 'assets/img/grandpuriwaterpark.jpg';
    if (strpos($nama, 'bendung tegal') !== false || strpos($nama, 'groundsill') !== false) return 'assets/img/bendungtegal.jpg';
    if (strpos($nama, 'sasana tirta') !== false) return 'assets/img/sasanatirtakembaran.jpg';
    if (strpos($nama, 'reklamasi') !== false) return 'assets/img/lapanganreklamasirentak.jpg';
    if (strpos($nama, 'wanatirta') !== false) return 'assets/img/wisataairwanatirtakencana.jpg';

    if (strpos($nama, 'ngondo') !== false) return 'assets/img/pantaingondo.jpg';
    if (strpos($nama, 'indrayanti') !== false) return 'assets/img/pantaiindrayanti.jpg';
    if (strpos($nama, 'midodaren') !== false) return 'assets/img/pantaimidodaren.jpg';
    if (strpos($nama, 'timang') !== false) return 'assets/img/pantaitimang.jpg';
    if (strpos($nama, 'ngrumput') !== false || strpos($nama, 'ngremput') !== false) return 'assets/img/pantaingrumput.jpg';
    if (strpos($nama, 'kesirat') !== false) return 'assets/img/PantaiKesirat.jpg';
    if (strpos($nama, 'depok') !== false) return 'assets/img/pantaidepok.jpg';
    if (strpos($nama, 'drini') !== false) return 'assets/img/pantaidrini.jpg';
    if (strpos($nama, 'parangtritis') !== false) return 'assets/img/pantaiparangtritis.jpg';
    if (strpos($nama, 'goa cemara') !== false) return 'assets/img/pantaigoacemara.jpg';

    if (strpos($nama, 'keraton') !== false || strpos($nama, 'palace') !== false) return 'assets/img/KeratonYogyakarta.jpg';
    if (strpos($nama, 'gembira loka') !== false) return 'assets/img/GembiraLokaZoo.jpg';
    if (strpos($nama, 'heha') !== false) return 'assets/img/hehaskyview.jpg';
    if (strpos($nama, 'pintu langit') !== false || strpos($nama, 'pintoe langit') !== false) return 'assets/img/pintulangit.jpg';
    if (strpos($nama, 'kadisoka') !== false) return 'assets/img/candikadikosa.jpg';
    if (strpos($nama, 'museum batik') !== false) return 'assets/img/MuseumBatikKeratonYogyakarta.jpg';
    if (strpos($nama, 'museum kristal') !== false) return 'assets/img/MuseumKristaldanCinderamataKeratonYogyakarta.jpg';
    if (strpos($nama, 'sultan agung') !== false) return 'assets/img/patungsultanagunimogiri.jpg';
    if (strpos($nama, 'situs gedong') !== false) return 'assets/img/situsgedongpusoko.jpg';
    if (strpos($nama, 'goa kalisuci') !== false) return 'assets/img/GoaKalisuci.jpg';
    if (strpos($nama, 'camping') !== false || strpos($nama, 'lorsambi') !== false) return 'assets/img/Campinggroundlorsambi.jpg';

    return 'assets/img/default.jpg';
}
?>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Destination DSS</title>
    <link rel="stylesheet" href="assets/user.css">
</head>
<body>

<div class="app">

    <div class="header">
        <h2>Destination<span>DSS</span></h2>
        <a href="favorit.php" class="btn-nav-fav">❤️</a>
    </div>

    <form method="GET" class="search-box-user">
        <input type="text" name="search" placeholder="Cari destinasi..." value="<?= htmlspecialchars($search); ?>">
        <input type="hidden" name="kategori" value="<?= htmlspecialchars($kategori_filter); ?>">
        <input type="hidden" name="sort" value="<?= htmlspecialchars($sort); ?>">
    </form>

    <div class="tabs">
        <a href="?kategori=Semua&sort=<?= urlencode($sort); ?>&search=<?= urlencode($search); ?>" class="<?= $kategori_filter == 'Semua' ? 'active' : ''; ?>">Semua</a>
        <a href="?kategori=Budaya&sort=<?= urlencode($sort); ?>&search=<?= urlencode($search); ?>" class="<?= $kategori_filter == 'Budaya' ? 'active' : ''; ?>">Budaya</a>
        <a href="?kategori=Alam&sort=<?= urlencode($sort); ?>&search=<?= urlencode($search); ?>" class="<?= $kategori_filter == 'Alam' ? 'active' : ''; ?>">Alam</a>
        <a href="?kategori=Pantai&sort=<?= urlencode($sort); ?>&search=<?= urlencode($search); ?>" class="<?= $kategori_filter == 'Pantai' ? 'active' : ''; ?>">Pantai</a>
        <a href="?kategori=Wisata Air&sort=<?= urlencode($sort); ?>&search=<?= urlencode($search); ?>" class="<?= $kategori_filter == 'Wisata Air' ? 'active' : ''; ?>">Air</a>
    </div>

    <form method="GET" class="sort-box">
        <input type="hidden" name="kategori" value="<?= htmlspecialchars($kategori_filter); ?>">
        <input type="hidden" name="search" value="<?= htmlspecialchars($search); ?>">
        <select name="sort" onchange="this.form.submit()">
            <option value="dss" <?= $sort == "dss" ? "selected" : ""; ?>>Sortir Skor DSS</option>
            <option value="rating" <?= $sort == "rating" ? "selected" : ""; ?>>Sortir Rating</option>
            <option value="visitors" <?= $sort == "visitors" ? "selected" : ""; ?>>Sortir Visitors</option>
        </select>
    </form>

    <div class="title-row">
        <h1>Top 5 Destinasi</h1>
        <span>
            <?php
            if ($sort == "rating") echo "REKOMENDASI RATING";
            elseif ($sort == "visitors") echo "REKOMENDASI VISITORS";
            else echo "REKOMENDASI DSS";
            ?>
        </span>
    </div>

    <div class="top-scroll">
        <?php $rank = 1; foreach ($top5 as $d) { ?>
        <div class="top-card" onclick="openDetail(
            '<?= htmlspecialchars(addslashes($d['nama_wisata'])); ?>',
            '<?= htmlspecialchars(addslashes($d['kategori'])); ?>',
            '<?= htmlspecialchars(addslashes($d['deskripsi'])); ?>',
            '<?= number_format($d['visitors']); ?>',
            '<?= htmlspecialchars($d['rating']); ?>',
            '<?= number_format($d['revenue']); ?>',
            '<?= number_format($d['skor'], 4); ?>'
        )">
            <img src="<?= fotoWisata($d['nama_wisata']); ?>" alt="<?= htmlspecialchars($d['nama_wisata']); ?>">

            <div class="top-label">Top <?= $rank; ?></div>

            <div class="top-info">
                <h3><?= htmlspecialchars($d['nama_wisata']); ?></h3>
                <p><?= htmlspecialchars($d['kategori']); ?></p>
            </div>

            <div class="success-box">
                <span>VISITORS</span>
                <b><?= number_format($d['visitors']); ?></b>

                <div class="bottom-info">
                    <div class="left-bottom">
                        <button 
                            type="button"
                            class="btn-fav" 
                            data-nama="<?= htmlspecialchars($d['nama_wisata']); ?>"
                            onclick="event.stopPropagation(); toggleFavorit(this.dataset.nama)"
                        >♡</button>

                        <div class="rating-box">⭐ <?= htmlspecialchars($d['rating']); ?></div>
                    </div>

                    <div class="dss-text">DSS <?= number_format($d['skor'], 4); ?></div>
                </div>
            </div>
        </div>
        <?php $rank++; } ?>
    </div>

    <h1 class="section-title">Peringkat Lainnya</h1>

    <div class="ranking-card">
        <?php $no = 6; foreach ($lainnya as $d) { ?>
        <div class="ranking-item" onclick="openDetail(
            '<?= htmlspecialchars(addslashes($d['nama_wisata'])); ?>',
            '<?= htmlspecialchars(addslashes($d['kategori'])); ?>',
            '<?= htmlspecialchars(addslashes($d['deskripsi'])); ?>',
            '<?= number_format($d['visitors']); ?>',
            '<?= htmlspecialchars($d['rating']); ?>',
            '<?= number_format($d['revenue']); ?>',
            '<?= number_format($d['skor'], 4); ?>'
        )">
            <b><?= $no++; ?></b>

            <div>
                <h4><?= htmlspecialchars($d['nama_wisata']); ?></h4>
                <p>⭐ <?= htmlspecialchars($d['rating']); ?> | 👥 <?= number_format($d['visitors']); ?> visitors</p>
            </div>

            <div class="ranking-actions">
                <strong><?= number_format($d['skor'], 4); ?></strong>

                <button 
                    type="button"
                    class="btn-fav-list" 
                    data-nama="<?= htmlspecialchars($d['nama_wisata']); ?>"
                    onclick="event.stopPropagation(); toggleFavorit(this.dataset.nama)"
                >♡</button>
            </div>
        </div>
        <?php } ?>
    </div>

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
function openDetail(nama, kategori, deskripsi, visitors, rating, revenue, skor) {
    document.getElementById('modalNama').innerText = nama;
    document.getElementById('modalKategori').innerText = kategori;
    document.getElementById('modalDeskripsi').innerText = deskripsi;
    document.getElementById('modalVisitors').innerText = visitors;
    document.getElementById('modalRating').innerText = rating;
    document.getElementById('modalRevenue').innerText = revenue;
    document.getElementById('modalSkor').innerText = skor;
    document.getElementById('detailModal').style.display = 'flex';
}

function closeDetail() {
    document.getElementById('detailModal').style.display = 'none';
}

window.onclick = function(e) {
    let modal = document.getElementById('detailModal');
    if (e.target == modal) modal.style.display = 'none';
}

function toggleFavorit(nama) {
    let data = JSON.parse(localStorage.getItem("favorit")) || [];

    if (data.includes(nama)) {
        data = data.filter(item => item !== nama);
    } else {
        data.push(nama);

        fetch("aksi_favorit.php", {
            method: "POST",
            headers: {
                "Content-Type": "application/x-www-form-urlencoded"
            },
            body: "nama=" + encodeURIComponent(nama)
        });
    }

    localStorage.setItem("favorit", JSON.stringify(data));
    updateFavoritButtons();
}

function updateFavoritButtons() {
    let data = JSON.parse(localStorage.getItem("favorit")) || [];

    document.querySelectorAll(".btn-fav, .btn-fav-list").forEach(btn => {
        let nama = btn.dataset.nama;

        if (data.includes(nama)) {
            btn.classList.add("active");
            btn.innerHTML = "❤️";
        } else {
            btn.classList.remove("active");
            btn.innerHTML = "♡";
        }
    });
}

document.addEventListener("DOMContentLoaded", updateFavoritButtons);
</script>

</body>
</html>