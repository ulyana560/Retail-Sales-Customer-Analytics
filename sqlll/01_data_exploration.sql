SELECT COUNT(*) AS total_rows
FROM retail_sales_analysis;

SELECT *
FROM retail_sales_analysis
LIMIT 10;

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'retail_sales_analysis'
ORDER BY ordinal_position;

SELECT
    "Order Date",
    TO_DATE("Order Date", 'DD.MM.YYYY') AS order_date_correct
FROM retail_sales_analysis
LIMIT 10;

ALTER TABLE retail_sales_analysis
ALTER COLUMN "Order Date" TYPE date
USING TO_DATE("Order Date", 'DD.MM.YYYY');

ALTER TABLE retail_sales_analysis
ALTER COLUMN "Ship Date" TYPE date
USING TO_DATE("Ship Date", 'DD.MM.YYYY');

ALTER TABLE retail_sales_analysis
ALTER COLUMN "Sales" TYPE numeric
USING "Sales"::numeric;

SELECT "Sales"
FROM retail_sales_analysis
LIMIT 10;

ALTER TABLE retail_sales_analysis
ALTER COLUMN "Sales" TYPE numeric
USING "Sales"::numeric;

SELECT
    MIN("Order Date") AS first_order_date,
    MAX("Order Date") AS last_order_date
FROM retail_sales_analysis;

SELECT
    COUNT(*) AS missing_postal_code
FROM retail_sales_analysis
WHERE "Postal Code" IS NULL;

SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT ("Row ID", "Order ID", "Product ID", "Customer ID", "Order Date", "Sales")) AS unique_records
FROM retail_sales_analysis;
