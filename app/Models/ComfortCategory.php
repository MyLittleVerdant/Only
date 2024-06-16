<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ComfortCategory extends Model
{
    use HasFactory;

    public function posts()
    {
        return $this->belongsToMany(Post::class, 'post_comfort');
    }

    public function cars()
    {
        return $this->hasMany(Car::class );
    }
}
