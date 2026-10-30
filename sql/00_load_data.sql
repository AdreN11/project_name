INSERT INTO users
FROM INFILE '/var/lib/clickhouse/user_files/data/users.csv'
FORMAT CSVWithNames;

INSERT INTO movies
FROM INFILE '/var/lib/clickhouse/user_files/data/movies.csv'
FORMAT CSVWithNames;

INSERT INTO watch_history
FROM INFILE '/var/lib/clickhouse/user_files/data/watch_history.csv'
FORMAT CSVWithNames;

INSERT INTO search_logs
FROM INFILE '/var/lib/clickhouse/user_files/data/search_logs.csv'
FORMAT CSVWithNames;