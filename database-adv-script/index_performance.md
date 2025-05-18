# SQL Indexing and Performance Measurement

## Overview
This document outlines the process of creating indexes for specific columns in a database and measuring query performance before and after the addition of these indexes.

## Creating Indexes

### Recommended Indexes

1. **Index on Bookings Table (user_id)**
   ```sql
   CREATE INDEX idx_user_id ON bookings(user_id);