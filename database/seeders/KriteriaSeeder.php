<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class KriteriaSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('kriterias')->insert([

            [
                'nama' => 'Harga',
                'atribut' => 'cost',
            ],

            [
                'nama' => 'Rating',
                'atribut' => 'benefit',
            ],

            [
                'nama' => 'Popularitas',
                'atribut' => 'benefit',
            ],
        ]);
    }
}