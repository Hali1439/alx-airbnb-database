# Booking Table Partitioning Performance Report

## 🎯 Objective

To improve query performance on a large `bookings` table by implementing **range partitioning** based on the `start_date` column.

---

## 🔧 Implementation Overview

- We created a new partitioned table: `bookings_partitioned`
- Partitioned it by `start_date` using **range partitioning**
- Created quarterly partitions for the year 2024
- Added indexes on frequently queried columns (`user_id`) within each partition

---

## ⚙️ Test Queries

### 1. Without Partitioning (Original `bookings` table)

```sql
EXPLAIN ANALYZE
SELECT * FROM bookings
WHERE start_date BETWEEN '2024-04-01' AND '2024-06-30';
