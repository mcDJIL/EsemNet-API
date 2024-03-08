<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Pakets extends Model
{
    use HasFactory;

    protected $table = 'paket';

    public $timestamps = false;

    protected $fillable = [
        'Nama', 'IDJenis', 'HargaPerJam'
    ];

    public function jenis()
    {
        return $this->belongsTo(jenis::class, 'IDJenis', 'ID');
    }
}
