<?php

namespace App\Http\Controllers;

use App\Models\Member;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class MemberController extends Controller
{
    protected $memberModel;
    public function __construct(Member $member)
    {
        $this->memberModel = $member;
    }

    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $index = $this->memberModel->all();

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
            'Nama' => 'required',
            'Telepon' => 'required|string|min:10|max:15',
            'Alamat' => 'nullable',
        ], [
            'Nama.required' => 'Member name must be filled in',
        ]);

        if ($validation->fails()) return response()->json($validation->errors());

        $store = collect($request->only($this->memberModel->getFillable()))->toArray();
        $new = $this->memberModel->create($store);

        return response()->json([ 'message' => 'Data member success added' ]);
    }

    /**
     * Display the specified resource.
     */
    public function show(Member $member)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Member $member)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, $id)
    {
        $komputer = $this->memberModel->findOrFail($id);

        $update = collect($request->only($this->memberModel->getFillable()))->toArray();

        $komputer->update($update);

        return response()->json([ 'message' => 'Data member success updated' ]);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        $delete = $this->memberModel->findOrFail($id)->delete();

        return response()->json([ 'message' => 'Data member success deleted' ]);
    }
}
