<?php

namespace App\Http\Controllers;

use App\Models\Pendidikan;
use App\Models\PengalamanKerja;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class HomeController extends Controller
{
    // public function __construct()
    // {
    //     $this->middleware('cekRole:Admin');
    // }


    // public function index()
    // {
    //     return view('index');
    // }

    public function search(Request $request)
    {
        $data = new PengalamanKerja; //mengambil database pada tabel Pengalaman_Kerja
        $data = new Pendidikan; //mengambil database pada tabel Pengalaman_Kerja
        if ($request->get('search')) {
            $data->$data->where('nama', 'LIKE', '%' . $request->get('search') . '%');
        }
        $data = $data->get();
        return view('partials.main', compact('data', 'request')); //menampilkan data yang diambil pada tampilan view datause
    }

    public function dataPengalaman(Request $request)
    {
        $data = PengalamanKerja::get();
        return view('pengalaman.datapengalaman', compact('data',)); //menampilkan data yang diambil pada tampilan view datauser
    }

    public function create()
    {
        return view('pengalaman.create');
    }

    public function store(Request $request)
    {
        $validator = Validator::make(
            $request->all(),
            [
                'nama' => 'required',
                'jabatan' => 'required',
                'tahun_masuk' => 'required',
                'tahun_keluar' => 'required'
            ]
        );
        if ($validator->fails()) return redirect()->back()->withInput()->withErrors($validator);

        $data = [
            'nama' => $request->nama,
            'jabatan' => $request->jabatan,
            'tahun_masuk' => $request->tahun_masuk,
            'tahun_keluar' => $request->tahun_keluar
        ];

        PengalamanKerja::create($data);
        return redirect()->route('pengalaman');
    }

    public function update(Request $request, $id)
    {
        $data = PengalamanKerja::find($id);
        return view('pengalaman.update', compact('data'));
    }

    public function save(Request $request, $id)
    {
        $validator = Validator::make(
            $request->all(),
            [
                'nama' => 'required',
                'jabatan' => 'required',
                'tahun_masuk' => 'required',
                'tahun_keluar' => 'required'
            ]
        );
        if ($validator->fails()) return redirect()->back()->withInput()->withErrors($validator);

        $data = [
            'nama' => $request->nama,
            'jabatan' => $request->jabatan,
            'tahun_masuk' => $request->tahun_masuk,
            'tahun_keluar' => $request->tahun_keluar
        ];

        PengalamanKerja::whereId($id)->update($data);
        return redirect()->route('pengalaman');
    }

    public function delete($id)
    {
        $data = PengalamanKerja::find($id);
        if ($data) {
            $data->delete();
        }
        return redirect()->route('pengalaman');
    }
}