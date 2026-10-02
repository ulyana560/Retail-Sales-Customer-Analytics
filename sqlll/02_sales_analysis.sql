SELECT
    SUM("Sales") AS total_sales
FROM retail_sales_analysis;

SELECT
    AVG("Sales") AS average_sales
FROM retail_sales_analysis;

SELECT
    MIN("Sales") AS minimum_sales,
    MAX("Sales") AS maximum_sales
FROM retail_sales_analysis;

SELECT
    COUNT(DISTINCT "Order ID") AS total_orders
FROM retail_sales_analysis;

SELECT
    "Rok",
    SUM("Sales") AS total_sales
FROM retail_sales_analysis
GROUP BY "Rok"
ORDER BY "Rok";

SELECT
    "Miesiąc",
    SUM("Sales") AS total_sales
FROM retail_sales_analysis
GROUP BY "Miesiąc"
ORDER BY "Miesiąc";


SELECT
    "Rok",
    "Miesiąc",
    SUM("Sales") AS total_sales
FROM retail_sales_analysis
GROUP BY
    "Rok",
    "Miesiąc"
ORDER BY
    "Rok",
    "Miesiąc";

SELECT
    "Rok",
    SUM("Sales") AS total_sales,
    LAG(SUM("Sales")) OVER (
        ORDER BY "Rok"
    ) AS previous_year_sales
FROM retail_sales_analysis
GROUP BY "Rok"
ORDER BY "Rok";

SELECT
    "Rok",
    SUM("Sales") AS total_sales,
    LAG(SUM("Sales")) OVER (
        ORDER BY "Rok"
    ) AS previous_year_sales,
    ROUND(
        (
            SUM("Sales") - LAG(SUM("Sales")) OVER (
                ORDER BY "Rok"
            )
        ) / LAG(SUM("Sales")) OVER (
            ORDER BY "Rok"
        ) * 100,
        2
    ) AS yoy_growth_percent
FROM retail_sales_analysis
GROUP BY "Rok"
ORDER BY "Rok";

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
    "Product Name",
    SUM("Sales") AS total_sales
FROM retail_sales_analysis
GROUP BY "Product Name"
ORDER BY total_sales DESC
LIMIT 10;

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
    COUNT(DISTINCT "Customer ID") AS total_customers,
    SUM("Sales") AS total_sales,
    ROUND(
        SUM("Sales") / COUNT(DISTINCT "Customer ID"),
        2
    ) AS average_sales_per_customer
FROM retail_sales_analysis;

SELECT
    COUNT(DISTINCT "Order ID") AS total_orders,
    COUNT(DISTINCT "Customer ID") AS total_customers,
    ROUND(
        COUNT(DISTINCT "Order ID")::numeric
        / COUNT(DISTINCT "Customer ID"),
        2
    ) AS average_orders_per_customer
FROM retail_sales_analysis;

SELECT
    "Segment",
    SUM("Sales") AS total_sales
FROM retail_sales_analysis
GROUP BY "Segment"
ORDER BY total_sales DESC;

SELECT
    "Segment",
    COUNT(DISTINCT "Order ID") AS total_orders
FROM retail_sales_analysis
GROUP BY "Segment"
ORDER BY total_orders DESC;

SELECT
    "Segment",
    ROUND(
        SUM("Sales") / COUNT(DISTINCT "Order ID"),
        2
    ) AS average_order_value
FROM retail_sales_analysis
GROUP BY "Segment"
ORDER BY average_order_value DESC;

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
    ROUND(
        SUM("Sales") / COUNT(DISTINCT "Order ID"),
        2
    ) AS average_order_value
FROM retail_sales_analysis
GROUP BY "Region"
ORDER BY average_order_value DESC;

SELECT
    "Ship Mode",
    SUM("Sales") AS total_sales
FROM retail_sales_analysis
GROUP BY "Ship Mode"
ORDER BY total_sales DESC;

SELECT
    "Ship Mode",
    COUNT(DISTINCT "Order ID") AS total_orders
FROM retail_sales_analysis
GROUP BY "Ship Mode"
ORDER BY total_orders DESC;

SELECT
    ROUND(AVG("Ship Mode"), 2) AS average_shipping_days
FROM retail_sales_analysis;

SELECT 
    "Ship Mode",
    ROUND(AVG("Ship Date" - "Order Date"), 2) AS avg_shipping_time
FROM retail_sales_analysis
GROUP BY "Ship Mode"
ORDER BY avg_shipping_time;

SELECT
    EXTRACT(YEAR FROM "Order Date") AS year,
    EXTRACT(MONTH FROM "Order Date") AS month,
    ROUND(SUM("Sales"), 2) AS total_sales
FROM retail_sales_analysis
GROUP BY
    EXTRACT(YEAR FROM "Order Date"),
    EXTRACT(MONTH FROM "Order Date")
ORDER BY year, month;

WITH monthly_sales AS (
    SELECT
        EXTRACT(YEAR FROM "Order Date") AS year,
        EXTRACT(MONTH FROM "Order Date") AS month,
        SUM("Sales") AS total_sales
    FROM retail_sales_analysis
    GROUP BY
        EXTRACT(YEAR FROM "Order Date"),
        EXTRACT(MONTH FROM "Order Date")
),
ranked AS (
    SELECT
        year,
        month,
        total_sales,
        RANK() OVER (
            PARTITION BY year
            ORDER BY total_sales DESC
        ) AS ranking
    FROM monthly_sales
)
SELECT
    year,
    month,
    ROUND(total_sales, 2) AS total_sales
FROM ranked
WHERE ranking = 1
ORDER BY year;

WITH subcategory_sales AS (
    SELECT
        "Category",
        "Sub-Category",
        SUM("Sales") AS total_sales
    FROM retail_sales_analysis
    GROUP BY
        "Category",
        "Sub-Category"
),
ranked AS (
    SELECT
        "Category",
        "Sub-Category",
        total_sales,
        RANK() OVER (
            PARTITION BY "Category"
            ORDER BY total_sales DESC
        ) AS ranking
    FROM subcategory_sales
)
SELECT
    "Category",
    "Sub-Category",
    ROUND(total_sales, 2) AS total_sales
FROM ranked
WHERE ranking = 1
ORDER BY "Category";

SELECT
    "Category",
    ROUND(SUM("Sales"), 2) AS total_sales,
    ROUND(
        SUM("Sales") * 100.0 / SUM(SUM("Sales")) OVER (),
        2
    ) AS sales_share_percent
FROM retail_sales_analysis
GROUP BY "Category"
ORDER BY sales_share_percent DESC;

SELECT
    "Segment",
    ROUND(SUM("Sales"), 2) AS total_sales,
    ROUND(
        SUM("Sales") * 100.0 / SUM(SUM("Sales")) OVER (),
        2
    ) AS sales_share_percent
FROM retail_sales_analysis
GROUP BY "Segment"
ORDER BY sales_share_percent DESC;