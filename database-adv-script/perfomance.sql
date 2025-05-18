-- Initial Query: Retrieve all bookings with user, property, and payment details
SELECT 
    b.booking_id,
    b.check_in_date,
    b.status AS booking_status,
    u.user_id,
    u.name AS user_name,
    u.email,
    p.property_id,
    p.name AS property_name,
    p.location,
    pay.payment_id,
    pay.amount,
    pay.status AS payment_status
FROM Booking b
INNER JOIN User u ON b.user_id = u.user_id
INNER JOIN Property p ON b.property_id = p.property_id
INNER JOIN Payment pay ON b.booking_id = pay.booking_id
WHERE b.status = 'confirmed' 
  AND b.check_in_date >= '2025-01-01' 
  AND b.check_in_date < '2026-01-01'
  AND pay.status = 'paid'
ORDER BY b.check_in_date;

-- EXPLAIN ANALYZE for Initial Query
EXPLAIN ANALYZE 
SELECT 
    b.booking_id,
    b.check_in_date,
    b.status AS booking_status,
    u.user_id,
    u.name AS user_name,
    u.email,
    p.property_id,
    p.name AS property_name,
    p.location,
    pay.payment_id,
    pay.amount,
    pay.status AS payment_status
FROM Booking b
INNER JOIN User u ON b.user_id = u.user_id
INNER JOIN Property p ON b.property_id = p.property_id
INNER JOIN Payment pay ON b.booking_id = pay.booking_id
WHERE b.status = 'confirmed' 
  AND b.check_in_date >= '2025-01-01' 
  AND b.check_in_date < '2026-01-01'
  AND pay.status = 'paid'
ORDER BY b.check_in_date;

-- Refactored Query: Optimized for performance
SELECT 
    b.booking_id,
    b.check_in_date,
    b.status AS booking_status,
    u.name AS user_name,
    u.email,
    p.name AS property_name,
    p.location,
    pay.amount,
    pay.status AS payment_status
FROM Booking b
INNER JOIN User u ON b.user_id = u.user_id
INNER JOIN Property p ON b.property_id = p.property_id
LEFT JOIN Payment pay ON b.booking_id = pay.booking_id
WHERE b.status = 'confirmed' 
  AND b.check_in_date >= '2025-01-01' 
  AND b.check_in_date < '2026-01-01'
  AND (pay.status = 'paid' OR pay.status IS NULL)
ORDER BY b.check_in_date;

-- EXPLAIN ANALYZE for Refactored Query
EXPLAIN ANALYZE 
SELECT 
    b.booking_id,
    b.check_in_date,
    b.status AS booking_status,
    u.name AS user_name,
    u.email,
    p.name AS property_name,
    p.location,
    pay.amount,
    pay.status AS payment_status
FROM Booking b
INNER JOIN User u ON b.user_id = u.user_id
INNER JOIN Property p ON b.property_id = p.property_id
LEFT JOIN Payment pay ON b.booking_id = pay.booking_id
WHERE b.status = 'confirmed' 
  AND b.check_in_date >= '2025-01-01' 
  AND b.check_in_date < '2026-01-01'
  AND (pay.status = 'paid' OR pay.status IS NULL)
ORDER BY b.check_in_date;