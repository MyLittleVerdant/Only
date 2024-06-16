<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class ComfortCategoriesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('comfort_categories')->insert([
            ['name' => 'econom'],
            ['name' => 'comfort'],
            ['name' => 'business'],
        ]);
    }
}
