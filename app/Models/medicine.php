<?php

namespace App\Models;

use App\Models\Supplier;
use Illuminate\Database\Eloquent\Model;

class medicine extends Model
{

    protected $table='medicines';
    public $timestamps = false;

protected $fillable = [
    'name',
    'type',
    'barcode',
    'price_purchase',
    'price_sell',
    'quantity',
    'expiry_date',
    'supplier_id',
    'description'

];

public function supplier()
{
   return $this->belongsTo(Supplier::class);
}

}
