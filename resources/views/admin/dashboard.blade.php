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

            <button class="btn btn-light custom-outline-btn">

                <i class="bi bi-calendar3"></i>
                Last 30 Days

            </button>

            <button class="btn btn-maroon">

                <i class="bi bi-download"></i>
                Export Report

            </button>

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

    <!-- Active -->
    <div class="col-lg-3 col-md-6">

        <div class="admin-card">

            <div class="card-icon bg-soft-green">

                <i class="bi bi-map"></i>

            </div>

            <p class="admin-card-label">

                Active Destinations

            </p>

            <h2 class="admin-card-value">

                {{ $totalWisata }}

            </h2>

        </div>

    </div>

    <!-- Revenue -->
    <div class="col-lg-3 col-md-6">

        <div class="admin-card">

            <div class="card-icon bg-soft-blue">

                <i class="bi bi-cash"></i>

            </div>

            <p class="admin-card-label">

                Estimated Revenue

            </p>

            <h2 class="admin-card-value">

                $128.5k

            </h2>

        </div>

    </div>

</div>

<!-- =========================
ANALYTICS CHART
========================= -->

<div class="row g-4 mb-5">

    <!-- LEFT -->
    <div class="col-lg-6">

        <div class="admin-card p-4 h-100">

            <h3 class="chart-title">

                Kategori Wisata

            </h3>

            <p class="chart-subtitle">

                Distribusi destinasi wisata berdasarkan kategori

            </p>

            <div class="chart-wrapper">

                <canvas id="kategoriChart"></canvas>

            </div>

        </div>

    </div>

    <!-- RIGHT -->
    <div class="col-lg-6">

        <div class="admin-card p-4 h-100">

            <h3 class="chart-title">

                Top Rating Wisata

            </h3>

            <p class="chart-subtitle">

                Destinasi dengan rating tertinggi

            </p>

            <div class="chart-wrapper">

                <canvas id="ratingChart"></canvas>

            </div>

        </div>

    </div>

</div>

<!-- =========================
CONTENT SECTION
========================= -->

<div class="row g-4 mb-5">

    <!-- LEFT -->
    <div class="col-lg-8">

        <div class="admin-box">

            <div class="d-flex justify-content-between align-items-center mb-4">

                <h3 class="admin-box-title">

                    Monthly Visitor Trends

                </h3>

                <div class="d-flex gap-3">

                    <span class="trend-dot red-dot">

                        Domestic

                    </span>

                    <span class="trend-dot blue-dot">

                        International

                    </span>

                </div>

            </div>

            <!-- Dummy Chart -->
            <div class="visitor-chart-wrapper">

                <canvas id="visitorChart"></canvas>

            </div>

        </div>

    </div>

    <!-- RIGHT -->
    <div class="col-lg-4">

        <div class="admin-box">

            <div class="d-flex justify-content-between align-items-center mb-4">

                <h3 class="admin-box-title">

                    Top Destinations

                </h3>

                <a href="#"
                    class="view-all-link">

                    View All

                </a>

            </div>

            @foreach($topWisata as $wisata)

            <div class="top-destination-item">

                <div class="d-flex justify-content-between mb-2">

                    <strong>

                        {{ $wisata->nama }}

                    </strong>

                    <span>

                        {{ rand(4,15) }}k views

                    </span>

                </div>

                <div class="progress custom-progress">

                    <div
                        class="progress-bar custom-progress-bar"
                        style="width: {{ rand(60,95) }}%"
                    ></div>

                </div>

            </div>

            @endforeach

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

                <tr>

                    <td>
                        New Destination Added:
                        Goa Jomblang
                    </td>

                    <td>Destination</td>

                    <td>Budi Kusuma</td>

                    <td>2 mins ago</td>

                    <td>

                        <span class="status-badge success-badge">

                            Published

                        </span>

                    </td>

                </tr>

                <tr>

                    <td>
                        Updated Destination:
                        Borobudur
                    </td>

                    <td>Content</td>

                    <td>Admin</td>

                    <td>1 hour ago</td>

                    <td>

                        <span class="status-badge warning-badge">

                            Updating

                        </span>

                    </td>

                </tr>

                <tr>

                    <td>
                        Deleted Destination:
                        Pantai X
                    </td>

                    <td>Destination</td>

                    <td>Super Admin</td>

                    <td>3 hours ago</td>

                    <td>

                        <span class="status-badge danger-badge">

                            Removed

                        </span>

                    </td>

                </tr>

            </tbody>

        </table>

    </div>

</div>

```html
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