<?php

namespace Database\Seeders;

use App\Models\Surat;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class SuratsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $s = [
            [
                'nama' => 'John Doe',
                'jenis_surat' => 'Izin Menikah',
                'tanggal_mulai' => '2023-01-01',
                'tanggal_selesai' => '2023-01-05',
                'alasan' => 'Butuh waktu istirahat',
                'durasi' => 5
            ],
            [
                'nama' => 'Jane Smith',
                'jenis_surat' => 'Izin Tugas',
                'tanggal_mulai' => '2023-02-01',
                'tanggal_selesai' => '2023-02-10',
                'alasan' => 'Liburan keluarga',
                'durasi' => 5
            ],
            // Tambahkan data lainnya sesuai kebutuhan
        ];

        foreach ($s as $surats) {
            Surat::create($surats);
        }
    }
}
