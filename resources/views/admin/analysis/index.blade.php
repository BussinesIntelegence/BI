@extends('admin.layouts.app')

@section('title', 'DSS Analytics')

@section('content')

<div class="analytics-page">

    <!-- ======================================== -->
    <!-- PAGE HEADER -->
    <!-- ======================================== -->
    <div class="analytics-header">

        <div>
            <h1 class="analytics-title">
                DSS Dashboard
            </h1>

            <p class="analytics-subtitle">
                Decision support system using Simple Additive Weighting (SAW)
                method for Jogja tourism optimization.
            </p>
        </div>

        <div class="analytics-actions">

            <a
                href="/admin/analysis/export/pdf"
                class="btn btn-maroon"
            >

                <i class="bi bi-file-earmark-pdf"></i>

                Export PDF

            </a>

        </div>

    </div>

    <!-- ======================================== -->
    <!-- SUMMARY CARDS -->
    <!-- ======================================== -->
    <div class="row g-4 mb-4">

        <!-- TOTAL WISATA -->
        <div class="col-12 col-sm-6 col-xl-3">

            <div class="summary-card">

                <div class="summary-top">

                    <div>
                        <p class="summary-label">
                            TOTAL WISATA
                        </p>

                        <h2 class="summary-value">
                            {{ number_format($totalWisata) }}
                        </h2>

                        <span class="summary-desc">
                            Destinasi terdaftar
                        </span>
                    </div>

                    <div class="summary-icon bg-soft-maroon">
                        <i class="bi bi-map"></i>
                    </div>

                </div>

            </div>

        </div>

        <!-- TOTAL KRITERIA -->
        <div class="col-12 col-sm-6 col-xl-3">

            <div class="summary-card">

                <div class="summary-top">

                    <div>
                        <p class="summary-label">
                            TOTAL KRITERIA
                        </p>

                        <h2 class="summary-value">
                            {{ number_format($totalKriteria) }}
                        </h2>

                        <span class="summary-desc">
                            Parameter penilaian
                        </span>
                    </div>

                    <div class="summary-icon bg-soft-dark">
                        <i class="bi bi-sliders"></i>
                    </div>

                </div>

            </div>

        </div>

        <!-- TOTAL KUNJUNGAN -->
        <div class="col-12 col-sm-6 col-xl-3">

            <div class="summary-card">

                <div class="summary-top">

                    <div>
                        <p class="summary-label">
                            TOTAL KUNJUNGAN
                        </p>

                        <h2 class="summary-value">
                            {{ number_format($totalKunjungan) }}
                        </h2>

                        <span class="summary-desc">
                            Bulan ini (Jogja Area)
                        </span>
                    </div>

                    <div class="summary-icon bg-soft-blue">
                        <i class="bi bi-people"></i>
                    </div>

                </div>

            </div>

        </div>

        <!-- WARNING -->
        <div class="col-12 col-sm-6 col-xl-3">

            <div class="summary-card warning-card">

                <div class="summary-top">

                    <div>
                        <p class="summary-label text-danger">
                            DATA BELUM LENGKAP
                        </p>

                        <h2 class="summary-value text-danger">
                            {{ number_format($incompleteData) }}
                        </h2>

                        <a href="#" class="summary-link">
                            Segera lengkapi parameter
                        </a>
                    </div>

                    <div class="summary-icon bg-soft-danger">
                        <i class="bi bi-exclamation-triangle"></i>
                    </div>

                </div>

            </div>

        </div>

    </div>

    <div class="col-12 col-sm-6 col-xl-3">

    <div class="summary-card">

        <div class="summary-top">

            <div>

                <p class="summary-label">
                    AVG WEEKDAY PRICE
                </p>

                <h2 class="summary-value">
                    Rp {{ number_format($averageWeekdayPrice) }}
                </h2>

                <span class="summary-desc">
                    Harga tiket weekday
                </span>

            </div>

        </div>

    </div>

</div>

    <!-- ========================================
