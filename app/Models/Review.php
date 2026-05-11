<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Review extends Model
{
    protected $fillable = [

        'wisata_id',
        'nama',
        'rating',
        'komentar',
        'status'

    ];

    public function wisata()
    {
        return $this->belongsTo(Wisata::class);
    }
}