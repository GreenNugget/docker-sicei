<?php

namespace App\Models;

class Student
{
    public $name;
    public $plate;

    function __construct(String $name, String $plate) {
        $this->name = $name;
        $this->plate = $plate;
    }

}

?>