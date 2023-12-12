<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Cuti;
use App\Models\KonfirmasiCuti;
use App\Models\Surat;
use Illuminate\Http\Request;

class KonfirmasiController extends Controller
{
    public function __construct()
    {
        $this->middleware('cekRole:Admin');
    }

    //cuti
    public function cuti()
    {
        $cutis = Cuti::all();

        return view('admin.detailCuti', compact('cutis'));
    }
    public function show($id)
    {
        $cuti = Cuti::findOrFail($id);

        return view('admin.showCuti', compact('cuti'));
    }

    public function approve($id)
    {
        $cuti = Cuti::findOrFail($id);
        $cuti->update(['status' => 'disetujui']);

        return redirect()->route('cuti.detail')->with('success', 'Cuti berhasil disetujui!');
    }

    public function reject($id)
    {
        $cuti = Cuti::findOrFail($id);
        $cuti->update(['status' => 'ditolak']);

        return redirect()->route('cuti.detail')->with('success', 'Cuti berhasil ditolak!');
    }

    //surat izin 
    public function surat()
    {
        $surat = Surat::all();

        return view('admin.detailSurat', compact('surat'));
    }
    public function showSrt($id)
    {
        $surat = Surat::findOrFail($id);

        return view('admin.showSurat', compact('surat'));
    }

    public function approveSrt($id)
    {
        $surat = Surat::findOrFail($id);
        $surat->update(['status' => 'disetujui']);

        return redirect()->route('surat.detail')->with('success', 'Surat Izin berhasil disetujui!');
    }

    public function rejectSrt($id)
    {
        $surat = Surat::findOrFail($id);
        $surat->update(['status' => 'ditolak']);

        return redirect()->route('surat.detail')->with('success', 'Surat Izin berhasil ditolak!');
    }
}
