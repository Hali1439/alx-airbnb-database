🔹 Initial (Unoptimized) Query
-- Retrieve all bookings with full user, property, and payment details
SELECT 
    bookings.id AS booking_id,
    users.name AS user_name,
    users.email AS user_email,
    properties.title AS property_title,
    properties.location,
    payments.amount,
    payments.status,
    bookings.start_date,
    bookings.end_date
FROM bookings
JOIN users ON bookings.user_id = users.id
JOIN properties ON bookings.property_id = properties.id
JOIN payments ON bookings.id = payments.booking_id;

🔹 Optimized Version

-- Optimized query: SELECT only needed columns, use indexes
SELECT 
    b.id AS booking_id,
    u.name AS user_name,
    u.email,
    p.title AS property_title,
    p.location,
    pay.amount,
    pay.status,
    b.start_date,
    b.end_date
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
LEFT JOIN payments pay ON pay.booking_id = b.id;

💡 Final Optimized Query

SELECT 
    b.id AS booking_id,
    u.name AS user_name,
    u.email,
    p.title AS property_title,
    p.location,
    pay.amount,
    pay.status,
    b.start_date,
    b.end_date
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
LEFT JOIN payments pay ON pay.booking_id = b.id;