SMART INSIGHT PANEL
======================================== -->
<div class="dashboard-panel insight-panel mb-4">

    <div class="panel-header mb-4">

        <div>

            <h4>
                Smart Insight Analytics
            </h4>

            <p>
                Interpretasi otomatis berdasarkan data DSS wisata Yogyakarta.
            </p>

        </div>

    </div>

    <div class="row g-4">

        <!-- Insight 1 -->
        <div class="col-lg-3 col-md-6">

            <div class="insight-card">

                <div class="insight-icon">
                    <i class="bi bi-bar-chart-line-fill"></i>
                </div>

                <h6>
                    Kategori Dominan
                </h6>

                <h3>
                    {{ $dominantCategory['kategori'] }}
                </h3>

                <p>
                    Mendominasi distribusi wisata saat ini.
                </p>

            </div>

        </div>

        <!-- Insight 2 -->
        <div class="col-lg-3 col-md-6">

            <div class="insight-card">

                <div class="insight-icon">
                    <i class="bi bi-star-fill"></i>
                </div>

                <h6>
                    Rating Rata-Rata
                </h6>

                <h3>
                    {{ number_format($averageRating,1) }}
                </h3>

                <p>
                    Kualitas destinasi wisata tergolong tinggi.
                </p>

            </div>

        </div>

        <!-- Insight 3 -->
        <div class="col-lg-3 col-md-6">

            <div class="insight-card">

                <div class="insight-icon">
                    <i class="bi bi-trophy-fill"></i>
                </div>

                <h6>
                    Wisata Terpopuler
                </h6>

                <h3>
                    {{ $topDestination->tour->place_name ?? '-' }}
                </h3>

                <p>
                    Popularity Score:
                    {{ number_format($topDestination->popularity_score,2) }}
                </p>

            </div>

        </div>

        <!-- Insight 4 -->
        <div class="col-lg-3 col-md-6">

            <div class="insight-card">

                <div class="insight-icon warning">

                    <i class="bi bi-cpu"></i>

                </div>

                <h5>
                    Insight SAW
                </h5>

                <h3>
                    Rating Dominan
                </h3>

                <p>
                    Destinasi dengan rating tinggi
                    lebih sering muncul pada rekomendasi teratas.
                </p>

            </div>

        </div>

    </div>

</div>

    <!-- ======================================== -->
    <!-- CHART SECTION -->
    <!-- ======================================== -->
    
    <div class="row g-4 mb-4">

    <!-- Distribusi -->
    <div class="col-lg-6">

        <div class="dashboard-panel h-100">

            <div class="panel-header">
                <h4>Distribusi Kategori Wisata</h4>
            </div>

            <div class="chart-wrapper">
                <canvas id="categoryAnalyticsChart"></canvas>
            </div>

        </div>

    </div>

    <!-- Analisis -->
    <div class="col-lg-6">

        <div class="dashboard-panel h-100">

            <div class="panel-header">

                <h4>Analisis Kategori Wisata</h4>

                <p>
                    Ringkasan performa kategori.
                </p>

            </div>

            <div class="table-responsive">

            <table class="table analytics-table">

                <thead>
                    <tr>
                        <th>Kategori</th>
                        <th>Total Wisata</th>
                        <th>Avg Rating</th>
                        <th>Avg Harga</th>
                    </tr>
                </thead>

                <tbody>

                    @foreach($categoryAnalytics as $item)

                    <tr>
                        <td>{{ $item['category'] }}</td>
                        <td>{{ $item['total'] }}</td>
                        <td>{{ $item['avg_rating'] }}</td>
                        <td>
                            Rp {{ number_format($item['avg_price']) }}
                        </td>
                    </tr>

                    @endforeach

                </tbody>

            </table>

        </div>

        </div>

    </div>

</div>

<div class="row g-4 mb-4">

    <!-- Popularity Ranking -->
    <div class="col-lg-6">

        <div class="dashboard-panel h-100">

            <div class="panel-header">

                <h4>
                    Top 10 Popularity Ranking
                </h4>

            </div>

            <div class="table-responsive">

            <table class="table analytics-table">

                <thead>
                    <tr>
                        <th>Wisata</th>
                        <th>Popularity</th>
                    </tr>
                </thead>

                <tbody>

                    @foreach($topPopularityDestinations as $item)

                    <tr>

                        <td>
                            {{ $item->tour->place_name }}
                        </td>

                        <td>
                            {{ number_format($item->popularity_score,2) }}
                        </td>

                    </tr>

                    @endforeach

                </tbody>

            </table>

        </div>

        </div>

    </div>

    <!-- Tren -->
    <div class="col-lg-6">

        <div class="dashboard-panel h-100">

            <div class="panel-header">

                <h4>
                    Tren Prioritas Wisatawan
                </h4>

                <p>
                    Berdasarkan popularity score.
                </p>

            </div>

            <div class="chart-wrapper">

                <canvas
                    id="priorityChart"
                ></canvas>

            </div>

        </div>

    </div>

