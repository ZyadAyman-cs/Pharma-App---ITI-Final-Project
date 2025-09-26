<?php

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\Admin\UserController;
use App\Http\Controllers\Admin\SupplierController;
use App\Http\Controllers\pharmacist\OrderController;
use App\Http\Controllers\pharmacist\ProductController;

Route::get('/mainadmin', function () {
    return view('admin.layout.app');
})->middleware('checkrole:admin')->name('go');


Route::get('/mainpharmacist', function () {
    return view('pharmacist.layout.app');
})->middleware('checkrole:Pharmacist')->name('gopharma');

Route::get('/', function () {
    return view('auth.login');
})->name('login');


Route::get('/dashboard', function () {
    return view('dashboard');
})->middleware(['auth', 'verified'])->name('dashboard');

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

require __DIR__.'/auth.php';


Route::middleware(['checkrole:admin'])->group(function () {


Route::prefix("admin")->name("admin.")->group(function(){

Route::get('listuser',[UserController::class,'index'])->name('listuser');
Route::get('createuser',[UserController::class,'create'])->name('createuser');
Route::post('createuser',[UserController::class,'store'])->name('storeuser');
Route::get('users/{id}/edit', [UserController::class, 'edit'])->name('users.edit');
Route::put('users/{id}', [UserController::class, 'update'])->name('users.update');
Route::delete('users/{id}', [UserController::class, 'destroy'])->name('users.destroy');
});
});

Route::prefix("supplier")->name("supplier.")->group(function(){
    Route::get('listsupplier',[SupplierController::class,'index'])->name('listsupplier');
    Route::get('createsupplier',[SupplierController::class,'create'])->name('createsupplier');
    Route::post('storesupplier',[SupplierController::class,'store'])->name('storesupplier');
    Route::get('editsupplier/{id}',[SupplierController::class,'edit'])->name('editsupplier');
    Route::put('updatesupplier/{id}',[SupplierController::class,'update'])->name('updatesupplier');
    Route::delete('deletesupplier/{id}',[SupplierController::class,'destroy'])->name('deletesupplier');

});


Route::prefix("products")->name("product.")->group(function(){
    Route::get('allproducts',[ProductController::class,'index'])->name('allproducts');
    Route::get('createproduct',[ProductController::class,'create'])->name('createproduct');
    Route::post('storeproduct',[ProductController::class,'store'])->name('storeproduct');
    Route::get('editproduct/{id}',[ProductController::class,'edit'])->name('editproduct');
    Route::put('updateproduct/{id}',[ProductController::class,'update'])->name('updateproduct');
    Route::delete('deleteproduct/{id}',[ProductController::class,'destroy'])->name('deleteproduct');
    Route::get('search',[ProductController::class,'search'])->name('searchproduct');


});

Route::prefix("orders")->name("orders.")->group(function(){
    Route::get('allorders',[OrderController::class,'index'])->name('allorders');
    Route::get('showorder/{id}',[OrderController::class,'show'])->name('showorder');
    Route::get('createorder',[OrderController::class,'create'])->name('createorder');
    Route::post('storeorder',[OrderController::class,'store'])->name('storeorder');
    Route::get('editorder/{id}',[OrderController::class,'edit'])->name('editorder');
    Route::put('updateorder/{id}',[OrderController::class,'update'])->name('updateorder');
    Route::delete('deleteorder/{id}',[OrderController::class,'destroy'])->name('deleteorder');
    Route::get('/medicines/search', [OrderController::class, 'search'])->name('medicines.search');
    Route::post('/start-new-day', [OrderController::class, 'startNewDay'])->name('startNewDay');
    Route::get('/archivedOrders', [OrderController::class, 'archivedOrders'])->name('archivedOrders');   // كل الأوردرات المؤرشفة
    Route::get('/showArchivedOrder/{id}', [OrderController::class, 'showArchivedOrder'])->name('showArchivedOrder');



});



Route::post('/logout', function () {
    Auth::logout();
    return redirect()->route('login');
})->name('logout');

