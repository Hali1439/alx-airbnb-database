# 📊 ER Diagram Requirements

Welcome to the core of database sanity. This is your blueprint — a high-level, visual map of your Airbnb-like system. This file outlines **entity definitions**, **relationships**, and modeling best practices required to complete Task 0 of the ALX Database Project.

## ✅ Project Goals

- [ ] Identify **core entities** and their attributes.
- [ ] Define **relationships** (1:1, 1:N, N:M) between those entities.
- [ ] Include **keys** (primary, foreign) clearly.
- [ ] Use **naming conventions** that are scalable and readable.
- [ ] Validate the design reflects **normalization** up to 3NF.
- [ ] Deliver the ERD in **Draw.io**, Lucidchart, or equivalent.

---

## 🧱 Core Entities

You must include, at minimum:

- **User**
  - Hosts, guests, and admins
- **Property**
  - Airbnb-style listings owned by users
- **Booking**
  - Reservation details
- **Payment**
  - Linked to bookings
- **Review**
  - User feedback for properties
- **Message**
  - User-to-user communication

---

## 🔗 Entity Relationships

> Think in relationships. Data without relationships is chaos.

- A **User** can host many **Properties**
- A **User** can book many **Properties** via **Bookings**
- A **Booking** must be linked to one **User** and one **Property**
- A **Booking** has exactly one **Payment**
- A **User** can leave many **Reviews**, each on a **Property**
- A **User** can send many **Messages** to another **User**

---

## 🗃 ERD Conventions

| Element         | Convention Example              |
|----------------|----------------------------------|
| Entity Name     | PascalCase (e.g., `User`)        |
| Attribute Name  | snake_case (e.g., `email`)       |
| Primary Key     | Ends with `_id` (e.g., `user_id`)|
| Foreign Key     | Same name as target PK          |
| Timestamp Fields| `created_at`, `updated_at`       |

---

## 🧠 Visual Design Checklist

- [ ] Each entity has a clearly defined primary key
- [ ] All foreign keys are explicitly connected
- [ ] Use crow’s foot notation or UML
- [ ] ERD should be **exported as PNG and embedded or linked**

---

## 📌 Submission

- Place ERD file in this folder as: `ERD/airbnb_erd.drawio` or `airbnb_erd.png`
- Keep this `requirements.md` updated if your model evolves
- Ensure your diagram is consistent with `schema.sql`

---

## 👑 Pro Tip

**Design like you’re building for scale** — not for this project, but for a billion-dollar startup.

- Avoid nullable foreign keys unless absolutely necessary
- Plan for indexing where queries will hit most often
- Think modular: relationships should be navigable from any angle

---



