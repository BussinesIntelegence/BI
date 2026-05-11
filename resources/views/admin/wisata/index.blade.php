@extends('admin.layouts.app')

@section('content')

<!-- =========================
HEADER
========================= -->

<div class="d-flex justify-content-between align-items-center flex-wrap gap-3 mb-5">

    <!-- LEFT -->
    <div>

        <h1 class="dashboard-title">

            Manage Destinations

        </h1>

        <p class="dashboard-subtitle">

            Curate and monitor the cultural
            heritage sites of Yogyakarta.

        </p>

    </div>

    <!-- RIGHT -->
    <div class="d-flex gap-3">

        <a href="/admin/wisata/create"
            class="btn btn-maroon">

            <i class="bi bi-plus-lg"></i>
            Add New Destination

        </a>

    </div>

</div>

<!-- =========================
TABLE BOX
========================= -->

<div class="admin-box">

    <!-- TOP -->
    <div class="d-flex justify-content-between align-items-center flex-wrap gap-3 mb-4">

        <!-- Search -->
        <form
            action="/admin/wisata"
            method="GET"
            class="admin-search-form"
        >

            <div class="search-table-box">

                <i class="bi bi-search"></i>

                <input
                    type="text"
                    name="search"
                    placeholder="Search by name or category..."
                    value="{{ request('search') }}"
                >

            </div>

        </form>

        <!-- Total -->
        <p class="text-secondary mb-0">

            Showing {{ $wisatas->count() }}
            of {{ $wisatas->total() }}

        </p>

    </div>

    <!-- TABLE -->
    <div class="table-responsive">

        <table class="table align-middle admin-table">

            <thead>

                <tr>

                    <th>DESTINATION</th>
                    <th>CATEGORY</th>
                    <th>RATING</th>
                    <th>PRICE</th>
                    <th>ACTIONS</th>

                </tr>

            </thead>

            <tbody>

                @forelse($wisatas as $wisata)

                <tr>

                    <!-- Destination -->
                    <td>

                        <div class="d-flex align-items-center gap-3">

                            <!-- Image -->
                            <img

                                src="{{ $wisata->gambar
                                    ? asset('assets/images/wisata/' . $wisata->gambar)
                                    : 'https://picsum.photos/seed/' . $wisata->id . '/200/200' }}"

                                class="admin-wisata-thumb"

                                alt="{{ $wisata->nama }}"

                            >

                            <!-- Info -->
                            <div>

                                <strong>

                                    {{ $wisata->nama }}

                                </strong>

                                <p class="text-secondary mb-0">

                                    Ref ID:
                                    JK-{{ $wisata->id }}

                                </p>

                            </div>

                        </div>

                    </td>

                    <!-- Category -->
                    <td>

                        <span class="category-badge">

                            {{ $wisata->kategori }}

                        </span>

                    </td>

                    <!-- Rating -->
                    <td>

                        ⭐ {{ $wisata->rating }}

                    </td>

                    <!-- Price -->
                    <td>

                        Rp {{ number_format($wisata->harga_weekday,0,',','.') }}

                    </td>

                    <!-- Actions -->
                    <td>

                        <div class="d-flex gap-3">

                            <!-- View -->
                            <a
                                href="/wisata/{{ $wisata->id }}"
                                class="action-btn"
                                target="_blank"
                            >

                                <i class="bi bi-eye"></i>

                            </a>

                            <!-- Edit -->
                            <a
                                href="/admin/wisata/{{ $wisata->id }}/edit"
                                class="action-btn"
                            >

                                <i class="bi bi-pencil"></i>

                            </a>

                            <!-- Delete -->
                            <form
                                action="{{ route('wisata.destroy', $wisata->id) }}"
                                method="POST"
                                class="delete-form"
                            >

                                @csrf
                                @method('DELETE')

                                <button
                                    type="button"
                                    class="action-btn delete-action-btn"
                                    onclick="openDeleteModal(this)"
                                >

                                    <i class="bi bi-trash"></i>

                                </button>

                            </form>

                        </div>

                    </td>

                </tr>

                @empty

                <tr>

                    <td colspan="5" class="text-center py-5">

                        <h5>

                            Data wisata tidak ditemukan

                        </h5>

                    </td>

                </tr>

                @endforelse

            </tbody>

        </table>

    </div>

    <!-- PAGINATION -->
    <div class="mt-4">

        {{ $wisatas->links() }}

    </div>

</div>


<!-- =========================
DELETE MODAL
========================= -->

<div
    class="delete-modal-overlay"
    id="deleteModal"
>

    <div class="delete-modal-box">

        <!-- Icon -->
        <div class="delete-icon">

            <i class="bi bi-trash3-fill"></i>

        </div>

        <!-- Title -->
        <h3>
            Hapus Wisata?
        </h3>

        <!-- Subtitle -->
        <p>

            Data wisata yang dihapus
            tidak dapat dikembalikan.

        </p>

        <!-- Actions -->
        <div class="delete-actions">

            <button
                class="btn-cancel"
                onclick="closeDeleteModal()"
            >

                Batal

            </button>

            <button
                class="btn-delete-confirm"
                id="confirmDeleteBtn"
            >

                Ya, Hapus

            </button>

        </div>

    </div>

</div>

<script>

    // =========================
    // DELETE MODAL
    // =========================

    let selectedForm = null;

    // Open
    function openDeleteModal(button){

        selectedForm = button.closest('.delete-form');

        document
            .getElementById('deleteModal')
            .classList
            .add('show');
    }

    // Close
    function closeDeleteModal(){

        document
            .getElementById('deleteModal')
            .classList
            .remove('show');
    }

    // Confirm Delete
    document
        .getElementById('confirmDeleteBtn')
        .addEventListener('click', function(){

            if(selectedForm){

                selectedForm.submit();

            }

        });

</script>

@endsection