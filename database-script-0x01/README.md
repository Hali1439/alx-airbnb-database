# Airbnb Database Schema — `schema.sql`

This file defines the full relational database schema for an Airbnb-like application.

## 🧱 Schema Overview

This database models five key features of an Airbnb-style platform:

- **User Management**: Users can be guests, hosts, or admins.
- **Property Listings**: Hosts list properties with prices and descriptions.
- **Booking System**: Users book properties with specific dates.
- **Payment Tracking**: Payment information is linked to bookings.
- **Review and Messaging**: Users can leave reviews and communicate.

## 📌 Tables and Relationships

| Table    | Description |
|----------|-------------|
| `User`   | Stores user details and roles. |
| `Property` | Belongs to a host (user). |
| `Booking` | Connects a user with a property. |
| `Payment` | Tied to a booking. |
| `Review` | Linked to both a user and a property. |
| `Message` | Represents user-to-user messages. |

### 🔑 Key Constraints
- All primary keys are UUIDs for scalability.
- Foreign keys have `ON DELETE CASCADE` for relational integrity.
- ENUMs are enforced via `CHECK` constraints for portability.

### 🚀 Indexes
- Indexes on:
  - `User.email`
  - `Property.host_id`, `location`
  - `Booking.property_id`, `user_id`
  - `Payment.booking_id`
  - `Review(user_id, property_id)` (unique)
  - `Message.sender_id`, `recipient_id`

## ✅ Notes
- Schema is written for **PostgreSQL** but can be adapted for **MySQL**.
- Designed to meet 3NF principles with no redundancy.
- Assumes all UUIDs are generated via the application or PostgreSQL's `gen_random_uuid()`.

---

## ⚔️ Next Step

1. Create and test this schema using:
   ```bash
   psql -U youruser -d airbnb_db -f schema.sql

