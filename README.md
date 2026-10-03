# Retail Sales & Customer Analytics

## About the Project

This project focuses on analyzing retail sales data to identify key sales trends, understand customer behavior, evaluate product performance, and explore geographic and shipping patterns.

The project is designed as an end-to-end data analytics workflow, combining **SQL** for data analysis and **Power BI** for data modeling, visualization, and interactive reporting.

The final goal is to transform raw transactional data into meaningful business insights and present them through an interactive Power BI report.

## Project Objectives

* Analyze historical sales performance and trends
* Identify top-performing products, categories, and sub-categories
* Analyze customer segments and purchasing behavior
* Compare sales performance across regions
* Explore shipping methods and delivery patterns
* Identify important patterns and trends in the data
* Build an interactive Power BI report with relevant KPIs and visualizations
* Develop a short-term sales forecast based on historical sales patterns

## Key Business Questions

### Sales Performance

* How do sales change over time?
* Which periods generate the highest sales?
* Which categories contribute the most to total sales?
* Are there noticeable trends in sales over time?

### Customer Analysis

* Which customer segments generate the most sales?
* Which customers have the highest sales?
* How are sales distributed across customer segments?
* What proportion of customers are repeat customers?
* How are customers distributed across regions?

### Product Analysis

* Which products generate the highest sales?
* Which product categories perform best?
* Which products appear among the top-performing products?

### Geographic Analysis

* Which regions generate the highest sales?
* How are customers distributed across regions?
* Are there differences in sales performance between regions?

### Shipping Analysis

* Which shipping methods are used most frequently?
* How long does it take to ship orders on average?
* Which shipping methods generate the highest sales?

### Forecasting

* What patterns can be identified in historical monthly sales?
* What short-term sales trend is indicated by the Power BI forecast?

## Tools & Technologies

* **SQL** — data analysis and business queries
* **Power Query** — data preparation and transformation
* **Power BI** — data modeling, DAX, visualization, and reporting
* **Excel / CSV** — source data
* **GitHub** — project documentation and version control

## Project Workflow

```text
Raw Data
   ↓
Data Preparation
   ↓
SQL Analysis
   ↓
Data Modeling
   ↓
DAX Measures
   ↓
Power BI Report
   ↓
Sales Forecasting
   ↓
Business Insights
   ↓
Final Conclusions
```

## Power BI Dashboard

The Power BI report consists of three main pages.

### 1. Sales Overview

The first page provides a high-level overview of sales performance.

Key elements include:

* Total Sales
* Total Orders
* Total Customers
* Total Products
* Average Order Value
* Monthly Sales Trend
* Sales by Region
* Sales by Segment
* Sales by Category
* Interactive filters for Year, Region, and Category

### 2. Customer & Product Analytics

The second page focuses on customer and product performance.

Key elements include:

* Total Customers
* Total Orders
* Average Order Value
* Repeat Customer Rate
* Top 10 Customers by Sales
* Top 10 Products by Sales
* Sales by Segment
* Orders by Segment
* Customers by Region
* Interactive Segment filter

### 3. Operations & Forecast

The third page focuses on shipping performance and future sales trends.

Key elements include:

* Average Shipping Days
* Orders by Ship Mode
* Sales by Ship Mode
* Monthly Sales Trend
* Short-term Sales Forecast

## Key Results

The current Power BI dashboard provides the following high-level results:

* Total sales amount to approximately **2.26 million**.
* The dataset contains approximately **5,000 orders** and **793 customers**.
* The average order value is approximately **459.48**.
* The **West** region generates the highest sales among the analyzed regions.
* The **Consumer** segment generates the highest sales among the analyzed customer segments.
* **Technology** is the highest-selling category in the dashboard.
* **Standard Class** is the most frequently used shipping method and generates the highest sales among shipping methods.
* The average shipping time is approximately **3.96 days**.
* The dashboard shows a clear upward movement in sales over the analyzed period, with fluctuations between individual months.
* The Power BI forecast extends the historical monthly sales trend into the short term.

## Project Structure

```text
retail-sales-analysis/
│
├── sql/
│   ├── 01_basic_checks.sql
│   ├── 02_customer_analysis.sql
│   ├── 03_product_analysis.sql
│   ├── ...
│   ├── 08_sales_performance.sql
│   └── 09_final_business_analysis.sql
│
├── powerbi/
│   └── Retail_Sales_Analytics.pbix
│
├── data/
│
└── README.md
```

## Project Status

**Completed**

The project includes data preparation, SQL analysis, Power BI data modeling, DAX measures, interactive dashboards, and short-term sales forecasting.

## Conclusion

The project demonstrates an end-to-end approach to retail data analysis, from data preparation and SQL-based exploration to Power BI data modeling, visualization, and forecasting.

The final dashboard provides an interactive view of sales performance, customer and product behavior, regional differences, shipping patterns, and historical sales trends. The combination of SQL and Power BI demonstrates the use of both analytical querying and business intelligence tools to transform transactional data into actionable insights.
