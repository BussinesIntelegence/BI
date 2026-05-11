<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Wisata extends Model
{
    protected $fillable = [
        'nama',
        'kategori',
        'rating',
        'total_review',
        'harga_weekday',
        'harga_weekend',
        'latitude',
        'longitude',
        'deskripsi',
        'gambar'
    ];

    /*
    ==========================================
    AUTO IMAGE URL
    ==========================================
    */

    public function getImageUrlAttribute()
    {

        /*
        ==========================================
        Jika gambar asli tersedia
        ==========================================
        */

        if ($this->gambar) {

            return asset('assets/images/wisata/' . $this->gambar);
        }

        /*
        ==========================================
        KATEGORI LOWERCASE
        ==========================================
        */

        $kategori = strtolower($this->kategori);

        /*
        ==========================================
        ALAM
        ==========================================
        */

        if (
            str_contains($kategori, 'alam') ||
            str_contains($kategori, 'gunung')
        ) {

            return 'https://images.unsplash.com/photo-1506744038136-46273834b3fb?q=80&w=1200&auto=format&fit=crop';
        }

        /*
        ==========================================
        PANTAI
        ==========================================
        */

        if (
            str_contains($kategori, 'pantai') ||
            str_contains($kategori, 'air')
        ) {

            return 'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?q=80&w=1200&auto=format&fit=crop';
        }

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

            return 'https://images.unsplash.com/photo-1516483638261-f4dbaf036963?q=80&w=1200&auto=format&fit=crop';
        }

        /*
        ==========================================
        KULINER
        ==========================================
        */

        if (
            str_contains($kategori, 'kuliner')
        ) {

            return 'https://images.unsplash.com/photo-1504674900247-0877df9cc836?q=80&w=1200&auto=format&fit=crop';
        }

        /*
        ==========================================
        DEFAULT
        ==========================================
        */

        return 'https://images.unsplash.com/photo-1527631746610-bca00a040d60?q=80&w=1200&auto=format&fit=crop';
    }

    public function reviews()
    {
        return $this->hasMany(Review::class);
    }
}