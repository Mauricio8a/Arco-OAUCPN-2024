<?php

namespace App\Traits;

use Illuminate\Database\Eloquent\Relations\HasMany;

trait HasPersonHasProcedures
{
    public function personHasProcedures(): HasMany
    {
        return $this->hasMany(PersonHasProcedure::class);
    }
}
