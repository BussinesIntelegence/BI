@extends('layouts.app')

@section('content')

<div class="recommendation-page">

    <!-- =========================
    HERO SECTION
    ========================== -->

    <section class="recommendation-hero-section">

        <div class="container">

            <div class="recommendation-hero-card">

                <div class="row align-items-center g-5">

                    <!-- LEFT -->
                    <div class="col-lg-5">

                        <div class="hero-badge">

                            SISTEM REKOMENDASI SAW

                        </div>

                        <h1 class="recommendation-title">

                            Temukan Wisata
                            Terbaik Untukmu

                        </h1>

                        <p class="hero-description">

                            Masukkan preferensi Anda dan sistem
                            akan memberikan rekomendasi wisata
                            terbaik menggunakan metode
                            SAW (Simple Additive Weighting).

                        </p>

                    </div>

                    <!-- RIGHT -->
                    <div class="col-lg-7">

                        <form
                            action="/recommendation"
                            method="GET"
                        >

                            <div class="row g-4">

                                <!-- Kategori -->
                                <div class="col-md-4">

                                    <label class="filter-label">

                                        Kategori Wisata

                                    </label>

                                    <select
                                        name="kategori"
                                        class="form-select filter-select"
                                    >

                                        <option value="">
                                            Semua Kategori
                                        </option>

                                        <option value="alam">
                                            Alam
                                        </option>

                                        <option value="budaya">
                                            Budaya
                                        </option>

                                        <option value="pantai">
                                            Pantai
                                        </option>

                                        <option value="kuliner">
                                            Kuliner
                                        </option>

                                    </select>

                                </div>

                                <!-- Budget -->
                                <div class="col-md-4">

                                    <label class="filter-label">

                                        Budget Maksimal

                                    </label>

                                    <select
                                        name="budget"
                                        class="form-select filter-select"
                                    >

                                        <option value="">
                                            Semua Budget
                                        </option>

                                        <option value="25000">
                                            < 25.000
                                        </option>

                                        <option value="50000">
                                            < 50.000
                                        </option>

                                        <option value="100000">
                                            < 100.000
                                        </option>

                                    </select>

                                </div>

                                <!-- Rating -->
                                <div class="col-md-4">

                                    <label class="filter-label">

                                        Minimum Rating

                                    </label>

                                    <select
                                        name="rating"
                                        class="form-select filter-select"
                                    >

                                        <option value="">
                                            Semua Rating
                                        </option>

                                        <option value="3">
                                            3+
                                        </option>

                                        <option value="4">
                                            4+
                                        </option>

                                        <option value="4.5">
                                            4.5+
                                        </option>

                                    </select>

                                </div>

                            </div>

                            <!-- Button -->
                            <div class="mt-4">

                                <button
                                    type="submit"
                                    class="btn-generate"
                                >

                                    <i class="bi bi-stars"></i>

                                    Generate Recommendation

                                </button>

                            </div>

                        </form>

                    </div>

                </div>

            </div>

        </div>

    </section>

<div class="container">

@if($topResult)

<div class="smart-insight-card mb-5">

    <div class="row align-items-center g-4">

        <!-- IMAGE -->
        <div class="col-lg-4 mb-3 mb-lg-0">

            <img
                src="{{ $topResult->image_url }}"
                class="insight-image"
                alt="{{ $topResult->nama }}"
            >

        </div>

        <!-- CONTENT -->
        <div class="col-lg-8">

            <span class="insight-badge">

                TOP RECOMMENDATION

            </span>

            <h2 class="insight-title">

                {{ $topResult->nama }}

            </h2>

            <p class="insight-subtitle">

                Destinasi ini menjadi rekomendasi terbaik
                berdasarkan hasil perhitungan metode
                Simple Additive Weighting (SAW).

            </p>

            <div class="insight-points">

                <div class="insight-item">

                    ✔ Memiliki rating tinggi
                    ({{ $topResult->rating }})

                </div>

                <div class="insight-item">

                    ✔ Skor SAW tertinggi
                    ({{ number_format($topResult->score_saw,3) }})

                </div>

                <div class="insight-item">

                    ✔ Sesuai preferensi wisata pengguna

                </div>

                <div class="insight-item">

                    ✔ Memiliki performa review baik

                </div>

            </div>

        </div>

    </div>

</div>

@endif

</div>

    <!-- =========================
