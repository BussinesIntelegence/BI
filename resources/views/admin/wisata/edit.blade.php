@extends('admin.layouts.app')

@section('content')

<!-- =========================
HEADER
========================= -->

<div class="d-flex justify-content-between align-items-center mb-5">

    <div>

        <h1 class="dashboard-title">

            Edit Destination

        </h1>

        <p class="dashboard-subtitle">

            Update informasi destinasi wisata.

        </p>

    </div>

    <!-- Back -->
    <a
        href="/admin/wisata"
        class="btn btn-light custom-outline-btn"
    >

        <i class="bi bi-arrow-left"></i>
        Back

    </a>

</div>

<!-- =========================
FORM BOX
========================= -->

<div class="admin-box">

    <form
        action="/admin/wisata/{{ $wisata->id }}"
        method="POST"
        enctype="multipart/form-data"
    >

        @csrf
        @method('PUT')

        <div class="row g-4">

            <!-- LEFT -->
            <div class="col-lg-8">

                <!-- Nama -->
                <div class="mb-4">

                    <label class="admin-label">

                        Nama Wisata

                    </label>

                    <input
                        type="text"
                        name="nama"
                        class="form-control admin-input"
                        value="{{ $wisata->nama }}"
                    >

                </div>

                <!-- Deskripsi -->
                <div class="mb-4">

                    <label class="admin-label">

                        Deskripsi

                    </label>

                    <textarea
                        name="deskripsi"
                        rows="8"
                        class="form-control admin-input"
                    >{{ $wisata->deskripsi }}</textarea>

                </div>

                <!-- Kategori -->
                <div class="mb-4">

                    <label class="admin-label">

                        Kategori

                    </label>

                    <select
                        name="kategori"
                        class="form-select admin-input"
                    >

                        <option
                            value="Budaya"
                            {{ $wisata->kategori == 'Budaya' ? 'selected' : '' }}
                        >
                            Budaya
                        </option>

                        <option
                            value="Alam"
                            {{ $wisata->kategori == 'Alam' ? 'selected' : '' }}
                        >
                            Alam
                        </option>

                        <option
                            value="Pantai"
                            {{ $wisata->kategori == 'Pantai' ? 'selected' : '' }}
                        >
                            Pantai
                        </option>

                        <option
                            value="Kuliner"
                            {{ $wisata->kategori == 'Kuliner' ? 'selected' : '' }}
                        >
                            Kuliner
                        </option>

                    </select>

                </div>

            </div>

            <!-- RIGHT -->
            <div class="col-lg-4">

                <!-- Preview -->
                <div class="mb-4">

                    <label class="admin-label">

                        Current Image

                    </label>

                    <img
                        src="{{ $wisata->gambar
                            ? asset('assets/images/wisata/' . $wisata->gambar)
                            : 'https://via.placeholder.com/400x300?text=No+Image' }}"

                        class="img-fluid rounded-4"
                    >

                </div>

                <!-- Upload -->
                <div class="mb-4">

                    <label class="admin-label">

                        Replace Image

                    </label>

                    <input
                        type="file"
                        name="gambar"
                        class="form-control admin-input"
                    >

                </div>

                <!-- Rating -->
                <div class="mb-4">

                    <label class="admin-label">

                        Rating

                    </label>

                    <input
                        type="number"
                        step="0.1"
                        name="rating"
                        class="form-control admin-input"
                        value="{{ $wisata->rating }}"
                    >

                </div>

                <!-- Harga -->
                <div class="mb-4">

                    <label class="admin-label">

                        Harga Weekday

                    </label>

                    <input
                        type="number"
                        name="harga_weekday"
                        class="form-control admin-input"
                        value="{{ $wisata->harga_weekday }}"
                    >

                </div>

                <!-- Submit -->
                <button
                    type="submit"
                    class="btn btn-maroon w-100"
                >

                    <i class="bi bi-save"></i>
                    Update Destination

                </button>

            </div>

        </div>

    </form>

</div>

@endsection