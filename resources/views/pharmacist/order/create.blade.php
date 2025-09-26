@extends('pharmacist.layout.app')

@section('content')
<div class="container mx-auto p-6 bg-white shadow-lg rounded-lg">
    <h2 class="text-2xl font-bold mb-6 text-center text-blue-600">📝 Create New Order</h2>

    @if(session('error'))
        <p class="bg-green-100 text-green-700 p-2 rounded mb-4">{{ session('error') }}</p>
    @endif

    <form action="{{ route('orders.storeorder') }}" method="POST" class="space-y-4">
        @csrf

        <div id="medicines-wrapper">
            <div class="medicine-item flex items-center space-x-3 bg-gray-50 p-3 rounded shadow">
                <input type="text" class="medicine-search w-1/2 border rounded p-2" placeholder="Type medicine name or barcode">
                <input type="hidden" name="medicines[0][id]" class="medicine-id">
                <input type="number" name="medicines[0][quantity]" placeholder="Quantity" class="form-control w-1/4 border rounded p-2">
                <button type="button" class="remove-medicine bg-red-500 text-white px-3 py-1 rounded hover:bg-red-600">Remove</button>
            </div>
        </div>

        <div class="flex space-x-3">
            <button type="button" id="add-medicine" class="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600">+ Add Medicine</button>
            <button type="submit" class="bg-green-500 text-white px-4 py-2 rounded hover:bg-green-600">✅ Create Order</button>
            <a href="{{ route('orders.allorders')}}" class="bg-gray-400 text-white px-4 py-2 rounded hover:bg-gray-500">⬅ Back</a>
        </div>
    </form>
</div>

{{-- Scripts --}}
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

<script>
    let index = 1;

    function initMedicineSearch(element, i) {
        $(element).autocomplete({
            source: function(request, response) {
                $.ajax({
                    url: '{{ route("orders.medicines.search") }}',
                    dataType: "json",
                    data: { q: request.term },
                    success: function(data) {
                        response($.map(data, function(item) {
                            return {
                                label: item.name + " (Stock: " + item.quantity + ")",
                                value: item.name,
                                id: item.id
                            };
                        }));
                    }
                });
            },
            minLength: 1,
            select: function(event, ui) {
                $(this).siblings('.medicine-id').val(ui.item.id);
                $(this).val(ui.item.value);
                return false;
            }
        });
    }

    // init أول عنصر
    initMedicineSearch($('.medicine-search').first(), 0);

    // إضافة عنصر جديد
    $('#add-medicine').on('click', function() {
        let wrapper = $('#medicines-wrapper');
        let newItem = $(`
            <div class="medicine-item flex items-center space-x-3 bg-gray-50 p-3 rounded shadow">
                <input type="text" class="medicine-search w-1/2 border rounded p-2" placeholder="Type medicine name or barcode">
                <input type="hidden" name="medicines[${index}][id]" class="medicine-id">
                <input type="number" name="medicines[${index}][quantity]" placeholder="Quantity" class="form-control w-1/4 border rounded p-2">
                <button type="button" class="remove-medicine bg-red-500 text-white px-3 py-1 rounded">Remove</button>
            </div>
        `);

        wrapper.append(newItem);

        initMedicineSearch(newItem.find('.medicine-search'), index);

        index++;
    });

    // remove button
    $(document).on('click', '.remove-medicine', function() {
        $(this).closest('.medicine-item').remove();
    });
</script>
@endsection
