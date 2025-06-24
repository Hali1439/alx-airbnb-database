-- schema.sql: Airbnb Database Schema
-- Author: Halima
-- Description: Defines all tables, keys, constraints, and indexes.

-- ========================
-- USER TABLE
-- ========================
CREATE TABLE User (
    user_id UUID PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash TEXT NOT NULL,
    phone_number VARCHAR(20),
    role VARCHAR(10) NOT NULL CHECK (role IN ('guest', 'host', 'admin')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_user_email ON User(email);

-- ========================
-- PROPERTY TABLE
-- ========================
CREATE TABLE Property (
    property_id UUID PRIMARY KEY,
    host_id UUID NOT NULL,
    name VARCHAR(100) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(255) NOT NULL,
    pricepernight DECIMAL(10, 2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (host_id) REFERENCES User(user_id) ON DELETE CASCADE
);

CREATE INDEX idx_property_host ON Property(host_id);
CREATE INDEX idx_property_location ON Property(location);

-- ========================
-- BOOKING TABLE
-- ========================
CREATE TABLE Booking (
    booking_id UUID PRIMARY KEY,
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    status VARCHAR(10) NOT NULL CHECK (status IN ('pending', 'confirmed', 'canceled')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (property_id) REFERENCES Property(property_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES User(user_id) ON DELETE CASCADE
);

CREATE INDEX idx_booking_property ON Booking(property_id);
CREATE INDEX idx_booking_user ON Booking(user_id);

-- ========================
-- PAYMENT TABLE
-- ========================
CREATE TABLE Payment (
    payment_id UUID PRIMARY KEY,
    booking_id UUID NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_method VARCHAR(20) NOT NULL CHECK (payment_method IN ('credit_card', 'paypal', 'stripe')),

    FOREIGN KEY (booking_id) REFERENCES Booking(booking_id) ON DELETE CASCADE
);

CREATE INDEX idx_payment_booking ON Payment(booking_id);

-- ========================
-- REVIEW TABLE
-- ========================
CREATE TABLE Review (
    review_id UUID PRIMARY KEY,
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    rating INTEGER NOT NULL CHECK (rating BETWEEN 1 AND 5),
    comment TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (property_id) REFERENCES Property(property_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES User(user_id) ON DELETE CASCADE
);

CREATE UNIQUE INDEX idx_unique_review ON Review(user_id, property_id);

-- ========================
-- MESSAGE TABLE
-- ========================
CREATE TABLE Message (
    message_id UUID PRIMARY KEY,
    sender_id UUID NOT NULL,
    recipient_id UUID NOT NULL,
    message_body TEXT NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (sender_id) REFERENCES User(user_id) ON DELETE CASCADE,
    FOREIGN KEY (recipient_id) REFERENCES User(user_id) ON DELETE CASCADE
);

CREATE INDEX idx_message_sender ON Message(sender_id);
CREATE INDEX idx_message_recipient ON Message(recipient_id);

