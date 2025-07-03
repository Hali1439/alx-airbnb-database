# database-adv-script
*contents

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

- `subqueries.sql`: Contains the SQL subqueries.


### File List

- `joins_queries.sql` — contains SQL JOIN queries.

