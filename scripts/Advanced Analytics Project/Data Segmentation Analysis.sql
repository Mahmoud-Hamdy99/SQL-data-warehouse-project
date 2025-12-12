/*
===============================================================================
Data Segmentation Analysis
===============================================================================
Purpose:
    - To group data into meaningful categories for targeted insights.
    - For customer segmentation, product categorization, or regional analysis.

SQL Functions Used:
    - CASE: Defines custom segmentation logic.
    - GROUP BY: Groups data into segments.
===============================================================================
*/

/*Group customers into three segments based on their spending behavior;
- VIP: at least 12 months of history and spending more than €5,000.
- Regular: at least 12 months of history but spending €5,000 or less.
- New: lifespan less than 12 months.
And find the total number of customers by each group.*/


WITH customer_spending AS (
	SELECT 
		C.customer_key,
		SUM(sales_amount) AS total_spending,
		MIN(order_date) AS first_order,
		MAX(order_date) AS last_order,
		DATEDIFF( MONTH , MIN(order_date) , MAX(order_date)) AS lifespan
	FROM gold.fact_sales S
	LEFT JOIN gold.dim_customers C ON S.customer_key = C.customer_key
	GROUP BY C.customer_key
)

SELECT 
	customer_segment,
	COUNT(customer_segment) as total_customers
FROM
	(SELECT 
		customer_key,
		CASE
			WHEN lifespan >= 12 AND total_spending > 5000 THEN 'VIP'
			WHEN lifespan >= 12 AND total_spending <= 5000 THEN 'Regular' 
			ELSE 'New'
		END AS customer_segment
	FROM customer_spending) t 

GROUP BY customer_segment
ORDER BY total_customers DESC

