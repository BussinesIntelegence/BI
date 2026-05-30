<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('dim_tours', function (Blueprint $table) {

            $table->id();

            $table->string('place_name');

            $table->text('description')->nullable();

            $table->foreignId('category_id');

            $table->foreignId('location_id');

            $table->timestamps();

        });
    }

    public function down(): void
    {
        Schema::dropIfExists('dim_tours');
    }
};