# 🗂️ Entity-Relationship Diagram (ERD)

This document defines the key entities and relationships for the Airbnb-style booking system database.

---

## 📦 Entities and Attributes

### 1. **User**
- `id` (Primary Key)
- `first_name`
- `last_name`
- `email`
- `password`
- `created_at`
- `updated_at`

### 2. **Property**
- `id` (Primary Key)
- `owner_id` (Foreign Key → User)
- `name`
- `description`
- `location`
- `price_per_night`
- `max_guests`
- `created_at`
- `updated_at`

### 3. **Booking**
- `id` (Primary Key)
- `user_id` (Foreign Key → User)
- `property_id` (Foreign Key → Property)
- `check_in_date`
- `check_out_date`
- `total_price`
- `status`
- `created_at`
- `updated_at`

### 4. **Review**
- `id` (Primary Key)
- `user_id` (Foreign Key → User)
- `property_id` (Foreign Key → Property)
- `rating`
- `comment`
- `created_at`

---

## 🔗 Relationships

- **User ↔ Booking**: One user can have many bookings.
- **Property ↔ Booking**: One property can have many bookings.
- **User ↔ Property**: One user (host) can own many properties.
- **User ↔ Review**: One user can leave multiple reviews.
- **Property ↔ Review**: One property can have many reviews.

---

## 🧰 ER Diagram
![ERD/airbnb-erd.png](https://github.com/Hali1439/alx-airbnb-database/blob/aae533ccd070d49ac48b03a4bc7ef8b6f113ea0a/ERD/airbnb-erd.png)
