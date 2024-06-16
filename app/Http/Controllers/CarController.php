<?php

namespace App\Http\Controllers;

use App\Http\Requests\CarRentRequest;
use App\Http\Services\CarService;
use Illuminate\Http\RedirectResponse;

class CarController extends Controller
{
    public function __construct(private CarService $carService)
    {
        $this->carService = new CarService;
    }

    public function index()
    {
        $availableCars = session('availableCars');
        return view('cars', ['availableCars' => $availableCars]);
    }

    /**
     * Показать доступные для аренды машины
     * @param CarRentRequest $request
     * @return RedirectResponse
     */
    public function showAvailableCars(CarRentRequest $request): \Illuminate\Http\RedirectResponse
    {
        $employee = $request->getEmployee();
        $comfortCategories = $employee->post->comfortCategories->pluck('id');
        $rentFrom = $request->input('rent_from');
        $rentTo = $request->input('rent_to');
        $model = $request->input('model');

        $availableCars = $this->carService->getAvailableCars($comfortCategories, $rentFrom, $rentTo, $model);
        return redirect()->route('index')->with('availableCars', $availableCars);
        //        return view('cars', ['availableCars' => $availableCars]);

    }

}
