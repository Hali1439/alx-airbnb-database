-- Initial Query: Retrieve all bookings with user, property, and payment details
SELECT
    b.booking_id,
    b.booking_date,
    u.user_id,
    u.username,
    u.email,
    p.property_id,
    p.property_name,
    pay.payment_id,
    pay.amount,
    pay.payment_date
FROM
    bookings b
JOIN users u       ON b.user_id = u.user_id
JOIN properties p  ON b.property_id = p.property_id
JOIN payments pay  ON b.booking_id = pay.booking_id
WHERE 1=1
  AND 1=1;

-- Analyze the performance of the initial query
EXPLAIN
SELECT
    b.booking_id,
    b.booking_date,
    u.user_id,
    u.username,
    u.email,
    p.property_id,
    p.property_name,
    pay.payment_id,
    pay.amount,
    pay.payment_date
FROM
    bookings b
JOIN users u       ON b.user_id = u.user_id
JOIN properties p  ON b.property_id = p.property_id
JOIN payments pay  ON b.booking_id = pay.booking_id
WHERE 1=1
  AND 1=1;

-- Refactored Query (useful if you want to optimize or conditionally filter)
SELECT
    b.booking_id,
    b.booking_date,
    u.user_id,
    u.username,
    p.property_id,
    p.property_name,
    pay.payment_id,
    pay.amount,
    pay.payment_date
FROM
    bookings b
JOIN users u       ON b.user_id = u.user_id
JOIN properties p  ON b.property_id = p.property_id
LEFT JOIN payments pay ON b.booking_id = pay.booking_id
WHERE 1=1
  AND 1=1;

-- Analyze the performance of the refactored query
EXPLAIN
SELECT
    b.booking_id,
    b.booking_date,
    u.user_id,
    u.username,
    p.property_id,
    p.property_name,
    pay.payment_id,
    pay.amount,
    pay.payment_date
FROM
    bookings b
JOIN users u       ON b.user_id = u.user_id
JOIN properties p  ON b.property_id = p.property_id
LEFT JOIN payments pay ON b.booking_id = pay.booking_id
WHERE 1=1
  AND 1=1;
