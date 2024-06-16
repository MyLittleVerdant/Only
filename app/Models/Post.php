<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Post extends Model
{
    use HasFactory;

    public function comfortCategories()
    {
        return $this->belongsToMany(ComfortCategory::class, 'post_comfort');
    }


    public function employees()
    {
        return $this->hasMany(Employee::class);
    }
}
