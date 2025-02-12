<?php

use Illuminate\Foundation\Application;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;
use App\Http\Controllers\PersonHasProcedureController;
use App\Http\Controllers\UsraxisController;
use App\Http\Controllers\PersonController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\LicenseController;
use App\Http\Controllers\ProcedureController;

Route::get('/', function () {
    return Inertia::render('Welcome', [
        'canLogin' => Route::has('login'),
        // 'canRegister' => Route::has('register'),
        'laravelVersion' => Application::VERSION,
        'phpVersion' => PHP_VERSION,
    ]);
});

/* Route::get('/dashboard-vuetify', function(){
    return Inertia::render('DashboardVuetify');
})->name('dashboard.vuetify'); */

Route::middleware([
    'auth:sanctum',
    config('jetstream.auth_session'),
    'verified',
])->group(function () {
    Route::get('/dashboard', function () {
        return Inertia::render('DashboardVuetify');
    })->name('dashboard');

    // Ruta para los usuarios
    Route::get('/usuarios', [UserController::class, 'index'])->name('usuarios');

    // Ruta para las personas
    Route::get('/personas', [PersonController::class, 'index'])->name('personas');

    // Ruta para los digitadores
    Route::get('/usraxis', [UsraxisController::class, 'index'])->name('digitadores');

    // Ruta para las licencias
    Route::get('/licencias', [LicenseController::class, 'index'])->name('licencias');

    // Ruta para los trámites
    Route::get('/tramites', [ProcedureController::class, 'index'])->name('tramites');

    // Ruta para los expedientes
    Route::get('/expedientes', [PersonHasProcedureController::class, 'index'])->name('expedientes');

    // Ruta para las fichas
    //Route::get('/fichas', [PorDefinir__Controller::class, 'index'])->name('fichas');


    /* Route::get('/expedientes', function () {
        return Inertia::render('Expedientes');
    })->name('expedientes'); */


    //Definición como recursos, cambia la sintaxis
    //Route::resource('expedientes', PersonHasProcedureController::class)->names('expedientes');
});
