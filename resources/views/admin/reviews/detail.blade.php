@extends('admin.layouts.app')

@section('content')

<!-- ========================================
HEADER
======================================== -->

<div class="d-flex justify-content-between align-items-center flex-wrap gap-3 mb-5">

    <!-- LEFT -->
    <div class="d-flex align-items-center gap-4">

        <img
            src="{{ $wisata->image_url }}"
            width="100"
            height="100"
            style="
                object-fit: cover;
                border-radius: 24px;
            "
        >

        <div>

            <h1 class="dashboard-title mb-2">

                {{ $wisata->nama }}

            </h1>

            <p class="dashboard-subtitle mb-0">

                Moderasi review pengunjung destinasi wisata.

            </p>

        </div>

    </div>

    <!-- RIGHT -->
    <a
        href="/admin/reviews"
        class="btn btn-outline-dark rounded-4"
    >

        <i class="bi bi-arrow-left"></i>

        Back

    </a>

</div>

<!-- ========================================
SUMMARY
======================================== -->

<div class="row g-4 mb-5">

    <!-- TOTAL -->
    <div class="col-lg-4">

        <div class="admin-card">

            <div class="card-icon bg-soft-blue">

                <i class="bi bi-chat-dots"></i>

            </div>

            <p class="admin-card-label">

                Total Reviews

            </p>

            <h2 class="admin-card-value">

                {{ $reviews->total() }}

            </h2>

        </div>

    </div>

    <!-- PENDING -->
    <div class="col-lg-4">

        <div class="admin-card">

            <div class="card-icon bg-soft-yellow">

                <i class="bi bi-hourglass-split"></i>

            </div>

            <p class="admin-card-label">

                Pending Reviews

            </p>

            <h2 class="admin-card-value text-warning">

                {{ $reviews->where('status','pending')->count() }}

            </h2>

        </div>

    </div>

    <!-- APPROVED -->
    <div class="col-lg-4">

        <div class="admin-card">

            <div class="card-icon bg-soft-green">

                <i class="bi bi-check-circle"></i>

            </div>

            <p class="admin-card-label">

                Approved Reviews

            </p>

            <h2 class="admin-card-value text-success">

                {{ $reviews->where('status','approved')->count() }}

            </h2>

        </div>

    </div>

</div>

<!-- ========================================
REVIEWS LIST
======================================== -->

<div class="review-management-wrapper">

    <div class="d-flex justify-content-between align-items-center mb-4">

        <div class="review-page-header">

            <h1 class="review-page-title">

                Visitor Reviews

            </h1>

            <p class="review-page-subtitle">

                Kelola dan moderasi review pengunjung.

            </p>

        </div>

    </div>

    <!-- ========================================
FILTER
======================================== -->

<form
    method="GET"
    class="row g-3 mb-5"
>

    <!-- SEARCH -->

    <div class="col-lg-4">

        <input
            type="text"
            name="search"
            class="form-control"
            placeholder="Search visitor..."
            value="{{ request('search') }}"
        >

    </div>

    <!-- STATUS -->

    <div class="col-lg-3">

        <select
            name="status"
            class="form-select"
        >

            <option value="">

                All Status

            </option>

            <option
                value="pending"
                @selected(request('status') == 'pending')
            >

                Pending

            </option>

            <option
                value="approved"
                @selected(request('status') == 'approved')
            >

                Approved

            </option>

            <option
                value="rejected"
                @selected(request('status') == 'rejected')
            >

                Rejected

            </option>

        </select>

    </div>

    <!-- RATING -->

    <div class="col-lg-3">

        <select
            name="rating"
            class="form-select"
        >

            <option value="">

                All Rating

            </option>

            <option
                value="5"
                @selected(request('rating') == 5)
            >

                ⭐⭐⭐⭐⭐

            </option>

            <option
                value="4"
                @selected(request('rating') == 4)
            >

                ⭐⭐⭐⭐

            </option>

            <option
                value="3"
                @selected(request('rating') == 3)
            >

                ⭐⭐⭐

            </option>

            <option
                value="2"
                @selected(request('rating') == 2)
            >

                ⭐⭐

            </option>

            <option
                value="1"
                @selected(request('rating') == 1)
            >

                ⭐

            </option>

        </select>

    </div>

    <!-- BUTTON -->

    <div class="col-lg-2">

        <button class="btn btn-maroon w-100">

            <i class="bi bi-search"></i>

            Filter

        </button>

        <a
            href="/admin/reviews/{{ $wisata->id }}"
            class="btn btn-light w-100 mt-2"
        >

            Reset

        </a>

    </div>

</form>

    <!-- REVIEW ITEMS -->

    @forelse($reviews as $review)

    <div class="review-admin-card">

        <!-- TOP -->
        <div class="review-admin-top">

            <div class="d-flex align-items-center gap-3">

                <!-- AVATAR -->
                <div class="review-avatar">

                    {{ strtoupper(substr($review->nama,0,1)) }}

                </div>

                <!-- INFO -->
                <div>

                    <h5 class="mb-1">

                        {{ $review->nama }}

                    </h5>

                    <small class="text-secondary">

                        {{ $review->created_at->diffForHumans() }}

                    </small>

                </div>

            </div>

            <!-- STATUS -->
            <div>

                @if($review->status == 'pending')

                    <span class="badge bg-warning-subtle text-warning-emphasis">

                        Pending

                    </span>

                @elseif($review->status == 'approved')

                    <span class="badge bg-success-subtle text-success">

                        Approved

                    </span>

                @else

                    <span class="badge bg-danger-subtle text-danger">

                        Rejected

                    </span>

                @endif

            </div>

        </div>

        <!-- STARS -->
        <div class="mb-3">

            {!! str_repeat('⭐', $review->rating) !!}

        </div>

        <!-- COMMENT -->
        <p class="review-admin-comment">

            {{ $review->komentar }}

        </p>

        <!-- ACTIONS -->
        <div class="d-flex gap-2 mt-4">

            <!-- APPROVE -->
            <form
                action="/admin/reviews/{{ $review->id }}/approve"
                method="POST"
            >

                @csrf

                <button class="btn btn-success rounded-4">

                    <i class="bi bi-check-lg"></i>

                    Approve

                </button>

            </form>

            <!-- REJECT -->
            <form
                action="/admin/reviews/{{ $review->id }}/reject"
                method="POST"
            >

                @csrf

                <button class="btn btn-warning rounded-4">

                    <i class="bi bi-x-lg"></i>

                    Reject

                </button>

            </form>

            <!-- DELETE -->
            <form
                action="/admin/reviews/{{ $review->id }}"
                method="POST"
            >

                @csrf
                @method('DELETE')

                <button class="btn btn-danger rounded-4">

                    <i class="bi bi-trash"></i>

                    Delete

                </button>

            </form>

        </div>

    </div>

    @empty

    <!-- EMPTY -->

    <div class="empty-review-admin">

        <i class="bi bi-chat-square-heart"></i>

        <h4>

            Belum Ada Review

        </h4>

        <p>

            Saat ini belum ada review
            yang masuk untuk destinasi wisata ini.
            Review pengunjung akan muncul di sini
            setelah dikirimkan dan dimoderasi.

        </p>

    </div>

    @endforelse

    <!-- PAGINATION -->

    <div class="mt-5">

        {{ $reviews->links() }}

    </div>

</div>

@endsection