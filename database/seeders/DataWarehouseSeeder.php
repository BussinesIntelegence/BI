<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

use App\Models\Wisata;

use App\Models\DimTour;
use App\Models\DimCategory;
use App\Models\DimLocation;
use App\Models\FactTourism;

class DataWarehouseSeeder extends Seeder
{
    public function run(): void
    {
        foreach (Wisata::all() as $wisata) {

            /*
            ==========================================
            NORMALISASI KATEGORI
            ==========================================
            */

            $normalizedCategory =
                $this->normalizeCategory(
                    $wisata->kategori
                );

            $category = DimCategory::firstOrCreate([
                'category_name' => $normalizedCategory
            ]);

            /*
            ==========================================
            LOCATION
            ==========================================
            */

            $location = DimLocation::create([

                'latitude' => $wisata->latitude ?? 0,

                'longitude' => $wisata->longitude ?? 0

            ]);

            /*
            ==========================================
            TOUR DIMENSION
            ==========================================
            */

            $tour = DimTour::create([

                'place_name' => $wisata->nama,

                'description' => $wisata->deskripsi,

                'category_id' => $category->id,

                'location_id' => $location->id

            ]);

            /*
            ==========================================
            POPULARITY SCORE
            ==========================================
            */

            $popularityScore = (

                ($wisata->rating * 0.4)

                +

                (log($wisata->total_review + 1) * 0.6)

            );

            /*
            ==========================================
            FACT TABLE
            ==========================================
            */

            FactTourism::create([

                'tour_id' => $tour->id,

                'rating' => $wisata->rating,

                'vote_count' => $wisata->total_review,

                'htm_weekday' => $wisata->harga_weekday,

                'htm_weekend' => $wisata->harga_weekend,

                'popularity_score' => round(
                    $popularityScore,
                    3
                )

            ]);
        }
    }

    /*
    ==========================================
    CATEGORY NORMALIZATION
    ==========================================
    */

    private function normalizeCategory($kategori): string
    {
        $kategori = strtolower($kategori);

        /*
        ==========================================
        BUDAYA
        ==========================================
        */

        if (
            str_contains($kategori, 'budaya') ||
            str_contains($kategori, 'museum') ||
            str_contains($kategori, 'sejarah')
        ) {

            return 'Budaya';
        }

        /*
        ==========================================
        PANTAI
        ==========================================
        */

        if (
            str_contains($kategori, 'pantai')
        ) {

            return 'Pantai';
        }

        /*
        ==========================================
        ALAM
        ==========================================
        */

        if (
            str_contains($kategori, 'alam') ||
            str_contains($kategori, 'air') ||
            str_contains($kategori, 'agrowisata') ||
            str_contains($kategori, 'petualangan')
        ) {

            return 'Alam';
        }

        /*
        ==========================================
        KULINER
        ==========================================
        */

        if (
            str_contains($kategori, 'kuliner')
        ) {

            return 'Kuliner';
        }

        /*
        ==========================================
        DEFAULT
        ==========================================
        */

        return 'Buatan';
    }
}