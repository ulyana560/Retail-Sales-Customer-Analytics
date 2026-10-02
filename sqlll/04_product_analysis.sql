SELECT
    COUNT(DISTINCT "Product ID") AS total_products
FROM retail_sales_analysis;

SELECT
    "Category",
    COUNT(DISTINCT "Product ID") AS total_products
FROM retail_sales_analysis
GROUP BY "Category"
ORDER BY total_products DESC;

SELECT
    "Sub-Category",
    COUNT(DISTINCT "Product ID") AS total_products
FROM retail_sales_analysis
GROUP BY "Sub-Category"
ORDER BY total_products DESC;

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
    AVG(total_sales) AS average_sales_per_product
FROM (
    SELECT
        "Product ID",
        SUM("Sales") AS total_sales
    FROM retail_sales_analysis
    GROUP BY "Product ID"
) AS product_sales;

WITH product_sales AS (
    SELECT
        "Category",
        "Product ID",
        "Product Name",
        SUM("Sales") AS total_sales
    FROM retail_sales_analysis
    GROUP BY
        "Category",
        "Product ID",
        "Product Name"
),
ranked_products AS (
    SELECT
        *,
        ROW_NUMBER() OVER (
            PARTITION BY "Category"
            ORDER BY total_sales DESC
        ) AS product_rank
    FROM product_sales
)
SELECT
    "Category",
    "Product ID",
    "Product Name",
    total_sales
FROM ranked_products
WHERE product_rank = 1
ORDER BY "Category";

SELECT
    "Product ID",
    "Product Name",
    SUM("Sales") AS total_sales,
    ROUND(
        SUM("Sales") * 100.0 /
        SUM(SUM("Sales")) OVER (),
        2
    ) AS sales_share_percent
FROM retail_sales_analysis
GROUP BY
    "Product ID",
    "Product Name"
ORDER BY sales_share_percent DESC;

SELECT
    COUNT(DISTINCT "Product ID") AS products_with_sales
FROM retail_sales_analysis
WHERE "Sales" > 0;

SELECT
    EXTRACT(YEAR FROM "Order Date") AS order_year,
    "Product ID",
    "Product Name",
    SUM("Sales") AS total_sales
FROM retail_sales_analysis
GROUP BY
    EXTRACT(YEAR FROM "Order Date"),
    "Product ID",
    "Product Name"
ORDER BY
    order_year,
    total_sales DESC;