<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class KodePotonganHarga extends Model
{
    use HasFactory;

    protected $table = 'kodepotonganharga';
    
    public $timestamps = false;

    protected $fillable = [
        'Nama', 'Kode', 'Presentase', 'Maksimal', 'BerlakuSampai'
    ];
}
