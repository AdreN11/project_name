-- Смотрим пропуски
SELECT
    count() AS total_rows,
    countIf(user_id IS NULL OR user_id = '') AS user_id_nulls,

    countIf(age IS NULL) AS age_nulls,
    countIf(country IS NULL OR country = '') AS country_nulls,

    countIf(subscription_plan IS NULL OR subscription_plan = '') AS plan_nulls,
    countIf(primary_device IS NULL) AS device,

    countIf(subscription_start_date IS NULL) AS sub_start_nulls,
    countIf(monthly_spend IS NULL) AS spend_nulls
FROM users;

-- Смотрим дубликаты
SELECT
    count() AS total_rows,
    countDistinct(user_id) AS unique_users,
    count() - countDistinct(user_id) AS extra_rows
FROM users;

-- Смотрим аномальные значения
SELECT count(age) AS anomaly FROM users
WHERE age <= 10 OR age >= 90;

-- Смотрим и изменяем типы данных
DESCRIBE TABLE users;

ALTER TABLE users
MODIFY COLUMN age NULLABLE(Int32);

-- Проверка поля monthly_spend
SELECT
    subscription_plan,
    count() AS users,
    round(avg(monthly_spend), 2) AS avg_spend,
    min(monthly_spend) AS min_spend,
    max(monthly_spend) AS max_spend
FROM users
GROUP BY subscription_plan
ORDER BY subscription_plan;