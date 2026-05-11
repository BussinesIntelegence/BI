@extends('layouts.app')

@section('content')

<div class="home-page">

    <!-- ========================================
    HERO SECTION
    ========================================= -->

    <section class="hero-home">

        <!-- VIDEO BACKGROUND -->
        <video
            autoplay
            muted
            loop
            playsinline
            class="hero-video"
        >

            <source
                src="{{ asset('assets/videos/jogja-cinematic.mp4') }}"
                type="video/mp4"
            >

        </video>

        <!-- Overlay -->
        <div class="hero-overlay"></div>

        <!-- Content -->
        <div class="container h-100 d-flex align-items-center">

            <div class="hero-content position-relative">

                <!-- Badge -->
                <div class="hero-badge">

                    Explore Cultural Heritage of Yogyakarta

                </div>

                <!-- Heading -->
                <h1 class="hero-title">

                    Discover
                    The Soul of
                    Yogyakarta

                </h1>

                <!-- Subtitle -->
                <p class="hero-subtitle">

                    Jelajahi destinasi wisata terbaik di Yogyakarta
                    mulai dari budaya,
                    alam,
                    pantai,
                    hingga pengalaman autentik berbasis
                    rekomendasi pintar DSS.

                </p>

                <!-- Search -->
                <form
                    action="/explore"
                    method="GET"
                    class="hero-search-box"
                >

                    <i class="bi bi-search"></i>

                    <input
                        type="text"
                        name="search"
                        placeholder="Cari destinasi wisata..."
                    >

                    <button type="submit">

                        Explore

                    </button>

                </form>

                <!-- Stats -->
                <div class="hero-stats">

                    <!-- Item -->
                    <div class="hero-stat-item">

                        <strong>

                            473+

                        </strong>

                        <span>

                            Destinations

                        </span>

                    </div>

                    <!-- Item -->
                    <div class="hero-stat-item">

                        <strong>

                            4.8★

                        </strong>

                        <span>

                            Average Rating

                        </span>

                    </div>

                    <!-- Item -->
                    <div class="hero-stat-item">

                        <strong>

                            DSS Powered

                        </strong>

                        <span>

                            Smart Recommendation

                        </span>

                    </div>

                </div>

            </div>

        </div>

    </section>

    <!-- ========================================
    TOP DESTINATION SECTION
    ========================================= -->

    <section class="destination-section py-5">

        <div class="container">

            <!-- Section Heading -->
            <div class="section-heading mb-5">

                <h2 class="top-title">

                    Top Destinasi

                </h2>

                <p class="text-secondary">

                    Pilihan terbaik untuk petualangan Anda minggu ini.

                </p>

            </div>

            <!-- Cards -->
            <div class="row g-4">

                @foreach($wisatas as $wisata)

                <div class="col-lg-4 col-md-6">

                    <div class="card wisata-card h-100">

                        <!-- Image -->
                        <div class="position-relative overflow-hidden">

                            <img
                                loading="lazy"
                                src="{{ $wisata->image_url }}"
                                class="card-img-top wisata-image"
                                alt="{{ $wisata->nama }}"
                            >

                            <!-- Rating -->
                            <div class="rating-box">

                                ⭐ {{ number_format($wisata->rating,1) }}

                            </div>

                        </div>

                        <!-- Body -->
                        <div class="card-body d-flex flex-column p-4">

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

                                <a
                                    href="/wisata/{{ $wisata->id }}"
                                    class="btn btn-outline-dark w-100"
                                >

                                    View Details

                                </a>

                            </div>

                        </div>

                    </div>

                </div>

                @endforeach

            </div>

        </div>

    </section>

</div>

@endsection