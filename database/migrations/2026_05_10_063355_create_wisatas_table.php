<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations
     */
    public function up(): void
    {
        Schema::create('wisatas', function (Blueprint $table) {

            $table->id();

            // Nama tempat wisata
            $table->string('nama');

            // Kategori wisata
            $table->string('kategori');

            // Rating wisata
            $table->double('rating')->default(0);

            // Jumlah review/vote
            $table->integer('total_review')->default(0);

            // Harga weekday
            $table->integer('harga_weekday')->default(0);

            // Harga weekend
            $table->integer('harga_weekend')->default(0);

            // Koordinat lokasi
            $table->double('latitude', 10, 7)->nullable();
            $table->double('longitude', 10, 7)->nullable();

            // Deskripsi wisata
            $table->text('deskripsi')->nullable();

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations
     */
    public function down(): void
    {
        Schema::dropIfExists('wisatas');
    }
};