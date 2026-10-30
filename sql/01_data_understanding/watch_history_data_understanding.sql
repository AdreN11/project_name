-- Смотрим пропуски
SELECT
    count() AS total_rows,
    countIf(user_id IS NULL OR user_id = '') AS user_id_nulls,

    countIf(watch_date IS NULL) AS watch_date_nulls,
    countIf(device_type IS NULL OR device_type = '') AS device_type_nulls,

    countIf(watch_duration_minutes IS NULL) AS watch_duration_minutes_nulls,
    countIf(progress_percentage IS NULL) AS progress_percentage_nulls,

    countIf(action IS NULL OR action = '') AS action_nulls,
    countIf(location_country IS NULL OR location_country = '') AS location_country_nulls
FROM watch_history;

-- Смотрим дубликаты
SELECT
    count() AS total_rows,
    countDistinct(session_id) AS unique_sessions,
    count() - countDistinct(session_id) AS extra_rows
FROM watch_history;

-- Смотрим аномальные значения
SELECT
    count(progress_percentage) AS anomaly
FROM watch_history
WHERE progress_percentage < 0 OR progress_percentage > 100;

-- Смотрим и изменяем типы данных
DESCRIBE watch_history;

-- Проверка полей на согласованность
-- 1. Связь action и progress
SELECT
    action,
    count() AS sessions,
    round(avg(progress_percentage), 1) AS avg_progress,
    countIf(progress_percentage >= 90) AS high_progress
FROM watch_history
GROUP BY action
ORDER BY sessions DESC;

-- 2. Есть ли completed с низким прогрессом (и наоборот)
SELECT
    action,
    countIf(progress_percentage < 50) AS low_progress,
    countIf(progress_percentage BETWEEN 50 AND 89) AS mid_progress,
    countIf(progress_percentage >= 90) AS high_progress
FROM watch_history
GROUP BY action;