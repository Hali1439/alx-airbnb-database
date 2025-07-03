# Optimization Report – Airbnb Clone Complex Query

## 🎯 Objective
Improve the performance of a complex SQL query that joins multiple tables: `bookings`, `users`, `properties`, and `payments`.

---

## 🔍 Initial Query Analysis

### Query:

```sql
SELECT *
FROM bookings
JOIN users ON bookings.user_id = users.id
JOIN properties ON bookings.property_id = properties.id
JOIN payments ON bookings.id = payments.booking_id;
