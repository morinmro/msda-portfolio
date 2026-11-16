# D211: Advanced Data Acquisition

I loaded an external broadband-access dataset into the PostgreSQL `churn` database, aggregated average broadband access by state in SQL, and connected Tableau to PostgreSQL through custom SQL. The resulting dashboard compares churn, bandwidth usage and broadband access across states.

| File | Description |
|---|---|
| [`D211_queries.sql`](D211_queries.sql) | Table creation, data load and aggregation queries |
| `D211_dashboard.twbx` | Packaged Tableau workbook |
| `data/state_abbreviations.csv` | State name/abbreviation lookup |

**Data:** [`../data/broadband_access.csv`](../data/broadband_access.csv) · **Tools:** PostgreSQL, Tableau
