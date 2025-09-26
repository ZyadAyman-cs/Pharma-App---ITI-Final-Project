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
        Schema::create('orderitem', function (Blueprint $table) {
             $table->id();
    $table->unsignedBigInteger('order_id');
    $table->unsignedBigInteger('medicine_id');
    $table->integer('quantity');
    $table->decimal('price', 10, 2); // السعر وقت الشراء
    $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('orderitem');
    }
};
