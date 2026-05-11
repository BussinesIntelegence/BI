@extends('layouts.app')

@section('content')

<div class="container py-5">

    <!-- =========================
    HERO SECTION
    ========================== -->

    <div class="hero-home mb-5">

        <div class="row align-items-center">

            <div class="col-lg-7">

                <!-- Heading -->
                <h1 class="hero-title mb-4">

                    Discover Yogyakarta

                </h1>

                <!-- Subtitle -->
                <p class="hero-subtitle">

                    Jelajahi destinasi wisata terbaik di Yogyakarta
                    mulai dari budaya, alam, pantai hingga kuliner.

                </p>

            </div>

        </div>

    </div>

    <!-- =========================
    TOP DESTINASI
    ========================== -->

    <div class="mb-4">

        <h2 class="top-title">

            Top Destinasi

        </h2>

        <p class="text-secondary">

            Pilihan terbaik untuk petualangan Anda minggu ini.

        </p>

    </div>

    <!-- =========================
    CARD WISATA
    ========================== -->

    <div class="row g-4">

        @foreach($wisatas as $wisata)

        <div class="col-lg-4 col-md-6">

            <div class="card wisata-card h-100">

                <!-- Image -->
                <div class="position-relative">

                    <img
                        loading="lazy"
                        src="{{ $wisata->gambar
                            ? asset('assets/images/wisata/' . $wisata->gambar)
                            : 'https://via.placeholder.com/600x400?text=Wisata+Jogja' }}"

                        class="card-img-top wisata-image"
                        alt="{{ $wisata->nama }}"
                    >

                    <!-- Rating -->
                    <div class="rating-box">

                        ⭐ {{ number_format($wisata->rating,1) }}

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

                    <!-- Footer -->
                    <div class="mt-auto">

                        <a href="/wisata/{{ $wisata->id }}"
                            class="btn btn-outline-dark rounded-4 w-100">

                            View Details

                        </a>

                    </div>

                </div>

            </div>

        </div>

        @endforeach

    </div>

</div>

@endsection