</div>


    <!-- ======================================== -->
    <!-- SIMULASI + TABLE -->
    <!-- ======================================== -->
    <div class="row g-4 mb-4">

        <!-- WHAT IF -->
        <div class="col-12 col-xl-4">

            <div class="dashboard-panel">

                <div class="panel-header">
                    <h4>
                        Simulasi What-If
                    </h4>
                </div>


                <!-- ================================= -->
                <!-- FORM SIMULASI -->
                <!-- ================================= -->

                <form>

                    <!-- Harga -->
                    <div class="range-group">

                        <div class="weight-item">

                            <div class="weight-header">

                                <label>Bobot Harga</label>

                                <span
                                    class="weight-badge"
                                    id="hargaValue"
                                >
                                    30%
                                </span>

                            </div>

                            <input
                                type="range"
                                class="form-range weight-slider"
                                min="0"
                                max="100"
                                value="30"

                                data-target="hargaValue"
                                data-weight="harga"
                            >

                        </div>

                    </div>

                   <!-- Review -->
                    <div class="range-group">

                        <div class="weight-item">

                            <div class="weight-header">

                                <label>Bobot Review</label>

                                <span
                                    class="weight-badge"
                                    id="reviewValue"
                                >
                                    20%
                                </span>

                            </div>

                            <input
                                type="range"
                                class="form-range weight-slider"
                                min="0"
                                max="100"
                                value="20"

                                data-target="reviewValue"
                                data-weight="review"
                            >

                        </div>

                    </div>

                    <!-- Popularitas -->
                    <div class="range-group">

                        <div class="weight-item">

                            <div class="weight-header">

                                <label>Bobot Popularitas</label>

                                <span
                                    class="weight-badge"
                                    id="popularitasValue"
                                >
                                    20%
                                </span>

                            </div>

                            <input
                                type="range"
                                class="form-range weight-slider"
                                min="0"
                                max="100"
                                value="20"

                                data-target="popularitasValue"
                                data-weight="popularitas"
                            >

                        </div>

                    </div>

                    <!-- Rating -->
                    <div class="range-group">

                        <div class="weight-item">

                            <div class="weight-header">

                                <label>Bobot Rating</label>

                                <span
                                    class="weight-badge"
                                    id="ratingValue"
                                >
                                    25%
                                </span>

                            </div>

                            <input
                                type="range"
                                class="form-range weight-slider"
                                min="0"
                                max="100"
                                value="25"

                                data-target="ratingValue"
                                data-weight="rating"
                            >

                        </div>

                    </div>

                    <div class="alert alert-light mt-3">

                        Total Bobot :

                        <strong id="totalWeight">

                            100%

                        </strong>

                    </div>

                    <button
                        type="button"
                        id="simulateBtn"
                        class="btn btn-maroon w-100"
                    >

                        <i class="bi bi-calculator"></i>

                        Simulasikan Skor

                    </button>

                </form>
                <div class="mini-weight-grid">

                    <div class="mini-weight-card">
                        <span>Harga</span>
                        <strong>30%</strong>
                    </div>

                    <div class="mini-weight-card">
                        <span>Rating</span>
                        <strong>30%</strong>
                    </div>

                    <div class="mini-weight-card">
                        <span>Review</span>
                        <strong>20%</strong>
                    </div>

                    <div class="mini-weight-card">
                        <span>Popularitas</span>
                        <strong>20%</strong>
                    </div>

                </div>

            </div>

        </div>

        <!-- TABLE -->
        <div class="col-12 col-xl-8">

            <div class="dashboard-panel">

                <div class="table-header">

                    <div>
                        <h4>
                            Hasil Rekomendasi SAW
                        </h4>

                        <p>
                            Berdasarkan parameter aktif
                        </p>
                    </div>

                </div>

                <div class="table-responsive">

                    <table class="table align-middle recommendation-table">

                        <thead>
                            <tr>
                                <th>DESTINASI WISATA</th>
                                <th>SKOR AKHIR</th>
                                <th>STATUS HARGA</th>
                                <th>REKOMENDASI</th>
                            </tr>
                        </thead>

                        <tbody>

                            @foreach($topWisata as $wisata)

                            <tr
                                class="wisata-row"

                                data-rating="{{ $wisata->rating }}"

                                data-review="{{ $wisata->vote_count }}"

                                data-popularitas="{{ $wisata->popularity_score }}"

                                data-harga="{{ $wisata->htm_weekday }}"
                            >

                                <td>

                                    <div class="destination-cell">

                                        @php

                                            $kategori = strtolower($wisata->tour->category->category_name ?? '');

                                            $placeholder = 'tourism';

                                            if (
                                                str_contains($kategori, 'alam') ||
                                                str_contains($kategori, 'gunung')
                                            ) {

                                                $placeholder = 'mountain,nature';

                                            } elseif (
                                                str_contains($kategori, 'pantai') ||
                                                str_contains($kategori, 'air')
                                            ) {

                                                $placeholder = 'beach,ocean';

                                            } elseif (
                                                str_contains($kategori, 'budaya') ||
                                                str_contains($kategori, 'sejarah')
                                            ) {

                                                $placeholder = 'temple,heritage';

                                            } elseif (
                                                str_contains($kategori, 'kuliner')
                                            ) {

                                                $placeholder = 'food,restaurant';

                                            } else {

                                                $placeholder = 'tourism,travel';

                                            }

                                        @endphp

                                        <img
                                                src="{{ $wisata->gambar
                                                    ? asset('assets/images/wisata/' . $wisata->gambar)
                                                    : 'https://picsum.photos/seed/' . $wisata->id . '/200/200' }}"
                                                alt="{{ $wisata->tour->place_name ?? '-' }}"
                                            >

                                        <div>

                                            <strong>
                                                {{ $wisata->tour->place_name ?? '-' }}
                                            </strong>

                                            <br>

                                            <small class="text-muted">

                                                Popularity:
                                                {{ number_format($wisata->popularity_score,2) }}

                                            </small>

                                            <small>
                                                {{ $wisata->tour->category->category_name ?? '-' }}
                                            </small>

                                        </div>

                                    </div>

                                </td>

                                <td>

                                    <span class="score-text score-value">

                                        {{ number_format($wisata->popularity_score, 3) }}

                                    </span>

                                </td>

                                <td>

                                    @if($wisata->htm_weekday <= 10000)

                                        <span class="badge bg-success-subtle text-success">
                                            Terjangkau
                                        </span>

                                    @elseif($wisata->htm_weekday <= 30000)

                                        <span class="badge bg-warning-subtle text-warning-emphasis">
                                            Menengah
                                        </span>

                                    @else

                                        <span class="badge bg-danger-subtle text-danger">
                                            Premium
                                        </span>

                                    @endif

                                </td>

                                <td>

                                    <span
                                        class="badge bg-primary-subtle text-primary recommendation-badge"
                                    >

                                        Direkomendasikan

                                    </span>

                                </td>

                            </tr>

                            @endforeach

                            </tbody>
                    </table>

                </div>

            </div>

        </div>

    </div>

    <!-- ======================================== -->
