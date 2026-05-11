@extends('layouts.app')

@section('content')

<div class="container py-5">

    <!-- =========================
    HERO IMAGE
    ========================== -->

    <div class="detail-hero mb-5">

        <img
            loading="lazy"
            src="{{ $wisata->gambar
                ? asset('assets/images/wisata/' . $wisata->gambar)
                : 'https://via.placeholder.com/1200x600?text=Wisata+Jogja' }}"

            class="detail-image"
            alt="{{ $wisata->nama }}"
        >

    </div>

    <!-- =========================
    DETAIL CONTENT
    ========================== -->

    <div class="row g-5">

        <!-- LEFT CONTENT -->
        <div class="col-lg-8">

            <!-- Category -->
            <p class="category-text mb-3">

                {{ $wisata->kategori }}

            </p>

            <!-- Title -->
            <h1 class="detail-title mb-4">

                {{ $wisata->nama }}

            </h1>

            <!-- Info -->
            <div class="d-flex flex-wrap gap-4 mb-4">

                <div class="info-box">
                    ⭐ Rating:
                    <strong>
                        {{ number_format($wisata->rating,1) }}
                    </strong>
                </div>

                <div class="info-box">
                    👥 Review:
                    <strong>
                        {{ number_format($wisata->total_review) }}
                    </strong>
                </div>

            </div>

            <!-- Description -->
            <div class="detail-description">

                <h4 class="mb-3">
                    Tentang Wisata
                </h4>

                <p>

                    {{ $wisata->deskripsi }}

                </p>

            </div>

        </div>

        <!-- RIGHT SIDEBAR -->
        <div class="col-lg-4">

            <div class="detail-sidebar">

                <!-- Harga -->
                <div class="mb-4">

                    <h5 class="mb-3">
                        Harga Tiket
                    </h5>

                    <div class="price-item">

                        <span>Weekday</span>

                        <strong>
                            Rp {{ number_format($wisata->harga_weekday,0,',','.') }}
                        </strong>

                    </div>

                    <div class="price-item">

                        <span>Weekend</span>

                        <strong>
                            Rp {{ number_format($wisata->harga_weekend,0,',','.') }}
                        </strong>

                    </div>

                </div>

                <!-- Tombol -->
                <form action="/favorite/{{ $wisata->id }}" method="POST">

                    @csrf

                    <button class="btn btn-maroon w-100 mb-3">

                        <i class="bi bi-heart-fill"></i>
                        Save Destination

                    </button>

                </form>

                <button class="btn btn-outline-dark w-100 rounded-4">

                    <i class="bi bi-geo-alt"></i>
                    View Location

                </button>

            </div>

        </div>

    </div>

<!-- =========================
LOCATION SECTION
========================= -->

    <div class="location-section mt-5 pt-5">

        <div class="row g-5 align-items-center">

            <!-- LEFT -->
            <div class="col-lg-5">

                <p class="category-text mb-3">

                    Lokasi Wisata

                </p>

                <h2 class="top-title mb-4">

                    Temukan Lokasi
                    {{ $wisata->nama }}

                </h2>

                <p class="text-secondary mb-4">

                    Jelajahi lokasi destinasi wisata secara langsung
                    melalui peta interaktif untuk memudahkan perjalanan Anda.

                </p>

                <!-- Info Card -->
                <div class="location-card">

                    <div class="d-flex align-items-center gap-3">

                        <div class="location-icon">

                            <i class="bi bi-geo-alt-fill"></i>

                        </div>

                        <div>

                            <h5 class="mb-1">

                                {{ $wisata->nama }}

                            </h5>

                            <p class="text-secondary mb-0">

                                Yogyakarta, Indonesia

                            </p>

                        </div>

                    </div>

                </div>

            </div>

            <!-- RIGHT -->
            <div class="col-lg-7">

                <div class="map-wrapper">

                    <iframe
                        src="https://www.google.com/maps?q={{ urlencode($wisata->nama . ' Yogyakarta') }}&output=embed"

                        width="100%"
                        height="450"

                        style="border:0;"
                        allowfullscreen=""
                        loading="lazy"
                        referrerpolicy="no-referrer-when-downgrade">

                    </iframe>

                </div>

            </div>

        </div>

    </div>

    <!-- =========================
    REKOMENDASI
    ========================== -->

    <div class="mt-5 pt-5">

        <h2 class="top-title mb-4">

            Rekomendasi Lainnya

        </h2>

        <div class="row g-4">

            @foreach($rekomendasi as $item)

            <div class="col-lg-4">

                <div class="card wisata-card h-100">

                    <!-- Image -->
                    <img
                        loading="lazy"
                        src="{{ $item->gambar
                            ? asset('assets/images/wisata/' . $item->gambar)
                            : 'https://via.placeholder.com/600x400?text=Wisata+Jogja' }}"

                        class="card-img-top wisata-image"
                        alt="{{ $item->nama }}"
                    >

                    <!-- Body -->
                    <div class="card-body">

                        <p class="category-text mb-2">

                            {{ $item->kategori }}

                        </p>

                        <h4 class="mb-3">

                            {{ $item->nama }}

                        </h4>

                        <a href="/wisata/{{ $item->id }}"
                            class="btn btn-outline-dark rounded-4">

                            View Details

                        </a>

                    </div>

                </div>

            </div>

            @endforeach

        </div>

    </div>

</div>

@endsection