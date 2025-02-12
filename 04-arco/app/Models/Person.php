<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Person extends Model
{

    use Hasfactory;

    protected $table = 'person';

    /* public function procedures()
    {
        return $this->belongsToMany(PersonHasProcedure::class, 'dni', 'procedure_id');
    } */
}