<!-- ADVANCED ANALYTICS -->
<!-- ======================================== -->

<div class="row g-4 mb-4">

    <!-- LINE CHART -->
    <div class="col-12 col-xl-8">

        <div class="dashboard-panel">

            <div class="panel-header">

                <div>

                    <h4>
                        Popularity Score per Kategori
                    </h4>

                    <p>
                        Rata-rata popularity score berdasarkan kategori wisata.
                    </p>

                </div>

            </div>

            <div class="chart-wrapper">

                <canvas id="trendChart"></canvas>

            </div>

        </div>

    </div>

    <!-- RADAR ANALYTICS -->
    <div class="col-12 col-xl-4">

        <div class="dashboard-panel">

            <div class="panel-header">

                <div>

                    <h4>
                        Analisis Kriteria SAW
                    </h4>

                    <p>
                        Visualisasi pengaruh tiap parameter.
                    </p>

                </div>

            </div>

            <div class="chart-wrapper">

                <canvas id="radarChart"></canvas>

            </div>

        </div>

    </div>

</div>

    <!-- ======================================== -->
    <!-- MAP SECTION -->
    <!-- ======================================== -->
    <div class="dashboard-panel">

        <div class="panel-header">

            <h4>
                Distribusi Geografis Objek Wisata
            </h4>

            <p>
                Mapping destinasi unggulan Jogja berdasarkan persebaran wilayah.
            </p>

        </div>

        <!-- ========================================= -->
        <!-- Placeholder untuk Leaflet / Google Maps -->
        <!-- ========================================= -->

        <div class="analytics-card map-card">

            <div class="section-title-wrapper">

            </div>

            <!-- MAP CONTAINER -->
            <div id="wisataMap"></div>

        </div>

    </div>

