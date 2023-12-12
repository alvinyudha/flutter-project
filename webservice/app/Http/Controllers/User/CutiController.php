<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Models\Cuti;
use App\Models\KonfirmasiCuti;
use Carbon\Carbon;
use Illuminate\Http\Request;

class CutiController extends Controller
{
    public function __construct()
    {
        $this->middleware('cekRole:User');
    }

    public function create()
    {
        return view('user.cuti');
    }

    public function store(Request $request)
    {
        // Validasi data pengajuan cuti
        $request->validate([
            'nama' => 'required',
            'tanggal_mulai' => 'required|date',
            'tanggal_selesai' => 'required|date|after_or_equal:tanggal_mulai',
            'alasan' => 'required'
        ]);
        // Hitung selisih hari antara tanggal_mulai dan tanggal_selesai
        $tanggalMulai = Carbon::parse($request->tanggal_mulai);
        $tanggalSelesai = Carbon::parse($request->tanggal_selesai);
        $selisihHari = $tanggalMulai->diffInDays($tanggalSelesai) + 1; // tambahkan 1 hari untuk inklusif hari terakhir

        // Batasan hari cuti (misalnya 14 hari)
        $batasanHariCuti = 14;

        // Cek apakah jumlah hari cuti melebihi batasan
        if ($selisihHari > $batasanHariCuti) {
            return redirect()->back()->with('failed', 'Jumlah hari cuti melebihi batasan yang diperbolehkan.');
        }
        // Simpan data pengajuan cuti ke dalam database
        $cuti = new Cuti();
        $cuti->nama = $request->nama;
        $cuti->tanggal_mulai = $request->tanggal_mulai;
        $cuti->tanggal_selesai = $request->tanggal_selesai;
        $cuti->alasan = $request->alasan;
        $cuti->durasi = $selisihHari;
        $cuti->status = 'pending';
        $cuti->user_id = auth()->user()->id;
        $cuti->save();

        // Redirect ke halaman sukses atau error
        return redirect()->back()->with('success', 'Pengajuan cuti berhasil diajukan.');
    }
}
