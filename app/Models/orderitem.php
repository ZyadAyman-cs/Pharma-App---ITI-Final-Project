<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class orderitem extends Model
{
 protected $fillable = ['order_id', 'medicine_id', 'quantity', 'price'];
   protected $table = 'orderitem';

    public function order()
    {
        return $this->belongsTo(Order::class);
    }

    public function medicine()
    {
        return $this->belongsTo(Medicine::class);
    }}
