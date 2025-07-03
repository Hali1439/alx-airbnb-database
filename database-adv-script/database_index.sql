-- Indexes for Users table
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_users_username ON users(username);

-- Indexes for Bookings table
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_bookings_booking_date ON bookings(booking_date);

-- Indexes for Properties table
CREATE INDEX idx_properties_city ON properties(city);

-- Example of measuring query performance before and after indexing using EXPLAIN ANALYZE
EXPLAIN ANALYZE
SELECT *
FROM bookings
WHERE user_id = 42
  AND booking_date BETWEEN '2025-01-01' AND '2025-01-31';

EXPLAIN ANALYZE
SELECT u.username, b.booking_id, p.property_name
FROM bookings b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
WHERE p.city = 'London';
