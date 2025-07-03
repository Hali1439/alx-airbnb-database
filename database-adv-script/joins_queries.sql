-- 1. INNER JOIN: Retrieve all bookings and their respective users.
SELECT
    b.booking_id,
    b.property_id,
    b.booking_date,
    u.user_id,
    u.username,
    u.email
FROM
    bookings b
INNER JOIN
    users u ON b.user_id = u.user_id;
-- Only returns bookings with a linked user (enforces referential integrity).

-- 2. LEFT JOIN: Retrieve all properties and their reviews (including those with no reviews).
SELECT
    p.property_id,
    p.property_name,
    r.review_id,
    r.review_text,
    r.created_at AS review_date
FROM
    properties p
LEFT JOIN
    reviews r ON p.property_id = r.property_id;
-- Includes properties with no reviews (review_id will be NULL).
SELECT
    p.property_id,
    p.property_name,
    r.review_id,
    r.review_text,
    r.created_at AS review_date
FROM
    properties p
LEFT JOIN
    reviews r ON p.property_id = r.property_id
ORDER BY
    p.property_id, r.review_id;

-- 3. FULL OUTER JOIN: Retrieve all users and all bookings, even if no booking/user link exists.
-- Note: FULL OUTER JOIN support varies (use UNION of LEFT + RIGHT for MySQL).
SELECT
    u.user_id,
    u.username,
    b.booking_id,
    b.property_id,
    b.booking_date
FROM
    users u
FULL OUTER JOIN
    bookings b ON u.user_id = b.user_id
-- For databases without FULL OUTER JOIN (e.g., MySQL), use:
-- SELECT ... FROM users u LEFT JOIN bookings b ON ... 
-- UNION
-- SELECT ... FROM bookings b LEFT JOIN users u ON ...
;
