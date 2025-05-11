-- Sample Data for USER
INSERT INTO USER (firstName, lastName, email, password, phoneNumber, isHost) VALUES
('Alice', 'Smith', 'alice@example.com', 'password123', '555-1234', TRUE),
('Bob', 'Johnson', 'bob@example.com', 'password456', '555-5678', TRUE),
('Charlie', 'Brown', 'charlie@example.com', 'password789', '555-8765', FALSE),
('Diana', 'Prince', 'diana@example.com', 'password101', '555-4321', FALSE);

-- Sample Data for PROPERTY
INSERT INTO PROPERTY (hostID, title, description, address, pricing, capacity) VALUES
(1, 'Cozy Cottage', 'A charming cottage in the woods.', '123 Forest Lane, Springfield', 150.00, 4),
(1, 'Beach House', 'A beautiful house by the sea.', '456 Ocean Drive, Springfield', 250.00, 6),
(2, 'Downtown Apartment', 'Modern apartment in the city center.', '789 City St, Springfield', 100.00, 2),
(2, 'Mountain Retreat', 'Escape to the mountains.', '321 Hilltop Ave, Springfield', 200.00, 8);

-- Sample Data for BOOKING
INSERT INTO BOOKING (guestID, propertyID, dates, price, status) VALUES
(3, 1, '2023-06-01', 150.00, 'Confirmed'),
(3, 2, '2023-06-05', 250.00, 'Pending'),
(4, 3, '2023-07-10', 100.00, 'Confirmed'),
(4, 4, '2023-08-15', 200.00, 'Cancelled');

-- Sample Data for REVIEW
INSERT INTO REVIEW (bookingID, rating, comment) VALUES
(1, 5, 'Absolutely loved the cozy cottage!'),
(3, 4, 'Great apartment, but a bit noisy.'),
(4, 2, 'The retreat was nice, but not what I expected.');

-- Sample Data for AMENITY
INSERT INTO AMENITY (name, category) VALUES
('WiFi', 'Internet'),
('Pool', 'Recreation'),
('Air Conditioning', 'Comfort'),
('Parking', 'Facility');

-- Sample Data for PROPERTY_AMENITY
INSERT INTO PROPERTY_AMENITY (propertyID, amenityID) VALUES
(1, 1),
(1, 3),
(2, 2),
(2, 3),
(3, 1),
(3, 4),
(4, 1),
(4, 2);

-- Sample Data for PROPERTY_IMAGE
INSERT INTO PROPERTY_IMAGE (propertyID, imageURL) VALUES
(1, 'http://example.com/images/cottage.jpg'),
(2, 'http://example.com/images/beachhouse.jpg'),
(3, 'http://example.com/images/apartment.jpg'),
(4, 'http://example.com/images/mountainretreat.jpg');

-- Sample Data for PAYMENT
INSERT INTO PAYMENT (bookingID, amount, status) VALUES
(1, 150.00, 'Completed'),
(3, 100.00, 'Completed'),
(4, 200.00, 'Refunded');