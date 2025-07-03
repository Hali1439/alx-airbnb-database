-- STEP 1: Create the partitioned table
CREATE TABLE bookings_partitioned (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) PARTITION BY RANGE (start_date);

-- STEP 2: Create partitions (example: quarterly partitions for 2024)
CREATE TABLE bookings_q1_2024 PARTITION OF bookings_partitioned
    FOR VALUES FROM ('2024-01-01') TO ('2024-04-01');

CREATE TABLE bookings_q2_2024 PARTITION OF bookings_partitioned
    FOR VALUES FROM ('2024-04-01') TO ('2024-07-01');

CREATE TABLE bookings_q3_2024 PARTITION OF bookings_partitioned
    FOR VALUES FROM ('2024-07-01') TO ('2024-10-01');

CREATE TABLE bookings_q4_2024 PARTITION OF bookings_partitioned
    FOR VALUES FROM ('2024-10-01') TO ('2025-01-01');

-- STEP 3: Optional indexes (per partition)
CREATE INDEX idx_q1_user_id ON bookings_q1_2024(user_id);
CREATE INDEX idx_q2_user_id ON bookings_q2_2024(user_id);
CREATE INDEX idx_q3_user_id ON bookings_q3_2024(user_id);
CREATE INDEX idx_q4_user_id ON bookings_q4_2024(user_id);
