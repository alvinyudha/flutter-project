<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class DetailProfileSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('detail_profile')->insert([
            'address' => 'jember',
            'nomor_hp' => '085375325',
            'ttl' => '2000-11-17',
            'foto' => 'picture.png'
        ]);
    }
}
