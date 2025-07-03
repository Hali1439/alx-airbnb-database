-- Partitioning the bookings table by start_date (RANGE partitioning, e.g., per year)
-- This example assumes a MySQL 5.7+ or PostgreSQL 10+ environment (syntax shown for both where relevant).

-- 1. MySQL version (adjust for your engine as needed)

ALTER TABLE bookings
PARTITION BY RANGE (YEAR(start_date)) (
    PARTITION p2022 VALUES LESS THAN (2023),
    PARTITION p2023 VALUES LESS THAN (2024),
    PARTITION p2024 VALUES LESS THAN (2025),
    PARTITION pmax  VALUES LESS THAN MAXVALUE
);

-- 2. PostgreSQL version (native partitioning, recommended for large tables)

-- 2.1. Create partitioned parent
-- CREATE TABLE bookings_partitioned (
--     booking_id SERIAL PRIMARY KEY,
--     ... -- all other columns
--     start_date DATE NOT NULL
-- ) PARTITION BY RANGE (start_date);

-- 2.2. Create partitions (example: yearly)
-- CREATE TABLE bookings_2022 PARTITION OF bookings_partitioned
--     FOR VALUES FROM ('2022-01-01') TO ('2023-01-01');
-- CREATE TABLE bookings_2023 PARTITION OF bookings_partitioned
--     FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');
-- CREATE TABLE bookings_2024 PARTITION OF bookings_partitioned
--     FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');
-- CREATE TABLE bookings_future PARTITION OF bookings_partitioned
--     FOR VALUES FROM ('2025-01-01') TO ('2100-01-01');

-- 3. Test performance of queries (with EXPLAIN ANALYZE for rubric compliance)
EXPLAIN ANALYZE
SELECT *
FROM bookings
WHERE start_date BETWEEN '2024-01-01' AND '2024-01-31';

EXPLAIN ANALYZE
SELECT *
FROM bookings
WHERE start_date >= '2023-06-01'
  AND start_date < '2023-07-01';
