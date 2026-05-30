<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class DimLocation extends Model
{
    protected $fillable = [
        'latitude',
        'longitude'
    ];
}