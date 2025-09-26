@extends('admin.layout.app')

@section('content')
<div class="max-w-lg mx-auto bg-white p-6 rounded-lg shadow-lg mt-10">
    <h2 class="text-xl font-bold mb-4">Edit Supplier</h2>

    <form action="{{ route('supplier.updatesupplier', $supplier->id )}}" method="POST">
        @csrf
        @method('PUT')

        <div class="mb-4">
            <label class="block">Name</label>
            <input type="text" name="name" value="{{ $supplier->name }}" class="w-full border rounded p-2" required>
        </div>

        <div class="mb-4">
            <label class="block">Email</label>
            <input type="email" name="email" value="{{ $supplier->email }}" class="w-full border rounded p-2">
        </div>

        <div class="mb-4">
            <label class="block">Phone</label>
            <input type="text" name="phone" value="{{ $supplier->phone }}" class="w-full border rounded p-2">
        </div>

        <div class="mb-4">
            <label class="block">Address</label>
            <input type="text" name="address" value="{{ $supplier->address }}" class="w-full border rounded p-2">
        </div>

        <div class="mb-4">
            <label class="block">Company</label>
            <input type="text" name="company_name" value="{{ $supplier->company }}" class="w-full border rounded p-2">
        </div>

        <button type="submit" class="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600">Update</button>
        <a href="{{ route('supplier.listsupplier') }}" class="ml-2 text-gray-600">Cancel</a>
    </form>
</div>
@endsection