TABEL PERHITUNGAN SAW
========================= -->
                <div class="col-12">

                    <div class="row justify-content-center">

                        <div class="col-lg-11">

                    <div class="saw-table-wrapper">

                        <div class="mb-4">

                            <h2 class="top-title">

                                Tabel Perhitungan SAW

                            </h2>

                            <p class="text-secondary">

                                Hasil normalisasi dan perhitungan metode
                                Simple Additive Weighting (SAW).

                            </p>

                        </div>

                        <div class="table-responsive saw-scroll">

                            <table class="table custom-table align-middle">

                                <thead>

                                    <tr>

                                        <th>Ranking</th>
                                        <th>Wisata</th>
                                        <th>N Harga</th>
                                        <th>N Rating</th>
                                        <th>N Review</th>
                                        <th>Score SAW</th>

                                    </tr>

                                </thead>

                                <tbody>

                                    @foreach($wisatas as $wisata)

                                    <tr>

                                        <!-- Ranking -->
                                        <td>

                                            <span class="ranking-badge">

                                                #{{ $wisata->ranking }}

                                            </span>

                                        </td>

                                        <!-- Nama -->
                                        <td>

                                            {{ $wisata->nama }}

                                        </td>

                                        <!-- Normalisasi -->
                                        <td>

                                            {{ $wisata->n_harga }}

                                        </td>

                                        <td>

                                            {{ $wisata->n_rating }}

                                        </td>

                                        <td>

                                            {{ $wisata->n_review }}

                                        </td>

                                        <!-- Score -->
                                        <td>

                                            <strong>

                                                {{ $wisata->saw_score }}

                                            </strong>

                                        </td>

                                    </tr>

                                    @endforeach

                                </tbody>

                            </table>

                        </div>

                    </div>

                </div>

            </div>

        </div>
        </div>

    </div>

</div>
    
    </section>

</div>

<!-- =========================
TOP RECOMMENDATION
========================= -->

<section class="top-recommendation-section">

    <div class="container">

        <!-- Title -->
        <div class="mb-4">

            <h2 class="top-title">

                Top 6 Recommendation

            </h2>

            <p class="text-secondary">

                Destinasi wisata terbaik berdasarkan
                hasil perhitungan metode SAW.

            </p>

        </div>

    @if($topWisatas->count() > 0)

    <!-- Grid -->
    <div class="row g-4">

        @foreach($topWisatas as $wisata)

        <div class="col-lg-4 col-md-6">

            <div class="card wisata-card h-100">

                <!-- Image -->
                <div class="position-relative">

                    <img
                    loading="lazy"
                    src="{{ $wisata->image_url }}"
                    class="card-img-top wisata-image"
                    alt="{{ $wisata->nama }}"
                    >

                    <!-- Ranking -->
                    <div class="rating-box">

                        ⭐ #{{ $wisata->ranking }}

                    </div>

                </div>

                <!-- Body -->
                <div class="card-body d-flex flex-column">

                    <!-- Category -->
                    <p class="category-text mb-2">

                        {{ $wisata->kategori }}

                    </p>

                    <!-- Title -->
                    <h3 class="wisata-title mb-3">

                        {{ $wisata->nama }}

                    </h3>

                    <!-- Description -->
                    <p class="text-secondary mb-4">

                        {{ \Illuminate\Support\Str::limit($wisata->deskripsi, 90) }}

                    </p>

                    <!-- SAW SCORE -->
                    <div class="score-box mb-4">

                        <span>

                            SAW Score

                        </span>

                        <strong>

                            {{ $wisata->saw_score }}

                        </strong>

                    </div>

                    <!-- Button -->
                    <a href="/wisata/{{ $wisata->id }}"
                        class="btn btn-outline-dark rounded-4 mt-auto">

                        View Details

                    </a>

                </div>

            </div>

        </div>

        @endforeach

    </div>

    @else

    <div class="empty-state">

        <div class="empty-icon">

            <i class="bi bi-search"></i>

        </div>

        <h2 class="empty-title">

            Recommendation Tidak Ditemukan

        </h2>

        <p class="empty-text">

            Tidak ada wisata yang cocok dengan
            filter yang Anda pilih.
            Coba ubah kategori, budget,
            atau minimum rating.

        </p>

        <a href="/recommendation"
            class="btn-empty">

            <i class="bi bi-arrow-repeat"></i>

            Reset Recommendation

        </a>

    </div>

    @endif

