-- Indexes for User table
CREATE UNIQUE INDEX idx_user_email ON User (email);
CREATE INDEX idx_user_status ON User (status);
CREATE INDEX idx_user_created_at ON User (created_at);

-- Indexes for Booking table
CREATE INDEX idx_booking_user_id ON Booking (user_id);
CREATE INDEX idx_booking_property_id ON Booking (property_id);
CREATE INDEX idx_booking_check_in_date ON Booking (check_in_date);
CREATE INDEX idx_booking_status ON Booking (status);
CREATE INDEX idx_booking_date_status ON Booking (check_in_date, status);

-- Indexes for Property table
CREATE INDEX idx_property_owner_id ON Property (owner_id);
CREATE INDEX idx_property_location ON Property (location);
CREATE INDEX idx_property_status ON Property (status);

-- Performance analysis queries (run before and after applying indexes)
-- User query
EXPLAIN ANALYZE SELECT * FROM User WHERE email = 'user@example.com';

-- Booking query
EXPLAIN ANALYZE SELECT * FROM Booking WHERE user_id = 123 AND status = 'confirmed' ORDER BY check_in_date;

-- Property query
EXPLAIN ANALYZE SELECT * FROM Property WHERE owner_id = 456 AND status = 'available';