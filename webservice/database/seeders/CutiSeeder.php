<?php

namespace Database\Seeders;

use App\Models\Cuti;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class CutiSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $c = [
            [
                'nama' => 'John Doe',
                'tanggal_mulai' => '2023-01-01',
                'tanggal_selesai' => '2023-01-05',
                'alasan' => 'Butuh waktu istirahat',
                'durasi' => 14
            ],
            [
                'nama' => 'Jane Smith',
                'tanggal_mulai' => '2023-02-01',
                'tanggal_selesai' => '2023-02-10',
                'alasan' => 'Liburan keluarga',
                'durasi' => 14
            ],
            // Tambahkan data lainnya sesuai kebutuhan
        ];

        foreach ($c as $cuti) {
            Cuti::create($cuti);
        }
    }
}
