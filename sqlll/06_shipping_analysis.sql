SELECT
    AVG("Shipping Date ") AS average_shipping_days
FROM retail_sales_analysis;

SELECT
    "Ship Mode",
    AVG("Shipping Date ") AS average_shipping_days
FROM retail_sales_analysis
GROUP BY "Ship Mode"
ORDER BY average_shipping_days;

SELECT
    "Ship Mode",
    COUNT(DISTINCT "Order ID") AS total_orders
FROM retail_sales_analysis
GROUP BY "Ship Mode"
ORDER BY total_orders DESC;

SELECT
    "Ship Mode",
    SUM("Sales") AS total_sales
FROM retail_sales_analysis
GROUP BY "Ship Mode"
ORDER BY total_sales DESC;

SELECT
    "Ship Mode",
    AVG(order_sales) AS average_order_value
FROM (
    SELECT
        "Ship Mode",
        "Order ID",
        SUM("Sales") AS order_sales
    FROM retail_sales_analysis
    GROUP BY
        "Ship Mode",
        "Order ID"
) AS orders
GROUP BY "Ship Mode"
ORDER BY average_order_value DESC;

SELECT
    "Shipping Date ",
    COUNT(DISTINCT "Order ID") AS total_orders
FROM retail_sales_analysis
GROUP BY "Shipping Date "
ORDER BY "Shipping Date ";

SELECT
    CASE
        WHEN "Shipping Date " <= 2 THEN 'Fast'
        WHEN "Shipping Date " <= 5 THEN 'Medium'
        ELSE 'Slow'
    END AS shipping_category,
    COUNT(DISTINCT "Order ID") AS total_orders
FROM retail_sales_analysis
GROUP BY shipping_category
ORDER BY total_orders DESC;

SELECT
    CASE
        WHEN "Shipping Date " <= 2 THEN 'Fast'
        WHEN "Shipping Date " <= 5 THEN 'Medium'
        ELSE 'Slow'
    END AS shipping_category,
    SUM("Sales") AS total_sales
FROM retail_sales_analysis
GROUP BY shipping_category
ORDER BY total_sales DESC;

SELECT
    "Region",
    AVG("Shipping Date ") AS average_shipping_days
FROM retail_sales_analysis
GROUP BY "Region"
ORDER BY average_shipping_days;

SELECT
    "Category",
    AVG("Shipping Date ") AS average_shipping_days
FROM retail_sales_analysis
GROUP BY "Category"
ORDER BY average_shipping_days;

SELECT
    "Order ID",
    "Order Date",
    "Ship Date",
    "Ship Mode",
    "Region",
    "Shipping Date ",
    "Sales"
FROM retail_sales_analysis
WHERE "Shipping Date " > 5
ORDER BY "Shipping Date " DESC;

SELECT
    "Region",
    "Ship Mode",
    AVG("Shipping Date ") AS average_shipping_days,
    COUNT(DISTINCT "Order ID") AS total_orders
FROM retail_sales_analysis
GROUP BY
    "Region",
    "Ship Mode"
ORDER BY
    "Region",
    average_shipping_days;