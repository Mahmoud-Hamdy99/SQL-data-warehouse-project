/*
===============================================================================
Date Range Exploration 
===============================================================================
Purpose:
    - To determine the temporal boundaries of key data points.
    - To understand the range of historical data.

SQL Functions Used:
    - MIN(), MAX(), DATEDIFF()
===============================================================================
*/


USE DataWarehouse

-- Determine the first and last order date and the total duration in months
SELECT 
	MIN(order_date) AS first_order_date ,
	MAX(order_date) AS last_order_date,
	DATEDIFF(YEAR,MIN(order_date), MAX(order_date)) AS order_range_years,
	DATEDIFF(Month,MIN(order_date), MAX(order_date)) AS order_range_months,
	DATEDIFF(DAY,MIN(order_date), MAX(order_date)) AS order_range_days
FROM gold.fact_sales;


-- Find the youngest and oldest customer based on birthdate
SELECT 
	MIN(birthdate) AS oldest_birthday,
	DATEDIFF(YEAR, MIN(birthdate) , GETDATE()) AS oldest_age,
	MAX(birthdate) AS last_shipping_date,
	DATEDIFF(YEAR, max(birthdate) , GETDATE()) AS youngest_age
FROM gold.dim_customers;
