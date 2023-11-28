<?php

use App\Http\Controllers\APIController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::post('/auth/register', [APIController::class, 'register']);
Route::post('/auth/login', [APIController::class, 'login']);

Route::middleware(['auth:sanctum'])->group(function () {
    // API GET DATA LOGIN
    Route::get('auth/show', [APIController::class, 'show']);
    Route::post('auth/refresh', [APIController::class, 'refreshToken']);
    Route::post('auth/logout', [APIController::class, 'logout']);
});
