<?php

namespace App\Http\Controllers\API;

use App\Hospital;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class HospitalController extends Controller
{
    public function index()
    {
        return Hospital::orderBy('name')->get();
    }
}
