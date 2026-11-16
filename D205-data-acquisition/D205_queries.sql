-- D205 Data Acquisition: average customer income by internet service type
-- PostgreSQL, run against the WGU "churn" database

-- B1. Create the add-on services table (FK to customer)
CREATE TABLE services (
    customer_id TEXT,
    internetservice TEXT,
    phone TEXT,
    multiple TEXT,
    onlinesecurity TEXT,
    onlinebackup TEXT,
    deviceprotection TEXT,
    techsupport TEXT,
    CONSTRAINT fk_customerid
        FOREIGN KEY (customer_id)
        REFERENCES customer(customer_id)
);

-- B2. Load the add-on CSV
COPY services (
    customer_id,
    internetservice,
    phone,
    multiple,
    onlinesecurity,
    onlinebackup,
    deviceprotection,
    techsupport)
FROM 'C:\LabFiles\Services.csv'
DELIMITER ','
CSV HEADER;

-- C. Average income per internet service type (window function)
SELECT DISTINCT
    s.internetservice,
    AVG(c.income) OVER (PARTITION BY s.internetservice) AS avgincome
FROM services s
LEFT JOIN customer c
    ON s.customer_id = c.customer_id;