</div>

<!-- ======================================== -->
<!-- CHART JS CDN -->
<!-- ======================================== -->

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<script>

    // =========================================
    // Doughnut Chart
    // Distribusi Bobot Kriteria
    // =========================================

    const criteriaCtx =
        document.getElementById('criteriaChart');

    new Chart(criteriaCtx, {

        type: 'doughnut',

        data: {

            labels: {!! json_encode($kriterias->pluck('nama')) !!},

            datasets: [{

                data: {!! json_encode($kriterias->pluck('bobot')) !!},

                backgroundColor: [
                    '#c94444',
                    '#6d5f5f',
                    '#747496',
                    '#8a6b6b',
                    '#d85c5c'
                ],

                borderWidth: 0

            }]

        },

        options: {

            responsive: true,
            maintainAspectRatio: false,

            plugins: {

                legend: {
                    position: 'right'
                }

            },

            cutout: '72%'

        }

    });

    // =========================================
    // Bar Chart
    // Tren Prioritas Wisatawan
    // =========================================

    const priorityCtx =
    document.getElementById(
        'priorityChart'
    );

if(priorityCtx){

    new Chart(priorityCtx, {

        type: 'bar',

        data: {

            labels:
                @json(
                    $popularityPerCategory->keys()
                ),

            datasets: [

                {

                    label:
                        'Popularity Score',

                    data:
                        @json(
                            $popularityPerCategory->values()
                        ),

                    backgroundColor:
                        '#c94444',

                    borderRadius: 10

                }

            ]

        },

        options: {

            responsive: true,

            maintainAspectRatio: false,

            plugins: {

                legend: {

                    display: false

                }

            }

        }

    });

}

</script>
<script>

document.addEventListener('DOMContentLoaded', function () {

    /*
    ==========================================
    INIT MAP
    ==========================================
    */

    const map = L.map('wisataMap').setView(
        [-7.7956, 110.3695],
        10
    );

    /*
    ==========================================
    TILE LAYER
    ==========================================
    */

    L.tileLayer(
        'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
        {
            attribution: '&copy; OpenStreetMap contributors'
        }
    ).addTo(map);

    /*
    ==========================================
    DATA WISATA
    ==========================================
    */

    const wisataData = @json($mapWisata);

    /*
    ==========================================
    LOOP MARKERS
    ==========================================
    */

    wisataData.forEach(wisata => {

        if (wisata.latitude && wisata.longitude) {

            L.marker([
                wisata.latitude,
                wisata.longitude
            ])

            .addTo(map)

            .bindPopup(`

                <div style="min-width:200px">

                    <h6 style="
                        font-weight:700;
                        margin-bottom:8px;
                    ">
                        ${wisata.nama}
                    </h6>

                    <p style="margin-bottom:4px">
                        Kategori: ${wisata.kategori}
                    </p>

                    <p style="margin-bottom:0">
                        Rating: ⭐ ${wisata.rating}
                    </p>

                </div>

            `);

        }

    });

});

</script>

<script>

const sliders =
    document.querySelectorAll('.weight-slider');

/* ========================================
SYNC WEIGHT
======================================== */

function syncWeights(changedSlider){

    const sliders =
        document.querySelectorAll(
            '.weight-slider'
        );

    let total = 0;

    sliders.forEach(slider => {

        total += parseInt(slider.value);

    });

    if(total <= 100){
        return;
    }

    let excess = total - 100;

    const others =
        [...sliders].filter(
            s => s !== changedSlider
        );

    others.forEach(slider => {

        if(excess <= 0){
            return;
        }

        let value =
            parseInt(slider.value);

        let reduction =
            Math.min(
                value - 0,
                excess
            );

        if(reduction > 0){

            slider.value =
                value - reduction;

            excess -= reduction;

        }

    });

}

