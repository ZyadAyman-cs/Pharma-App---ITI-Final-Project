<?php

namespace App\Http\Controllers\Admin;

use App\Models\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{
 public function index()
    {
     $users = User::all();
    return view('admin.user.alluser', compact('users'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
     return view("admin.user.createuser");
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'name'=>'required',
            'email'=>'required|email|unique:users',
            'password'=>'required|min:7',
            'type'=>'required',
            'phone'=>'required',
            'address'=>'required'

        ]);

        $user=new User();
        $user->name=$request->name;
        $user->email=$request->email;
        $user->password=Hash::make($request->password);
        $user->type=$request->type;
        $user->phone=$request->phone;
        $user->address=$request->address;
        $user->save();

return redirect()->route('admin.listuser')->with('success', 'User updated successfully');

    }

    /**
     * Display the specified resource.
     */
    public function show(medicine $medicine)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit($id)
    {
        $user=User::findorfail($id);
        return view('admin.user.edituser',compact('user'));

    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request,$id)
    {

      $request->validate([
    'name' => 'sometimes',
    'email' => 'sometimes|email|unique:users,email,' . $id,
    'password' => 'nullable|min:7',
    'type' => 'sometimes',
    'phone' => 'sometimes',
    'address' => 'sometimes'
]);

$user = User::find($id);
$user->name = $request->name;
$user->email = $request->email;

// متغيرش الباسورد إلا لو اتبعت
if ($request->filled('password')) {
    $user->password = Hash::make($request->password);
}

$user->type = $request->type;
$user->phone = $request->phone;
$user->address = $request->address;
$user->save();

return redirect()->route('admin.user.listuser')->with('success', 'User updated successfully');

    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Request $request,$id)
    {
        $user=User::findorfail($id);
        $user->delete();
        return redirect()->route('admin.user.listuser')->with('success', 'User deleted successfully');

    }
}


