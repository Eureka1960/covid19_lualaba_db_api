<?php

use App\Border;
use Illuminate\Database\Seeder;

class BordersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Border::create([
            'name'          => 'Peage'
        ]);

        Border::create([
            'name'          => 'Aeroport'
        ]);

        // Border::create([
        //     'name'          => 'Port'
        // ]);
    }
}
