@extends('pharmacist.layout.app')

@section('content')
<div class="container mx-auto p-6">
    <h2 class="text-2xl font-bold mb-4">Order #{{ $order->id }}</h2>

    <p><strong>created_by:</strong> {{ $order->pharmacist->name }}</p>
    <p><strong>updated_by:{{ $order->updater?->name ?? 'N/A' }}</p>
    <p><strong>Total:</strong> {{ $order->total_price }} EGP</p>

    <h3 class="text-xl font-semibold mt-4">Items:</h3>
    <ul class="list-disc ml-6">
        @foreach($order->items as $item)
            <li>{{ $item->medicine->name }} - {{ $item->quantity }} pcs ({{ $item->price }} EGP each)</li>
        @endforeach
    </ul>
</div>
            <a href="{{ route('orders.allorders')}}" class="bg-gray-400 text-white px-4 py-2 rounded hover:bg-gray-500">⬅ Back</a>

@endsection
