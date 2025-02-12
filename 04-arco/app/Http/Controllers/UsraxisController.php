<?php

namespace App\Http\Controllers;

use App\Models\Usraxis;
use Illuminate\Http\Request;
use Inertia\Inertia;

class UsraxisController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {

        /* //Recuperar los datos de todos los usuarios digitadores
        $usraxis = Usraxis::with('office', 'person')->get();

        //dd($usraxis);

        return Inertia::render('Usraxis2', ['usraxis' => $usraxis]);
        //return response()->json($usraxis); */

        // Recuperar los datos de todos los usuarios digitadores con las relaciones
        $usraxis = Usraxis::with('office', 'person')->get();

        // Transformar los datos para aplanar las relaciones
        $transformedData = $usraxis->map(function ($item) {
            return [
                'id' => $item->id,
                'name' => $item->name,
                //'person_id' => $item->person_id,
                //'office_id' => $item->office_id,
                'person_dni' => $item->person->dni, // Acceder a la propiedad anidada
                'person_names' => $item->person->names, // Acceder a la propiedad anidada
                'person_cargo' => $item->person->cargo, // Acceder a la propiedad anidada
                'person_email' => $item->person->email, // Acceder a la propiedad anidada
                'office_name' => $item->office->name, // Acceder a la propiedad anidada
            ];
        });

        // Enviar los datos transformados a la vista
        //dd($transformedData);

        // Verificar si la solicitud es una API (por ejemplo, desde axios)
        if ($request->wantsJson()) {
            return response()->json($transformedData);
        }

        return Inertia::render('Usraxis2', ['usraxis' => $transformedData]);

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
    public function show(Usraxis $usraxis)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Usraxis $usraxis)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Usraxis $usraxis)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Usraxis $usraxis)
    {
        //
    }
}
