<?php

namespace App\Http\Controllers\API;

use App\Border;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class BorderController extends Controller
{
    public function index()
    {
        return Border::orderBy('name')->get();
    }
}
