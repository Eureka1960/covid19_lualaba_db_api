<?php

namespace App\Http\Controllers\API;
use App\Http\Controllers\Controller;
use App\InfectedPerson;
use App\Passenger;
use Illuminate\Http\Request;

class InfectedPersonController extends Controller
{
    public function findByHospitalId($hospitalsId)
    {
        $infectedPeople = InfectedPerson::where('hospitals_id', (int)$hospitalsId)->get();
        $passengers = Passenger::all();

        $passengers_infected = [];
        if (count($infectedPeople) > 0) {
            foreach ($infectedPeople as $k => $inP) {
                foreach ($passengers as $key => $value) {
                    if ($inP->passengers_id == $value->id){
                        $passengers_infected[$key] = $value;
                    }
                }
            }
        }

        return $passengers_infected;
    }
}
