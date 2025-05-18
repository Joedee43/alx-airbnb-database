# 🚀 Index Performance Report

## 🎯 Objective
Improve query performance on `users`, `bookings`, and `properties` tables by identifying high-usage columns and creating indexes.

---

## 🔍 Step 1: Identify High-Usage Columns

| Table      | Column        | Use Case                          |
|------------|----------------|-----------------------------------|
| `bookings` | `user_id`      | JOIN with users, WHERE conditions |
| `bookings` | `property_id`  | JOIN with properties              |
| `reviews`  | `property_id`  | JOIN with properties              |
| `users`    | `email`        | Login, WHERE lookups              |
| `properties` | `city`       | Filtering/search by location      |

---

## 🧱 Step 2: Index Creation Summary

### Created Indexes:
```sql
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_reviews_property_id ON reviews(property_id);
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_properties_city ON properties(city);
