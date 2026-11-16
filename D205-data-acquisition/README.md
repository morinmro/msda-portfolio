# D205: Data Acquisition

**Question:** What is the average income of customers for each type of internet service?

**Approach:** I designed an add-on `services` table with a foreign key to the existing `customer` table, loaded it from CSV with `COPY`, and wrote a query that uses a window function (`AVG() OVER (PARTITION BY …)`) to compute average income per internet service type.

**Result:** Average income was similar across service types: DSL ≈ $40.5K, Fiber Optic ≈ $39.3K, None ≈ $39.7K ([`output/churn_avgincome.csv`](output/churn_avgincome.csv)).

| File | Description |
|---|---|
| [`D205_queries.sql`](D205_queries.sql) | Table DDL, CSV load and analysis query |

**Tools:** PostgreSQL, pgAdmin
