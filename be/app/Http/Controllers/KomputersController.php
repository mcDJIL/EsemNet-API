<?php

namespace App\Http\Controllers;

use App\Models\Komputers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class KomputersController extends Controller
{

    protected $komputersModel;
    public function __construct(Komputers $komputers)
    {
        $this->komputersModel = $komputers;
    }

    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $index = $this->komputersModel->with([ 'jenis' ])->get();

        return response()->json([ 'data' => $index ]);
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
        $validation = Validator::make($request->all(), [
            'Nomor' => 'numeric|unique:komputer',
            'IDJenis' => 'required',
            'Merek' => 'required'
        ], [
            'IDJenis.required' => 'The type must be selected to add computer data',
            'Merek.required' => 'Brand must be filled in',
            'Nomor.unique' => 'Numbers must be unique'
        ]);

        if ($validation->fails()) return response()->json($validation->errors());

        $store = collect($request->only($this->komputersModel->getFillable()))->toArray();
        $new = $this->komputersModel->create($store);

        return response()->json([ 'message' => 'Data komputer success added' ]);
    }

    /**
     * Display the specified resource.
     */
    public function show(Komputers $komputers)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Komputers $komputers)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, $id)
    {
        $komputer = $this->komputersModel->findOrFail($id);

        $update = collect($request->only($this->komputersModel->getFillable()))->toArray();

        $komputer->update($update);

        return response()->json([ 'message' => 'Data komputer success updated' ]);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        $delete = $this->komputersModel->findOrFail($id)->delete();

        return response()->json([ 'message' => 'Data komputer success deleted' ]);
    }
}
