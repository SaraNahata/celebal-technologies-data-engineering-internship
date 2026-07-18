-- Query1 : Total Revenue per Category
SELECT p.category,
ROUND(SUM(oi.quantity * oi.unit_price * (1 - oi.discount_percent/100)), 2) AS total_revenue
FROM order_items oi
JOIN products p
ON oi.product_id = p.product_id
GROUP BY p.category
ORDER BY total_revenue DESC;


-- Query 2: Top 10 customers by total expenditure

SELECT c.customer_id,
c.customer_name,
ROUND(SUM(oi.quantity * oi.unit_price * (1 - oi.discount_percent/100)), 2) AS total_spending
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_spending DESC
LIMIT 10;

-- Query 3: Monthly Order Count
SELECT DATE_FORMAT(order_date, '%Y-%m') AS order_month,
COUNT(order_id) AS total_orders
FROM orders
GROUP BY DATE_FORMAT(order_date, '%Y-%m')
ORDER BY order_month;