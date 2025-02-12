<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Traits\HasPersonHasProcedures;

class Procedure extends Model
{
    protected $table = 'procedure';
    use HasFactory;

   /*  public function persons()
    {
        return $this->belongsToMany(Person::class, 'person_has_procedure', 'procedure_id', 'dni');
    }
 */
}
