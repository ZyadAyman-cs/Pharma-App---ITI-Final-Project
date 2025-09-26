<?php

namespace App\Models;

use App\Models\User;
use App\Models\orderitem;
use Illuminate\Database\Eloquent\Model;

class order extends Model
{
protected $fillable = ['pharmacist_id', 'total_price','created_by','updated_by'];
protected $table='order';

    public function items()
    {
        return $this->hasMany(orderitem::class);
    }

    public function pharmacist()
    {
        return $this->belongsTo(User::class, 'pharmacist_id');
    }

    public function creator()
{
    return $this->belongsTo(User::class, 'created_by');
}

public function updater()
{
    return $this->belongsTo(User::class, 'updated_by');
}

}
