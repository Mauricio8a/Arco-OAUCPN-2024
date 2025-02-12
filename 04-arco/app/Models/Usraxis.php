<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Traits\HasPersonHasProcedures;

class Usraxis extends Model
{
    use HasFactory, HasPersonHasProcedures;
    protected $table = 'usraxis';

    public function person()
    {
        return $this->hasOne(Person::class,'id', 'person_id');
    }

    public function office()
    {
        return $this->belongsTo(Office::class);
    }


}