/* ========================================
UPDATE BADGES
======================================== */

function updateSliderDisplay(){

    document.getElementById(
        'hargaValue'
    ).innerText =
        document.querySelector(
            '[data-weight="harga"]'
        ).value + '%';

    document.getElementById(
        'reviewValue'
    ).innerText =
        document.querySelector(
            '[data-weight="review"]'
        ).value + '%';

    document.getElementById(
        'popularitasValue'
    ).innerText =
        document.querySelector(
            '[data-weight="popularitas"]'
        ).value + '%';

    document.getElementById(
        'ratingValue'
    ).innerText =
        document.querySelector(
            '[data-weight="rating"]'
        ).value + '%';

}

/* ========================================
UPDATE TOTAL WEIGHT
======================================== */


function updateTotalWeight(){

    const harga =
        parseInt(
            document.querySelector(
                '[data-weight="harga"]'
            ).value
        );

    const review =
        parseInt(
            document.querySelector(
                '[data-weight="review"]'
            ).value
        );

    const popularitas =
        parseInt(
            document.querySelector(
                '[data-weight="popularitas"]'
            ).value
        );

    const rating =
        parseInt(
            document.querySelector(
                '[data-weight="rating"]'
            ).value
        );

    const total =

        harga +
        review +
        popularitas +
        rating;

    document.getElementById(
        'totalWeight'
    ).innerHTML =

        '<strong>Total Bobot : ' +
        total +
        '%</strong>';

}


/* ========================================
INIT TOTAL WEIGHT
======================================== */

updateTotalWeight();

sliders.forEach(slider => {

    slider.addEventListener(
        'input',
        function(){

            syncWeights(this);

            updateSliderDisplay();

            updateTotalWeight();

        }
    );

});

updateSliderDisplay();


/* ========================================
SIMULATE BUTTON
======================================== */

const simulateBtn =
    document.getElementById(
        'simulateBtn'
    );

simulateBtn.addEventListener(
    'click',
    function(){

        const harga =
            parseInt(
                document.querySelector(
                    '[data-weight="harga"]'
                ).value
            );

        const review =
            parseInt(
                document.querySelector(
                    '[data-weight="review"]'
                ).value
            );

        const rating =
            parseInt(
                document.querySelector(
                    '[data-weight="rating"]'
                ).value
            );

        const popularitas =
            parseInt(
                document.querySelector(
                    '[data-weight="popularitas"]'
                ).value
            );

        /* ========================================
        VALIDASI TOTAL BOBOT
        ======================================== */

        const totalWeight =

            harga +

            rating +

            review +

            popularitas;

        if(totalWeight !== 100){

            alert(
                'Total bobot harus 100%'
            );

            return;

        }


        /*
        ========================================
        TABLE BODY
        ========================================
        */

        const tbody =
            document.querySelector(
                '.recommendation-table tbody'
            );

        /*
        ========================================
        GET ALL ROWS
        ========================================
        */

        const rows =
            Array.from(
                document.querySelectorAll('.wisata-row')
            );

        /*
        ========================================
        UPDATE SCORE
        ========================================
        */
                const maxReview = Math.max(
            ...rows.map(r =>
                parseFloat(
                    r.dataset.review
                )
            )
        );

        const maxPopularity = Math.max(
            ...rows.map(r =>
                parseFloat(
                    r.dataset.popularitas
                )
            )
        );

        const minHarga = Math.min(
            ...rows.map(r =>
                parseFloat(
                    r.dataset.harga
                )
            )
        );

        const maxRating = Math.max(
            ...rows.map(r =>
                parseFloat(
                    r.dataset.rating
                )
            )
        );

        /*
        ========================================
        LOOP ROWS
        ========================================
        */


        rows.forEach(row => {

            const ratingValue =
                parseFloat(
                    row.dataset.rating || 0
                );

            const reviewValue =
                parseFloat(
                    row.dataset.review || 0
                );

            const popularitasValue =
                parseFloat(
                    row.dataset.popularitas || 0
                );

            const hargaValue =
                parseFloat(
                    row.dataset.harga || 1
                );

            /*
            ========================================
            NORMALISASI SAW
            ========================================
            */

            const nHarga =
                minHarga / Math.max(
                    hargaValue,
                    1
                );

            const nRating =
                ratingValue / Math.max(
                    maxRating,
                    1
                );

            const nReview =
                reviewValue / Math.max(
                    maxReview,
                    1
                );

            const nPopularity =
                popularitasValue / Math.max(
                    maxPopularity,
                    1
                );

            /*
            ========================================
            SAW SCORE
            ========================================
            */
            console.log({

                nama:
                    row.querySelector('strong')
                        ?.innerText,

                hargaValue,
                reviewValue,
                ratingValue,
                popularitasValue,

                nHarga,
                nRating,
                nReview,
                nPopularity

            });

            const score = (

                (nHarga * harga)

                +

                (nRating * rating)

                +

                (nReview * review)

                +

                (nPopularity * popularitas)

            ) / 100;

            /*
            ========================================
            SAVE SCORE
            ========================================
            */

            row.dataset.score = score;

            /*
            ========================================
            UPDATE SCORE UI
            ========================================
            */

            row.querySelector('.score-value')
                .innerText =
                score.toFixed(3);

            /*
            ========================================
            UPDATE RECOMMENDATION BADGE
            ========================================
            */

            const badge =
                row.querySelector(
                    '.recommendation-badge'
                );

            if (!badge) return;

            if(score >= 0.80){

                badge.innerText =
                    'Sangat Direkomendasikan';

                badge.className =
                    'badge bg-success-subtle text-success recommendation-badge';

            }
            else if(score >= 0.60){

                badge.innerText =
                    'Direkomendasikan';

                badge.className =
                    'badge bg-primary-subtle text-primary recommendation-badge';

            }
            else{

                badge.innerText =
                    'Pertimbangkan';

                badge.className =
                    'badge bg-warning-subtle text-warning recommendation-badge';

            }

        });

        /*
        ========================================
        SORT ROWS
        ========================================
        */

        rows.sort((a, b) => {

            return b.dataset.score - a.dataset.score;

        });

        /*
        ========================================
        RE-APPEND SORTED ROWS
        ========================================
        */

        rows.forEach(row => {

            tbody.appendChild(row);

        });

});

