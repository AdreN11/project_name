-- 1. Пропуски
SELECT
    count() AS total_rows,

    countIf(title IS NULL OR title = '') AS title_nulls,
    countIf(content_type IS NULL OR content_type = '') AS content_type_nulls,
    countIf(genre_primary IS NULL OR genre_primary = '') AS genre_primary_nulls
FROM movies;

-- 2. Дубликаты по movie_id
SELECT
    count() AS total_rows,
    countDistinct(movie_id) AS unique_movies,
    count() - countDistinct(movie_id) AS extra_rows
FROM movies;

-- 4. Типы
DESCRIBE movies;

-- 5. Распределение по content_type и genre (для понимания)
SELECT content_type, count() AS cnt
FROM movies
GROUP BY content_type
ORDER BY cnt DESC;

SELECT genre_primary, count() AS cnt
FROM movies
GROUP BY genre_primary
ORDER BY cnt DESC;