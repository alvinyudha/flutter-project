<?php

namespace Database\Seeders;

use App\Models\PengalamanKerja;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class DataPengalamanKerjaSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        PengalamanKerja::create([
            'nama' => 'Alvin Yudha',
            'jabatan' => 'Web Developer',
            'tahun_masuk' => '2023',
            'tahun_keluar' => '2028'
        ]);
    }
}
