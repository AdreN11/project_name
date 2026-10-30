-- 1. Пропуски
SELECT
    count() AS total_rows,

    countIf(search_date IS NULL) AS search_date_nulls,
    countIf(user_id IS NULL OR user_id = '') AS user_id_nulls,

    countIf(device_type IS NULL OR device_type = '') AS device_type_nulls,
    countIf(location_country IS NULL OR location_country = '') AS location_nulls
FROM search_logs;

-- 2. Дубликаты по search_id
SELECT
    count() AS total_rows,
    countDistinct(search_id) AS unique_search_ids,
    count() - countDistinct(search_id) AS extra_rows
FROM search_logs;

-- 3. Типы
DESCRIBE search_logs;