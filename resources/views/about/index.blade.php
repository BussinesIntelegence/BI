@extends('layouts.app')

@section('content')

<!-- =========================
HERO
========================= -->

<section class="about-hero">

    <div class="container position-relative">

        <div class="hero-content">

            <h1>

                Tentang JogjaExplore

            </h1>

            <p>

                Menjembatani nilai luhur warisan budaya
                dengan kecanggihan teknologi digital
                untuk pengalaman wisata yang tak terlupakan.

            </p>

        </div>

    </div>

</section>

<!-- =========================
ABOUT
========================= -->

<section class="about-section">

    <div class="container">

        <div class="row align-items-center g-5">

            <!-- LEFT -->
            <div class="col-lg-6">

                <span class="section-label">

                    MISI KAMI

                </span>

                <h2 class="about-title">

                    Menemukan Permata
                    Tersembunyi Yogyakarta

                </h2>

                <p class="about-text">

                    JogjaExplore hadir sebagai sistem
                    informasi dan rekomendasi berbasis web
                    yang dirancang khusus untuk membantu
                    wisatawan menemukan destinasi terbaik
                    di Yogyakarta menggunakan metode
                    Simple Additive Weighting (SAW).

                </p>

                <p class="about-text">

                    Sistem ini menggabungkan analisis data,
                    rating, ulasan, dan harga wisata
                    untuk menghasilkan rekomendasi
                    yang lebih akurat dan relevan.

                </p>

                <a href="/explore"
                    class="btn-about">

                    Mulai Eksplorasi

                </a>

            </div>

            <!-- RIGHT -->
            <div class="col-lg-6">

                <img

                    src="{{ asset('assets/images/wisata/jogja.png') }}"

                    class="about-image"

                    alt="About Jogja"

                >

            </div>

        </div>

    </div>

</section>

<!-- =========================
FEATURES
========================= -->

<section class="feature-section">

    <div class="container">

        <!-- Title -->
        <div class="text-center mb-5">

            <h2 class="top-title">

                Inovasi Digital Wisata

            </h2>

        </div>

        <div class="row g-4">

            <!-- SAW -->
            <div class="col-lg-6">

                <div class="feature-card large-card">

                    <div class="feature-icon">

                        <i class="bi bi-stars"></i>

                    </div>

                    <h3>

                        Smart Recommendations (SAW)

                    </h3>

                    <p>

                        Sistem rekomendasi menggunakan
                        metode SAW untuk memberikan
                        rekomendasi wisata terbaik
                        berdasarkan preferensi pengguna.

                    </p>

                </div>

            </div>

            <!-- Explore -->
            <div class="col-lg-6">

                <div class="feature-card dark-card">

                    <div class="feature-icon">

                        <i class="bi bi-compass"></i>

                    </div>

                    <h3>

                        Eksplorasi Tak Terbatas

                    </h3>

                    <p>

                        Jelajahi destinasi wisata,
                        budaya, kuliner, dan alam
                        Yogyakarta secara digital.

                    </p>

                </div>

            </div>

            <!-- Favorite -->
            <div class="col-lg-4">

                <div class="feature-card">

                    <div class="feature-icon">

                        <i class="bi bi-heart"></i>

                    </div>

                    <h3>

                        Daftar Favorit

                    </h3>

                    <p>

                        Simpan destinasi wisata
                        favorit untuk perjalanan Anda.

                    </p>

                </div>

            </div>

            <!-- BI -->
            <div class="col-lg-8">

                <div class="feature-card horizontal-card">

                    <div class="row align-items-center">

                        <div class="col-md-4">

                            <img
                                src="https://images.unsplash.com/photo-1506744038136-46273834b3fb?q=80&w=1200&auto=format&fit=crop"
                                class="horizontal-image"
                            >

                        </div>

                        <div class="col-md-8">

                            <h3>

                                Business Intelligence & DSS

                            </h3>

                            <p>

                                Dashboard analitik dan
                                metode DSS membantu
                                menghasilkan insight wisata
                                yang lebih akurat dan informatif.

                            </p>

                        </div>

                    </div>

                </div>

            </div>

        </div>

    </div>

</section>

<!-- =========================
CTA
========================= -->

<section class="about-cta">

    <div class="container text-center">

        <h2>

            Mari Temukan Cerita Anda
            di Yogyakarta

        </h2>

        <p>

            Ribuan destinasi bersejarah menanti
            untuk Anda jelajahi bersama JogjaExplore.

        </p>

        <div class="d-flex justify-content-center gap-3 flex-wrap">

            <a href="/explore"
                class="btn-cta-light">

                Cari Destinasi

            </a>

            <a href="/recommendation"
                class="btn-cta-outline">

                Rekomendasi SAW

            </a>

        </div>

    </div>

</section>

@endsection
