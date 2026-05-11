<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Wisata;

class RecommendationController extends Controller
{
    /**
     * Recommendation Page + SAW
     */
    public function index(Request $request)
    {
        // =========================
        // AMBIL DATA WISATA
        // =========================

        $wisatas = Wisata::all();

        // =========================
        // FILTER USER INPUT
        // =========================

        if ($request->budget) {

            $wisatas = $wisatas->where(
                'harga_weekday',
                '<=',
                $request->budget
            );

        }

        if ($request->kategori) {

            $wisatas = $wisatas->filter(function($item) use ($request){

                return str_contains(
                    strtolower($item->kategori),
                    strtolower($request->kategori)
                );

            });

        }

        if ($request->rating) {

            $wisatas = $wisatas->where(
                'rating',
                '>=',
                $request->rating
            );

        }

        // Jika kosong

        if ($wisatas->count() == 0) {

            return view(
                'recommendation.index',
                [

                    'wisatas' => collect([]),
                    'topWisatas' => collect([]),

                    'totalWisata' => 0,
                    'avgHarga' => 0,
                    'topRating' => 0,
                    'topKategori' => '-'

                ]
            );

        }



        // =========================
        // NILAI MAX & MIN
        // =========================

        $maxRating = $wisatas->max('rating');
        $maxReview = $wisatas->max('total_review');
        $minHarga = $wisatas->min('harga_weekday');

        // =========================
        // BOBOT KRITERIA
        // =========================

        $bobotHarga = 0.4;
        $bobotRating = 0.35;
        $bobotReview = 0.25;

        // =========================
        // HITUNG SAW
        // =========================

        $hasil = $wisatas->map(function($wisata) use (

            $maxRating,
            $maxReview,
            $minHarga,

            $bobotHarga,
            $bobotRating,
            $bobotReview

        ){

            // =========================
            // NORMALISASI
            // =========================

            // COST
            $nHarga = $minHarga / max($wisata->harga_weekday,1);

            // BENEFIT
            $nRating = $wisata->rating / max($maxRating,1);

            $nReview = $wisata->total_review / max($maxReview,1);

            // =========================
            // TOTAL SAW
            // =========================

            $score =

                ($nHarga * $bobotHarga) +
                ($nRating * $bobotRating) +
                ($nReview * $bobotReview);

            // =========================
            // SIMPAN DETAIL PERHITUNGAN
            // =========================

            $wisata->n_harga = round($nHarga, 3);

            $wisata->n_rating = round($nRating, 3);

            $wisata->n_review = round($nReview, 3);

            $wisata->saw_score = round($score, 3);

            return $wisata;

        });

        // =========================
        // SORTING RANKING
        // =========================

        $hasil = $hasil->sortByDesc('saw_score');

        // Ranking
        $hasil = $hasil->values();

        foreach($hasil as $index => $item){

            $item->ranking = $index + 1;

        }

        // =========================
        // TOP RECOMMENDATION
        // =========================

        $topWisatas = $hasil->take(6);


        // =========================
        // INSIGHT DATA
        // =========================

        // Total wisata
        $totalWisata = $hasil->count();

        // Rata-rata harga
        $avgHarga = round(
            $hasil->avg('harga_weekday')
        );

        // Rating tertinggi
        $topRating = $hasil->max('rating');

        // Kategori paling banyak
        $topKategori = $hasil
            ->groupBy('kategori')
            ->sortByDesc(function($item){

                return $item->count();

            })
            ->keys()
            ->first();



        // =========================
        // RETURN VIEW
        // =========================

        return view(
            'recommendation.index',
            [

                // Semua hasil SAW
                'wisatas' => $hasil,

                // Hanya top recommendation
                'topWisatas' => $topWisatas,
                'totalWisata' => $totalWisata,
                'avgHarga' => $avgHarga,
                'topRating' => $topRating,
                'topKategori' => $topKategori,

            ]
        );

    }
}