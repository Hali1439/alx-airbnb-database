# database-adv-script
*contents

## Join Queries - Airbnb Clone Database

This directory contains advanced SQL queries demonstrating the use of various types of SQL joins on the Airbnb clone schema.

## Queries Included

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

## File List

- `joins_queries.sql` — contains SQL JOIN queries.

