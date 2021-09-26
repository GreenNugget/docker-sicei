<?php

namespace App\Http\Controllers;

use App\Models\Student;

class StudentsController extends Controller
{
    public function getStudents(){
        $enrolledStudents = null;
        $enrolledStudents = array(
            new Student("Emily Sánchez", "A123"),
            new Student("Itzel Bermúdez", "A456"),
            new Student("Carlos Pool", "A789"),
            new Student("Diego Ávila", "A101"),
            new Student("Manuel Rico", "A112")
        );
        return dd($enrolledStudents);
    }
}