<!-- =========================
TOURISM INSIGHT
========================= -->

<section class="tourism-insight-section">

    <div class="container">

        <!-- Title -->
        <div class="text-center mb-5">

            <h2 class="top-title">

                Tourism Insights

            </h2>

            <p class="text-secondary">

                Analisis data destinasi wisata berdasarkan
                hasil sistem rekomendasi SAW.

            </p>

        </div>

        <!-- Grid -->
        <div class="row g-4">

            <!-- Total -->
            <div class="col-lg-3 col-md-6">

                <div class="insight-card">

                    <h3>

                        {{ $totalWisata }}

                    </h3>

                    <p>

                        Total Destinations

                    </p>

                </div>

            </div>

            <!-- Harga -->
            <div class="col-lg-3 col-md-6">

                <div class="insight-card">

                    <h3>

                        Rp {{ number_format($avgHarga,0,',','.') }}

                    </h3>

                    <p>

                        Average Ticket Price

                    </p>

                </div>

            </div>

            <!-- Rating -->
            <div class="col-lg-3 col-md-6">

                <div class="insight-card">

                    <h3>

                        {{ $topRating }}

                    </h3>

                    <p>

                        Highest Rating

                    </p>

                </div>

            </div>

            <!-- Kategori -->
            <div class="col-lg-3 col-md-6">

                <div class="insight-card">

                    <h3>

                        {{ $topKategori }}

                    </h3>

                    <p>

                        Most Popular Category

                    </p>

                </div>

            </div>

        </div>

    </div>

</section>


<!-- =========================
SAW EXPLANATION
========================= -->

<section class="saw-explanation-section">

    <div class="container">

        <!-- Title -->
        <div class="text-center mb-5">

            <h2 class="top-title">

                How SAW Recommendation Works

            </h2>

            <p class="text-secondary col-lg-7 mx-auto">

                Sistem rekomendasi ini menggunakan metode
                Simple Additive Weighting (SAW)
                untuk menentukan destinasi wisata terbaik
                berdasarkan preferensi pengguna.

            </p>

        </div>

        <!-- Cards -->
        <div class="row g-4">

            <!-- Harga -->
            <div class="col-lg-4">

                <div class="saw-info-card h-100">

                    <div class="saw-icon">

                        <i class="bi bi-cash-stack"></i>

                    </div>

                    <h4>

                        Harga Tiket

                    </h4>

                    <span class="criteria-badge cost-badge">

                        COST

                    </span>

                    <p>

                        Semakin murah harga tiket wisata,
                        maka nilai rekomendasi akan semakin baik.

                    </p>

                    <strong>

                        Bobot: 40%

                    </strong>

                </div>

            </div>

            <!-- Rating -->
            <div class="col-lg-4">

                <div class="saw-info-card h-100">

                    <div class="saw-icon">

                        <i class="bi bi-star-fill"></i>

                    </div>

                    <h4>

                        Rating Wisata

                    </h4>

                    <span class="criteria-badge benefit-badge">

                        BENEFIT

                    </span>

                    <p>

                        Wisata dengan rating lebih tinggi
                        akan mendapatkan skor rekomendasi lebih besar.

                    </p>

                    <strong>

                        Bobot: 35%

                    </strong>

                </div>

            </div>

            <!-- Review -->
            <div class="col-lg-4">

                <div class="saw-info-card h-100">

                    <div class="saw-icon">

                        <i class="bi bi-chat-dots-fill"></i>

                    </div>

                    <h4>

                        Total Review

                    </h4>

                    <span class="criteria-badge benefit-badge">

                        BENEFIT

                    </span>

                    <p>

                        Semakin banyak review pengguna,
                        maka wisata dianggap semakin populer.

                    </p>

                    <strong>

                        Bobot: 25%

                    </strong>

                </div>

            </div>

        </div>

        <!-- Formula -->
        <div class="formula-box mt-5">

            <h4 class="mb-3">

                Formula SAW

            </h4>

            <p class="formula-text">

                Vᵢ = Σ (Wⱼ × Rᵢⱼ)

            </p>

            <p class="text-secondary mb-0">

                Nilai akhir diperoleh dari hasil perkalian
                bobot kriteria dengan nilai normalisasi
                masing-masing alternatif wisata.

            </p>

        </div>

    </div>

</section>

@endsection
