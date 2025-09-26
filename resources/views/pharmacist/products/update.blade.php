@extends('pharmacist.layout.app')

@section('content')
<div class="max-w-lg mx-auto bg-white p-6 rounded-lg shadow-lg mt-10">
    <h2 class="text-xl font-bold mb-4">Edit Product</h2>

    <form action="{{ route('product.updateproduct', $product->id) }}" method="POST">
        @csrf
        @method('PUT')

        <div class="mb-4">
            <label class="block">Name</label>
            <input type="text" name="name" value="{{ $product->name }}" class="w-full border rounded p-2" required>
        </div>

        <div class="mb-4">
            <label class="block font-semibold">Type</label>
            <select name="type" class="w-full border p-2 rounded">
                <option value="">-- Select type --</option>
                <option value="tablet" {{ $product->type == 'tablet' ? 'selected' : '' }}>tablet</option>
                <option value="syrup" {{ $product->type == 'syrup' ? 'selected' : '' }}>syrup</option>
                <option value="injection" {{ $product->type == 'injection' ? 'selected' : '' }}>injection</option>
                <option value="ointment" {{ $product->type == 'ointment' ? 'selected' : '' }}>ointment</option>
                <option value="other" {{ $product->type == 'other' ? 'selected' : '' }}>other</option>
            </select>
        </div>

        <div class="mb-4">
            <label class="block">Supplier</label>
            <select name="supplier_id" class="w-full border rounded p-2">
                <option value="">-- Select supplier --</option>
                @foreach($suppliers as $supplier)
                    <option value="{{ $supplier->id }}" {{ $supplier->id == $product->supplier_id ? 'selected' : '' }}>
                        {{ $supplier->name }}
                    </option>
                @endforeach
            </select>
        </div>

        <div class="mb-4">
            <label class="block">Barcode</label>
            <input type="number" name="barcode" value="{{ $product->barcode }}" class="w-full border rounded p-2">
        </div>

        <div class="mb-4">
            <label class="block">Purchase Price</label>
            <input type="number" step="0.01" name="price_purchase" value="{{ $product->price_purchase }}" class="w-full border rounded p-2">
        </div>

        <div class="mb-4">
            <label class="block">Selling Price</label>
            <input type="number" step="0.01" name="price_sell" value="{{ $product->price_sell }}" class="w-full border rounded p-2">
        </div>

        <div class="mb-4">
            <label class="block">Quantity</label>
            <input type="number" name="quantity" value="{{ $product->quantity }}" class="w-full border rounded p-2">
        </div>

        <div class="mb-4">
            <label class="block">Expiry Date</label>
            <input type="date" name="expiry_date" value="{{ $product->expiry_date }}" class="w-full border rounded p-2">
        </div>

        <button type="submit" class="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600">Update</button>
        <a href="{{ route('product.allproducts') }}" class="ml-2 text-gray-600">Cancel</a>
    </form>
</div>
@endsection
