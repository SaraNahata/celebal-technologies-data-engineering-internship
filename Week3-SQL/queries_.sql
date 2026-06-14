SELECT COUNT(*) FROM superstore_raw;
SELECT * FROM superstore_raw LIMIT 5;

-- Step 1
DESCRIBE superstore_raw;

CREATE TABLE customers (
customer_id   VARCHAR(20),
customer_name VARCHAR(100),
segment       VARCHAR(50)
);

INSERT INTO customers
SELECT DISTINCT
    `Customer ID`,
    `Customer Name`,
    Segment
FROM superstore_raw;

CREATE TABLE products (
product_id    VARCHAR(30),
product_name  VARCHAR(255),
category      VARCHAR(50),
sub_category  VARCHAR(50)
);

INSERT INTO products
SELECT DISTINCT
    `Product ID`,
    `Product Name`,
    Category,
    `Sub-Category`
FROM superstore_raw;

CREATE TABLE orders (
    order_id     VARCHAR(20),
    order_date   VARCHAR(20),
    ship_date    VARCHAR(20),
    ship_mode    VARCHAR(50),
    customer_id  VARCHAR(20),
    sales        DECIMAL(10,2),
    quantity     INT,
    discount     DECIMAL(5,2),
    profit       DECIMAL(10,2)
);

INSERT INTO orders
SELECT DISTINCT
    `Order ID`,
    `Order Date`,
    `Ship Date`,
    `Ship Mode`,
    `Customer ID`,
    Sales,
    Quantity,
    Discount,
    Profit
FROM superstore_raw;

SELECT COUNT(*) FROM customers;
SELECT COUNT(*) FROM products;
SELECT COUNT(*) FROM orders;

-- STEP 2
-- Q1
-- all orders where sales are greater than the average sales
SELECT *, (SELECT AVG(sales) FROM orders) AS avg_sales
FROM orders
WHERE sales > (
    SELECT AVG(sales)
    FROM orders
);

-- Q2
-- the highest sales order for each customer
SELECT * FROM orders o
WHERE sales = ( SELECT MAX(sales) FROM orders
    WHERE customer_id = o.customer_id
);

-- Q3
-- total sales for each customer
WITH customer_sales AS (
    SELECT
	customer_id,
	SUM(sales) AS total_sales
    FROM orders
    GROUP BY customer_id
)
SELECT * FROM customer_sales;

-- Q4
-- customers whose total sales are above average
WITH customer_sales AS (
    SELECT customer_id, SUM(sales) AS total_sales
    FROM orders
    GROUP BY customer_id
)
SELECT *, (SELECT AVG(total_sales) FROM customer_sales) as avg_total_sales
FROM customer_sales
WHERE total_sales > ( SELECT AVG(total_sales) FROM customer_sales
);

-- Q5
-- customers ranked based on total sales
WITH customer_sales AS (
    SELECT customer_id, SUM(sales) AS total_sales
    FROM orders
    GROUP BY customer_id
)
SELECT
    customer_id,
    total_sales,
    RANK() OVER (ORDER BY total_sales DESC) AS sales_rank
FROM customer_sales;

-- Q6
-- assign row numbers to each order within a customer
SELECT customer_id, order_id, sales,
    ROW_NUMBER() OVER (
        PARTITION BY customer_id
        ORDER BY sales DESC
    ) AS row_num
FROM orders;

-- Q7
-- top 3 customers based on total sales
WITH customer_sales AS (
    SELECT
        customer_id,
        SUM(sales) AS total_sales
    FROM orders
    GROUP BY customer_id
),

ranked_customers AS (
    SELECT
        customer_id, total_sales,
        RANK() OVER (ORDER BY total_sales DESC) AS sales_rank
    FROM customer_sales
)

SELECT * FROM ranked_customers
WHERE sales_rank <= 3;

-- COMBINED QUERY
WITH customer_sales AS (
SELECT customer_id, SUM(sales) AS total_sales
FROM orders
GROUP BY customer_id
)

SELECT customer_name, total_sales,
RANK() OVER (ORDER BY total_sales DESC) AS rank_no
FROM customer_sales cs
JOIN customers c
ON cs.customer_id = c.customer_id;

-- MINI PROJECT
-- Q1 : TOP 5 CUSTOMERS
SELECT c.customer_name, SUM(o.sales) AS total_sales
FROM orders o
JOIN customers c
ON o.customer_id = c.customer_id
GROUP BY c.customer_name
ORDER BY total_sales DESC
LIMIT 5;

-- Q2: BOTTOM 5 CUSTOMERS
SELECT c.customer_name, SUM(o.sales) AS total_sales
FROM orders o
JOIN customers c
ON o.customer_id = c.customer_id
GROUP BY c.customer_name
ORDER BY total_sales
LIMIT 5;

-- Q3: CUSTOMERS WHO MADE ONLY ONE ORDER
SELECT o.customer_id, c.customer_name,  COUNT(o.order_id) AS no_of_orders
FROM orders o 
JOIN customers c
ON o.customer_id= c.customer_id
GROUP BY o.customer_id ,c.customer_name
HAVING COUNT(o.order_id) = 1;

-- Q4: CUSTOMERS WITH SALES ABOVE THAN AVERAGE
WITH customer_sales AS (
SELECT o.customer_id, c.customer_name, SUM(o.sales) AS total_sales
FROM orders o
JOIN customers c
ON o.customer_id = c.customer_id
GROUP BY o.customer_id, c.customer_name
)

SELECT customer_name, total_sales
FROM customer_sales
WHERE total_sales > (
SELECT AVG(total_sales)
FROM customer_sales
);

-- Q5 : HIGHEST ORDER VALUE PER CUSTOMER
SELECT c.customer_name, MAX(o.sales) AS highest_order_value
FROM orders o
JOIN customers c
ON o.customer_id = c.customer_id
GROUP BY c.customer_name;

