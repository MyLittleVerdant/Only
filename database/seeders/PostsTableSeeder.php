<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class PostsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('posts')->insert([
            ['name' => 'Manager'],
            ['name' => 'Developer'],
            ['name' => 'HR'],
            ['name' => 'Driver'],
            ['name' => 'Sales'],
        ]);
    }
}
