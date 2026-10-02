SELECT
    "Region",
    SUM("Sales") AS total_sales
FROM retail_sales_analysis
GROUP BY "Region"
ORDER BY total_sales DESC;

SELECT
    "Region",
    COUNT(DISTINCT "Order ID") AS total_orders
FROM retail_sales_analysis
GROUP BY "Region"
ORDER BY total_orders DESC;

SELECT
    "Region",
    COUNT(DISTINCT "Customer ID") AS total_customers
FROM retail_sales_analysis
GROUP BY "Region"
ORDER BY total_customers DESC;

SELECT
    "Region",
    AVG(order_sales) AS average_order_value
FROM (
    SELECT
        "Region",
        "Order ID",
        SUM("Sales") AS order_sales
    FROM retail_sales_analysis
    GROUP BY
        "Region",
        "Order ID"
) AS orders
GROUP BY "Region"
ORDER BY average_order_value DESC;

SELECT
    "State",
    SUM("Sales") AS total_sales
FROM retail_sales_analysis
GROUP BY "State"
ORDER BY total_sales DESC;

SELECT
    "City",
    SUM("Sales") AS total_sales
FROM retail_sales_analysis
GROUP BY "City"
ORDER BY total_sales DESC
LIMIT 10;

SELECT
    "City",
    COUNT(DISTINCT "Order ID") AS total_orders
FROM retail_sales_analysis
GROUP BY "City"
ORDER BY total_orders DESC
LIMIT 10;

SELECT
    "Region",
    SUM("Sales") AS total_sales,
    ROUND(
        SUM("Sales") * 100.0 /
        SUM(SUM("Sales")) OVER (),
        2
    ) AS sales_share_percent
FROM retail_sales_analysis
GROUP BY "Region"
ORDER BY sales_share_percent DESC;

SELECT
    "Region",
    "Category",
    SUM("Sales") AS total_sales
FROM retail_sales_analysis
GROUP BY
    "Region",
    "Category"
ORDER BY
    "Region",
    total_sales DESC;

WITH regional_category_sales AS (
    SELECT
        "Region",
        "Category",
        SUM("Sales") AS total_sales
    FROM retail_sales_analysis
    GROUP BY
        "Region",
        "Category"
),
ranked_categories AS (
    SELECT
        *,
        ROW_NUMBER() OVER (
            PARTITION BY "Region"
            ORDER BY total_sales DESC
        ) AS category_rank
    FROM regional_category_sales
)
SELECT
    "Region",
    "Category",
    total_sales
FROM ranked_categories
WHERE category_rank = 1
ORDER BY "Region";

SELECT
    "Region",
    "State",
    SUM("Sales") AS total_sales
FROM retail_sales_analysis
GROUP BY
    "Region",
    "State"
ORDER BY
    "Region",
    total_sales DESC;

SELECT
    EXTRACT(YEAR FROM "Order Date") AS order_year,
    "Region",
    SUM("Sales") AS total_sales
FROM retail_sales_analysis
GROUP BY
    EXTRACT(YEAR FROM "Order Date"),
    "Region"
ORDER BY
    order_year,
    total_sales DESC;