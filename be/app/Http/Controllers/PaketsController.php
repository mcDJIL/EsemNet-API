<?php

namespace App\Http\Controllers;

use App\Models\Pakets;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class PaketsController extends Controller
{

    protected $paketsModel;
    public function __construct(Pakets $pakets)
    {
        $this->paketsModel = $pakets;
    }

    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $index = $this->paketsModel->with([ 'jenis' ])->get();

        return response()->json([ "data" => $index ]);
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
            'Nama' => 'required',
            'IDJenis' => 'nullable',
            'HargaPerJam' => 'integer|min:5000'
        ], [
            'Nama.required' => 'Name cannot be empty'
        ]);

        if ($validation->fails()) return response()->json($validation->errors());

        $store = collect($request->only($this->paketsModel->getFillable()))->toArray();
        $new = $this->paketsModel->create($store);

        return response()->json([ 'message' => 'Data paket success added' ]);
    }

    /**
     * Display the specified resource.
     */
    public function show(Pakets $pakets)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Pakets $pakets)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, $id)
    {
        $paket = $this->paketsModel->findOrFail($id);

        $updateData = collect($request->only($this->paketsModel->getFillable()))->toArray();

        $paket->update($updateData);

        return response()->json([ "message" => "Data paket success updated" ]);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        $delete = $this->paketsModel->findOrFail($id)->delete();

        return response()->json([ 'message' => 'Data paket success deleted' ]);
    }
}
