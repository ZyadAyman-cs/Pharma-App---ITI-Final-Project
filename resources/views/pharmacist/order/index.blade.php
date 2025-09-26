@extends('pharmacist.layout.app')

@section('content')
<div class="container mt-4">

    <!-- Header -->
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="fw-bold text-primary">📦 All Orders</h2>
        <div>
            <div class="mb-4">
    <form action="{{ route('orders.startNewDay') }}" method="POST" onsubmit="return confirm('هل انت متأكد انك عايز تبدأ يوم جديد؟ هيتم أرشفة كل الأوردرات الحالية!')">
        @csrf
        <button type="submit" class="bg-red-600 text-white px-4 py-2 rounded hover:bg-red-700">
            🚀 Start New Day
        </button>
    </form>
</div>

            <a href="{{ route('orders.createorder') }}" class="btn btn-success shadow-sm me-2">
                <i class="bi bi-plus-circle me-1"></i> Create Order
            </a>
            <a href="{{ url()->previous() }}" class="btn btn-secondary shadow-sm">
                <i class="bi bi-arrow-left-circle me-1"></i> Back
            </a>
        </div>
    </div>

    <!-- Success Alert -->
    @if(session('success'))
        <div class="alert alert-success alert-dismissible fade show shadow-sm" role="alert">
            <i class="bi bi-check-circle-fill me-1"></i> {{ session('success') }}
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
    @endif

    <!-- Orders Table -->
 <div class="card shadow-lg border-0 rounded-3">
    <div class="card-body p-4 bg-light">
        <table class="table table-hover align-middle text-center table-bordered shadow-sm">
            <thead class="table-primary text-dark">
                <tr>
                    <th>#ID</th>
                    <th>Total Price</th>
                    <th>Created At</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                @forelse($orders as $order)
                    <tr>
                        <td>
                            <span class="badge bg-gradient bg-primary fs-6 px-3 py-2 shadow-sm">
                                {{ $order->id }}
                            </span>
                        </td>
                        <td class="text-success fw-bold">
                            {{ number_format($order->total_price, 2) }} EGP
                        </td>
                        <td>
                            <span class="text-muted">
                                {{ $order->created_at->format('Y-m-d H:i') }}
                            </span>
                        </td>
                        <td>
                            <!-- View Button -->
                            <a href="{{ route('orders.showorder', $order->id) }}"
                               class="btn btn-sm btn-primary me-1 shadow-sm">
                                <i class="bi bi-eye"></i> View
                            </a>

                            <!-- Edit Button -->
                            <a href="{{ route('orders.editorder', $order->id) }}"
                               class="btn btn-sm btn-warning me-1 shadow-sm text-dark">
                                <i class="bi bi-pencil-square"></i> Edit
                            </a>

                            <!-- Delete Button -->
                            <form action="{{ route('orders.deleteorder', $order->id) }}"
                                  method="POST"
                                  class="d-inline">
                                @csrf @method('DELETE')
                                <button type="submit"
                                        class="btn btn-sm btn-danger shadow-sm"
                                        onclick="return confirm('Are you sure you want to delete this order?')">
                                    <i class="bi bi-trash"></i> Delete
                                </button>
                            </form>
                        </td>
                    </tr>
                @empty
                    <tr>
                        <td colspan="4" class="text-center text-muted py-4">
                            🚫 No Orders Found
                        </td>
                    </tr>
                @endforelse
            </tbody>
        </table>

        <!-- Pagination -->
        <div class="mt-3 d-flex justify-content-center">
            {{ $orders->links('pagination::bootstrap-5') }}
        </div>
    </div>
</div>


@endsection
