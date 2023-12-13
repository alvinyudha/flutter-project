<?php

use App\Http\Controllers\Admin\AdminController;
use App\Http\Controllers\Admin\KonfirmasiController;
use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\Auth\RegisterController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\MyControll;
use App\Http\Controllers\PendidikanController;
use App\Http\Controllers\User\CutiController;
use App\Http\Controllers\User\RiwayatController;
use App\Http\Controllers\User\SuratController;
use App\Http\Controllers\User\UserController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

// Route::get('/', function () {
//     return view('dashboard');
// });
Route::get('/', [LoginController::class, 'index'])->name('login');
Route::post('/login-proses', [LoginController::class, 'login_proses'])->name('login-proses');
Route::get('/logout', [LoginController::class, 'logout'])->name('logout');

Route::get('/register', [RegisterController::class, 'index'])->name('register');
Route::post('/register-proses', [RegisterController::class, 'register_proses'])->name('register-proses');

// Route::group(['prefix' => 'admin', 'middleware' => ['auth'], 'as' => 'admin.'], function () {
Route::middleware(['cekLogin', 'cekRole:Admin'])->group(function () {

    Route::get('admin', [AdminController::class, 'index'])->name('home.admin');
    Route::get('/cuti', [KonfirmasiController::class, 'cuti'])->name('cuti.detail');
    Route::get('/cuti/{id}', [KonfirmasiController::class, 'show'])->name('cuti.show');
    Route::put('/cuti/{id}/approve', [KonfirmasiController::class, 'approve'])->name('cuti.approve');
    Route::put('/cuti/{id}/reject', [KonfirmasiController::class, 'reject'])->name('cuti.reject');

    Route::get('/surat', [KonfirmasiController::class, 'surat'])->name('surat.detail');
    Route::get('/surat/{id}', [KonfirmasiController::class, 'showSrt'])->name('surat.show');
    Route::put('/surat/{id}/approveSrt', [KonfirmasiController::class, 'approveSrt'])->name('surat.approve');
    Route::put('/surat/{id}/rejectSrt', [KonfirmasiController::class, 'rejectSrt'])->name('surat.reject');


    //pengalaman kerja
    // Route::get('/pengalaman', [HomeController::class, 'dataPengalaman'])->name('pengalaman');

    // Route::get('/create', [HomeController::class, 'create'])->name('create');
    // Route::post('/store', [HomeController::class, 'store'])->name('store');

    // Route::get('/update/{id}', [HomeController::class, 'update'])->name('update');
    // Route::put('/save/{id}', [HomeController::class, 'save'])->name('save');

    // Route::delete('/delete/{id}', [HomeController::class, 'delete'])->name('delete');


    // //pendidikan
    // Route::get('/pendidikan', [PendidikanController::class, 'dataPendidikan'])->name('pendidikan');

    // Route::get('/createpend', [PendidikanController::class, 'create'])->name('createpend');
    // Route::post('/storepend', [PendidikanController::class, 'store'])->name('storepend');

    // Route::get('/updatepend/{id}', [PendidikanController::class, 'updatePend'])->name('updatepend');
    // Route::put('/savepend/{id}', [PendidikanController::class, 'savePend'])->name('savepend');

    // Route::delete('/deletepend/{id}', [PendidikanController::class, 'delete'])->name('deletepend');
});


Route::middleware(['cekLogin', 'cekRole:User'])->group(function () {
    Route::get('user', [UserController::class, 'index'])->name('home.user');
    Route::get('pengajuan-cuti', [CutiController::class, 'create'])->name('cuti.create');
    Route::post('pengajuan-cuti', [CutiController::class, 'store'])->name('cuti.store');
    Route::get('pengajuan-surat', [SuratController::class, 'create'])->name('surat.create');
    Route::post('pengajuan-surat', [SuratController::class, 'store'])->name('surat.store');
    Route::get('/cuti-riwayat', [RiwayatController::class, 'cuti'])->name('cuti.riwayat');
    Route::get('/cuti-riwayat/{id}', [RiwayatController::class, 'cutiRiwayat'])->name('cuti.detailRiwayat');
    Route::get('/surat-riwayat', [RiwayatController::class, 'surat'])->name('surat.riwayat');
    Route::get('/surat-riwayat/{id}', [RiwayatController::class, 'suratRiwayat'])->name('surat.detailRiwayat');
});
