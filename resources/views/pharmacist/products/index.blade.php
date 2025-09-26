@extends('pharmacist.layout.app')

@section('content')





<div class="max-w-6xl mx-auto bg-white p-6 rounded-lg shadow-lg mt-10">
    <form method="GET" action="{{ route('product.searchproduct') }}" class="mb-4 flex gap-2">
    <input type="text" name="search" value="{{ request('search') }}"
           placeholder="ابحث باسم الدواء أو الباركود"
           class="border rounded p-2 w-1/3">
    <button type="submit" class="bg-blue-500 text-white px-4 py-2 rounded">
        بحث
    </button>
</form>
@if(session('searchedMedicine'))
   @php $searchedMedicine = session('searchedMedicine'); @endphp
   <div id="searchModal" class="fixed inset-0 bg-gray-900 bg-opacity-50 flex items-center justify-center">
       <div class="bg-white p-6 rounded-lg shadow-lg w-1/3 relative">
           <button onclick="document.getElementById('searchModal').style.display='none'"
                   class="absolute top-2 right-2 text-gray-500 hover:text-black">&times;</button>

           <h2 class="text-xl font-bold mb-4">Medicine Info</h2>
           <p><strong>Name:</strong> {{ $searchedMedicine->name }}</p>
           <p><strong>Type:</strong> {{ $searchedMedicine->type }}</p>
           <p><strong>Supplier:</strong> {{ $searchedMedicine->supplier->name ?? 'N/A' }}</p>
           <p><strong>Barcode:</strong> {{ $searchedMedicine->barcode }}</p>
           <p><strong>Quantity:</strong> {{ $searchedMedicine->quantity }}</p>
           <p><strong>Price:</strong> {{ $searchedMedicine->price_sell }}</p>

           <div class="mt-4 flex gap-2">
               <a href="{{ route('product.editproduct', $searchedMedicine->id) }}" class="px-3 py-2 bg-yellow-400 rounded">Edit</a>
               <form action="{{ route('product.deleteproduct', $searchedMedicine->id) }}" method="POST" onsubmit="return confirm('متأكد؟');">
                   @csrf
                   @method('DELETE')
                   <button class="px-3 py-2 bg-red-500 text-white rounded">Delete</button>
               </form>
           </div>
       </div>
   </div>
@endif


     @if(session('success'))
        <p class="bg-green-100 text-green-700 p-2 rounded mb-4">{{ session('success') }}</p>
    @endif
    <h2 class="text-2xl font-bold mb-4">Products List</h2>
    <a href="{{ route('product.createproduct') }}" class="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600 mb-4 inline-block">Add Product</a>

    <table class="w-full border-collapse border border-gray-300 mt-4">
        <thead>
            <tr class="bg-gray-200">
                <th class="border p-2">ID</th>
                <th class="border p-2">Name</th>
                <th class="border p-2">Category</th>
                <th class="border p-2">Supplier</th>
                <th class="border p-2">Price</th>
                <th class="border p-2">Stock</th>
                <th class="border p-2">Actions</th>
            </tr>
        </thead>
        <tbody>
            @forelse($products as $product)
                <tr>
                    <td class="border p-2">{{ $product->id }}</td>
                    <td class="border p-2">{{ $product->name }}</td>
                    <td class="border p-2">{{ $product->type }}</td>
                    <td class="border p-2">{{ $product->supplier->name ?? 'N/A' }}</td>
                    <td class="border p-2">{{ $product->price_sell }}</td>
                    <td class="border p-2">{{ $product->quantity }}</td>
                    <td class="border p-2">
                        <a href="{{ route('product.editproduct', $product->id) }}" class="text-blue-500">Edit</a> |
                        <form action="{{ route('product.deleteproduct', $product->id) }}" method="POST" class="inline">
                            @csrf
                            @method('DELETE')
                            <button type="submit" class="text-red-500" onclick="return confirm('Are you sure?')">Delete</button>
                        </form>
                    </td>
                </tr>
            @empty
                <tr><td colspan="7" class="text-center p-2">No products found.</td></tr>
            @endforelse
        </tbody>
    </table>
</div>
<div class="mt-4 flex justify-end">
    <div class="bg-black px-3 py-2 rounded-md shadow-sm text-sm">
        {{ $products->appends(request()->query())->links('pagination::tailwind') }}
    </div>
</div>



@endsection
