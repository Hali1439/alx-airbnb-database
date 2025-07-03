
## 📄 SQL Join Queries – Airbnb Clone Database

### 🔁 INNER JOIN – Retrieve all bookings and the respective users who made those bookings

```sql
SELECT 
    users.id AS user_id,
    users.name AS user_name,
    bookings.id AS booking_id,
    bookings.property_id,
    bookings.start_date,
    bookings.end_date
FROM 
    users
INNER JOIN 
    bookings 
ON 
    users.id = bookings.user_id;
```

---

### 🔗 LEFT JOIN – Retrieve all properties and their reviews, including properties that have no reviews

```sql
SELECT 
    properties.id AS property_id,
    properties.title,
    reviews.id AS review_id,
    reviews.rating,
    reviews.comment,
    CASE 
        WHEN reviews.id IS NULL THEN 'No Reviews'
        ELSE 'Has Reviews'
    END AS review_status
FROM 
    properties
LEFT JOIN 
    reviews 
ON 
    properties.id = reviews.property_id;
```

> ✅ This version includes all properties, even those without reviews, and adds a `review_status` column to indicate review presence.

---

### 🚫 FULL OUTER JOIN (MySQL workaround using UNION) – Retrieve all users and all bookings, even if no matching records exist

> ⚠️ MySQL does not support `FULL OUTER JOIN`, so we use `UNION` of two `LEFT JOIN`s to simulate it.

```sql
-- Users with or without bookings
SELECT 
    users.id AS user_id,
    users.name AS user_name,
    bookings.id AS booking_id,
    bookings.property_id,
    bookings.start_date
FROM 
    users
LEFT JOIN 
    bookings 
ON 
    users.id = bookings.user_id

UNION

-- Bookings with or without users (simulates the other half of FULL OUTER JOIN)
SELECT 
    users.id AS user_id,
    users.name AS user_name,
    bookings.id AS booking_id,
    bookings.property_id,
    bookings.start_date
FROM 
    bookings
LEFT JOIN 
    users 
ON 
    users.id = bookings.user_id;
```

---

