<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePassengersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('passengers', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('full_name');
            $table->enum('gender', ['F', 'M'])->default('F');
            $table->string('address_from');
            $table->string('address_to');
            $table->string('cell_phone', 20);
            $table->bigInteger('borders_id')->unsigned()->index()->nullable();
            $table->boolean('covid')->default(false);
            $table->timestamps();
        });

        Schema::table('passengers', function($table) {
            $table->foreign('borders_id')->references('id')->on('borders');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('passengers');
    }
}
