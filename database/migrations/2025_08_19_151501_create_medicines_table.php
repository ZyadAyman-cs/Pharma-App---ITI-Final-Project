<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('medicines', function (Blueprint $table) {
            $table->id();
    $table->string('name');
    $table->string('generic_name')->nullable();
    $table->enum('type', ['tablet', 'syrup', 'injection', 'ointment', 'other']);
    $table->string('barcode')->unique()->nullable();
    $table->decimal('price_purchase', 10, 2);
    $table->decimal('price_sell', 10, 2);
    $table->integer('quantity')->default(0);
    $table->date('expiry_date');
    $table->foreignId('supplier_id')->constrained()->onDelete('cascade');
    $table->text('description')->nullable();
    $table->string('image')->nullable();
    $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('medicines');
    }
};
