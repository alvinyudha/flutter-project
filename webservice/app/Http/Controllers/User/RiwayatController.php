<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Models\Cuti;
use App\Models\Surat;
use Illuminate\Http\Request;

class RiwayatController extends Controller
{
    public function __construct()
    {
        $this->middleware('cekRole:User');
    }

    public function cuti()
    {
        $user = auth()->user();
        // $cutis = Cuti::all();
        $cutis = Cuti::where('user_id', $user->id)->get();
        return view('user.riwayatCuti', compact('cutis'));
    }
    public function cutiRiwayat($id)
    {
        $cuti = Cuti::findOrFail($id);

        return view('user.showCuti', compact('cuti'));
    }
    public function surat()
    {
        $user = auth()->user();
        // $cutis = Cuti::all();
        $surat = Surat::where('user_id', $user->id)->get();
        return view('user.riwayatSurat', compact('surat'));
    }
    public function suratRiwayat($id)
    {
        $surat = Surat::findOrFail($id);

        return view('user.showSurat', compact('surat'));
    }
}
