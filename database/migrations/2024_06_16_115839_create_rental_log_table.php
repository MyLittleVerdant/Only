<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('rental_logs', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->foreignId('car_id')->constrained();
            $table->foreignId('employee_id')->constrained();
            $table->dateTime('rent_from');
            $table->dateTime('rent_to');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('rental_logs');
    }
};
