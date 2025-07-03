# Database Performance Monitoring and Refinement

## 1. Query Monitoring

We regularly profile critical queries using `EXPLAIN ANALYZE` (PostgreSQL/MySQL 8+) and `SHOW PROFILE` (MySQL).

**Example 1: User Booking Lookup**
```sql
EXPLAIN ANALYZE
SELECT * FROM bookings WHERE user_id = 123 AND booking_date BETWEEN '2024-01-01' AND '2024-01-31';
```
- **Observation:** Initial plan showed a full table scan.

**Example 2: Property Search by City**
```sql
EXPLAIN ANALYZE
SELECT * FROM properties WHERE city = 'Nairobi';
```
- **Observation:** Sequential scan, slow for large tables.

**Example 3: Multi-table Join**
```sql
EXPLAIN ANALYZE
SELECT u.username, b.booking_id, p.property_name
FROM bookings b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
WHERE p.city = 'Nairobi';
```
- **Observation:** Hash join with filter, but property scan is still slow.

---

## 2. Bottleneck Identification

- **Bookings by user/date:** Slow due to missing index on `(user_id, booking_date)`.
- **Properties by city:** No index on `city`.
- **Join performance:** Join on unindexed columns increases query time.

---

## 3. Schema Adjustments & Index Implementation

**A. Composite Index for Bookings**
```sql
-- Optimize date range lookups per user
CREATE INDEX idx_bookings_user_date ON bookings(user_id, booking_date);
```

**B. Index for City Search**
```sql
-- Accelerate city-based property searches
CREATE INDEX idx_properties_city ON properties(city);
```

**C. Additional Index for Join Performance**
```sql
-- Ensure join keys are indexed
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
```

---

## 4. Improvements Observed

- **EXPLAIN ANALYZE after indexes:**
    - User booking lookups now use index scans, reducing execution time from seconds to milliseconds for typical workloads.
    - Property city search now uses index-only scan, eliminating full table scan.
    - Join queries use indexed lookups, improving join time and reducing memory usage.

**SHOW PROFILE** (MySQL only) shows CPU and I/O time sharply reduced for these queries post-indexing.

---

## 5. Continuous Monitoring Strategy

- Integrate slow query log analysis (e.g., in MySQL, enable `long_query_time` and monitor `slow_query_log`).
- Review and tune queries monthly as data volume and access patterns evolve.
- Drop unused indexes and consider composite/covering indexes for new query patterns.
- Partition large tables as they grow (see `partitioning.sql`).

---

** Note:**  
Indexing is an ongoing process; always validate with real data and realistic concurrency. Monitor for index bloat and write slowdowns as data and workload evolve.
