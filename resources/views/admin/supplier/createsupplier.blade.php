@extends('admin.layout.app')

@section('content')
<div class="max-w-lg mx-auto bg-white p-6 rounded-lg shadow-lg mt-10">
    <h2 class="text-xl font-bold mb-4">Add Supplier</h2>

    {{-- Validation Errors --}}
    @if ($errors->any())
        <div class="mb-4 bg-red-100 text-red-700 p-3 rounded">
            <ul class="list-disc pl-5">
                @foreach ($errors->all() as $error)
                    <li>{{ $error }}</li>
                @endforeach
            </ul>
        </div>
    @endif

    <form action="{{ route('supplier.storesupplier') }}" method="POST">
        @csrf
        <div class="mb-4">
            <label class="block font-medium">Name</label>
            <input type="text" name="name" class="w-full border rounded p-2" value="{{ old('name') }}" required>
            @error('name')
                <p class="text-red-500 text-sm mt-1">{{ $message }}</p>
            @enderror
        </div>

        <div class="mb-4">
            <label class="block font-medium">Email</label>
            <input type="email" name="email" class="w-full border rounded p-2" value="{{ old('email') }}">
            @error('email')
                <p class="text-red-500 text-sm mt-1">{{ $message }}</p>
            @enderror
        </div>

        <div class="mb-4">
            <label class="block font-medium">Phone</label>
            <input type="text" name="phone" class="w-full border rounded p-2" value="{{ old('phone') }}">
            @error('phone')
                <p class="text-red-500 text-sm mt-1">{{ $message }}</p>
            @enderror
        </div>

        <div class="mb-4">
            <label class="block font-medium">Address</label>
            <input type="text" name="address" class="w-full border rounded p-2" value="{{ old('address') }}">
            @error('address')
                <p class="text-red-500 text-sm mt-1">{{ $message }}</p>
            @enderror
        </div>

        <div class="mb-4">
            <label class="block font-medium">Company</label>
            <input type="text" name="company_name" class="w-full border rounded p-2" value="{{ old('company') }}">
            @error('company')
                <p class="text-red-500 text-sm mt-1">{{ $message }}</p>
            @enderror
        </div>

        <button type="submit" class="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600">Save</button>
        <a href="{{ route('supplier.listsupplier') }}" class="ml-2 text-gray-600">Cancel</a>
    </form>
</div>
@endsection
