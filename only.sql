-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: MySQL-5.7
-- Время создания: Июн 16 2024 г., 20:31
-- Версия сервера: 5.7.44
-- Версия PHP: 8.1.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `only`
--

-- --------------------------------------------------------

--
-- Структура таблицы `cars`
--

CREATE TABLE `cars` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `comfort_category_id` bigint(20) UNSIGNED NOT NULL,
  `model` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `cars`
--

INSERT INTO `cars` (`id`, `created_at`, `updated_at`, `comfort_category_id`, `model`) VALUES
(1, NULL, NULL, 3, 'BMW 5 Series'),
(2, NULL, NULL, 2, 'Tesla Model S'),
(3, NULL, NULL, 1, 'Toyota Corolla'),
(4, NULL, NULL, 3, 'BMW 6 Series'),
(5, NULL, NULL, 2, 'Tesla Cybertruck'),
(6, NULL, NULL, 1, 'Skoda Octavia');

-- --------------------------------------------------------

--
-- Структура таблицы `comfort_categories`
--

CREATE TABLE `comfort_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `comfort_categories`
--

INSERT INTO `comfort_categories` (`id`, `name`) VALUES
(1, 'econom'),
(2, 'comfort'),
(3, 'business');

-- --------------------------------------------------------

--
-- Структура таблицы `employees`
--

CREATE TABLE `employees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `employees`
--

INSERT INTO `employees` (`id`, `created_at`, `updated_at`, `post_id`, `user_id`) VALUES
(1, NULL, NULL, 2, 2),
(2, NULL, NULL, 2, 7),
(3, NULL, NULL, 3, 6),
(4, NULL, NULL, 1, 5),
(5, NULL, NULL, 5, 3),
(6, NULL, NULL, 4, 4);

-- --------------------------------------------------------

--
-- Структура таблицы `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_06_16_114927_create_post_table', 2),
(6, '2024_06_16_115218_create_comfort_category_table', 2),
(7, '2024_06_16_115301_create_employee_table', 2),
(8, '2024_06_16_115549_create_post_comfort_table', 2),
(9, '2024_06_16_115752_create_car_table', 2),
(10, '2024_06_16_115839_create_rental_log_table', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `posts`
--

INSERT INTO `posts` (`id`, `name`) VALUES
(1, 'Manager'),
(2, 'Developer'),
(3, 'HR'),
(4, 'Driver'),
(5, 'Sales');

-- --------------------------------------------------------

--
-- Структура таблицы `post_comfort`
--

CREATE TABLE `post_comfort` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `comfort_category_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `post_comfort`
--

INSERT INTO `post_comfort` (`id`, `comfort_category_id`, `post_id`) VALUES
(1, 3, 2),
(2, 1, 4),
(3, 2, 3),
(4, 3, 5),
(5, 1, 1),
(6, 2, 2),
(7, 1, 2),
(8, 1, 5),
(9, 2, 5);

-- --------------------------------------------------------

--
-- Структура таблицы `rental_logs`
--

CREATE TABLE `rental_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `car_id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `rent_from` datetime NOT NULL,
  `rent_to` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `rental_logs`
--

