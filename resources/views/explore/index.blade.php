@extends('layouts.app')

@section('content')

<div class="container py-5">

    <!-- =========================
    PAGE HEADER
    ========================== -->

    <div class="mb-5 text-center">

        <h1 class="section-title">
            Explore Destinations
        </h1>

        <p class="section-subtitle mx-auto col-lg-6">

            Temukan berbagai destinasi wisata terbaik di Yogyakarta
            untuk perjalanan yang tak terlupakan.

        </p>

    </div>

    <!-- =========================
    SEARCH FORM
    ========================== -->

    <div class="search-wrapper mb-4">

        <form action="/explore" method="GET" class="w-100">

            <div class="search-box mx-auto">

                <!-- Search Icon -->
                <i class="bi bi-search search-icon"></i>

                <!-- Input -->
                <input
                    type="text"
                    class="form-control search-input"
                    placeholder="Cari wisata favorit..."
                    name="search"
                    id="liveSearch"
                    value="{{ request('search') }}"
                >

            </div>

        @if(request('kategori'))

        <input
            type="hidden"
            name="kategori"
            value="{{ request('kategori') }}"
        >

        @endif

        </form>

    </div>

    <!-- =========================
    FILTER BUTTON
    ========================== -->

    <div class="d-flex flex-wrap justify-content-center gap-3 mb-5">

        <!-- Semua -->
        <a
            href="/explore"
            class="btn-category text-decoration-none
            {{ !request('kategori') ? 'active-category' : '' }}">

            Semua

        </a>

        <!-- Alam -->
        <a
            href="/explore?kategori=alam"
            class="btn-category text-decoration-none
            {{ request('kategori') == 'alam' ? 'active-category' : '' }}">

            Alam

        </a>

        <!-- Pantai -->
        <a
            href="/explore?kategori=pantai"
            class="btn-category text-decoration-none
            {{ request('kategori') == 'pantai' ? 'active-category' : '' }}">

            Pantai

        </a>

        <!-- Budaya -->
        <a
            href="/explore?kategori=budaya"
            class="btn-category text-decoration-none
            {{ request('kategori') == 'budaya' ? 'active-category' : '' }}">

            Budaya

        </a>

        <!-- Museum -->
        <a
            href="/explore?kategori=museum"
            class="btn-category text-decoration-none
            {{ request('kategori') == 'museum' ? 'active-category' : '' }}">

            Museum

        </a>

        <!-- Buatan -->
        <a
            href="/explore?kategori=buatan"
            class="btn-category text-decoration-none
            {{ request('kategori') == 'buatan' ? 'active-category' : '' }}">

            Buatan

        </a>

    </div>

    <!-- =========================
    GRID WISATA
    ========================== -->

<div id="wisataContainer">

    @include('explore._cards')

</div>

    <!-- =========================
    PAGINATION
    ========================== -->

    <div class="mt-5 d-flex justify-content-center">

        {{ $wisatas->links() }}

    </div>

</div>

@endsection