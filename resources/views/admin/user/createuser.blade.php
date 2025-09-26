{{-- resources/views/admin/users/create.blade.php --}}
@extends('admin.layout.app')

@section('content')
<div class="max-w-lg mx-auto bg-white p-6 rounded-lg shadow-md">
    <h2 class="text-2xl font-bold mb-4">Create New User</h2>

    @if(session('success'))
        <div class="bg-green-100 text-green-800 p-3 rounded mb-4">
            {{ session('success') }}
        </div>
    @endif

    <form action="{{ route('admin.storeuser') }}" method="post">
        @csrf

        <div class="mb-4">
            <label class="block font-semibold">Name</label>
            <input type="text" name="name" value="" class="w-full border p-2 rounded">
            @error('name') <p class="text-red-500 text-sm">{{ $message }}</p> @enderror
        </div>

        <div class="mb-4">
            <label class="block font-semibold">Email</label>
            <input type="email" name="email" value="" class="w-full border p-2 rounded">
            @error('email') <p class="text-red-500 text-sm">{{ $message }}</p> @enderror
        </div>

        <div class="mb-4">
            <label class="block font-semibold">Password</label>
            <input type="password" name="password" class="w-full border p-2 rounded">
            @error('password') <p class="text-red-500 text-sm">{{ $message }}</p> @enderror
        </div>



        <div class="mb-4">
            <label class="block font-semibold">Role</label>
            <select name="type" class="w-full border p-2 rounded">
                <option value="">-- Select Role --</option>
                <option value="admin">Admin</option>
                <option value="pharmacist">Pharmacist</option>
                <option value="cashier">Cashier</option>
                <option value="supplier">Supplier</option>
            </select>
            @error('type') <p class="text-red-500 text-sm">{{ $message }}</p> @enderror
        </div>

        <div class="mb-4">
            <label class="block font-semibold">Phone</label>
            <input type="text" name="phone" value="" class="w-full border p-2 rounded">
        </div>

        <div class="mb-4">
            <label class="block font-semibold">Address</label>
            <input type="text" name="address" value="" class="w-full border p-2 rounded">
        </div>

        <button type="submit" class="bg-blue-600 text-white px-4 py-2 rounded">Create User</button>
        <a href="{{ route('admin.listuser') }}" class="ml-2 text-gray-600">Cancel</a>
    </form>
</div>
@endsection
