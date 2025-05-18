SELECT bookings.id AS booking_id, users.id AS user_id, users.name, bookings.date
FROM bookings
INNER JOIN users ON bookings.user_id = users.id;

SELECT p.*,r.* FROM Properties p LEFT JOIN Reviews r ON r.property_id = p.property_id ORDER BY p.property_id;

SELECT users.id AS user_id, users.name, bookings.id AS booking_id, bookings.date
FROM users
FULL OUTER JOIN bookings ON bookings.user_id = users.id;
