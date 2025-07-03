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
JOIN payments pay  ON b.booking_id = pay.booking_id;

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
JOIN payments pay  ON b.booking_id = pay.booking_id;

-- Refactored Query (if analysis shows inefficiencies, e.g. unnecessary columns or N+1 JOINs)
-- Assuming all joins are necessary, the focus is on ensuring indexed columns are used, and only necessary columns are selected.
-- If payment may not exist for all bookings, use LEFT JOIN for payments.
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
LEFT JOIN payments pay ON b.booking_id = pay.booking_id;

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
LEFT JOIN payments pay ON b.booking_id = pay.booking_id;
