<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateInfectedPeopleTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('infected_people', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->bigInteger('passengers_id')->unsigned()->index()->nullable();
            $table->bigInteger('hospitals_id')->unsigned()->index()->nullable();
            $table->string('name_person_to_contact');
            $table->enum('gender_person_to_contact', ['F', 'M'])->default('F');
            $table->string('address_person_to_contact');
            $table->string('phone_person_to_contact');
            $table->timestamps();
        });

        Schema::table('infected_people', function($table) {
            $table->foreign('passengers_id')->references('id')->on('passengers');
            $table->foreign('hospitals_id')->references('id')->on('hospitals');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('infected_people');
    }
}
