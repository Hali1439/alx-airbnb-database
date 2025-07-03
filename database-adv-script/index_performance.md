# Index Performance Analysis

## Indexing Strategy

Indexes were added on high-usage columns:
- `users.email` and `users.username`: for login and admin queries.
- `bookings.user_id`, `bookings.property_id`, `bookings.booking_date`: for frequent joins, filters, and reporting.
- `properties.city`: for location-based searches.

## Performance Measurement

### Before and After Indexing

**Example Query:**  
Find all bookings for a user in a date range:

```sql
EXPLAIN ANALYZE
SELECT * FROM bookings WHERE user_id = 42 AND booking_date BETWEEN '2025-01-01' AND '2025-01-31';
```

**Example Join Query:**

```sql
EXPLAIN ANALYZE
SELECT u.username, b.booking_id, p.property_name
FROM bookings b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
WHERE p.city = 'London';
```

- Run these queries before and after adding indexes to compare execution plans and performance.

## Trade-Offs

- **Improved read/query speed** for common access patterns.
- **Slightly slower writes** (INSERT/UPDATE/DELETE) due to index maintenance.
- **Additional storage** used for index structures.

## Notes

- Indexes must be monitored and adjusted as query patterns evolve.
- Composite indexes (multi-column) may be required for more complex queries.
- Avoid indexing columns with low selectivity (many duplicate values).

---

**Recommendation:**  
Regularly review query plans with `EXPLAIN ANALYZE` to ensure indexes are being used. Remove unused indexes to reduce write overhead and storage costs.

