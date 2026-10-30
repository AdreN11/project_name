# Продуктовые вопросы:

Срезы
* Retention: когорта по дате первой активности, тип подписки, устройство, страна, возрастные группы
* Engagement: устройство, тип контента, основной жанр, тип подписки

Здоровье продукта (Overview) \
Вопросы:

* Как меняется количество активных пользователей во времени?
* Как меняется вовлечённость (среднее время просмотра, сессии)?

Метрики:

* DAU / WAU / MAU
* Stickiness (DAU/MAU)
* Average Watch Time per user / per session
* Количество сессий

Удержание (Retention) \
Вопросы:

* Насколько хорошо пользователи возвращаются?
* Как отличается retention у разных когорт?

Метрики:

* Day 1 / Day 7 / Day 30 Retention
* Retention-кривые по когортам (по дате первой активности + 1–2 важных среза)

Вовлечённость и потребление контента \
Вопросы:

* Сколько в среднем смотрят?
* Какой процент досматриваемости?
* Есть ли сильные различия по устройствам, типу контента и жанрам?

Метрики:

* Average Watch Duration
* Completion Rate (например, progress ≥ 80–90%)
* Распределение по устройствам / content_type / genre_primary

Монетизация \
Вопросы:

* Как распределены пользователи по тарифам?
* Связана ли глубина потребления с типом подписки?

Метрики:

* Распределение пользователей по subscription_plan
* Average Watch Time / Completion Rate в разрезе тарифов
* Доля активных пользователей по тарифам

# Дашборды:
* Overview / Product Health — главные метрики активности, тренды, ключевые сигналы
* Engagement & Retention — retention-кривые, когорты, watch time, completion rate
* Monetization (можно объединить с Overview, если данных по подпискам будет 



```
1. Создать базу Redash (только при первом запуске)
docker compose run --rm redash create_db
2. Поднять всё
docker compose up -d

# Создаём папку внутри контейнера
docker compose exec clickhouse mkdir -p /var/lib/clickhouse/user_files/data

# Копируем все csv внутрь контейнера
docker cp tables/. clickhouse:/var/lib/clickhouse/user_files/data/

docker compose exec clickhouse clickhouse-client
```

