<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Traits\HasPersonHasProcedures;

class Location extends Model
{
    use HasFactory, HasPersonHasProcedures;

    protected $table = 'location';

}
