<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('post_comfort', function (Blueprint $table) {
            $table->id();
            $table->foreignId('comfort_category_id')->constrained(
                table: 'comfort_categories'
            );
            $table->foreignId('post_id')->constrained();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('post_comfort');
    }
};
