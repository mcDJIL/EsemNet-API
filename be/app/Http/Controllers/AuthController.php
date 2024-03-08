<?php

namespace App\Http\Controllers;

use App\Models\Pengguna;
use Illuminate\Http\Request;

class AuthController extends Controller
{

    protected $penggunaModel;
    public function __construct(Pengguna $pengguna)
    {
        $this->penggunaModel = $pengguna;
    }

    public function login(Request $request)
    {
        $login = $this->penggunaModel->where('NamaPengguna', $request->input('username'))
        ->where('KataSandi', $request->input('password'))->first();

        if (!$login) return response()->json([ "message" => "Username or Password is wrong" ], 401);

        $token = md5($request->input('username'));

        $login->update([ 'token' => $token ]);
        
        return response()->json([ "data" => $login ]);
    }

    public function logout(Request $request)
    {
        $token = $request->query('token');

        $logout = $this->penggunaModel->where('token', $token)->first();

        if (!$logout || $token === null) return response()->json([ 'message' => 'Unauthorized User' ], 401);

        $logout->update([ 'token' => null ]);

        return response()->json([ 'message' => 'Logout Successfully' ]);
    }
}
