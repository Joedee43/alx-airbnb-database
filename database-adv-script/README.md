# 📊 SQL Joins Practice

This project is designed to help learners **master SQL joins** by writing and understanding complex queries using different types of joins. It focuses on practical use cases like bookings, users, properties, and reviews in a relational database.

---

## 🧠 Objectives

- Learn how to write **INNER JOIN**, **LEFT JOIN**, and **FULL OUTER JOIN** queries.
- Understand real-world use cases of each join type.
- Retrieve meaningful data from multiple related tables.

---

## 📁 Tables Used

| Table Name  | Description                         |
|-------------|-------------------------------------|
| `users`     | Stores user information             |
| `bookings`  | Contains booking data made by users |
| `properties`| Lists rental properties              |
| `reviews`   | Holds user reviews of properties     |

---

## 🧩 SQL Queries

### 1. ✅ INNER JOIN — Bookings with Their Users

**Purpose:** Get all bookings along with the user who made them.

```sql
SELECT bookings.id AS booking_id, users.id AS user_id, users.name, bookings.date
FROM bookings
INNER JOIN users ON bookings.user_id = users.id;
