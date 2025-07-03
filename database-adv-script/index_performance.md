# Index Performance Optimization – Airbnb Clone Database

## Objective

This document explains the rationale behind implementing indexes in the database and compares query performance before and after indexing.

---

## 🎯 Indexing Strategy

We analyzed commonly queried columns in the `users`, `bookings`, and `properties` tables based on JOINs, WHERE conditions, and ORDER BY clauses.

### 📌 Users Table
| Column | Usage |
|--------|-------|
| id     | JOINs (bookings.user_id = users.id) |
| email  | WHERE clause for login/authentication |

**Indexes Created**
- `idx_users_id`
- `idx_users_email`

---

### 📌 Bookings Table
| Column        | Usage |
|---------------|-------|
| user_id       | JOIN with users |
| property_id   | JOIN with properties |
| created_at    | ORDER BY booking history |

**Indexes Created**
- `idx_bookings_user_id`
- `idx_bookings_property_id`
- `idx_bookings_created_at`

---

### 📌 Properties Table
| Column   | Usage |
|----------|-------|
| id       | JOINs with bookings |
| location | WHERE clause for search |
| price    | Filtering and ordering |

**Indexes Created**
- `idx_properties_id`
- `idx_properties_location`
- `idx_properties_price`

---

## ⚙️ Performance Testing with EXPLAIN

### Query Without Index

```sql
EXPLAIN SELECT * 
FROM bookings 
JOIN users ON bookings.user_id = users.id 
WHERE users.email = 'user@example.com';
