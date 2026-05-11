@extends('admin.layouts.app')

@section('content')

<!-- =========================
HEADER
========================= -->

<div class="dashboard-header mb-5">

    <div class="d-flex justify-content-between align-items-center flex-wrap gap-3">

        <!-- Left -->
        <div>

            <h1 class="dashboard-title">

                Sugeng Rawuh, Admin

            </h1>

            <p class="dashboard-subtitle">

                Here is what's happening with Jogja's
                heritage tourism today.

            </p>

        </div>

        <!-- Right -->
        <div class="d-flex gap-3">


        </div>

    </div>

</div>

<!-- =========================
STATISTIC CARDS
========================= -->

<div class="row g-4 mb-5">

    <!-- Total Wisata -->
    <div class="col-lg-3 col-md-6">

        <div class="admin-card">

            <div class="card-icon bg-soft-red">

                <i class="bi bi-people"></i>

            </div>

            <p class="admin-card-label">

                Total Destinations

            </p>

            <h2 class="admin-card-value">

                {{ $totalWisata }}

            </h2>

        </div>

    </div>

    <!-- Rating -->
    <div class="col-lg-3 col-md-6">

        <div class="admin-card">

            <div class="card-icon bg-soft-yellow">

                <i class="bi bi-star"></i>

            </div>

            <p class="admin-card-label">

                Average Rating

            </p>

            <h2 class="admin-card-value">

                {{ $avgRating }}

            </h2>

        </div>

    </div>

    <!-- Total Reviews -->
    <div class="col-lg-3 col-md-6">

        <div class="admin-card">

            <div class="card-icon bg-soft-green">

                <i class="bi bi-chat-dots"></i>

            </div>

            <p class="admin-card-label">
                Total Reviews
            </p>

            <h2 class="admin-card-value">
                {{ number_format($totalReviews) }}
            </h2>

        </div>

    </div>

    <!-- Incomplete Data -->
    <div class="col-lg-3 col-md-6">

        <div class="admin-card">

            <div class="card-icon bg-soft-blue">

                <i class="bi bi-shield-exclamation"></i>

            </div>

            <p class="admin-card-label">
                Incomplete Data
            </p>

            <h2 class="admin-card-value text-danger">
                {{ number_format($incompleteData) }}
            </h2>

        </div>

    </div>

</div>

<!-- =========================
QUICK ACTIONS
========================= -->

<div class="admin-box mb-5">

    <div class="d-flex justify-content-between align-items-center mb-4">

        <div>

            <h3 class="admin-box-title">

                Quick Actions

            </h3>

            <p class="text-secondary mb-0">

                Shortcut untuk pengelolaan sistem wisata.

            </p>

        </div>

    </div>

    <div class="row g-4">

        <!-- Add -->
        <div class="col-lg-3 col-md-6">

            <a
                href="/admin/wisata/create"
                class="quick-action-card"
            >

                <div class="quick-icon bg-soft-red">

                    <i class="bi bi-plus-circle"></i>

                </div>

                <h5>

                    Add Destination

                </h5>

                <p>

                    Tambahkan destinasi wisata baru.

                </p>

            </a>

        </div>

        <!-- Manage -->
        <div class="col-lg-3 col-md-6">

            <a
                href="/admin/wisata"
                class="quick-action-card"
            >

                <div class="quick-icon bg-soft-green">

                    <i class="bi bi-map"></i>

                </div>

                <h5>

                    Manage Destinations

                </h5>

                <p>

                    Kelola seluruh data wisata.

                </p>

            </a>

        </div>

        <!-- Analytics -->
        <div class="col-lg-3 col-md-6">

            <a
                href="/admin/analysis"
                class="quick-action-card"
            >

                <div class="quick-icon bg-soft-blue">

                    <i class="bi bi-bar-chart"></i>

                </div>

                <h5>

                    Open Analytics

                </h5>

                <p>

                    Lihat analisis DSS & SAW.

                </p>

            </a>

        </div>

        <!-- Reviews -->
        <div class="col-lg-3 col-md-6">

            <a
                href="/admin/review"
                class="quick-action-card"
            >

                <div class="quick-icon bg-soft-yellow">

                    <i class="bi bi-chat-dots"></i>

                </div>

                <h5>

                    Visitor Reviews

                </h5>

                <p>

                    Pantau review pengunjung.

                </p>

            </a>

        </div>

    </div>

</div>

<!-- =========================
RECENT ACTIVITY
========================= -->

<div class="admin-box">

    <div class="d-flex justify-content-between align-items-center mb-4">

        <h3 class="admin-box-title">

            Recent Activity

        </h3>

        <button class="btn btn-light custom-outline-btn">

            <i class="bi bi-funnel"></i>
            All Activity

        </button>

    </div>

    <div class="table-responsive">

        <table class="table align-middle admin-table">

            <thead>

                <tr>

                    <th>EVENT</th>
                    <th>CATEGORY</th>
                    <th>USER</th>
                    <th>TIMESTAMP</th>
                    <th>STATUS</th>

                </tr>

            </thead>

            <tbody>

                @foreach($recentWisata as $wisata)

                <tr>

                    <td>

                        New Destination Added:
                        {{ $wisata->nama }}

                    </td>

                    <td>

                        Destination

                    </td>

                    <td>

                        Admin

                    </td>

                    <td>

                        {{ $wisata->created_at->diffForHumans() }}

                    </td>

                    <td>

                        <span class="status-badge success-badge">

                            Published

                        </span>

                    </td>

                </tr>

                @endforeach

                </tbody>

        </table>

    </div>

