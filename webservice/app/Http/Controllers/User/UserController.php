<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Models\PengalamanKerja;
use Illuminate\Http\Request;

class UserController extends Controller
{
    public function __construct()
    {
        $this->middleware('cekRole:User');
    }


    public function index()
    {
        $data = PengalamanKerja::count();
        return view('user.dashboard', compact('data'));
    }
}
