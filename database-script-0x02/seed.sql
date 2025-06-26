-- Insert sample users
INSERT INTO User (first_name, last_name, email, password)
VALUES
  ('Halima', 'Muktar', 'halima@example.com', 'hashedpassword1'),
  ('Liya', 'Tesfaye', 'liya@example.com', 'hashedpassword2'),
  ('Daniel', 'Kebede', 'daniel@example.com', 'hashedpassword3');

-- Insert sample properties
INSERT INTO Property (owner_id, name, description, location, price_per_night, max_guests)
VALUES
  (1, 'Sunset Villa', 'Cozy villa with ocean view', 'Addis Ababa', 120.00, 4),
  (2, 'City Loft', 'Modern apartment in city center', 'Nairobi', 85.00, 2),
  (3, 'Mountain Retreat', 'Cabin with mountain views', 'Bahir Dar', 150.00, 6);

-- Insert sample bookings
INSERT INTO Booking (user_id, property_id, check_in_date, check_out_date, total_price, status)
VALUES
  (2, 1, '2025-07-10', '2025-07-12', 240.00, 'confirmed'),
  (3, 2, '2025-08-01', '2025-08-03', 170.00, 'pending'),
  (1, 3, '2025-07-20', '2025-07-23', 450.00, 'confirmed');

-- Insert sample reviews
INSERT INTO Review (user_id, property_id, rating, comment)
VALUES
  (2, 1, 5, 'Amazing stay! Beautiful sunset views.'),
  (3, 2, 4, 'Clean and modern, great location.'),
  (1, 3, 5, 'Very peaceful, perfect for relaxing.');

