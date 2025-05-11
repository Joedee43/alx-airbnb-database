# Vacation Rental System Database Schema

## Overview
This document outlines the SQL schema for a vacation rental system, modeled similarly to platforms like Airbnb. The schema includes tables for users, properties, bookings, reviews, amenities, images, and payments.

## Tables

1. **USER**
   - Stores user details.
   - Primary Key: `userID`

2. **PROPERTY**
   - Contains property listings.
   - Primary Key: `propertyID`
   - Foreign Key: `hostID` references `USER(userID)`

3. **BOOKING**
   - Represents reservations.
   - Primary Key: `bookingID`
   - Foreign Keys: `guestID` references `USER(userID)`, `propertyID` references `PROPERTY(propertyID)`

4. **REVIEW**
   - Stores reviews for bookings.
   - Primary Key: `reviewID`
   - Foreign Key: `bookingID` references `BOOKING(bookingID)`

5. **AMENITY**
   - Lists available amenities.
   - Primary Key: `amenityID`

6. **PROPERTY_AMENITY**
   - Junction table for many-to-many relationship between properties and amenities.
   - Primary Key: Composite of `propertyID` and `amenityID`

7. **PROPERTY_IMAGE**
   - Stores images associated with properties.
   - Primary Key: `imageID`
   - Foreign Key: `propertyID` references `PROPERTY(propertyID)`

8. **PAYMENT**
   - Tracks payment transactions.
   - Primary Key: `paymentID`
   - Foreign Key: `bookingID` references `BOOKING(bookingID)`

## Indexes
Indexes are created on critical columns for improved query performance.

## Usage
To create the database schema, run the `schema.sql` file in your SQL database management system.