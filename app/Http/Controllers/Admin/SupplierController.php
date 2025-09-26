<?php

namespace App\Http\Controllers\Admin;

use App\Models\Supplier;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class SupplierController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $supplier=Supplier::all();
        return view('admin.supplier.allsupplier',compact('supplier'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('admin.supplier.createsupplier');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
       $data= $request->validate([
                'name'=>'required|max:200',
                'email'=>'required|email|unique:suppliers',
                'phone'=>'required|numeric',
                'address'=>'required',
                'company_name'=>'required'
        ]);

    Supplier::create($request->all());
    return redirect()->route('supplier.listsupplier')->with('success','supplier created successfully');

    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit($id)
{
    $supplier = Supplier::findOrFail($id);
    return view('admin.supplier.editsupplier', compact('supplier'));
}


    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {

      $request->validate([
    'name' => 'sometimes',
    'email' => 'sometimes|email|unique:suppliers,email,' . $id,
    'company_name' => 'sometimes',
    'phone' => 'sometimes',
    'address' => 'sometimes'
]);

$supplier=Supplier::find($id);
$supplier->name=$request->name;
$supplier->email=$request->email;
$supplier->company_name=$request->company_name;
$supplier->phone=$request->phone; 
$supplier->address=$request->address;
$supplier->save();
return redirect()->route('supplier.listsupplier')->with('success','supplier updated successfully');



    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
$supplier=Supplier::find($id);
$supplier->delete();
return redirect()->route('supplier.listsupplier')->with('success','supplier deleted successfully');

    }
}
