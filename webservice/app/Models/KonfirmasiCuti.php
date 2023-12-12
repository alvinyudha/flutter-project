<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class KonfirmasiCuti extends Model
{
    use HasFactory;
    protected $fillable = [
        'cuti_id',
        'disetujui',
    ];

    public function cuti()
    {
        return $this->belongsTo(Cuti::class);
    }
}
