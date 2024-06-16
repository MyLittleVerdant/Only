<?php

namespace App\Http\Services;

use App\Models\Car;

class CarService
{

    /**
     * Получить доступные для аренды машины
     * @param $comfortCategories
     * @param $rentFrom
     * @param $rentTo
     * @param $model
     * @return mixed
     */
    public function getAvailableCars($comfortCategories, $rentFrom, $rentTo, $model = null): mixed
    {
        $query = Car::leftJoin('rental_logs as rl', function ($join) use ($rentFrom, $rentTo) {
            $join->on('cars.id', '=', 'rl.car_id')
                ->where(function ($query) use ($rentFrom, $rentTo) {
                    $query->where('rl.rent_from', '<=', $rentTo)
                        ->where('rl.rent_to', '>=', $rentFrom);
                });
        })
            ->whereIn('comfort_category_id', $comfortCategories)
            ->whereNull('rl.car_id')
            ->select('cars.*');

        if ($model) {
            $query->where('model', 'like', "%{$model}%");
        }

        return $query->get();
    }
}
