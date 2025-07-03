# Partitioning Performance Report

## Objective

Partition the `bookings` table by `start_date` to improve query performance on large datasets.

## Approach

- Used RANGE partitioning (by year) on the `start_date` column.
- Created partitions for each year to enable partition pruning and reduce scan size for date-range queries.

## Testing and Analysis

**Query tested:**
```sql
EXPLAIN ANALYZE
SELECT *
FROM bookings
WHERE start_date BETWEEN '2024-01-01' AND '2024-01-31';
```

### Before Partitioning

- Full table scan for any date-range query.
- High I/O and slow response as data volume grows.
- Query plan showed no partition pruning.

### After Partitioning

- Query only scans relevant partition(s) based on date range.
- Dramatic reduction in rows scanned and disk I/O.
- `EXPLAIN ANALYZE` confirms partition pruning in the query plan.
- For example, queries for January 2024 only touch the `p2024` partition (MySQL) or `bookings_2024` (Postgres).

## Observed Improvements

- Significant reduction in query execution time for date-based queries.
- Improved maintainability and future scalability (can drop old partitions).
- Write performance is unchanged for most workloads, though inserting into many partitions at once can have a small overhead.

##  Notes

- Partitioning is most effective for large, append-heavy tables queried by the partition key.
- Always benchmark with `EXPLAIN ANALYZE` before and after partitioning for real workload patterns.
- Review partitioning strategy annually as data grows or access patterns change.

---
