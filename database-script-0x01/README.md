# 🗄️ Airbnb Database Schema (DDL)

This folder contains the SQL script for defining the relational schema of the Airbnb-style booking system.

## 📁 Files

- `schema.sql` — Contains all `CREATE TABLE` statements, constraints, and indexes for the database.
- `README.md` — Explanation of the schema and normalization applied.

## 📌 Tables Created

1. **User** — Stores account and login details.
2. **Property** — Stores host listings and related information.
3. **Booking** — Tracks reservations and user stays.
4. **Review** — User feedback and rating of properties.

## ✅ Features

- **3NF-compliant design**
- **Primary and Foreign Key constraints**
- **Timestamps for audit/history**
- **Enum field for booking status**
- **Indexes for performance on foreign keys**



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

