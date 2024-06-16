<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Support\Facades\Auth;

class CarRentRequest extends FormRequest
{
    protected $employee;

    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        $user = Auth::user();
        $this->employee = $user?->employee;
        if (empty($this->employee)){
            return false;
        }
        return true;
    }

    public function getEmployee()
    {
        return $this->employee;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'rent_from' => 'required|date|after_or_equal:today',
            'rent_to' => 'required|date|after:rent_from',
            'model' => 'nullable|string',
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
            'rent_from.required' => "Поле 'дата начала аренды' обязательно для заполнения.",
            'rent_from.date' => "Поле 'дата начала аренды' должно быть в форме даты.",
            'rent_from.after_or_equal' => "Поле 'дата начала аренды' должно быть не меньше текущей даты.",
            'rent_to.required' => "Поле 'дата окончания аренды' обязательно для заполнения.",
            'rent_to.date' => "Поле 'дата окончания аренды' должно быть в форме даты.",
            'rent_to.after' =>  "Поле 'дата начала аренды' должно быть не меньше даты начала аренды.",
        ];
    }
}
