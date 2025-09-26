<?php

namespace App\Models;

use App\Models\medicine;
use Illuminate\Database\Eloquent\Model;

class Supplier extends Model
{

    protected $table='suppliers';
protected $fillable = [
    'name',
    'email',
    'company_name',
    'phone',
    'address',

];


public function medicines()
{
   return $this->hasMany(medicine::class);
}



}
