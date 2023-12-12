<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Cuti;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class CutiAPIController extends Controller
{
    public function show()
    {
        $data = Cuti::all();

        return response()->json($data);
    }



    public function store(Request $request)
    {
        // Validasi data pengajuan cuti
        $request->validate([
            'tanggal_mulai' => 'required|date',
            'tanggal_selesai' => 'required|date|after_or_equal:tanggal_mulai',
            'alasan' => 'required'
        ]);
        // Hitung selisih hari antara tanggal_mulai dan tanggal_selesai
        $tanggalMulai = Carbon::parse($request->tanggal_mulai);
        $tanggalSelesai = Carbon::parse($request->tanggal_selesai);
        $selisihHari = $tanggalMulai->diffInDays($tanggalSelesai) + 1; // tambahkan 1 hari untuk inklusif hari terakhir
        $user = Auth::user();

        // Batasan hari cuti (misalnya 14 hari)
        $batasanHariCuti = 14;

        // Cek apakah jumlah hari cuti melebihi batasan
        if ($selisihHari > $batasanHariCuti) {
            return response()->json(['message' => 'Jumlah hari cuti melebihi batasan yang diperbolehkan.'], 201);
        }

        // Simpan data pengajuan cuti ke dalam database
        $cuti = new Cuti();
        $cuti->tanggal_mulai = $request->tanggal_mulai;
        $cuti->tanggal_selesai = $request->tanggal_selesai;
        $cuti->alasan = $request->alasan;
        $cuti->durasi = $selisihHari;
        $cuti->status = 'pending';
        $cuti->nama = $user->name;
        $cuti->save();

        return response()->json(['message' => 'Cuti berhasil diajukan'], 201);
    }
}
