<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Wisata;

class WisataSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // Path file CSV
        $csvFile = database_path('data/cleaned_wisata.csv');

        // Cek apakah file ada
        if (!file_exists($csvFile)) {
            $this->command->error('File CSV tidak ditemukan!');
            return;
        }

        // Buka file CSV
        $file = fopen($csvFile, 'r');

        // Ambil header pertama
        $header = fgetcsv($file);

        // Loop isi CSV
        while (($row = fgetcsv($file, 10000, ',')) !== false) {

            $data = array_combine($header, $row);

            Wisata::create([

                // Nama wisata
                'nama' => $data['nama'] ?? '-',

                // Kategori/type wisata
                'kategori' => $data['type'] ?? 'Wisata',

                // Rating
                'rating' => (double) ($data['vote_average'] ?? 0),

                // Total review
                'total_review' => (int) ($data['vote_count'] ?? 0),

                // Harga weekday
                'harga_weekday' => (int) ($data['htm_weekday'] ?? 0),

                // Harga weekend
                'harga_weekend' => (int) ($data['htm_weekend'] ?? 0),

                // Latitude
                'latitude' => !empty($data['latitude'])
                    ? (double) $data['latitude']
                    : null,

                // Longitude
                'longitude' => !empty($data['longitude'])
                    ? (double) $data['longitude']
                    : null,

                // Deskripsi
                'deskripsi' => $data['description'] ?? null,
            ]);
        }

        fclose($file);

        $this->command->info('Data wisata berhasil diimport!');
    }
}