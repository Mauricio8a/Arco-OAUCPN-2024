<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

use App\Models\User;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        //

        User::create([
            'name' => 'Mauricio Ochoa Calderón',
            'email' => 'mauricio8a2005@yahoo.com',
            'password' => bcrypt('12345678')
        ])->assignRole('Admin');

    }
}
