-- Step 1: Create parent table (no data, just structure)
CREATE TABLE Booking (
    booking_id BIGINT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    property_id BIGINT NOT NULL,
    start_date DATE NOT NULL,
    status VARCHAR(20) NOT NULL
) PARTITION BY RANGE (start_date);

-- Step 2: Create partitions for each year (2020–2025)
CREATE TABLE Booking_2020 PARTITION OF Booking
    FOR VALUES FROM ('2020-01-01') TO ('2021-01-01');
CREATE TABLE Booking_2021 PARTITION OF Booking
    FOR VALUES FROM ('2021-01-01') TO ('2022-01-01');
CREATE TABLE Booking_2022 PARTITION OF Booking
    FOR VALUES FROM ('2022-01-01') TO ('2023-01-01');
CREATE TABLE Booking_2023 PARTITION OF Booking
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');
CREATE TABLE Booking_2024 PARTITION OF Booking
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');
CREATE TABLE Booking_2025 PARTITION OF Booking
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

-- Step 3: Create indexes on each partition (based on prior indexes)
-- Booking_2020
CREATE INDEX idx_booking_2020_user_id ON Booking_2020 (user_id);
CREATE INDEX idx_booking_2020_property_id ON Booking_2020 (property_id);
CREATE INDEX idx_booking_2020_start_date ON Booking_2020 (start_date);
CREATE INDEX idx_booking_2020_status ON Booking_2020 (status);
CREATE INDEX idx_booking_2020_date_status ON Booking_2020 (start_date, status);

-- Booking_2021
CREATE INDEX idx_booking_2021_user_id ON Booking_2021 (user_id);
CREATE INDEX idx_booking_2021_property_id ON Booking_2021 (property_id);
CREATE INDEX idx_booking_2021_start_date ON Booking_2021 (start_date);
CREATE INDEX idx_booking_2021_status ON Booking_2021 (status);
CREATE INDEX idx_booking_2021_date_status ON Booking_2021 (start_date, status);

-- Booking_2022
CREATE INDEX idx_booking_2022_user_id ON Booking_2022 (user_id);
CREATE INDEX idx_booking_2022_property_id ON Booking_2022 (property_id);
CREATE INDEX idx_booking_2022_start_date ON Booking_2022 (start_date);
CREATE INDEX idx_booking_2022_status ON Booking_2022 (status);
CREATE INDEX idx_booking_2022_date_status ON Booking_2022 (start_date, status);

-- Booking_2023
CREATE INDEX idx_booking_2023_user_id ON Booking_2023 (user_id);
CREATE INDEX idx_booking_2023_property_id ON Booking_2023 (property_id);
CREATE INDEX idx_booking_2023_start_date ON Booking_2023 (start_date);
CREATE INDEX idx_booking_2023_status ON Booking_2023 (status);
CREATE INDEX idx_booking_2023_date_status ON Booking_2023 (start_date, status);

-- Booking_2024
CREATE INDEX idx_booking_2024_user_id ON Booking_2024 (user_id);
CREATE INDEX idx_booking_2024_property_id ON Booking_2024 (property_id);
CREATE INDEX idx_booking_2024_start_date ON Booking_2024 (start_date);
CREATE INDEX idx_booking_2024_status ON Booking_2024 (status);
CREATE INDEX idx_booking_2024_date_status ON Booking_2024 (start_date, status);

-- Booking_2025
CREATE INDEX idx_booking_2025_user_id ON Booking_2025 (user_id);
CREATE INDEX idx_booking_2025_property_id ON Booking_2025 (property_id);
CREATE INDEX idx_booking_2025_start_date ON Booking_2025 (start_date);
CREATE INDEX idx_booking_2025_status ON Booking_2025 (status);
CREATE INDEX idx_booking_2025_date_status ON Booking_2025 (start_date, status);

-- Step 4: Test query performance (run before partitioning for baseline)
EXPLAIN ANALYZE
SELECT * FROM Booking
WHERE start_date BETWEEN '2025-01-01' AND '2025-12-31'
  AND status = 'confirmed';

-- Note: To run baseline, execute the query on the non-partitioned table before applying partitioning.
-- After partitioning, run the same query to compare.