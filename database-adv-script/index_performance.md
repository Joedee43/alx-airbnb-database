-- Create index on user_id in bookings table (improves WHERE and JOIN performance)
CREATE INDEX idx_bookings_user_id ON bookings(user_id);

-- Create index on property_id in bookings table (used in JOIN and filtering)
CREATE INDEX idx_bookings_property_id ON bookings(property_id);

-- Create index on property_id in reviews table (used for JOINs and subqueries)
CREATE INDEX idx_reviews_property_id ON reviews(property_id);

-- Create index on email in users table (for login/authentication WHERE clauses)
CREATE INDEX idx_users_email ON users(email);

-- Create index on city in properties table (improves searches by city)
CREATE INDEX idx_properties_city ON properties(city);


---

### 🧠 Summary:
- Use `EXPLAIN` to see **execution strategy**.
- Use `EXPLAIN ANALYZE` (PostgreSQL) to see **timings**.
- Look for **"Using index"** or **"ref"** type.
- Create indexes on columns used in `WHERE`, `JOIN`, `ORDER BY`.

---

Let me know if you want a custom benchmark report using sample queries from your schema.
