@extends('pharmacist.layout.app')

@section('content')
<div class="container mx-auto p-6 bg-white shadow-lg rounded-lg">
    <h2 class="text-2xl font-bold mb-6 text-center text-purple-600">📦 Archived Orders</h2>

    <table class="table table-hover align-middle text-center table-bordered w-full">
        <thead class="bg-purple-600 text-white">
            <tr>
                <th>#Archived ID</th>
                <th>Original Order ID</th>
                <th>Archived At</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            @forelse($archivedOrders as $order)
                <tr>
                    <td><span class="badge bg-purple-500 text-white px-2 py-1 rounded">{{ $order->id }}</span></td>
                    <td>{{ $order->order_id }}</td>
                    <td class="text-muted">{{ \Carbon\Carbon::parse($order->created_at)->format('Y-m-d H:i') }}</td>
                    <td>
                      <a href="{{ route('orders.showArchivedOrder', $order->id) }}"
   class="bg-blue-500 text-white px-3 py-1 rounded hover:bg-blue-600">
    👁 View
</a>


                    </td>
                </tr>
            @empty
                <tr>
                    <td colspan="4" class="text-center text-gray-500 py-4">🚫 No Archived Orders Found</td>
                </tr>
            @endforelse
        </tbody>
    </table>

    <div class="mt-4 d-flex justify-content-center">
        {{ $archivedOrders->links('pagination::bootstrap-5') }}
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
    function showOrderDetails(id, data) {
        Swal.fire({
            title: '📋 Order Details (ID: ' + id + ')',
            html: `<pre style="text-align:left;max-height:400px;overflow:auto;background:#f8f9fa;padding:10px;border-radius:8px;">${JSON.stringify(data, null, 2)}</pre>`,
            width: 800,
            confirmButtonText: 'Close'
        });
    }
</script>
@endsection
