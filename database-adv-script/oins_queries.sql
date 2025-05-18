SELECT bookings.id AS booking_id, users.id AS user_id, users.name, bookings.date
FROM bookings
INNER JOIN users ON bookings.user_id = users.id;

SELECT properties.id AS property_id, properties.name, reviews.rating
FROM properties
LEFT JOIN reviews ON reviews.property_id = properties.id;

SELECT users.id AS user_id, users.name, bookings.id AS booking_id, bookings.date
FROM users
FULL OUTER JOIN bookings ON bookings.user_id = users.id;
