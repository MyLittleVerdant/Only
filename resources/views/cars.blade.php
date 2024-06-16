<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Список доступных машин</title>
</head>
<body>
<h2>Аренда машины</h2>

<form action="{{ route('available-cars') }}" method="POST">
    @csrf <!-- Добавление CSRF токена для защиты формы -->

    <label for="rent_from">Rent From:</label><br>
    <input type="datetime-local" id="rent_from" name="rent_from">
    @if ($errors->has('rent_from'))
        <p class="text-danger">{{ $errors->first('rent_from') }}</p>
    @else
        <br><br>
    @endif

    <label for="rent_to">Rent To:</label><br>
    <input type="datetime-local" id="rent_to" name="rent_to">
    @if ($errors->has('rent_to'))
        <p class="text-danger">{{ $errors->first('rent_to') }}</p>
    @else
        <br><br>
    @endif

    <label for="model">Car Model (optional):</label><br>
    <input type="text" id="model" name="model">
    @if ($errors->has('model'))
        <p class="text-danger">{{ $errors->first('model') }}</p>
    @else
        <br><br>
    @endif

    <label for="comfort-category">Comfort Category:</label><br>
    <select id="comfort-category" name="comfort-category">
        @foreach($comfortCategories as $category)
            <option value="{{ $category->id }}">{{ $category->name }}</option>
        @endforeach
    </select>
    @if ($errors->has('comfort-category'))
        <p class="text-danger">{{ $errors->first('comfort-category') }}</p>
    @else
        <br><br>
    @endif

    <button type="submit">Submit</button>
</form>
@if (isset($availableCars) && count($availableCars) > 0)
    <h2>Доступные машины</h2>
    <table border="1">
        <thead>
        <tr>
            <th>Comfort Category</th>
            <th>Model</th>
        </tr>
        </thead>
        <tbody>
        @foreach ($availableCars as $car)
            <tr>
                <td>{{ $car->comfortCategory->name }}</td>
                <td>{{ $car->model }}</td>
            </tr>
        @endforeach
        </tbody>
    </table>
@else
    <p>No cars available for the selected period.</p>
@endif
</body>
</html>