</div>

<!-- =========================
LATEST DESTINATIONS
========================= -->

<div class="admin-box mt-5">

    <div class="d-flex justify-content-between align-items-center mb-4">

        <h3 class="admin-box-title">

            Latest Destinations

        </h3>

    </div>

    <div class="row g-4">

        @foreach($topWisata->take(3) as $wisata)

        <div class="col-lg-4">

            <div class="latest-card">

                <img
                    src="{{ $wisata->image_url }}"
                    class="latest-image"
                    alt="{{ $wisata->nama }}"
                >

                <div class="latest-body">

                    <span class="category-badge">

                        {{ $wisata->kategori }}

                    </span>

                    <h5>

                        {{ $wisata->nama }}

                    </h5>

                    <p>

                        ⭐ {{ number_format($wisata->rating,1) }}

                    </p>

                </div>

            </div>

        </div>

        @endforeach

    </div>

</div>

<script>

document.addEventListener('DOMContentLoaded', function(){

    // =========================
    // CATEGORY DATA
    // =========================

    const kategoriLabels = @json(
        $kategoriData->pluck('kategori')
    );

    const kategoriTotals = @json(
        $kategoriData->pluck('total')
    );

    // =========================
    // CATEGORY CHART
    // =========================

    const kategoriCtx =
        document.getElementById('kategoriChart');

    new Chart(kategoriCtx, {

        type: 'doughnut',

        data: {

            labels: kategoriLabels,

            datasets: [{

                data: kategoriTotals,

                backgroundColor: [

                    '#9f1d20', // merah
                    '#d97706', // orange
                    '#0f766e', // teal
                    '#2563eb'  // blue

                ],

                borderWidth: 0,

                hoverOffset: 8

            }]

        },

        options: {

            responsive: true,

            maintainAspectRatio: false,

            cutout: '68%',

            plugins: {

                legend: {

                    position: 'bottom',

                    labels: {

                        usePointStyle: true,

                        pointStyle: 'circle',

                        padding: 18,

                        font: {

                            size: 12

                        }

                    }

                }

            }

        }

    });

    // =========================
    // RATING DATA
    // =========================

    const ratingLabels = @json(
        $ratingData->pluck('nama')
    );

    const ratingValues = @json(
        $ratingData->pluck('rating')
    );

    // =========================
    // RATING CHART
    // =========================

    const ratingCtx =
        document.getElementById('ratingChart');

    new Chart(ratingCtx, {

        type: 'bar',

        data: {

            labels: ratingLabels,

            datasets: [{

                label: 'Rating',

                data: ratingValues,

                backgroundColor: '#9f1d20',

                borderRadius: 12,

                borderSkipped: false,

                barThickness: 42

            }]

        },

        options: {

            responsive: true,

            maintainAspectRatio: false,

            plugins: {

                legend: {

                    display: false

                }

            },

            scales: {

                x: {

                    ticks: {

                        display: false

                    },

                    grid: {

                        display: false

                    },

                    border: {

                        display: false

                    }

                },

                y: {

                    beginAtZero: true,

                    max: 5,

                    ticks: {

                        stepSize: 1,

                        color: '#666'

                    },

                    grid: {

                        color: '#f1f1f1'

                    },

                    border: {

                        display: false

                    }

                }

            }

        }

    });

        // =========================
    // VISITOR TREND CHART
    // =========================

    const visitorCtx =
        document.getElementById('visitorChart');

    new Chart(visitorCtx, {

        type: 'line',

        data: {

            labels: [

                'Jan',
                'Feb',
                'Mar',
                'Apr',
                'May',
                'Jun'

            ],

            datasets: [

                {

                    label: 'Domestic',

                    data: [

                        1200,
                        1900,
                        3000,
                        5000,
                        4200,
                        6100

                    ],

                    borderColor: '#9f1d20',

                    backgroundColor: 'rgba(159,29,32,.08)',

                    tension: .4,

                    fill: true

                },

                {

                    label: 'International',

                    data: [

                        800,
                        1400,
                        2200,
                        3400,
                        3000,
                        4500

                    ],

                    borderColor: '#475569',

                    backgroundColor: 'rgba(71,85,105,.06)',

                    tension: .4,

                    fill: true

                }

            ]

        },

        options: {

            responsive: true,

            maintainAspectRatio: false,

            plugins: {

                legend: {

                    display: false

                }

            },

            scales: {

                x: {

                    grid: {

                        display: false

                    }

                },

                y: {

                    grid: {

                        color: '#f1f1f1'

                    }

                }

            }

        }

    });

});

</script>

@endsection