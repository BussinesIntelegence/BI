<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class DimTour extends Model
{
    protected $fillable = [
        'place_name',
        'description',
        'category_id',
        'location_id'
    ];

    public function category()
    {
        return $this->belongsTo(DimCategory::class);
    }

    public function location()
    {
        return $this->belongsTo(DimLocation::class);
    }

    public function fact()
    {
        return $this->hasOne(FactTourism::class,'tour_id');
    }
}