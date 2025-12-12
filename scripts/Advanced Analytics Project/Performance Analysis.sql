/*
===============================================================================
Performance Analysis (Year-over-Year, Month-over-Month)
===============================================================================
Purpose:
    - To measure the performance of products, customers, or regions over time.
    - For benchmarking and identifying high-performing entities.
    - To track yearly trends and growth.

SQL Functions Used:
    - LAG(): Accesses data from previous rows.
    - AVG() OVER(): Computes average values within partitions.
    - CASE: Defines conditional logic for trend analysis.
===============================================================================
*/

/* Analyze the yearly performance of products by comparing their sales 
to both the average sales performance of the product and the previous year's sales */

WITH yearly_product_analysis AS (
	SELECT
		YEAR(order_date) AS order_year,
		product_name,
		SUM(sales_amount) AS current_sales
	FROM gold.fact_sales S
	LEFT JOIN gold.dim_products p ON S.product_key = P.product_key
	WHERE order_date IS NOT NULL
	GROUP BY YEAR(order_date) , product_name
)  
SELECT 
	order_year ,
	product_name,
	FORMAT(current_sales, 'N0') as current_sales,
	FORMAT(AVG(current_sales) OVER(PARTITION BY product_name),'N0') AS avg_sales,
	FORMAT(current_sales - AVG(current_sales) OVER(PARTITION BY product_name),'N0') AS diff_avg,
	CASE 
		WHEN current_sales - AVG(current_sales) OVER(PARTITION BY product_name) > 0 THEN 'above avg'
		WHEN current_sales- AVG(current_sales) OVER(PARTITION BY product_name) < 0 THEN 'below avg'
		ELSE 'avg'
	END AS  avg_change,

	--- Year-over-Year Analysis
	FORMAT(LAG(current_sales) OVER(PARTITION BY product_name ORDER BY order_year),'N0') AS previos_year_sales,
	FORMAT(current_sales - LAG(current_sales) OVER(PARTITION BY product_name ORDER BY order_year),'N0') AS diff_sales,
	CASE
		WHEN current_sales - LAG(current_sales) OVER(PARTITION BY product_name ORDER BY order_year) > 0 THEN 'Increase'
		WHEN current_sales - LAG(current_sales) OVER(PARTITION BY product_name ORDER BY order_year) < 0 THEN 'Decrease'
		ELSE 'No change'
	END AS previous_year_change

FROM yearly_product_analysis
ORDER BY product_name , order_year
