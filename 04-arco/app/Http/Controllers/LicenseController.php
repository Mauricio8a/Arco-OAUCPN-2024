<?php

namespace App\Http\Controllers;

use App\Models\License;
use Illuminate\Http\Request;
use Inertia\Inertia;

class LicenseController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //Recuperar los datos de todos las personas actores
        return Inertia::render('Licencias');
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
    public function show(License $license)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(License $license)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, License $license)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(License $license)
    {
        //
    }
}
