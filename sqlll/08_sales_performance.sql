SELECT
    "Category",
    SUM("Sales") AS total_sales
FROM retail_sales_analysis
GROUP BY "Category"
ORDER BY total_sales DESC;

SELECT
    "Sub-Category",
    SUM("Sales") AS total_sales
FROM retail_sales_analysis
GROUP BY "Sub-Category"
ORDER BY total_sales DESC;

WITH order_sales AS (
    SELECT
        "Order ID",
        SUM("Sales") AS order_value
    FROM retail_sales_analysis
    GROUP BY "Order ID"
)
SELECT
    AVG(order_value) AS average_order_value
FROM order_sales;

SELECT
    "Segment",
    SUM("Sales") AS total_sales,
    COUNT(DISTINCT "Order ID") AS total_orders,
    COUNT(DISTINCT "Customer ID") AS total_customers
FROM retail_sales_analysis
GROUP BY "Segment"
ORDER BY total_sales DESC;

SELECT
    "Category",
    SUM("Sales") AS total_sales,
    ROUND(
        SUM("Sales") * 100.0 /
        SUM(SUM("Sales")) OVER (),
        2
    ) AS sales_share_percent
FROM retail_sales_analysis
GROUP BY "Category"
ORDER BY sales_share_percent DESC;

SELECT
    "Customer ID",
    "Customer Name",
    SUM("Sales") AS total_sales
FROM retail_sales_analysis
GROUP BY
    "Customer ID",
    "Customer Name"
ORDER BY total_sales DESC
LIMIT 10;

SELECT
    "Product ID",
    "Product Name",
    SUM("Sales") AS total_sales
FROM retail_sales_analysis
GROUP BY
    "Product ID",
    "Product Name"
ORDER BY total_sales DESC
LIMIT 10;

SELECT
    "Product ID",
    "Product Name",
    SUM("Sales") AS total_sales
FROM retail_sales_analysis
GROUP BY
    "Product ID",
    "Product Name"
ORDER BY total_sales
LIMIT 10;

SELECT
    "Rok" AS order_year,
    SUM("Sales") AS total_sales
FROM retail_sales_analysis
GROUP BY "Rok"
ORDER BY order_year;

SELECT
    "Rok" AS order_year,
    "Category",
    SUM("Sales") AS total_sales
FROM retail_sales_analysis
GROUP BY
    "Rok",
    "Category"
ORDER BY
    order_year,
    total_sales DESC;

WITH product_sales AS (
    SELECT
        "Product ID",
        SUM("Sales") AS total_sales
    FROM retail_sales_analysis
    GROUP BY "Product ID"
),
top_products AS (
    SELECT
        total_sales
    FROM product_sales
    ORDER BY total_sales DESC
    LIMIT 10
)
SELECT
    ROUND(
        SUM(total_sales) * 100.0 /
        (SELECT SUM(total_sales) FROM product_sales),
        2
    ) AS top_10_sales_share_percent
FROM top_products;