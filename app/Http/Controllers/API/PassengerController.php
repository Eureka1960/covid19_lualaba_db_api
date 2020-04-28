<?php

namespace App\Http\Controllers\API;

use App\HealthPassenge;
use App\Http\Controllers\Controller;
use App\InfectedPerson;
use App\Passenger;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;

class PassengerController extends Controller
{
    public function index()
    {
        return Passenger::orderBy('full_name')->get();
    }

    public function show(Passenger $passenger)
    {
        return $passenger;
    }

    public function allInfectedPeople()
    {
        return Passenger::where('covid', true)->orderBy('full_name')->get();
    }

    public function alerInfectedPerson(Passenger $passenger)
    {
        if ($passenger->update(['covid' => true])) return Passenger::all();
        else response()->json(['error' => 'Il y a problème, Veuillez contacter le developpeur'], 500);

    }

    public function store(Request $request)
    {
        $pValidator = Validator::make($request->all(), [
            'full_name'                 => 'required|min:4',
            'gender'                    => 'required',
            'address_from'              => 'required|min:6',
            'address_to'                => 'required|min:6',
            'cell_phone'                => 'required|min:10|max:10',
            'borders_id'                => 'required',
        ]);

        $hValidator = Validator::make($request->all(), [
            'body_tempeture'            => 'required|numeric',
            // 'main_symptome'             => 'required',
            'other_symptomes'           => 'required',
            // 'lockdown'                  => 'required'
        ]);

        $iValidator = null;

        if ($request->main_symptome == true) {
            $iValidator = Validator::make($request->all(), [
                'hospitals_id'                  => 'required',
                'name_person_to_contact'        => 'required|min:4',
                'gender_person_to_contact'      => 'required',
                'address_person_to_contact'     => 'required|min:6',
                'phone_person_to_contact'       => 'required|min:10|max:10'
            ]);
        }

        $passenger = null;
        $store1 = null;
        $store2 = null;

        if ($pValidator->fails()) return response()->json(['error' => $pValidator->errors()], 401);
        else {
            $passenger_input = $request->all();
            $full_name = $passenger_input['full_name'];
            $gender = $passenger_input['gender'];
            $address_from = $passenger_input['address_from'];
            $address_to = $passenger_input['address_to'];
            $cell_phone = $passenger_input['cell_phone'];
            $borders_id = $passenger_input['borders_id'];
            $passenger = Passenger::create([
                'full_name'                 => $full_name,
                'gender'                    => $gender,
                'address_from'              => $address_from,
                'address_to'                => $address_to,
                'cell_phone'                => $cell_phone,
                'borders_id'                => $borders_id,
                'covid'                     => $request->main_symptome == true ? 1 : 0
            ]);
        }

        if ($hValidator->fails()) return response()->json(['error' => $hValidator->errors()], 401);
        else {
            $health_input = $request->all();
            $body_tempeture = $health_input['body_tempeture'];
            // $main_symptome = $health_input['main_symptome'] != null ? $health_input['main_symptome'] == 'false' ? false : true : false;
            $other_symptomes = $health_input['other_symptomes'];
            // $lockdown = $health_input['lockdown'] != null ? $health_input['lockdown'] == 'false' ? false : true :  false;
            $store1 = HealthPassenge::create([
                'body_tempeture'            => $body_tempeture,
                'main_symptome'             => $request->main_symptome == null ? false : true,
                'other_symptomes'           => $other_symptomes,
                'lockdown'                  => $request->lockdown != null ? true : false,
                'passengers_id'             => $passenger->id
            ]);
        }

        $message = '';
        $type = 'success';

        if ($request->main_symptome == true) {
            if ($iValidator->fails()) return response()->json(['error' => $iValidator->errors()], 401);
            else {
                $infected_input = $request->all();
                $hospitals_id = $infected_input['hospitals_id'];
                $name_person_to_contact = $infected_input['name_person_to_contact'];
                $gender_person_to_contact = $infected_input['gender_person_to_contact'];
                $address_person_to_contact = $infected_input['address_person_to_contact'];
                $phone_person_to_contact = $infected_input['phone_person_to_contact'];
                $store2 = InfectedPerson::create([
                    'passengers_id'                 => $passenger->id,
                    'hospitals_id'                  => $hospitals_id,
                    'name_person_to_contact'        => $name_person_to_contact,
                    'gender_person_to_contact'      => $gender_person_to_contact,
                    'address_person_to_contact'     => $address_person_to_contact,
                    'phone_person_to_contact'       => $phone_person_to_contact
                ]);

                $message = "Danger: (" . $passenger->full_name ." ) est une personne infectée !!!";
                $type = 'danger';
            }
        } else $message = "Success: Le checking de " . $passenger->full_name . " est clean !";

        if ($passenger != null && $store1 != null) {
            $success['type'] = $type;
            $success['message'] = $message;
            return response()->json(['success' => $success], 200);
        }

        // return $passenger;

    }

    public function update(Request $request, Passenger $passenger)
    {

    }

    public function destroy(Passenger $passenger)
    {

    }
}
