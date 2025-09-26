@extends('pharmacist.layout.app')

@section('content')
<div class="max-w-lg mx-auto bg-white p-6 rounded-lg shadow-lg mt-10">
    <h2 class="text-xl font-bold mb-4">Add Product</h2>

    <form action="{{ route('product.storeproduct') }}" method="POST">
        @csrf
        <div class="mb-4">
            <label class="block">Name</label>
            <input type="text" name="name" class="w-full border rounded p-2" required>
        </div>

        <div class="mb-4">
            <label class="block font-semibold">type</label>
            <select name="type" class="w-full border p-2 rounded">
                <option value="">-- Select type --</option>
                <option value="tablet">tablet</option>
                <option value="syrup">syrup</option>
                <option value="injection">injection</option>
                <option value="ointment">ointment</option>
                <option value="other">other</option>

            </select>
        </div>

        <div class="mb-4">
            <label class="block">Supplier</label>
            <select name="supplier_id" class="w-full border rounded p-2">
                <option value="">-- Select type --</option>
                @foreach($suppliers as $supplier)
                    <option value="{{ $supplier->id }}">{{ $supplier->name }}</option>
                @endforeach
            </select>
        </div>


           <div class="mb-4">
            <label class="block">barcode</label>
            <input type="number" name="barcode" class="w-full border rounded p-2">
        </div>
           <div class="mb-4">
            <label class="block">price_purchase</label>
            <input type="number" name="price_purchase" class="w-full border rounded p-2">
        </div>

           <div class="mb-4">
            <label class="block">price_sell</label>
            <input type="number" name="price_sell" class="w-full border rounded p-2">
        </div>
           <div class="mb-4">
            <label class="block">quantity</label>
            <input type="number" name="quantity" class="w-full border rounded p-2">
        </div>
             <div class="mb-4">
            <label class="block">expiry_date</label>
            <input type="date" name="expiry_date" class="w-full border rounded p-2">
        </div>

        <button type="submit" class="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600">Save</button>
        <a href="{{ route('product.allproducts') }}" class="ml-2 text-gray-600">Cancel</a>
    </form>
</div>
@endsection
