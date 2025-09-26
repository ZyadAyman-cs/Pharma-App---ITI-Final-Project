<?php

namespace App\Http\Controllers\pharmacist;

use App\Models\medicine;
use App\Models\Supplier;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $products=medicine::with('supplier')->paginate(15);
        return view('pharmacist.products.index',compact('products'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
            $suppliers = Supplier::all();

        return view('pharmacist.products.create',compact('suppliers'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {

        $request->validate([

            'name'=>'required',
            'type'=>'required',
            'supplier_id'=>'required|numeric',
            'price_purchase'=>'required|numeric',
            'price_sell'=>'required|numeric',
            'quantity'=>'required|numeric',
            'barcode'=>'required|numeric',
            'expiry_date'=>'required'

        ]);

        $product=new medicine();
        $product->name=$request->name;
        $product->type=$request->type;
        $product->supplier_id=$request->supplier_id;
        $product->price_purchase=$request->price_purchase;
        $product->price_sell=$request->price_sell;
        $product->quantity=$request->quantity;
        $product->expiry_date=$request->expiry_date;
        $product->barcode=$request->barcode;
        $product->save();
        return redirect()->route('product.allproducts')->with('success','the product created successfully');



    }
    public function search(Request $request)
 {

    $request->validate([
        'search' => 'required|string',
    ]);

    $searchedMedicine = medicine::where('name', 'like', '%' . $request->search . '%')
                        ->orWhere('barcode', $request->search)
                        ->with('supplier')
                        ->first();

    if ($searchedMedicine) {
        // رجع redirect للصفحة الرئيسية ومعاه الدواء في الـ session
        return redirect()->route('product.allproducts')
                         ->with('searchedMedicine', $searchedMedicine);
    }

    return redirect()->route('product.allproducts')
                     ->with('error', '⚠️ الدواء غير موجود');


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
    public function edit(string $id)
    {
        $product=medicine::findorfail($id);
        $suppliers = Supplier::all();

        return view('pharmacist.products.update',compact('product','suppliers'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {

    $request->validate([
        'name'          => 'required',
        'type'          => 'required',
        'supplier_id'   => 'required|numeric',
        'price_purchase'=> 'required|numeric',
        'price_sell'    => 'required|numeric',
        'quantity'      => 'required|numeric',
        'barcode'       => 'required|numeric',
        'expiry_date'   => 'required|date',
    ]);

    $product = medicine::findOrFail($id);

    $product->update($request->only([
        'name',
        'type',
        'supplier_id',
        'price_purchase',
        'price_sell',
        'quantity',
        'expiry_date',
        'barcode',
    ]));

    return redirect()->route('product.allproducts')->with('success','The product updated successfully');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $product=medicine::findorfail($id);
        $product->delete();
            return redirect()->route('product.allproducts')->with('success','The product deleted successfully');

    }
}
