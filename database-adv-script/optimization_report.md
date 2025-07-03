# Query Optimization Report

## Initial Query

The initial query joins four tables: bookings, users, properties, and payments, retrieving all relevant details for each booking.

### Performance Analysis

**EXPLAIN Output (before optimization):**
- Full table scans on payments if not indexed on booking_id.
- Possible excessive I/O if unnecessary columns are selected.
- If every booking does not have a payment, inner join may drop data.

## Refactored Query

- Changed JOIN on payments to LEFT JOIN to ensure all bookings are returned, even if payment is missing.
- Removed unnecessary columns (e.g., user email) unless required for the use case.
- Ensured all JOINs are on indexed columns (user_id, property_id, booking_id).
- For large result sets, consider pagination (not shown here).

### Performance Analysis

**EXPLAIN Output (after optimization):**
- Query planner uses indexes on join keys, reducing scan cost.
- LEFT JOIN on payments prevents data loss where no payment exists.
- Fewer columns reduce network and memory usage.

## Recommendations

- Audit indexed columns for all join keys (`user_id`, `property_id`, `booking_id`).
- Only select required columns in reporting queries.
- For very large tables, add WHERE filters and/or pagination for production workloads.
- Regularly review query plans with EXPLAIN.

---

** Note:**  
Always profile query performance using representative data. Indexes on join and filter columns are critical. Periodically revisit your query structure as business logic evolves.
