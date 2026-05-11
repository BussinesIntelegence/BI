<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Wisata;
use App\Models\Kriteria;

class AnalysisController extends Controller
{
    public function index()
    {

        /*
        ==========================================
        SUMMARY DATA
        ==========================================
        */

        $totalWisata = Wisata::count();

        $totalKriteria = Kriteria::count();

        $totalKunjungan = Wisata::sum('total_review');

        /*
        ==========================================
        DATA BELUM LENGKAP
        ==========================================
        */

        $incompleteData = Wisata::whereNull('gambar')
            ->orWhereNull('deskripsi')
            ->orWhereNull('latitude')
            ->orWhereNull('longitude')
            ->count();

        /*
        ==========================================
        KRITERIA DATA
        ==========================================
        */

        $kriterias = Kriteria::all();

        /*
        ==========================================
        DISTRIBUSI KATEGORI WISATA
        ==========================================
        */

        $allWisata = Wisata::all();

            /*
            ==========================================
            NORMALISASI KATEGORI
            ==========================================
            */

            $categoryMap = [
                'Alam' => 0,
                'Budaya' => 0,
                'Kuliner' => 0,
                'Buatan' => 0
            ];

            foreach ($allWisata as $wisata) {

                $kategori = strtolower($wisata->kategori);

                if (
                    str_contains($kategori, 'alam') ||
                    str_contains($kategori, 'pantai') ||
                    str_contains($kategori, 'gunung') ||
                    str_contains($kategori, 'air')
                ) {

                    $categoryMap['Alam']++;

                } elseif (
                    str_contains($kategori, 'budaya') ||
                    str_contains($kategori, 'sejarah') ||
                    str_contains($kategori, 'museum')
                ) {

                    $categoryMap['Budaya']++;

                } elseif (
                    str_contains($kategori, 'kuliner')
                ) {

                    $categoryMap['Kuliner']++;

                } else {

                    $categoryMap['Buatan']++;

                }
            }

            $wisataTypes = collect([
                [
                    'kategori' => 'Alam',
                    'total' => $categoryMap['Alam']
                ],
                [
                    'kategori' => 'Budaya',
                    'total' => $categoryMap['Budaya']
                ],
                [
                    'kategori' => 'Kuliner',
                    'total' => $categoryMap['Kuliner']
                ],
                [
                    'kategori' => 'Buatan',
                    'total' => $categoryMap['Buatan']
                ]
            ]);

        /*
        ==========================================
        TOP REKOMENDASI
        ==========================================
        */

        $topWisata = Wisata::select(
            'id',
            'nama',
            'kategori',
            'rating',
            'total_review',
            'harga_weekday',
            'gambar'
        )
        ->inRandomOrder()
        ->take(20)
        ->get();

        /*
        ==========================================
        MAP DATA
        ==========================================
        */

        $mapWisata = Wisata::select(
                'nama',
                'kategori',
                'rating',
                'latitude',
                'longitude'
            )
            ->whereNotNull('latitude')
            ->whereNotNull('longitude')
            ->get();

            /*
            ==========================================
            SMART INSIGHT DATA
            ==========================================
            */

            $topDestination = Wisata::orderByDesc('rating')->first();

            $averageRating = Wisata::avg('rating');

            $dominantCategory = $wisataTypes
                ->sortByDesc('total')
                ->first();

        return view('admin.analysis.index', compact(
            'totalWisata',
            'totalKriteria',
            'totalKunjungan',
            'incompleteData',
            'kriterias',
            'wisataTypes',
            'topWisata',
            'mapWisata',
            'topDestination',
            'averageRating',
            'dominantCategory'
        ));
    }
}