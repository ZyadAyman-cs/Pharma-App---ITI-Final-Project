<?php

namespace App\Http\Controllers\pharmacist;

use DB;
use App\Models\order;
use App\Models\medicine;
use App\Models\orderitem;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class OrderController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $orders =order::with('items.medicine')->paginate(15);
        return view('pharmacist.order.index',compact('orders'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
  $medicines = medicine::all();
        return view('pharmacist.order.create', compact('medicines'));
        }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
{
    $request->validate([
        'medicines' => 'required|array',
        'medicines.*.id' => 'required|exists:medicines,id',
        'medicines.*.quantity' => 'required|integer|min:1',
    ]);

    // نحسب التوتال
    $totalPrice = 0;

    foreach ($request->medicines as $item) {
        $medicine = Medicine::findOrFail($item['id']);
        $totalPrice += $medicine->price_sell * $item['quantity'];
    }

    if ($medicine->quantity < $item['quantity']) {
            return back()->with('error', "Not enough stock for {$medicine->name}");
        }
    // إنشاء الأوردر
    $order = order::create([
        'pharmacist_id' => auth()->id(), // اللي عامل الأوردر
        'total_price'   => $totalPrice,
    ]);

    // إنشاء الـ Items + خصم الكمية
    foreach ($request->medicines as $item) {
        $medicine = medicine::findOrFail($item['id']);

        // خصم الكمية
        if ($medicine->quantity < $item['quantity']) {
            return back()->with('error', "Not enough stock for {$medicine->name}");
        }
        $medicine->quantity -= $item['quantity'];
        $medicine->save();

        // حفظ الـ Item
        $order->items()->create([
            'medicine_id' => $medicine->id,
            'quantity'    => $item['quantity'],
            'price'       => $medicine->price_sell,
        ]);
    }

    return redirect()->route('orders.allorders')->with('success', 'Order created successfully');
}



    /**
     * Display the specified resource.
     */
   public function show($id)
{
    $order = order::with(['items.medicine', 'pharmacist'])->findOrFail($id);

    return view('pharmacist.order.show', compact('order'));
}

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        $order=order::with('items.medicine')->findorfail($id);
        $medicines=medicine::all();
        return view('pharmacist.order.edit',compact('order','medicines'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $order = order::findOrFail($id);

    $validated = $request->validate([
        'items' => 'required|array',
        'items.*.medicine_id' => 'required|exists:medicines,id',
        'items.*.quantity' => 'required|integer|min:1',
    ]);

    $order->items()->delete();

    $total = 0;
    foreach ($validated['items'] as $item) {
        $medicine = medicine::findOrFail($item['medicine_id']);
        $order->items()->create([
            'medicine_id' => $medicine->id,
            'quantity'    => $item['quantity'],
            'price'       => $medicine->price_sell,
        ]);
        $total += $item['quantity'] * $medicine->price_sell;
    }

    $order->update(['total_price' => $total,'updated_by' =>auth()->id()
]);

    return redirect()->route('orders.showorder', $order->id)
                     ->with('success', 'Order updated successfully!');


    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $order=order::findorfail($id);


        foreach ($order->items as $item) {
            $item->medicine->increment('quantity', $item->quantity);
        }

        $order->delete();

        return redirect()->route('orders.allorders')->with('success', 'Order deleted successfully');
    }

    public function search(Request $request)
{
    $search = $request->get('q');

    $medicines = medicine::query()
        ->where('name', 'like', "%{$search}%")
        ->orWhere('barcode', 'like', "%{$search}%")
        ->limit(10)
        ->get(['id', 'name', 'barcode', 'quantity']);

    return response()->json($medicines);
}
public function startNewDay()
{
    $orders = Order::with('items')->get();

    foreach ($orders as $order) {
        DB::table('archived_orders')->insert([
            'order_id' => $order->id,
    'data' => json_encode($order->load('items.medicine', 'pharmacist')), // نخزن الأوردر كامل
            'created_at' => now(),
            'updated_at' => now(),
        ]);
    }

    // نفرغ جدول الأوردرات
    Order::truncate();
    orderitem::truncate();

    return redirect()->route('orders.allorders')->with('success', 'تم بدء يوم جديد بنجاح ✅ كل الأوردرات اترحلت للأرشيف.');
}
public function archivedOrders()
{
    $archivedOrders = DB::table('archived_orders')->latest()->paginate(10);

    return view('pharmacist.order.archived', compact('archivedOrders'));
}
public function showArchivedOrder($id)
{
    $archivedOrder = DB::table('archived_orders')->find($id);

    if (!$archivedOrder) {
        abort(404, 'Order not found in archive.');
    }

    $orderData = json_decode($archivedOrder->data, true);

    return view('pharmacist.order.show-archived', compact('orderData'));
}

}
