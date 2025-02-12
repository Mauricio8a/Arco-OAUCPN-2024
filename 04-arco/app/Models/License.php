<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Traits\HasPersonHasProcedures;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class License extends Model
{

    use HasFactory, HasPersonHasProcedures;

    protected $table = 'license';

}
