/*
===============================================================================
Measures Exploration (Key Metrics)
===============================================================================
Purpose:
    - To calculate aggregated metrics (e.g., totals, averages) for quick insights.
    - To identify overall trends or spot anomalies.

SQL Functions Used:
    - COUNT(), SUM(), AVG()
===============================================================================
*/

-- Find the Total Sales
SELECT SUM(sales_amount)AS total_sales FROM gold.fact_sales;

-- Find how many items are sold
SELECT SUM(quantity)AS total_quantity FROM gold.fact_sales;

-- Find the average selling price
SELECT AVG(price)AS average_price FROM gold.fact_sales;

-- Find the Total number of Orders
SELECT COUNT(order_number)AS total_orders FROM gold.fact_sales;
SELECT COUNT(DISTINCT(order_number))AS total_orders FROM gold.fact_sales;  -- Actual Number

-- Find the total number of products
SELECT COUNT(product_name) AS total_products FROM gold.dim_products;
SELECT COUNT(Distinct product_name) AS total_products FROM gold.dim_products; 

-- Find the total number of customers
SELECT COUNT(customer_id) AS total_customers FROM gold.dim_customers;
SELECT COUNT(DISTINCT customer_id) AS total_customers FROM gold.dim_customers;

-- Find the total number of customers that has placed an order
SELECT COUNT(customer_key) AS total_customers FROM gold.fact_sales;
SELECT COUNT(Distinct customer_key) AS total_customers FROM gold.fact_sales;  -- Actual Number


-- Generate a Report that shows all key metrics of the business
SELECT 'total_sales' AS measure_name, SUM(sales_amount)AS measure_value FROM gold.fact_sales
UNION ALL
SELECT 'total_quantity', SUM(quantity) FROM gold.fact_sales
UNION ALL
SELECT 'average_price' , AVG(price) FROM gold.fact_sales
UNION ALL
SELECT 'total_orders', COUNT(DISTINCT(order_number)) FROM gold.fact_sales
UNION ALL
SELECT 'total_products', COUNT(product_name) FROM gold.dim_products
UNION ALL
SELECT 'total_customers', COUNT(customer_id) FROM gold.dim_customers
UNION ALL
SELECT 'total_customers', COUNT(Distinct customer_key) FROM gold.fact_sales;  -- that has placed an order
