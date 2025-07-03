# database-adv-script
## 📚 Table of Contents
-[Join Queries - Airbnb Clone Database](#Join Queries - Airbnb Clone Database)
- [Subqueries - Airbnb Clone Database](#Subqueries - Airbnb Clone Database)

## Join Queries - Airbnb Clone Database

This directory contains advanced SQL queries demonstrating the use of various types of SQL joins on the Airbnb clone schema.

### Queries Included

1. **INNER JOIN**
   - Retrieves all bookings and their respective users.
   - Ensures only records with a matching user and booking are returned.

2. **LEFT JOIN**
   - Retrieves all properties and any associated reviews.
   - Properties without reviews are still displayed with null review data.

3. **FULL OUTER JOIN**
   - Returns all users and all bookings.
   - Even users without bookings and bookings not linked to users are included.
   - Implemented using `UNION` to ensure compatibility with MySQL.

## Subqueries - Airbnb Clone Database

This directory demonstrates the use of both **correlated** and **non-correlated** subqueries in SQL, using real-world scenarios from the Airbnb clone project.

### Queries

#### 1. Properties with Average Rating > 4.0

**Type:** Non-Correlated Subquery  
**Description:**  
Finds all properties where the average review rating exceeds 4.0.  
The subquery calculates the average rating per property, and the main query filters properties by ID.

#### 2. Users with More Than 3 Bookings

**Type:** Correlated Subquery  
**Description:**  
Finds all users who have made more than three bookings.  
The subquery is executed for each user, counting bookings where the `user_id` matches the outer query.

### File List

## Aggregations and Window Functions – Airbnb Clone Database

This module demonstrates the use of SQL aggregation functions and window functions for data analysis within the Airbnb clone project.

### Queries

#### 1. Total Bookings by Each User

**Description:**  
This query retrieves the total number of bookings made by each user using the `COUNT()` aggregate function and `GROUP BY`.

- **Function used:** COUNT
- **Clause used:** GROUP BY
- **Output:** User ID, Name, Total Bookings

#### 2. Property Ranking by Total Bookings

**Description:**  
This query ranks all properties based on how many times they've been booked, using the `RANK()` window function.

- **Functions used:** COUNT, RANK
- **Clause used:** `OVER (ORDER BY COUNT(...) DESC)`
- **Output:** Property ID, Title, Total Bookings, Rank

### Files

- `aggregations_and_window_functions.sql`: SQL queries
- `README.md`: Documentation and explanations

- `subqueries.sql`: Contains the SQL subqueries.


#### File List

- `joins_queries.sql` — contains SQL JOIN queries.

