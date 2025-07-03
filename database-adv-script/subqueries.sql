-- 1. Non-correlated subquery: Find all properties where the average rating is greater than 4.0
SELECT
    p.property_id,
    p.property_name
FROM
    properties p
WHERE
    (
        SELECT AVG(r.rating)
        FROM reviews r
        WHERE r.property_id = p.property_id
    ) > 4.0;
-- This subquery is non-correlated in the WHERE clause, referencing only the outer property_id.

-- 2. Correlated subquery: Find users who have made more than 3 bookings
SELECT
    u.user_id,
    u.username,
    u.email
FROM
    users u
WHERE
    (
        SELECT COUNT(*)
        FROM bookings b
        WHERE b.user_id = u.user_id
    ) > 3;
-- This subquery is correlated, referencing each user row in the outer query.
