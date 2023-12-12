<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        User::create([
            'name' => 'admin',
            'username' => 'admin',
            'role' => 'Admin',
            'email' => 'admin@gmail.com',
            'password' => bcrypt('123456'),
        ]);

        User::create([
            'name' => 'User',
            'username' => 'user',
            'role' => 'User',
            'email' => 'user@gmail.com',
            'password' => bcrypt('123456'),
        ]);
    }
}
