@extends('pharmacist.layout.app')

@section('content')
<div class="container">
    <h2>Edit Order #{{ $order->id }}</h2>

    <form action="{{ route('orders.updateorder', $order->id) }}" method="POST">
        @csrf @method('PUT')


        {{-- تعديل الأصناف --}}
        <h4>Order Items</h4>
        <div id="order-items">
            @foreach($order->items as $index => $item)
                <div class="row mb-2">
                    <div class="col-md-5">
                        <select name="items[{{ $index }}][medicine_id]" class="form-control">
                            @foreach($medicines as $medicine)
                                <option value="{{ $medicine->id }}"
                                    {{ $item->medicine_id == $medicine->id ? 'selected' : '' }}>
                                    {{ $medicine->name }}
                                </option>
                            @endforeach
                        </select>
                    </div>
                    <div class="col-md-3">
                        <input type="number" name="items[{{ $index }}][quantity]"
                               class="form-control" value="{{ $item->quantity }}">
                    </div>
                    <div class="col-md-2">
                        <button type="button" class="btn btn-danger remove-item">X</button>
                    </div>
                </div>
            @endforeach
        </div>

        <button type="button" id="add-item" class="btn btn-secondary mb-3">+ Add Item</button>

        <button type="submit" class="btn btn-success">Update Order</button>
    </form>
                <a href="{{ route('orders.allorders')}}" class="bg-gray-400 text-white px-4 py-2 rounded hover:bg-gray-500">⬅ Back</a>

</div>

<script>
    let itemIndex = {{ count($order->items) }};

    document.getElementById('add-item').addEventListener('click', function () {
        let div = document.createElement('div');
        div.classList.add('row', 'mb-2');
        div.innerHTML = `
            <div class="col-md-5">
                <select name="items[${itemIndex}][medicine_id]" class="form-control">
                    @foreach($medicines as $medicine)
                        <option value="{{ $medicine->id }}">{{ $medicine->name }}</option>
                    @endforeach
                </select>
            </div>
            <div class="col-md-3">
                <input type="number" name="items[${itemIndex}][quantity]" class="form-control" value="1">
            </div>
            <div class="col-md-2">
                <button type="button" class="btn btn-danger remove-item">X</button>
            </div>
        `;
        document.getElementById('order-items').appendChild(div);
        itemIndex++;
    });

    document.addEventListener('click', function(e){
        if(e.target.classList.contains('remove-item')){
            e.target.closest('.row').remove();
        }
    });
</script>
@endsection
