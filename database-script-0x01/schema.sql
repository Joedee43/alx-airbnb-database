-- Users Table
CREATE TABLE USER (
    userID INT PRIMARY KEY AUTO_INCREMENT,
    firstName VARCHAR(50) NOT NULL,
    lastName VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    phoneNumber VARCHAR(15),
    isHost BOOLEAN DEFAULT FALSE
);

-- Properties Table
CREATE TABLE PROPERTY (
    propertyID INT PRIMARY KEY AUTO_INCREMENT,
    hostID INT,
    title VARCHAR(100) NOT NULL,
    description TEXT,
    address VARCHAR(255) NOT NULL,
    pricing DECIMAL(10, 2) NOT NULL,
    capacity INT NOT NULL,
    FOREIGN KEY (hostID) REFERENCES USER(userID) ON DELETE CASCADE
);

-- Bookings Table
CREATE TABLE BOOKING (
    bookingID INT PRIMARY KEY AUTO_INCREMENT,
    guestID INT,
    propertyID INT,
    dates DATE NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    status VARCHAR(50) NOT NULL,
    FOREIGN KEY (guestID) REFERENCES USER(userID) ON DELETE CASCADE,
    FOREIGN KEY (propertyID) REFERENCES PROPERTY(propertyID) ON DELETE CASCADE
);

-- Reviews Table
CREATE TABLE REVIEW (
    reviewID INT PRIMARY KEY AUTO_INCREMENT,
    bookingID INT,
    rating INT CHECK (rating >= 1 AND rating <= 5),
    comment TEXT,
    FOREIGN KEY (bookingID) REFERENCES BOOKING(bookingID) ON DELETE CASCADE
);

-- Amenities Table
CREATE TABLE AMENITY (
    amenityID INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    category VARCHAR(50)
);

-- Property_Amenity Junction Table
CREATE TABLE PROPERTY_AMENITY (
    propertyID INT,
    amenityID INT,
    PRIMARY KEY (propertyID, amenityID),
    FOREIGN KEY (propertyID) REFERENCES PROPERTY(propertyID) ON DELETE CASCADE,
    FOREIGN KEY (amenityID) REFERENCES AMENITY(amenityID) ON DELETE CASCADE
);

-- Property Images Table
CREATE TABLE PROPERTY_IMAGE (
    imageID INT PRIMARY KEY AUTO_INCREMENT,
    propertyID INT,
    imageURL VARCHAR(255) NOT NULL,
    FOREIGN KEY (propertyID) REFERENCES PROPERTY(propertyID) ON DELETE CASCADE
);

-- Payments Table
CREATE TABLE PAYMENT (
    paymentID INT PRIMARY KEY AUTO_INCREMENT,
    bookingID INT,
    amount DECIMAL(10, 2) NOT NULL,
    status VARCHAR(50) NOT NULL,
    FOREIGN KEY (bookingID) REFERENCES BOOKING(bookingID) ON DELETE CASCADE
);

-- Indexes for optimal performance
CREATE INDEX idx_user_email ON USER(email);
CREATE INDEX idx_property_host ON PROPERTY(hostID);
CREATE INDEX idx_booking_guest ON BOOKING(guestID);
CREATE INDEX idx_review_booking ON REVIEW(bookingID);
CREATE INDEX idx_payment_booking ON PAYMENT(bookingID);