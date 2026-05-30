<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('fact_tourism', function (Blueprint $table) {

            $table->id();

            $table->foreignId('tour_id');

            $table->double('rating')->default(0);

            $table->integer('vote_count')->default(0);

            $table->integer('htm_weekday')->default(0);

            $table->integer('htm_weekend')->default(0);

            $table->double('popularity_score')->default(0);

            $table->timestamps();

        });
    }

    public function down(): void
    {
        Schema::dropIfExists('fact_tourism');
    }
};