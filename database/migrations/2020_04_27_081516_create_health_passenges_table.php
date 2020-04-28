<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateHealthPassengesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('health_passenges', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('body_tempeture');
            $table->boolean('main_symptome')->default(false);
            $table->enum('other_symptomes', ['Toux', 'Rhume', 'Fievre', 'Convalescent']);
            $table->boolean('lockdown')->default(false);
            $table->bigInteger('passengers_id')->unsigned()->index()->nullable();
            $table->timestamps();
        });

        Schema::table('health_passenges', function($table) {
            $table->foreign('passengers_id')->references('id')->on('passengers');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('health_passenges');
    }
}
