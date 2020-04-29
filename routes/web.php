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

Route::get('/home','memberController@index')->name('home');
Route::get('logout', 'Auth\LoginController@logout')->name('logout');
Auth::routes();

Route::get('/customers/new', 'CustomerController@new');
Route::post('/customers/create', 'CustomerController@create')->name('customers.create'); 
Route::get('/customers/edit/{id}', 'CustomerController@edit');
Route::post('/customers/update', 'CustomerController@update');
Route::resource('members', 'memberController');

Route::resource('pitches', 'pitchController');

Route::resource('bookings', 'bookingController');

Route::get('/customers/new', 'CustomerController@new');
Route::post('/customers/create', 'CustomerController@create')->name('customers.create');
Route::get('/customers/edit/{id}', 'CustomerController@edit');
Route::post('/customers/update', 'CustomerController@update');

Route::get('products/displaygrid', 'productController@displaygrid')->name('products.displaygrid');