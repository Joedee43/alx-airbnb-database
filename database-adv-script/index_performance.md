Indexing Performance Report
This report summarizes the performance improvements observed after adding indexes to the users, bookings, and properties tables.

Users Table (filter on email)
Before Index: Sequential scan with 5 rows removed by filter.

After Index: Still uses sequential scan unless explicitly forced.

With Forced Index Scan:

Execution Time increased from ~0.034 ms to ~0.085 ms.

Due to small table size (6 rows), index scanning introduces overhead.

Bookings Table (filter on property_id)
Before Index: Sequential scan removing 3 rows, returning 4 rows.

After Index: Still uses sequential scan.

With Forced Index Scan:

Execution Time increased slightly from ~0.036 ms to ~0.081 ms.

Index scan is slightly slower due to small data size.

Properties Table (filter on property_id)
Before Index: Sequential scan removing 3 rows.

After Index: Still uses sequential scan.

With Forced Index Scan:

Execution Time increased from ~0.034 ms to ~0.098 ms.

Key Findings
Indexes do not offer performance benefits on small tables, as the PostgreSQL planner favors sequential scans, which are more efficient in such cases.

Forcing index usage results in higher execution time, likely due to the overhead of navigating B-tree structures versus scanning a few rows.

Planning times remain consistently low across all tests, indicating the overhead lies in the execution phase rather than query planning.

Conclusion
The experiment confirms that while indexing is a powerful tool for query optimization, its benefits are minimal for small tables due to the overhead involved in index scanning. However, setting up indexes now is a proactive measure that will ensure performance scalability as data volume increases.