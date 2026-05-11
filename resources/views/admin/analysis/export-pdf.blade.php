<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">

    <title>
        Analytics Report
    </title>

    <style>

        body{

            font-family: sans-serif;

            color: #222;

            font-size: 14px;
        }

        h1{

            color: #9f1d20;

            margin-bottom: 5px;
        }

        .subtitle{

            color: #777;

            margin-bottom: 30px;
        }

        .summary-grid{

            width: 100%;

            margin-bottom: 30px;
        }

        .summary-card{

            border: 1px solid #ddd;

            padding: 20px;

            border-radius: 12px;

            margin-bottom: 15px;
        }

        .summary-label{

            font-size: 12px;

            color: #777;

            margin-bottom: 10px;
        }

        .summary-value{

            font-size: 28px;

            font-weight: bold;

            color: #9f1d20;
        }

        table{

            width: 100%;

            border-collapse: collapse;

            margin-top: 20px;
        }

        table th{

            background: #9f1d20;

            color: white;

            padding: 12px;

            text-align: left;
        }

        table td{

            padding: 12px;

            border-bottom: 1px solid #eee;
        }

        .footer{

            margin-top: 40px;

            color: #777;

            font-size: 12px;
        }

    </style>

</head>

<body>

    <h1>
        JogjaExplore Analytics Report
    </h1>

    <p class="subtitle">

        Sistem Rekomendasi Tempat Wisata Yogyakarta
        menggunakan metode SAW.

    </p>

    <!-- SUMMARY -->

    <div class="summary-grid">

        <div class="summary-card">

            <div class="summary-label">
                Total Destinations
            </div>

            <div class="summary-value">
                {{ number_format($totalWisata) }}
            </div>

        </div>

        <div class="summary-card">

            <div class="summary-label">
                Total Criteria
            </div>

            <div class="summary-value">
                {{ number_format($totalKriteria) }}
            </div>

        </div>

        <div class="summary-card">

            <div class="summary-label">
                Total Reviews
            </div>

            <div class="summary-value">
                {{ number_format($totalKunjungan) }}
            </div>

        </div>

        <div class="summary-card">

            <div class="summary-label">
                Average Rating
            </div>

            <div class="summary-value">
                {{ number_format($avgRating,1) }}
            </div>

        </div>

    </div>

    <!-- TOP WISATA -->

    <h2>
        Top Recommendation Destinations
    </h2>

    <table>

        <thead>

            <tr>

                <th>Destination</th>
                <th>Category</th>
                <th>Rating</th>
                <th>Reviews</th>

            </tr>

        </thead>

        <tbody>

            @foreach($topWisata as $wisata)

            <tr>

                <td>
                    {{ $wisata->nama }}
                </td>

                <td>
                    {{ $wisata->kategori }}
                </td>

                <td>
                    {{ number_format($wisata->rating,1) }}
                </td>

                <td>
                    {{ number_format($wisata->total_review) }}
                </td>

            </tr>

            @endforeach

        </tbody>

    </table>

    <div class="footer">

        Generated automatically by JogjaExplore DSS System
        • {{ now()->format('d F Y H:i') }}

    </div>

</body>
</html>