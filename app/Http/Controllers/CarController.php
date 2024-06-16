<?php

namespace App\Http\Controllers;

use App\Http\Requests\CarRentRequest;
use App\Http\Services\CarService;
use App\Models\ComfortCategory;
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
        $comfortCategories = ComfortCategory::all();
        return view('cars', ['comfortCategories' => $comfortCategories, 'availableCars' => $availableCars]);
    }

    /**
     * Показать доступные для аренды машины
     * @param CarRentRequest $request
     * @return RedirectResponse
     */
    public function showAvailableCars(CarRentRequest $request): \Illuminate\Http\RedirectResponse
    {
        $selectedComfortCategories = [$request->input('comfort-category')] ?? $request->getAllowedComfortCategories();

        $rentFrom = $request->input('rent_from');
        $rentTo = $request->input('rent_to');
        $model = $request->input('model');

        $availableCars = $this->carService->getAvailableCars($selectedComfortCategories, $rentFrom, $rentTo, $model);
        return redirect()->route('index')->with('availableCars', $availableCars);
        //        return view('cars', ['availableCars' => $availableCars]);

    }

}
