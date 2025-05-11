# Normalization to Third Normal Form (3NF)

## Objective
To apply normalization principles to ensure the database schema for the vacation rental system is in Third Normal Form (3NF).

## Steps to Achieve 3NF

### 1. Identify Redundancies and Violations
- **USER Table:**
  - Contains user details. No redundancy observed.

- **PROPERTY Table:**
  - Contains hostID (FK to USER). No redundancy observed.
  
- **BOOKING Table:**
  - Contains guestID (FK to USER) and propertyID (FK to PROPERTY). No redundancy observed.

- **REVIEW Table:**
  - Contains bookingID (FK). No redundancy observed.

- **AMENITY Table:**
  - Contains amenity details. No redundancy observed.

- **PROPERTY_AMENITY Table:**
  - Junction table for many-to-many relationships. No redundancy observed.

- **PROPERTY_IMAGE Table:**
  - Contains all necessary image details. No redundancy observed.

- **PAYMENT Table:**
  - Contains bookingID (FK) and payment details. No redundancy observed.

### 2. Check for Transitive Dependencies
- Ensure no non-key attributes depend on other non-key attributes:
  - All attributes in each table depend solely on the primary key.

### 3. Adjustments Made
- After reviewing each table, no changes were necessary as all tables already comply with 3NF.

## Conclusion
The database schema for the vacation rental system is structured effectively and adheres to the Third Normal Form (3NF) principles, eliminating redundancies and ensuring all non-key attributes are fully functionally dependent on the primary key.