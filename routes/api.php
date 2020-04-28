<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

// Route::middleware('auth:api')->get('/user', function (Request $request) {
//     return $request->user();
// });

Route::post('login', 'API\UserController@login');
Route::post('register', 'API\UserController@register');

Route::group(['middleware' => 'auth:api'], function() {
    Route::post('details', 'API\UserController@details');
});

//Passenger
Route::get('/passenger/all', 'API\PassengerController@index');
Route::get('/passenger/{passenger}', 'API\PassengerController@show');
Route::post('/passenger/register', 'API\PassengerController@store');
Route::post('/passenger/alert/{passenger}', 'API\PassengerController@alerInfectedPerson');

//Border
Route::get('/border/all', 'API\BorderController@index');

//Hospital
Route::get('/hospital/all', 'API\HospitalController@index');


//infected people
Route::get('/infetcted_people/{id}', 'API\InfectedPersonController@findByHospitalId');
