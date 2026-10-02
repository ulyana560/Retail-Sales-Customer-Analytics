SELECT
    COUNT(DISTINCT "Customer ID") AS total_customers
FROM retail_sales_analysis;

SELECT
    "Customer ID",
    "Customer Name",
    COUNT(DISTINCT "Order ID") AS total_orders
FROM retail_sales_analysis
GROUP BY
    "Customer ID",
    "Customer Name"
ORDER BY total_orders DESC;

SELECT
    "Customer ID",
    "Customer Name",
    SUM("Sales") AS total_sales
FROM retail_sales_analysis
GROUP BY
    "Customer ID",
    "Customer Name"
ORDER BY total_sales DESC;

SELECT
    "Customer ID",
    "Customer Name",
    ROUND(
        SUM("Sales") / COUNT(DISTINCT "Order ID"),
        2
    ) AS average_order_value
FROM retail_sales_analysis
GROUP BY
    "Customer ID",
    "Customer Name"
ORDER BY average_order_value DESC;

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
    "Customer ID",
    "Customer Name",
    COUNT(DISTINCT "Order ID") AS total_orders
FROM retail_sales_analysis
GROUP BY
    "Customer ID",
    "Customer Name"
ORDER BY total_orders DESC
LIMIT 10;

SELECT
    "Customer ID",
    "Customer Name",
    COUNT(DISTINCT "Order ID") AS total_orders
FROM retail_sales_analysis
GROUP BY
    "Customer ID",
    "Customer Name"
HAVING COUNT(DISTINCT "Order ID") = 1
ORDER BY "Customer Name";

SELECT
    "Customer ID",
    "Customer Name",
    COUNT(DISTINCT "Order ID") AS total_orders
FROM retail_sales_analysis
GROUP BY
    "Customer ID",
    "Customer Name"
HAVING COUNT(DISTINCT "Order ID") > 1
ORDER BY total_orders DESC;

SELECT
    COUNT(*) AS repeat_customers
FROM (
    SELECT
        "Customer ID"
    FROM retail_sales_analysis
    GROUP BY "Customer ID"
    HAVING COUNT(DISTINCT "Order ID") > 1
) AS customers;

SELECT
    "Segment",
    SUM("Sales") AS total_sales
FROM retail_sales_analysis
GROUP BY "Segment"
ORDER BY total_sales DESC;

SELECT
    "Customer ID",
    SUM("Sales") AS total_sales,
    RANK() OVER (ORDER BY SUM("Sales") DESC) AS customer_rank
FROM retail_sales_analysis
GROUP BY "Customer ID"
ORDER BY customer_rank;

SELECT
    "Customer ID",
    SUM("Sales") AS total_sales,
    NTILE(4) OVER (ORDER BY SUM("Sales") DESC) AS sales_group
FROM retail_sales_analysis
GROUP BY "Customer ID"
ORDER BY total_sales DESC;