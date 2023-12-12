<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Providers\RouteServiceProvider;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;



class LoginController extends Controller
{
    public function __construct()
    {
        $this->middleware('guest')->except('logout');
    }


    public function index()
    {
        // abort(500);
        return view('auth.login');
    }

    public function login_proses(Request $request)
    {
        // dd($request->all());

        $request->validate([
            'username' => 'required',
            'password' => 'required'
        ]);

        $loginType = filter_var($request->username, FILTER_VALIDATE_EMAIL) ? 'email' : 'username';
        $credentials = [
            $loginType => $request->username,
            'password' => $request->password
        ];

        if (Auth::attempt($credentials)) {
            $user = Auth::user();

            if ($user->role == 'Admin') {
                return redirect()->route('home.admin');
            } elseif ($user->role == 'User') {
                return redirect()->route('home.user');
            }
        }

        return redirect()->route('login')->with('failed', 'Username atau Password Salah');
    }

    public function logout()
    {
        Auth::logout();
        return redirect()->route('login')->with('success', 'Kamu berhasil logout');
    }



    /**
     * Where to redirect users after login.
     *
    //  * @var string
     */
    // protected $redirectTo = RouteServiceProvider::HOME;

    // /**
    //  * Create a new controller instance.
    //  *
    //  * @return void
    //  */
    // public function __construct()
    // {
    //     $this->middleware('guest')->except('logout');
    // }
}
