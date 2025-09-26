@extends('pharmacist.layout.app')

@section('content')
<div class="container mx-auto p-6 bg-white shadow-lg rounded-lg">
    <h2 class="text-2xl font-bold mb-6 text-center text-purple-600">
        🗂 Archived Order Details
    </h2>

    <p><strong>Order ID:</strong> {{ $orderData['id'] }}</p>
    <p><strong>Pharmacist:</strong> {{ $orderData['pharmacist']['name'] ?? 'N/A' }}</p>
    <p><strong>Total Price:</strong> {{ $orderData['total_price'] }}</p>

    <h3 class="text-lg font-semibold mt-4">Medicines:</h3>
    <ul class="list-disc ml-6">
        @foreach($orderData['items'] as $item)
            <li>
                {{ $item['medicine']['name'] ?? 'Unknown' }} -
                Qty: {{ $item['quantity'] }} -
                Price: {{ $item['price'] }}
            </li>
        @endforeach
    </ul>

</div>
<a href="{{ route('orders.archivedOrders')}}" class="bg-gray-400 text-white px-4 py-2 rounded hover:bg-gray-500">⬅ Back</a>

@endsection
