-- INNER JOIN: Retrieve all bookings and the respective users who made those bookings
SELECT 
    users.id AS user_id,
    users.name AS user_name,
    bookings.id AS booking_id,
    bookings.property_id,
    bookings.start_date,
    bookings.end_date
FROM 
    users
INNER JOIN 
    bookings ON users.id = bookings.user_id;

-- LEFT JOIN: Retrieve all properties and their reviews, including properties that have no reviews
SELECT 
    properties.id AS property_id,
    properties.title,
    reviews.id AS review_id,
    reviews.rating,
    reviews.comment
FROM 
    properties
LEFT JOIN 
    reviews ON properties.id = reviews.property_id;

-- FULL OUTER JOIN: Retrieve all users and all bookings (even if no matching records exist)
-- ⚠️ Note: FULL OUTER JOIN is not supported in MySQL. Use UNION for compatibility if needed.
SELECT 
    users.id AS user_id,
    users.name AS user_name,
    bookings.id AS booking_id,
    bookings.property_id,
    bookings.start_date
FROM 
    users
LEFT JOIN 
    bookings ON users.id = bookings.user_id

UNION

SELECT 
    users.id AS user_id,
    users.name AS user_name,
    bookings.id AS booking_id,
    bookings.property_id,
    bookings.start_date
FROM 
    bookings
LEFT JOIN 
    users ON users.id = bookings.user_id;

