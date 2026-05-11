@extends('layouts.app')

@section('content')

<div class="container py-5">

    <!-- =========================
    HEADER
    ========================== -->

    <div class="mb-5">

        <h1 class="section-title">

            Destinasi Favorit

        </h1>

        <p class="section-subtitle col-lg-6">

            Kumpulan tempat wisata yang telah Anda simpan
            untuk perjalanan berikutnya.

        </p>

    </div>

    <!-- =========================
    FAVORITE LIST
    ========================== -->

    <div class="row g-4">

        @forelse($wisatas as $wisata)

        <div class="col-lg-6">

            <div class="card wisata-card h-100">

                <!-- Image -->
                <img
                    src="{{ $wisata->gambar
                        ? asset('assets/images/wisata/' . $wisata->gambar)
                        : 'https://via.placeholder.com/600x400?text=Wisata+Jogja' }}"

                    class="card-img-top wisata-image"
                    alt="{{ $wisata->nama }}"
                >

                <!-- Body -->
                <div class="card-body">

                    <!-- Category -->
                    <p class="category-text mb-2">

                        {{ $wisata->kategori }}

                    </p>

                    <!-- Title -->
                    <h2 class="mb-3">

                        {{ $wisata->nama }}

                    </h2>

                    <!-- Description -->
                    <p class="text-secondary mb-4">

                        {{ \Illuminate\Support\Str::limit($wisata->deskripsi, 120) }}

                    </p>

                    <!-- Action -->
                    <div class="d-flex gap-3">

                        <!-- Detail -->
                        <a href="/wisata/{{ $wisata->id }}"
                            class="btn btn-outline-dark rounded-4">

                            View Details

                        </a>

                        <!-- Remove -->
                        <form action="/favorite/remove/{{ $wisata->id }}"
                            method="POST">

                            @csrf

                            <button class="btn btn-danger rounded-4">

                                Remove

                            </button>

                        </form>

                    </div>

                </div>

            </div>

        </div>

        @empty

        <div class="col-12">

            <div class="empty-state">

                <div class="empty-icon">

                    <i class="bi bi-heart"></i>

                </div>

                <h2 class="empty-title">

                    Belum Ada Favorite

                </h2>

                <p class="empty-text">

                    Simpan destinasi wisata favorit Anda
                    untuk mempermudah perjalanan
                    dan rekomendasi wisata berikutnya.

                </p>

                <a href="/explore"
                    class="btn-empty">

                    <i class="bi bi-compass"></i>

                    Explore Destinations

                </a>

            </div>

        </div>



        @endforelse

    </div>

</div>

@endsection