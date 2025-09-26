@extends('admin.layout.app')

@section('content')
<div class="max-w-lg mx-auto bg-white p-6 rounded-lg shadow-lg mt-10">
    <h2 class="text-2xl font-bold mb-6">Edit User</h2>

    @if ($errors->any())
        <div class="bg-red-100 text-red-700 p-3 rounded mb-4">
            <ul class="list-disc pl-5">
                @foreach ($errors->all() as $error)
                    <li>{{ $error }}</li>
                @endforeach
            </ul>
        </div>
    @endif

    <form action="{{ route('admin.users.update', $user->id) }}" method="POST">
        @csrf
        @method('PUT')

        <div class="mb-4">
            <label class="block font-semibold">Name</label>
            <input type="text" name="name" value="{{ old('name', $user->name) }}" class="w-full border p-2 rounded">
        </div>

        <div class="mb-4">
            <label class="block font-semibold">Email</label>
            <input type="email" name="email" value="{{ old('email', $user->email) }}" class="w-full border p-2 rounded">
        </div>

        <div class="mb-4">
            <label class="block font-semibold">Password (Leave empty if not changing)</label>
            <input type="password" name="password" class="w-full border p-2 rounded">
        </div>

        <div class="mb-4">
            <label class="block font-semibold">Role</label>
            <select name="type" class="w-full border p-2 rounded">
                <option value="admin" {{ $user->type == 'admin' ? 'selected' : '' }}>Admin</option>
                <option value="Pharmacist" {{ $user->type == 'Pharmacist' ? 'selected' : '' }}>Pharmacist</option>
                <option value="Cashier" {{ $user->type == 'Cashier' ? 'selected' : '' }}>Cashier</option>
                <option value="Supplier" {{ $user->type == 'Supplier' ? 'selected' : '' }}>Supplier</option>
            </select>
        </div>

        <div class="mb-4">
            <label class="block font-semibold">Phone</label>
            <input type="text" name="phone" value="{{ old('phone', $user->phone) }}" class="w-full border p-2 rounded">
        </div>

        <div class="mb-4">
            <label class="block font-semibold">Address</label>
            <input type="text" name="address" value="{{ old('address', $user->address) }}" class="w-full border p-2 rounded">
        </div>

        <button type="submit" class="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600">
            Update User
        </button>
    </form>
</div>
@endsection
