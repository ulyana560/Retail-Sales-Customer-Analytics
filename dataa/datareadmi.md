## Dataset

### Dataset Overview

This project uses the **Superstore Sales Dataset**, a retail transaction dataset containing information about orders, customers, products, sales, shipping methods, and geographic locations.

The dataset is used to explore historical sales performance and identify patterns in customer, product, geographic, and shipping data.

### Dataset Coverage

* **Time period:** 2015–2018
* **Number of records:** 9,800
* **Number of columns:** 18
* **Unique orders:** 4,922
* **Unique customers:** 793
* **Unique products:** 1,861

The dataset contains approximately four years of historical order data, which makes it suitable for both business performance analysis and time-based analysis.

### Dataset Structure

The dataset contains the following groups of information:

**Order Information**

* `Row ID`
* `Order ID`
* `Order Date`
* `Ship Date`

**Customer Information**

* `Customer ID`
* `Customer Name`
* `Segment`

**Geographic Information**

* `Country`
* `City`
* `State`
* `Postal Code`
* `Region`

**Product Information**

* `Product ID`
* `Category`
* `Sub-Category`
* `Product Name`

**Sales Information**

* `Sales`

The dataset includes **3 product categories, 17 sub-categories, 4 regions, 49 states, and 529 cities**.

### Data Source

**Dataset:** Superstore Sales Dataset
**Source:** Kaggle

The dataset is publicly available and was downloaded from:

[Superstore Sales Dataset](https://www.kaggle.com/datasets/rohitsahoo/sales-forecasting/data)

### Data Quality

Before analysis, the dataset will be checked for:

* missing values;
* duplicate records;
* incorrect data types;
* date consistency;
* unusual or inconsistent values.

The original dataset contains **11 missing values in the `Postal Code` column**. No fully duplicated rows were identified.

Data preparation and transformation will be performed before the main SQL and Power BI analysis.

### Dataset Usage

The dataset will be used to:

* analyze sales trends over time;
* compare sales across products and categories;
* investigate customer segments and purchasing patterns;
* analyze sales by region, state, and city;
* examine shipping methods and delivery times;
* identify top-performing products and customers;
* prepare data for interactive Power BI reporting;
* explore historical sales patterns for short-term forecasting.