INSERT INTO `rental_logs` (`id`, `created_at`, `updated_at`, `car_id`, `employee_id`, `rent_from`, `rent_to`) VALUES
(1, NULL, NULL, 2, 2, '2024-06-16 15:00:00', '2024-06-25 19:22:14'),
(2, NULL, NULL, 6, 6, '2024-06-10 11:00:00', '2024-06-17 19:22:14');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(2, 'admin', 'admin@example.com', '2024-06-15 17:48:32', '$2y$12$YfdJsyB4J297x0NBUMDhTeJVE37/bGei33DSF/gIbmi2la8xBWkwK', 'ZtG2clepv71bFt6CZn8XwOHkeVV02y73VzrxyHVNKTxWhIWQaWMHLJYSMeyn', '2024-06-15 17:48:32', '2024-06-15 17:48:32'),
(3, 'Miss Bethany Rutherford', 'stamm.kailyn@example.org', '2024-06-16 13:17:44', '$2y$12$s7G3M9ZWF25Lt.iRcQxcqOLOHAD3m7gHZXQN9o5dKpZ2A27s39oXe', 'G6uAOrpxw9', '2024-06-16 13:17:44', '2024-06-16 13:17:44'),
(4, 'Miss Florine Mitchell', 'koelpin.ruthie@example.com', '2024-06-16 13:17:55', '$2y$12$QtP8Xa1r1fXibYghfgxxt.0YL9ofkBJ.03QaLbm8r9noVBejcdh4e', 'bk8DHXtYVx', '2024-06-16 13:17:56', '2024-06-16 13:17:56'),
(5, 'Kattie Klocko', 'stracke.franz@example.org', '2024-06-16 13:17:56', '$2y$12$QtP8Xa1r1fXibYghfgxxt.0YL9ofkBJ.03QaLbm8r9noVBejcdh4e', 'c28JkykjsL', '2024-06-16 13:17:56', '2024-06-16 13:17:56'),
(6, 'Dr. Flavie Rutherford IV', 'vschaefer@example.org', '2024-06-16 13:17:56', '$2y$12$QtP8Xa1r1fXibYghfgxxt.0YL9ofkBJ.03QaLbm8r9noVBejcdh4e', 'nkld8DyhJ8', '2024-06-16 13:17:56', '2024-06-16 13:17:56'),
(7, 'Christa Huels', 'frida72@example.com', '2024-06-16 13:17:56', '$2y$12$QtP8Xa1r1fXibYghfgxxt.0YL9ofkBJ.03QaLbm8r9noVBejcdh4e', 'rPHNW1ReY9', '2024-06-16 13:17:56', '2024-06-16 13:17:56');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cars_comfort_category_id_foreign` (`comfort_category_id`);

--
-- Индексы таблицы `comfort_categories`
--
ALTER TABLE `comfort_categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employees_post_id_foreign` (`post_id`),
  ADD KEY `employees_user_id_foreign` (`user_id`);

--
-- Индексы таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Индексы таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Индексы таблицы `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `post_comfort`
--
ALTER TABLE `post_comfort`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_comfort_comfort_category_id_foreign` (`comfort_category_id`),
  ADD KEY `post_comfort_post_id_foreign` (`post_id`);

--
-- Индексы таблицы `rental_logs`
--
ALTER TABLE `rental_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rental_logs_car_id_foreign` (`car_id`),
  ADD KEY `rental_logs_employee_id_foreign` (`employee_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `cars`
--
ALTER TABLE `cars`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `comfort_categories`
--
ALTER TABLE `comfort_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `employees`
--
ALTER TABLE `employees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `post_comfort`
--
ALTER TABLE `post_comfort`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `rental_logs`
--
ALTER TABLE `rental_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `cars`
--
ALTER TABLE `cars`
  ADD CONSTRAINT `cars_comfort_category_id_foreign` FOREIGN KEY (`comfort_category_id`) REFERENCES `comfort_categories` (`id`);

--
-- Ограничения внешнего ключа таблицы `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`),
  ADD CONSTRAINT `employees_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ограничения внешнего ключа таблицы `post_comfort`
--
ALTER TABLE `post_comfort`
  ADD CONSTRAINT `post_comfort_comfort_category_id_foreign` FOREIGN KEY (`comfort_category_id`) REFERENCES `comfort_categories` (`id`),
  ADD CONSTRAINT `post_comfort_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`);

--
-- Ограничения внешнего ключа таблицы `rental_logs`
--
ALTER TABLE `rental_logs`
  ADD CONSTRAINT `rental_logs_car_id_foreign` FOREIGN KEY (`car_id`) REFERENCES `cars` (`id`),
  ADD CONSTRAINT `rental_logs_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
