<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class FactTourism extends Model
{
    protected $table = 'fact_tourism';

    protected $fillable = [

        'tour_id',

        'rating',

        'vote_count',

        'htm_weekday',

        'htm_weekend',

        'popularity_score'
    ];

    public function tour()
    {
        return $this->belongsTo(
            DimTour::class,
            'tour_id'
        );
    }
}