<?php

namespace App\Http\Controllers;

use App\Models\PersonHasProcedure;
use App\Models\Year; // Importa el modelo Year
use Illuminate\Http\Request;
use Inertia\Inertia;
use Illuminate\Support\Facades\DB;

class PersonHasProcedureController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        try {

            $expedientes = DB::select('CALL get_tramites_por_fecha_digitador(?, ?)', [$request->usuario, $request->fecha_fin]);

        } catch (\Exception $e) {
            Log::error('Error al ejecutar el procedimiento almacenado: ' . $e->getMessage());
            return response()->json(['error' => 'Ocurrió un error al procesar la solicitud'], 500);
        }


        // Verificar si la solicitud es una API (por ejemplo, desde axios)
        if ($request->wantsJson()) {
            return response()->json($expedientes);
        }

        return Inertia::render('Expedientes', ['expedientes' => $expedientes]);

    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(PersonHasProcedure $personHasProcedure)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(PersonHasProcedure $personHasProcedure)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, PersonHasProcedure $personHasProcedure)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(PersonHasProcedure $personHasProcedure)
    {
        //
    }
}
