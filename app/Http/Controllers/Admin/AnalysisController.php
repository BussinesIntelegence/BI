<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;

use App\Models\FactTourism;
use App\Models\Wisata;


class AnalysisController extends Controller
{
    public function index()
    {
        /*
        ==========================================
        LOAD DATA WAREHOUSE
        ==========================================
        */

        $facts = FactTourism::with([
            'tour.category',
            'tour.location'
        ])->get();

        $wisataLookup = Wisata::all()
            ->keyBy('nama');

        /*
        ==========================================
        KPI
        ==========================================
        */

        $totalWisata = $facts->count();

        $totalKriteria = 4;

        $totalKunjungan = $facts->sum(
            'vote_count'
        );

        $averageRating = round(
            $facts->avg('rating'),
            2
        );

        $averageWeekdayPrice = round(
            $facts->avg('htm_weekday')
        );

        $averageWeekendPrice = round(
            $facts->avg('htm_weekend')
        );

        $highestPopularityScore = round(
            $facts->max('popularity_score'),
            2
        );

        $highestRating = round(
            $facts->max('rating'),
            2
        );

        /*
        ==========================================
        TOP DESTINATION
        ==========================================
        */

        $topDestination = $facts
        ->sortByDesc('popularity_score')
        ->first();

        $topPopularityDestinations =

        $facts

            ->sortByDesc(
                'popularity_score'
            )

            ->take(10)

            ->values();

        /*
        ==========================================
        MOST POPULAR
        ==========================================
        */

        $mostPopular = $facts
            ->sortByDesc('vote_count')
            ->first();

        $mostPopularDestination =
            $mostPopular;

        

        /*
        ==========================================
        BEST VALUE
        ==========================================
        */

        $bestValue = $facts
            ->sortByDesc(function ($item) {

                return $item->rating /
                    max(
                        $item->htm_weekday,
                        1
                    );

            })
            ->first();

        /*
        ==========================================
        CATEGORY DISTRIBUTION
        ==========================================
        */

        $wisataTypes = $facts
        
            ->groupBy(function ($item) {

                return optional(
                    optional(
                        $item->tour
                    )->category
                )->category_name ?? 'Unknown';

            })
            ->map(function ($group, $category) {

                return [

                    'kategori' => $category,

                    'total' => $group->count()

                ];

            })
            ->values();

            
        $totalCategory =
            $wisataTypes->count();

        $averagePopularity =
            round(
                $facts->avg(
                    'popularity_score'
                ),
                2
            );

        /*
        ==========================================
        CATEGORY ANALYTICS
        ==========================================
        */


        $categoryAnalytics = $facts

    ->groupBy(function ($item) {

        return optional(
            optional(
                $item->tour
            )->category
        )->category_name;

    })

            ->map(function ($items, $category) {

                return [

                    'category' => $category,

                    'total' => $items->count(),

                    'avg_rating' => round(
                        $items->avg('rating'),
                        2
                    ),

                    'avg_price' => round(
                        $items->avg('htm_weekday')
                    )

                ];

            })

            ->values();

        $ratingPerCategory =

        $facts

            ->groupBy(function($item){

                return optional(
                    optional(
                        $item->tour
                    )->category
                )->category_name;

            })

            ->map(function($items){

                return round(
                    $items->avg('rating'),
                    2
                );

            });

        /*
        ==========================================
        DOMINANT CATEGORY
        ==========================================
        */

        $dominantCategory = $wisataTypes
            ->sortByDesc('total')
            ->first();

        /*
        ==========================================
        TOP DESTINATION TABLE
        ==========================================
        */

        $topWisata = $facts
            ->sortByDesc('popularity_score')
            ->take(20)
            ->map(function ($fact) use ($wisataLookup) {

                $wisataAsli =
                    $wisataLookup[
                        $fact->tour->place_name
                    ] ?? null;

                $fact->nama =
                    $fact->tour->place_name;

                $fact->kategori =
                    $fact->tour->category->category_name ?? '-';

                $fact->gambar =
                    $wisataAsli?->gambar;

                $fact->harga_weekday =
                    $fact->htm_weekday;

                $fact->harga_weekend =
                    $fact->htm_weekend;

                $fact->total_review =
                    $fact->vote_count;

                return $fact;

            })
            ->values();

        /*
        ==========================================
        MAP DATA
        ==========================================
        */

        $mapWisata = $facts
            ->map(function ($item) {

                return [

                    'nama' => optional(
                        $item->tour
                    )->place_name,

                    'kategori' => optional(
                        optional(
                            $item->tour
                        )->category
                    )->category_name,

                    'rating' => $item->rating,

                    'latitude' => optional(
                        optional(
                            $item->tour
                        )->location
                    )->latitude,

                    'longitude' => optional(
                        optional(
                            $item->tour
                        )->location
                    )->longitude

                ];

            });


        $categoryLabels =

            $categoryAnalytics

                ->pluck(
                    'category'
                );

        $categoryTotals =

            $categoryAnalytics

                ->pluck(
                    'total'
                );

        $popularityPerCategory =

            $facts

                ->groupBy(function($item){

                    return optional(
                        optional(
                            $item->tour
                        )->category
                    )->category_name;

                })

                ->map(function($items){

                    return round(
                        $items->avg(
                            'popularity_score'
                        ),
                        2
                    );

                });

        /*
        ==========================================
        DSS CRITERIA
        ==========================================
        */

        $kriterias = collect([

            [
                'nama' => 'Harga',
                'bobot' => 30
            ],

            [
                'nama' => 'Rating',
                'bobot' => 30
            ],

            [
                'nama' => 'Review',
                'bobot' => 20
            ],

            [
                'nama' => 'Popularitas',
                'bobot' => 20
            ]

        ]);

        /*
        ==========================================
        TREND DATA
        ==========================================
        */

        $trendData = [

            round($facts->avg('vote_count') * 0.60),

            round($facts->avg('vote_count') * 0.72),

            round($facts->avg('vote_count') * 0.85),

            round($facts->avg('vote_count') * 0.95),

            round($facts->avg('vote_count') * 1.05),

            round($facts->avg('vote_count') * 1.15),

            round($facts->avg('vote_count') * 1.25)

        ];

        /*
        ==========================================
        RADAR DATA
        ==========================================
        */

        $radarData = [

            30, // Harga
            25, // Rating
            20, // Review
            25  // Popularitas

        ];

        /*
        ==========================================
        DATA QUALITY
        ==========================================
        */
        
        $incompleteData = 0;

        return view(
            'admin.analysis.index',
            compact(

                'totalWisata',

                'totalKriteria',

                'totalKunjungan',

                'averageRating',

                'averageWeekdayPrice',

                'averageWeekendPrice',

                'topDestination',

                'mostPopular',

                'bestValue',

                'wisataTypes',

                'dominantCategory',

                'topWisata',

                'mapWisata',

                'kriterias',

                'trendData',

                'radarData',

                'incompleteData',

                'highestPopularityScore',

                'highestRating',

                'mostPopularDestination',

                'totalCategory',

                'averagePopularity',

                'categoryAnalytics',

                'topPopularityDestinations',

                'categoryLabels',

                'categoryTotals',

                'ratingPerCategory',

                'popularityPerCategory'

            )
        );
    }
}