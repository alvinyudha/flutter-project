<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Cuti extends Model
{
    use HasFactory;

    protected $fillable = ['nama', 'tanggal_mulai', 'tanggal_selesai', 'alasan', 'durasi', 'status'];

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
