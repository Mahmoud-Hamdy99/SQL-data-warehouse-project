/*
===============================================================================
Cumulative Analysis
===============================================================================
Purpose:
    - To calculate running totals or moving averages for key metrics.
    - To track performance over time cumulatively.
    - Useful for growth analysis or identifying long-term trends.

SQL Functions Used:
    - Window Functions: SUM() OVER(), AVG() OVER()
===============================================================================
*/

-- Calculate the total sales and price per month 
-- the running total of sales over time and moving average of price

SELECT 
	DATETRUNC(YEAR , order_date) as order_month,
	FORMAT(SUM(sales_amount), 'N0') AS total_sales,
	FORMAT(AVG(price), 'N0') AS avg_price,
	FORMAT(SUM(SUM(sales_amount)) OVER (ORDER BY DATETRUNC(YEAR, order_date)), 'N0' ) AS running_total_sales,
	FORMAT(AVG(AVG(sales_amount)) OVER (ORDER BY DATETRUNC(YEAR, order_date)), 'N0' ) AS moving_average_price

FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY DATETRUNC(YEAR , order_date) 
ORDER BY DATETRUNC(YEAR, order_date);

