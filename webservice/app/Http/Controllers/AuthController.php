<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class AuthController extends Controller
{
    public function register(Request $request)
    {
        //validate
        $rules = [
            'name' => 'required|string',
            'username' => 'required|string',
            'email' => 'required|string|unique:users',
            'password' => 'required|string|min:6',
        ];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json($validator->erros(), 400);
        }
        //create new user
        $user = User::create([
            'name' => $request->name,
            'username' => $request->username,
            'email' => $request->email,
            'password' => Hash::make($request->password)
        ]);
        $token = $user->createToken('Personal Access Token')->plainTextToken;
        $response = ['user' => $user, 'token' => $token];
        return response()->json($response, 200);
    }

    public function login(Request $request)
    {
        // validate inputs
        $rules = [
            'email' => 'required',
            'password' => 'required|string'
        ];
        $request->validate($rules);
        // find user email in users table
        $user = User::where('email', $request->email)->first();
        // if user email found and password is correct
        if ($user && Hash::check($request->password, $user->password)) {
            $token = $user->createToken('Personal Access Token')->plainTextToken;
            $response = ['user' => $user, 'token' => $token];
            return response()->json($response, 200);
        }
        $response = ['message' => 'Incorrect email or password'];
        return response()->json($response, 400);
    }
}