</script>
<script>

/* ========================================
TREND LINE CHART
======================================== */

const trendCtx =
    document.getElementById('trendChart');

new Chart(trendCtx, {

    type: 'line',

    data: {

        labels: [

            'Jan',
            'Feb',
            'Mar',
            'Apr',
            'Mei',
            'Jun',
            'Jul'

        ],

        datasets: [

            {

                label: 'Popularitas',

                data: @json($trendData),

                borderColor: '#c94444',

                backgroundColor: 'rgba(201,68,68,.08)',

                fill: true,

                tension: .4,

                pointRadius: 4

            }

        ]

    },

    options: {

        responsive: true,

        maintainAspectRatio: false,

        plugins: {

            legend: {

                display: false

            }

        },

        scales: {

            x: {

                grid: {

                    display: false

                }

            },

            y: {

                beginAtZero: true,

                grid: {

                    color: '#f1f1f1'

                }

            }

        }

    }

});

/* ========================================
RADAR CHART
======================================== */

const radarCtx =
    document.getElementById('radarChart');

new Chart(radarCtx, {

    type: 'radar',

    data: {

        labels: [

        'Harga',
        'Rating',
        'Review',
        'Popularitas'

        ],

        datasets: [

            {

                label: 'SAW Weight',

                data: @json($radarData),

                borderColor: '#c94444',

                backgroundColor: 'rgba(201,68,68,.2)',

                borderWidth: 2,

                pointBackgroundColor: '#c94444'

            }

        ]

    },

    options: {

        responsive: true,

        maintainAspectRatio: false,

        scales: {

            r: {

                beginAtZero: true,

                ticks: {

                    display: false

                },

                grid: {

                    color: '#ececec'

                },

                angleLines: {

                    color: '#ececec'

                }

            }

        },

        plugins: {

            legend: {

                display: false

            }

        }

    }

});

const categoryCtx =

document.getElementById(
    'categoryAnalyticsChart'
);

new Chart(categoryCtx, {

    type: 'bar',

    data: {

        labels:

            @json(
                $categoryLabels
            ),

        datasets: [{

            label:
                'Jumlah Wisata',

            data:

                @json(
                    $categoryTotals
                )

        }]

    }

});

</script>



@endsection