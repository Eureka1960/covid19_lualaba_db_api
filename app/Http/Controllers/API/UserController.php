<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class UserController extends Controller
{
    public $successStatus = 200;
    public function login()
    {
        if (Auth::attempt(['credential' => request('credential'), 'password' => request('password')])){
            $user = Auth::user();
            $success['id'] = $user->id;
            $success['username'] = $user->credential;
            $success['email'] = $user->email;
            $success['token'] = $user->createToken('Covid19Lualaba')->accessToken;
            return response()->json(['success' => $success], $this->successStatus);
        } else {
            $error['message'] = "L'identitifiant (email ou mot de passe) est incorrectes";
            return response()->json(['error' => $error]);
        }
    }

    public function register(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name'              => 'required',
            'gender'            => 'required',
            'email'             => 'required|email',
            'credential'        => 'required',
            'password'          => 'required',
            // 'c_password'        => 'required|same:password'
        ]);

        if ($validator->fails()) return response()->json(['error' => $validator->errors()], 401);

        $input = $request->all();
        $input['password'] = bcrypt($input['password']);
        $user = User::create($input);
        $success['token'] = $user->createToken('Covid19Lualaba')->accessToken;
        $success['name'] = $user->name;
        return response()->json(['success' => $success], $this->successStatus);
    }

    public function details()
    {
        $user = Auth::user();
        return response()->json(['success' => $user], $this->successStatus);

    }
}
