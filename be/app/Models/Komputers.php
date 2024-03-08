<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Komputers extends Model
{
    use HasFactory;

    protected $table = 'komputer';

    public $timestamps = false;

    protected $fillable = [
        'Nomor', 'Merek', 'IDJenis'
    ];

    public function jenis()
    {
        return $this->belongsTo(jenis::class, 'IDJenis', 'ID');
    }
}
