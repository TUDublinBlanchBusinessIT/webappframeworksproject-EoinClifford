<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});
Route::get('scorders/checkout', 'scorderController@checkout')->name('scorders.checkout');
Route::get('/home','memberController@index')->name('home');
//logout
Route::get('logout', 'Auth\LoginController@logout')->name('logout');
Auth::routes();

Route::get('/customers/new', 'CustomerController@new');
Route::post('/customers/create', 'CustomerController@create')->name('customers.create'); 
Route::get('/customers/edit/{id}', 'CustomerController@edit');
Route::post('/customers/update', 'CustomerController@update');
Route::resource('members', 'memberController');

Route::resource('pitches', 'pitchController');

Route::resource('bookings', 'bookingController');
//login
Route::get('/customers/new', 'CustomerController@new');
Route::post('/customers/create', 'CustomerController@create')->name('customers.create');
Route::get('/customers/edit/{id}', 'CustomerController@edit');
Route::post('/customers/update', 'CustomerController@update');
//shopping cart
Route::get('products/displaygrid', 'productController@displaygrid')->name('products.displaygrid');
Route::get('products/additem/{id}', 'productController@additem')->name('products.additem');
Route::get('products/emptycart', 'productController@emptycart')->name('products.emptycart');
Route::post('scorders/placeorder', 'scorderController@placeorder')->name('scorders.placeorder');
