<?php

namespace App\Http\Controllers;

use App\Models\KodePotonganHarga;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class KodePotonganHargaController extends Controller
{
    protected $diskonModel;
    public function __construct(KodePotonganHarga $kodePotonganHarga)
    {
        $this->diskonModel = $kodePotonganHarga;
    }

    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $index = $this->diskonModel->all();

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
            'start_date' => $request->input('BerlakuSampai'),
            'Nama' => 'required',
            'Kode' => 'required|unique:kodepotonganharga',
            'Presentase' => 'integer|min:1|max:100',
            'Maksimal' => 'integer|min:1',
            'BerlakuSampai' => 'date|after:start_date'
        ], [
            'Nama.required' => 'The name of the discount is mandatory',
            'Kode.required' => 'The discount code is mandatory', 
        ]);

        if ($validation->fails()) return response()->json($validation->errors());

        $store = collect($request->only($this->diskonModel->getFillable()))->toArray();
        $new = $this->diskonModel->create($store);

        return response()->json([ 'message' => 'Data diskon success added' ]);
    }

    /**
     * Display the specified resource.
     */
    public function show(KodePotonganHarga $kodePotonganHarga)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(KodePotonganHarga $kodePotonganHarga)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, $id)
    {
        $komputer = $this->diskonModel->findOrFail($id);

        $update = collect($request->only($this->diskonModel->getFillable()))->toArray();

        $komputer->update($update);

        return response()->json([ 'message' => 'Data diskon success updated' ]);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        $delete = $this->diskonModel->findOrFail($id)->delete();

        return response()->json([ 'message' => 'Data diskon success deleted' ]);
    }
}
