@extends('admin.layout.app')

@section('content')
<div class="max-w-4xl mx-auto bg-white p-6 rounded-lg shadow-lg mt-10">
    <h2 class="text-2xl font-bold mb-6">All Users</h2>


    @if(session('success'))
        <p class="bg-green-100 text-green-700 p-2 rounded mb-4">{{ session('success') }}</p>
    @endif

    <table class="w-full border-collapse border border-gray-300">
        <thead>
            <tr class="bg-gray-200">
                <th class="border border-gray-300 p-2">ID</th>
                <th class="border border-gray-300 p-2">Name</th>
                <th class="border border-gray-300 p-2">Email</th>
                <th class="border border-gray-300 p-2">Role</th>
                <th class="border border-gray-300 p-2">Actions</th>
            </tr>
        </thead>
        <tbody>
            @forelse($users as $user)
                <tr>
                    <td class="border border-gray-300 p-2">{{ $user->id }}</td>
                    <td class="border border-gray-300 p-2">{{ $user->name }}</td>
                    <td class="border border-gray-300 p-2">{{ $user->email }}</td>
                    <td class="border border-gray-300 p-2">{{ $user->type }}</td>
                    <td class="border border-gray-300 p-2 flex gap-2">
                        <!-- Edit -->
                        <a href="{{ route('admin.users.edit', $user->id) }}"
                           class="bg-blue-500 text-white px-3 py-1 rounded hover:bg-blue-600">Edit</a>

                        <!-- Delete -->
                        <form action="{{ route('admin.users.destroy', $user->id) }}" method="POST" onsubmit="return confirm('Are you sure you want to delete this user?')">
                            @csrf
                            @method('DELETE')
                            <button type="submit" class="bg-red-500 text-white px-3 py-1 rounded hover:bg-red-600">Delete</button>
                        </form>
                    </td>
                </tr>
            @empty
                <tr>
                    <td colspan="5" class="text-center p-4">No users found.</td>
                </tr>
            @endforelse
        </tbody>
    </table>
</div>
@endsection
