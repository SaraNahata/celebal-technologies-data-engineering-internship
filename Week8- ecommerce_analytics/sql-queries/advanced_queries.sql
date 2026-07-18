-- Query 7: Running Totals with Window Functions

WITH daily_revenue AS (
SELECT o.region_code,
DATE(o.order_date) AS order_date,
SUM(oi.quantity * oi.unit_price * (1 - oi.discount_percent/100)) AS daily_revenue
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY o.region_code, DATE(o.order_date)
)

SELECT region_code,
order_date,
ROUND(daily_revenue, 2) AS daily_revenue,
ROUND(
SUM(daily_revenue) OVER(
PARTITION BY region_code
ORDER BY order_date
),
2
) AS running_total
FROM daily_revenue
ORDER BY region_code, order_date;

-- Query 8: Ranking Products with DENSE_RANK()
WITH product_revenue AS (
SELECT p.category,
p.product_name,
SUM(oi.quantity * oi.unit_price * (1 - oi.discount_percent/100)) AS total_revenue
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.category, p.product_name
)

SELECT category,
product_name,
ROUND(total_revenue, 2) AS total_revenue,
DENSE_RANK() OVER(
PARTITION BY category
ORDER BY total_revenue DESC
) AS rank_in_category
FROM product_revenue
ORDER BY category, rank_in_category;

-- Query 9: LAG Analysis
WITH customer_orders AS (
SELECT customer_id,
order_date,
LAG(order_date) OVER(
PARTITION BY customer_id
ORDER BY order_date
) AS previous_order_date
FROM orders
)

SELECT customer_id,
order_date,
previous_order_date,
DATEDIFF(order_date, previous_order_date) AS days_gap,
CASE
WHEN AVG(DATEDIFF(order_date, previous_order_date))
OVER(PARTITION BY customer_id) > 30
THEN 'At Risk'
ELSE 'Active'
END AS customer_status
FROM customer_orders
ORDER BY customer_id, order_date;

-- Query 10: CTE with Multiple Levels
WITH monthly_revenue AS (
SELECT o.customer_id,
DATE_FORMAT(o.order_date, '%Y-%m') AS month,
SUM(oi.quantity * oi.unit_price * (1 - oi.discount_percent/100)) AS revenue
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY o.customer_id, DATE_FORMAT(o.order_date, '%Y-%m')
),
customer_category AS (
SELECT customer_id,
month,
revenue,
CASE
WHEN revenue > 10000 THEN 'High'
WHEN revenue BETWEEN 5000 AND 10000 THEN 'Medium'
ELSE 'Low'
END AS category
FROM monthly_revenue
)

SELECT month,
category,
COUNT(customer_id) AS customer_count
FROM customer_category
GROUP BY month, category
ORDER BY month, category;

-- Query 11: NTILE() for Customer Segmentation
WITH customer_value AS (
SELECT o.customer_id,
SUM(oi.quantity * oi.unit_price * (1 - oi.discount_percent/100)) AS total_value
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY o.customer_id
)

SELECT customer_id,
ROUND(total_value,2) AS total_value,
NTILE(4) OVER(ORDER BY total_value DESC) AS quartile,
CASE
WHEN NTILE(4) OVER(ORDER BY total_value DESC)=1 THEN 'Platinum'
WHEN NTILE(4) OVER(ORDER BY total_value DESC)=2 THEN 'Gold'
WHEN NTILE(4) OVER(ORDER BY total_value DESC)=3 THEN 'Silver'
ELSE 'Bronze'
END AS quartile_label
FROM customer_value;

-- Query 12: Year-over-Year Revenue Comparison
WITH monthly_revenue AS (
SELECT DATE_FORMAT(order_date,'%Y-%m') AS month,
SUM(oi.quantity * oi.unit_price * (1 - oi.discount_percent/100)) AS revenue
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY DATE_FORMAT(order_date,'%Y-%m')
)

SELECT month,
ROUND(revenue,2) AS revenue,
LAG(revenue) OVER(ORDER BY month) AS prev_revenue,
ROUND(
((revenue - LAG(revenue) OVER(ORDER BY month))
/ LAG(revenue) OVER(ORDER BY month))*100,2) AS growth_percent
FROM monthly_revenue;

-- Query 13: First vs Last Purchase Category
WITH purchases AS (
SELECT o.customer_id,
o.order_date,
p.category,
ROW_NUMBER() OVER(PARTITION BY o.customer_id ORDER BY o.order_date) AS first_order,
ROW_NUMBER() OVER(PARTITION BY o.customer_id ORDER BY o.order_date DESC) AS last_order
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
JOIN products p
ON oi.product_id = p.product_id
)

SELECT f.customer_id,
f.category AS first_category,
l.category AS last_category,
CASE
WHEN f.category=l.category THEN 'No'
ELSE 'Yes'
END AS category_shift
FROM purchases f
JOIN purchases l
ON f.customer_id=l.customer_id
WHERE f.first_order=1
AND l.last_order=1;

-- Query 14: Cumulative Distribution
WITH customer_revenue AS (
SELECT o.customer_id,
SUM(oi.quantity * oi.unit_price * (1 - oi.discount_percent/100)) AS revenue
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY o.customer_id
)

SELECT customer_id,
ROUND(revenue,2) AS revenue,
ROUND(
SUM(revenue) OVER(ORDER BY revenue DESC),
2
) AS cumulative_revenue,
ROUND(
SUM(revenue) OVER(ORDER BY revenue DESC)
/ SUM(revenue) OVER()*100,
2
) AS cumulative_percent
FROM customer_revenue
ORDER BY revenue DESC;

-- Query 15: Cohort Analysis
WITH customer_cohort AS (
SELECT customer_id,
DATE_FORMAT(registration_date,'%Y-%m') AS cohort_month
FROM customers
)

SELECT cc.cohort_month,
TIMESTAMPDIFF(
MONTH,
c.registration_date,
o.order_date
) AS order_month,
COUNT(DISTINCT o.customer_id) AS customers
FROM customer_cohort cc
JOIN customers c
ON cc.customer_id=c.customer_id
JOIN orders o
ON c.customer_id=o.customer_id
GROUP BY cc.cohort_month, order_month
ORDER BY cc.cohort_month, order_month;

-- Query 16: Self Join with Window Function
SELECT p1.product_name AS product_a,
p2.product_name AS product_b,
COUNT(*) AS times_bought_together
FROM order_items oi1
JOIN order_items oi2
ON oi1.order_id=oi2.order_id
AND oi1.product_id<oi2.product_id
JOIN products p1
ON oi1.product_id=p1.product_id
JOIN products p2
ON oi2.product_id=p2.product_id
GROUP BY product_a, product_b
ORDER BY times_bought_together DESC;