-- Indexes for the Users table
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_users_id ON users(id);

-- Indexes for the Bookings table
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_bookings_created_at ON bookings(created_at);

-- Indexes for the Properties table
CREATE INDEX idx_properties_location ON properties(location);
CREATE INDEX idx_properties_price ON properties(price);
CREATE INDEX idx_properties_id ON properties(id);
