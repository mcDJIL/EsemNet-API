<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\KodePotonganHargaController;
use App\Http\Controllers\KomputersController;
use App\Http\Controllers\MemberController;
use App\Http\Controllers\PaketsController;
use App\Http\Controllers\TransaksiController;
use App\Http\Middleware\TokenValidation;
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

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post('auth/login', [AuthController::class, 'login']);
Route::post('auth/logout', [AuthController::class, 'logout']);

Route::middleware(TokenValidation::class)->group(function() {

    //Paket Master Data
    Route::resource('paket', PaketsController::class);

    //Komputer Master Data
    Route::resource('komputer', KomputersController::class);

    //Diskon Master Data
    Route::resource('diskon', KodePotonganHargaController::class);

    //Member Master Data
    Route::resource('member', MemberController::class);

    //Transaksi Master Data
    Route::resource('transaksi', TransaksiController::class);

});