<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Cuti;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class CutiAPIController extends Controller
{
    public function show() //history
    {
        $user = auth()->user();
        // $cutis = Cuti::all();
        $data = Cuti::where('user_id', 2)->get();

        return response()->json($data);
    }



    public function store(Request $request) //ajukan
    {
        // validasi di mobile jgn disini
        // // Validasi data pengajuan cuti
        // $request->validate([
        //     'tanggal_mulai' => 'required|date',
        //     'tanggal_selesai' => 'required|date|after_or_equal:tanggal_mulai',
        //     'alasan' => 'required'
        // ]);
        // // Hitung selisih hari antara tanggal_mulai dan tanggal_selesai
        // $tanggalMulai = Carbon::parse($request->tanggal_mulai);
        // $tanggalSelesai = Carbon::parse($request->tanggal_selesai);
        // $selisihHari = $tanggalMulai->diffInDays($tanggalSelesai) + 1; // tambahkan 1 hari untuk inklusif hari terakhir
        // $user = Auth::user();

        // // Batasan hari cuti (misalnya 14 hari)
        // $batasanHariCuti = 14;

        // // Cek apakah jumlah hari cuti melebihi batasan
        // if ($selisihHari > $batasanHariCuti) {
        //     return response()->json(['message' => 'Jumlah hari cuti melebihi batasan yang diperbolehkan.'], 201);
        // }

        // // Simpan data pengajuan cuti ke dalam database
        // $cuti = new Cuti();
        // $cuti->nama = $user->name;
        // $cuti->tanggal_mulai = $request->tanggal_mulai;
        // $cuti->tanggal_selesai = $request->tanggal_selesai;
        // $cuti->alasan = $request->alasan;
        // $cuti->durasi = $selisihHari;
        // $cuti->status = 'pending';
        // $cuti->user_id = auth()->user()->id;
        // $cuti->save();
        Cuti::create($request->all());

        return response()->json(['message' => 'Cuti berhasil diajukan'], 201);
    }
}
