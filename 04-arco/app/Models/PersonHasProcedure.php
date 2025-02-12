<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PersonHasProcedure extends Model
{
    use HasFactory;

    protected $table = 'person_has_procedure';

    public function person()
    {
        return $this->hasOne(Person::class, 'dni', 'identification');
    }

    public function procedure()
    {
        return $this->belongsTo(Procedure::class);
    }

    public function usraxis()
    {
        return $this->belongsTo(Usraxis::class);
    }

    public function license()
    {
        return $this->belongsTo(License::class, 'licence_id', 'id');
    }

    public function year()
    {
        return $this->belongsTo(Year::class);
    }

    public function status()
    {
        return $this->belongsTo(Status::class);
    }

    public function location()
    {
        return $this->belongsTo(Location::class);
    }

    public function scan()
    {
        return $this->belongsTo(Scan::class);
    }

}
