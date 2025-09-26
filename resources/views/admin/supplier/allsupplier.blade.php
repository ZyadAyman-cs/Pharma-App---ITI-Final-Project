@extends('admin.layout.app')

@section('content')
<div class="max-w-5xl mx-auto bg-white p-6 rounded-lg shadow-lg mt-10">
    <h2 class="text-2xl font-bold mb-4">Suppliers List</h2>

    <a href="{{ route('supplier.createsupplier') }}"
       class="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600 mb-4 inline-block">
       + Add Supplier
    </a>

    <table class="w-full border border-gray-300">
        <thead>
            <tr class="bg-gray-100">
                <th class="border p-2">ID</th>
                <th class="border p-2">Name</th>
                <th class="border p-2">Email</th>
                <th class="border p-2">Phone</th>
                <th class="border p-2">Company</th>
                <th class="border p-2">Actions</th>
            </tr>
        </thead>
        <tbody>
            @forelse($supplier as $supplier)
                <tr>
                    <td class="border p-2">{{ $supplier->id }}</td>
                    <td class="border p-2">{{ $supplier->name }}</td>
                    <td class="border p-2">{{ $supplier->email }}</td>
                    <td class="border p-2">{{ $supplier->phone }}</td>
                    <td class="border p-2">{{ $supplier->company_name }}</td>
                    <td class="border p-2 flex gap-2">
                        <a href="{{ route('supplier.editsupplier', $supplier->id) }}"
                           class="bg-blue-500 text-white px-3 py-1 rounded hover:bg-blue-600">Edit</a>

                        <form action="{{ route('supplier.deletesupplier', $supplier->id) }}"
                              method="POST"
                              onsubmit="return confirm('Are you sure you want to delete this supplier?')">
                            @csrf
                            @method('DELETE')
                            <button type="submit" class="bg-red-500 text-white px-3 py-1 rounded hover:bg-red-600">
                                Delete
                            </button>
                        </form>
                    </td>
                </tr>
            @empty
                <tr>
                    <td colspan="6" class="text-center p-4">No suppliers found.</td>
                </tr>
            @endforelse
        </tbody>
    </table>
</div>
@endsection
