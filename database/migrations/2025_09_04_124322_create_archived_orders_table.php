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
        Schema::create('archived_orders', function (Blueprint $table) {
           $table->id();
    $table->unsignedBigInteger('order_id'); // ID بتاع الأوردر الأصلي
    $table->json('data'); // نخزن بيانات الأوردر كلها
    $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('archived_orders');
    }
};
