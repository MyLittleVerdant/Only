<?php

namespace App\Http\Requests;

use App\Models\Employee;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Support\Facades\Auth;

class CarRentRequest extends FormRequest
{
    protected Employee $employee;
    protected array $allowedComfortCategories;

    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        $user = Auth::user();
        $this->employee = $user?->employee;
        if (empty($this->employee)) {
            return false;
        }
        $this->allowedComfortCategories = $this->employee->post?->comfortCategories?->pluck('id')->toArray();

        return true;
    }

    public function getEmployee(): Employee
    {
        return $this->employee;
    }

    public function getAllowedComfortCategories(): array
    {
        return $this->allowedComfortCategories;
    }


    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'rent_from'        => 'required|date|after_or_equal:today',
            'rent_to'          => 'required|date|after:rent_from',
            'model'            => 'nullable|string',
            'comfort-category' => [
                'nullable',
                function ($attribute, $value, $fail) {
                    if (!in_array($value, $this->allowedComfortCategories)) {
                        $fail('Вам недоступен этот уровень комфорта');
                    }
                },
            ],
        ];
    }

    /**
     * Get the error messages for the defined validation rules.
     *
     * @return array
     */
    public function messages()
    {
        return [
            'rent_from.required'       => "Поле 'дата начала аренды' обязательно для заполнения.",
            'rent_from.date'           => "Поле 'дата начала аренды' должно быть в форме даты.",
            'rent_from.after_or_equal' => "Поле 'дата начала аренды' должно быть не меньше текущей даты.",
            'rent_to.required'         => "Поле 'дата окончания аренды' обязательно для заполнения.",
            'rent_to.date'             => "Поле 'дата окончания аренды' должно быть в форме даты.",
            'rent_to.after'            => "Поле 'дата начала аренды' должно быть не меньше даты начала аренды.",
        ];
    }
}
