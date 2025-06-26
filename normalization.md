# 🧠 Database Normalization to 3NF

This document outlines how the database schema for the Airbnb-style booking system was analyzed and normalized to ensure it follows **Third Normal Form (3NF)** — eliminating redundancy and ensuring data integrity.

---

## 🧩 Step 1: First Normal Form (1NF)

**Rule:** Eliminate repeating groups and ensure atomic values.

### ✅ What We Did:
- Each table has a **primary key**.
- All attributes are **atomic** (no lists or sets stored in a field).
- Example: `User.email` is a single value, not a list of emails.

---

## 🔄 Step 2: Second Normal Form (2NF)

**Rule:** Remove partial dependencies (no non-key attribute should depend on part of a composite key).

### ✅ What We Did:
- All tables have a **single-attribute primary key** (`id`).
- No table uses a composite primary key.
- Every non-key attribute fully depends on the whole key.

---

## 🧹 Step 3: Third Normal Form (3NF)

**Rule:** Remove transitive dependencies (non-key attributes must depend only on the key).

### ✅ What We Checked:
- No non-key attribute depends on another non-key attribute.
- For example, in the `Booking` table:
  - `total_price` depends on `check_in_date`, `check_out_date`, and `price_per_night`
  - This is a **derived value** — ideally calculated at runtime or stored for efficiency with a clear explanation.

### 📌 Decision:
We chose to **keep `total_price`** in the `Booking` table for performance, but we documented it as a calculated field to avoid confusion and maintain design clarity.

---

## 💡 Additional Improvements

### 🔍 Removed Potential Redundancy:
- No user info is stored in the `Booking` or `Review` tables directly — only foreign keys (`user_id`).
- Property details are stored only in the `Property` table, not duplicated in `Booking` or `Review`.

### ✅ Final Tables in 3NF:
- `User`
- `Property`
- `Booking`
- `Review`

---

## ✅ Conclusion

All tables have been reviewed and adjusted to conform to **Third Normal Form (3NF)**.  
This ensures the schema:
- Reduces redundancy
- Increases data integrity
- Supports scalability and maintainability

> The ERD diagram (see `ERD/airbnb-erd.png`) reflects this normalized structure.

