/*
===============================================================================
Ranking Analysis
===============================================================================
Purpose:
    - To rank items (e.g., products, customers) based on performance or other metrics.
    - To identify top performers or laggards.

SQL Functions Used:
    - Window Ranking Functions: RANK(), DENSE_RANK(), ROW_NUMBER(), TOP
    - Clauses: GROUP BY, ORDER BY
===============================================================================
*/

USE DataWarehouse

-- Which 5 products Generating the Highest Revenue?
-- Simple Ranking

SELECT TOP 5
	product_name, 
	SUM(sales_amount) AS total_revenue
FROM gold.fact_sales fs
LEFT JOIN GOLD.dim_products dp
	ON FS.product_key = dp.product_key
GROUP BY product_name
ORDER BY total_revenue DESC

-- Complex but Flexibly Ranking Using Window Functions
	
SELECT *
FROM 
	(SELECT
		dp.product_name,
		SUM(sales_amount) AS total_revenue,
		RANK() over( ORDER BY  SUM(sales_amount) DESC) AS rank_products
	FROM gold.fact_sales fs
	LEFT JOIN GOLD.dim_products dp
		ON FS.product_key = dp.product_key
	GROUP BY product_name
) AS ranked_products

WHERE rank_products <= 5;

-- What are the 5 worst-performing products in terms of sales?
-- Simple Ranking

SELECT TOP 5
    p.product_name,
    SUM(f.sales_amount) AS total_revenue
FROM gold.fact_sales f
LEFT JOIN gold.dim_products p
    ON p.product_key = f.product_key
GROUP BY p.product_name
ORDER BY total_revenue;

-- Complex but Flexibly Ranking Using Window Functions
SELECT *
FROM 
	(SELECT
		dp.product_name,
		SUM(sales_amount) AS total_revenue,
		RANK() over( ORDER BY  SUM(sales_amount) ) AS rank_products
	FROM gold.fact_sales fs
	LEFT JOIN GOLD.dim_products dp
		ON FS.product_key = dp.product_key
	GROUP BY product_name
) AS ranked_products

WHERE rank_products <= 5;

-- Find the top 10 customers who have generated the highest revenue
SELECT TOP 10
	c.customer_key,
    c.first_name,
    c.last_name,
	SUM(f.sales_amount) AS total_revenue
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
    ON c.customer_key = f.customer_key
GROUP BY	
	c.customer_key,
    c.first_name,
    c.last_name
ORDER BY total_revenue DESC;


-- Find the top 10 customers who have generated the lowest revenue

SELECT TOP 10
	c.customer_key,
    c.first_name,
    c.last_name,
	SUM(f.sales_amount) AS total_revenue
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
    ON c.customer_key = f.customer_key
GROUP BY	
	c.customer_key,
    c.first_name,
    c.last_name
ORDER BY total_revenue;


-- The 3 customers with the fewest orders placed

SELECT TOP 3
	c.customer_key,
    c.first_name,
    c.last_name,
	COUNT(DISTINCT f.order_number) AS total_orders
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
    ON c.customer_key = f.customer_key
GROUP BY	
	c.customer_key,
    c.first_name,
    c.last_name
ORDER BY total_orders ;
