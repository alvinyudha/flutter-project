<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Surat;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class SuratAPIController extends Controller
{
    public function showSurat()
    {
        $user = auth()->user();
        // $cutis = Cuti::all();
        $data = Surat::where('user_id', 2)->get();

        return response()->json($data);
    }



    public function storeSurat(Request $request)
    {
        // Validasi data pengajuan cuti
        // $request->validate([
        //     'jenis_surat' => 'required',
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
        // $surat = new Surat();
        // $surat->nama = $user->name;
        // $surat->jenis_surat = $request->jenis_surat;
        // $surat->tanggal_mulai = $request->tanggal_mulai;
        // $surat->tanggal_selesai = $request->tanggal_selesai;
        // $surat->alasan = $request->alasan;
        // $surat->durasi = $selisihHari;
        // $surat->status = 'pending';
        // $surat->user_id = auth()->user()->id;
        // $surat->save();
        Surat::create($request->all());

        return response()->json(['message' => 'Surat berhasil diajukan'], 201);
    }
}
