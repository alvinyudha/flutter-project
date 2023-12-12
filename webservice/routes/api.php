<?php

use App\Http\Controllers\API\AuthAPIController;
use App\Http\Controllers\API\CutiAPI;
use App\Http\Controllers\API\CutiAPIController;
use App\Http\Controllers\APIController;
use App\Http\Controllers\Backend\ApiPendidikanController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::post('auth/register', [AuthAPIController::class, 'register']);
Route::post('auth/login', [AuthAPIController::class, 'login']);
Route::middleware(['auth:sanctum'])->group(function () {
    Route::post('cuti', [CutiAPIController::class, 'store']);
    Route::get('cuti/show', [CutiAPIController::class, 'show']);
});



// Route::group(['namespace' => 'Backend'], function () {
//     Route::get('api_pendidikan', 'ApiPendidikanController@getAll');
//     Route::get('api_pendidikan/{id}', 'ApiPendidikanController@getPen');
//     Route::post('api_pendidikan', 'ApiPendidikanController@createPen');
//     Route::put('api_pendidikan/{id}', 'ApiPendidikanController@updatePen');
//     Route::delete('api_pendidikan/{id}', 'ApiPendidikanController@deletePen');
// });

// Route::get('api_pendidikan', [ApiPendidikanController::class, 'getAll']);
// Route::get('api_pendidikan/{id}', [ApiPendidikanController::class, 'getPen']);
// Route::put('api_pendidikan/{id}', [ApiPendidikanController::class, 'updatePen']);
// Route::post('api_pendidikan', [ApiPendidikanController::class, 'createPen']);
// Route::delete('api_pendidikan/{id}', [ApiPendidikanController::class, 'deletePen']);