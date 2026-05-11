@extends('admin.layouts.app')

@section('content')

<!-- =========================
HEADER
========================= -->

<div class="d-flex justify-content-between align-items-center mb-5">

    <div>

        <h1 class="dashboard-title">

            Add New Destination

        </h1>

        <p class="dashboard-subtitle">

            Tambahkan destinasi wisata baru
            ke sistem JogjaExplore.

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
        action="/admin/wisata"
        method="POST"
        enctype="multipart/form-data"
    >

        @csrf

        <div class="row g-4">

            <!-- =========================
            LEFT
            ========================== -->

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
                        placeholder="Masukkan nama wisata..."
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
                        placeholder="Masukkan deskripsi wisata..."
                    ></textarea>

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

                        <option value="">
                            -- Pilih Kategori --
                        </option>

                        <option value="Budaya">
                            Budaya
                        </option>

                        <option value="Alam">
                            Alam
                        </option>

                        <option value="Pantai">
                            Pantai
                        </option>

                        <option value="Kuliner">
                            Kuliner
                        </option>

                    </select>

                </div>

            </div>

            <!-- =========================
            RIGHT
            ========================== -->

            <div class="col-lg-4">

                <!-- Upload -->
                <div class="mb-4">

                    <label class="admin-label">

                        Gambar Wisata

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
                        placeholder="4.8"
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
                        placeholder="15000"
                    >

                </div>

                <!-- Submit -->
                <button
                    type="submit"
                    class="btn btn-maroon w-100"
                >

                    <i class="bi bi-save"></i>
                    Save Destination

                </button>

            </div>

        </div>

    </form>

</div>

@endsection