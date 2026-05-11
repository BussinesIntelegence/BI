@extends('admin.layouts.app')

@section('content')

<!-- HEADER -->

<div class="d-flex justify-content-between align-items-center mb-5">

    <div>

        <h1 class="dashboard-title">

            Review Destinations

        </h1>

        <p class="dashboard-subtitle">

            Kelola review berdasarkan destinasi wisata.

        </p>

    </div>

</div>

<!-- ========================================
FILTER
======================================== -->

<div class="admin-box mb-4">

    <form
        method="GET"
        class="row g-3"
    >

        <!-- SEARCH -->

        <div class="col-lg-5">

            <input
                type="text"
                name="search"
                class="form-control"
                placeholder="Search destination..."
                value="{{ request('search') }}"
            >

        </div>

        <!-- CATEGORY -->

        <div class="col-lg-3">

            <select
                name="kategori"
                class="form-select"
            >

                <option value="">

                    All Categories

                </option>

                <option
                    value="Alam"
                    @selected(request('kategori') == 'Alam')
                >

                    Alam

                </option>

                <option
                    value="Budaya"
                    @selected(request('kategori') == 'Budaya')
                >

                    Budaya

                </option>

                <option
                    value="Kuliner"
                    @selected(request('kategori') == 'Kuliner')
                >

                    Kuliner

                </option>

                <option
                    value="Pantai"
                    @selected(request('kategori') == 'Pantai')
                >

                    Pantai

                </option>

            </select>

        </div>

        <!-- PENDING ONLY -->

        <div class="col-lg-2">

            <div class="form-check mt-2">

                <input
                    class="form-check-input"
                    type="checkbox"
                    name="pending"
                    value="1"
                    id="pendingOnly"

                    @checked(request('pending'))
                >

                <label
                    class="form-check-label"
                    for="pendingOnly"
                >

                    Pending Only

                </label>

            </div>

        </div>

        <!-- BUTTON -->

        <div class="col-lg-2">

            <button class="btn btn-maroon w-100">

                <i class="bi bi-search"></i>

                Filter

            </button>

            <a
                href="/admin/reviews"
                class="btn btn-light w-100 mt-2"
            >

                Reset

            </a>

        </div>

    </form>

</div>

<!-- TABLE -->

<div class="admin-box">

    <div class="table-responsive">

        <table class="table align-middle admin-table">

            <thead>

                <tr>

                    <th>DESTINATION</th>
                    <th>TOTAL REVIEW</th>
                    <th>PENDING</th>
                    <th>APPROVED</th>
                    <th>RATING</th>
                    <th>ACTION</th>

                </tr>

            </thead>

            <tbody>

                @foreach($wisatas as $wisata)

                <tr>

                    <!-- DESTINATION -->
                    <td>

                        <div class="d-flex align-items-center gap-3">

                            <img
                                src="{{ $wisata->image_url }}"
                                width="70"
                                height="70"
                                style="
                                    object-fit:cover;
                                    border-radius:16px;
                                "
                            >

                            <div>

                                <strong>

                                    {{ $wisata->nama }}

                                </strong>

                                <p class="text-secondary mb-0">

                                    {{ $wisata->kategori }}

                                </p>

                            </div>

                        </div>

                    </td>

                    <!-- TOTAL -->
                    <td>

                        {{ $wisata->reviews_count }}

                    </td>

                    <!-- PENDING -->
                    <td>

                        <span class="badge bg-warning-subtle text-warning-emphasis">

                            {{ $wisata->pending_reviews_count }}

                        </span>

                    </td>

                    <!-- APPROVED -->
                    <td>

                        <span class="badge bg-success-subtle text-success">

                            {{ $wisata->approved_reviews_count }}

                        </span>

                    </td>

                    <!-- RATING -->
                    <td>

                        ⭐ {{ number_format($wisata->rating,1) }}

                    </td>

                    <!-- ACTION -->
                    <td>

                        <a
                            href="/admin/reviews/{{ $wisata->id }}"
                            class="btn btn-maroon"
                        >

                            Manage Reviews

                        </a>

                    </td>

                </tr>

                @endforeach

            </tbody>

        </table>

    </div>

    <div class="mt-4">

        {{ $wisatas->links() }}

    </div>

</div>

@endsection