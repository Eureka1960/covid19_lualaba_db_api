<?php

use App\Hospital;
use Illuminate\Database\Seeder;

class HospitalsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Hospital::create([
            'name'          => 'Hôpital MUANGEJI'
        ]);

        Hospital::create([
            'name'          => 'Zone de santé'
        ]);

        Hospital::create([
            'name'          => 'Hôpital GECAMINE'
        ]);

        Hospital::create([
            'name'          => 'Clinique'
        ]);
    }
}
