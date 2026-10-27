# 1. Остановить старое
docker compose down

# 2. Создать базу Redash (только при первом запуске)
docker compose run --rm redash create_db

# 3. Поднять всё
docker compose up -d