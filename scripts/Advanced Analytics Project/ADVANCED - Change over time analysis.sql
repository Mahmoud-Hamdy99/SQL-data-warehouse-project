/*
===============================================================================
Change Over Time Analysis
===============================================================================
Purpose:
    - To track trends, growth, and changes in key metrics over time.
    - For time-series analysis and identifying seasonality.
    - To measure growth or decline over specific periods.

SQL Functions Used:
    - Date Functions: DATETRUNC(), FORMAT()
    - Aggregate Functions: SUM(), COUNT()
===============================================================================
*/

-- Analyse sales performance, number of customers and quantity by year
SELECT 
	YEAR(order_date) AS order_year,
	FORMAT(SUM(sales_amount), 'N0') AS total_sales,
	FORMAT(COUNT(DISTINCT customer_key), 'N0') AS total_customers,
	FORMAT(SUM(quantity), 'N0') AS total_quantity
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY YEAR(order_date) 
ORDER BY YEAR(order_date)

-- Analyse sales performance, number of customers and quantity by month 
SELECT 
	MONTH(order_date) AS order_month,
	FORMAT(SUM(sales_amount), 'N0') AS total_sales,
	FORMAT(COUNT(DISTINCT customer_key), 'N0') AS total_customers,
	FORMAT(SUM(quantity), 'N0') AS total_quantity
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY MONTH(order_date) 
ORDER BY MONTH(order_date)

-- Analyse sales performance, number of customers and quantity by date (year and month) 

SELECT 
	YEAR(order_date) AS order_month,
	MONTH(order_date) AS order_month,
	FORMAT(SUM(sales_amount), 'N0') AS total_sales,
	FORMAT(COUNT(DISTINCT customer_key), 'N0') AS total_customers,
	FORMAT(SUM(quantity), 'N0') AS total_quantity
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY YEAR(order_date), MONTH(order_date) 
ORDER BY YEAR(order_date), MONTH(order_date) 

-- Analyse sales performance, number of customers and quantity by date (year and month) 
-- using DATETRUN() FUNCTION

SELECT 
	DATETRUNC(MONTH , order_date) AS order_month,
	-- (order_date) AS order_month,
	FORMAT(SUM(sales_amount), 'N0') AS total_sales,
	FORMAT(COUNT(DISTINCT customer_key), 'N0') AS total_customers,
	FORMAT(SUM(quantity), 'N0') AS total_quantity
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY DATETRUNC(MONTH , order_date) 
ORDER BY DATETRUNC(MONTH , order_date)




