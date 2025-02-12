<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;

class RoleSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        //Creación de Roles
        $role1 = Role::create(['name' => 'Admin']);
        $role2 = Role::create(['name' => 'Jefe']);
        $role3 = Role::create(['name' => 'Tecnico']);
        $role4 = Role::create(['name' => 'Digitador']);

        Permission::create(['name' => 'expedientes'])->syncRoles([$role1, $role2, $role3]);;

        Permission::create(['name' => 'expedientes.index'])->syncRoles([$role1, $role2, $role3, $role4]);
        Permission::create(['name' => 'expedientes.create'])->syncRoles([$role1, $role2, $role3]);
        Permission::create(['name' => 'expedientes.update'])->syncRoles([$role1, $role2, $role3, $role4]);


    }
}
