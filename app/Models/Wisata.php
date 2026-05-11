<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Wisata extends Model
{
    /**
     * Kolom yang boleh diisi mass assignment
     */
    protected $fillable = [

        'nama',
        'deskripsi',
        'kategori',
        'rating',
        'total_review',
        'harga_weekday',
        'harga_weekend',
        'gambar',
        'latitude',
        'longitude',
        'deskripsi',
    ];
}