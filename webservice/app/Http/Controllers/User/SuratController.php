<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Models\Surat;
use Carbon\Carbon;
use Illuminate\Http\Request;

class SuratController extends Controller
{
    public function __construct()
    {
        $this->middleware('cekRole:User');
    }

    public function create()
    {
        return view('user.surat');
    }

    public function store(Request $request)
    {
        // Validasi data pengajuan surat
        $request->validate([
            'nama' => 'required',
            'jenis_surat' => 'required',
            'tanggal_mulai' => 'required|date',
            'tanggal_selesai' => 'required|date|after_or_equal:tanggal_mulai',
            'alasan' => 'required'
        ]);
        // Hitung selisih hari antara tanggal_mulai dan tanggal_selesai
        $tanggalMulai = Carbon::parse($request->tanggal_mulai);
        $tanggalSelesai = Carbon::parse($request->tanggal_selesai);
        $selisihHari = $tanggalMulai->diffInDays($tanggalSelesai) + 1; // tambahkan 1 hari untuk inklusif hari terakhir

        // Batasan hari cuti (misalnya 14 hari)
        $batasanHariIzin = 14;

        // Cek apakah jumlah hari cuti melebihi batasan
        if ($selisihHari > $batasanHariIzin) {
            return redirect()->back()->with('failed', 'Jumlah hari izin melebihi batasan yang diperbolehkan.');
        }
        // Simpan data pengajuan surat ke dalam database
        $surat = new Surat();
        $surat->nama = $request->nama;
        $surat->jenis_surat = $request->jenis_surat;
        $surat->tanggal_mulai = $request->tanggal_mulai;
        $surat->tanggal_selesai = $request->tanggal_selesai;
        $surat->alasan = $request->alasan;
        $surat->durasi = $selisihHari;
        $surat->user_id = auth()->user()->id;
        $surat->save();

        // Redirect ke halaman sukses atau error
        return redirect()->back()->with('success', 'Pengajuan surat berhasil diajukan.');
    }
}
