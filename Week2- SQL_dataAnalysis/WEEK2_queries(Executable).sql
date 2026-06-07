create database sales_db;
use sales_db;

CREATE TABLE customers (
    customer_id   INT           PRIMARY KEY,
    first_name    VARCHAR(50)   NOT NULL,
    last_name     VARCHAR(50)   NOT NULL,
    email         VARCHAR(100)  UNIQUE NOT NULL,
    city          VARCHAR(50)   NOT NULL,
    state         VARCHAR(50)   NOT NULL,
    join_date     DATE          NOT NULL,
    is_premium    BOOLEAN       DEFAULT FALSE
);

 -- Index for filtering by city/state

CREATE INDEX idx_customers_city ON customers(city);

CREATE INDEX idx_customers_state ON customers(state);

 CREATE TABLE products (
    product_id    INT           PRIMARY KEY,
    product_name  VARCHAR(100)  NOT NULL,
    category      VARCHAR(50)   NOT NULL,
    brand         VARCHAR(50)   NOT NULL,
    unit_price    DECIMAL(10,2) NOT NULL  CHECK (unit_price > 0),
    stock_qty     INT           NOT NULL  DEFAULT 0  CHECK (stock_qty >= 0)
 );

-- Index for filtering by category

CREATE INDEX idx_products_category ON products(category);

CREATE TABLE orders (
    order_id      INT           PRIMARY KEY,
    customer_id   INT           NOT NULL,
    order_date    DATE          NOT NULL,
    status        VARCHAR(20)   NOT NULL  DEFAULT 'Pending'
                      CHECK (status IN ('Pending','Shipped','Delivered','Cancelled')),
    total_amount  DECIMAL(12,2) NOT NULL  CHECK (total_amount >= 0),
    
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

 -- Index for date-based filtering and sorting

CREATE INDEX idx_orders_date ON orders(order_date);
CREATE INDEX idx_orders_status ON orders(status);

DESCRIBE customers;
DESCRIBE products;
DESCRIBE orders;
DESCRIBE order_items;

-- ========== INSERT: customers ========== 

INSERT INTO customers VALUES 
(101, 'Aarav',  'Sharma', 'aarav.s@email.com',  'Mumbai',    'Maharashtra', '2024-01-15', TRUE), 
(102, 'Priya',  'Patel',  'priya.p@email.com',  'Ahmedabad', 'Gujarat',     '2024-02-20', FALSE), 
(103, 'Rohan',  'Gupta',  'rohan.g@email.com',  'Delhi',     'Delhi',       '2024-03-10', TRUE), 
(104, 'Sneha',  'Reddy',  'sneha.r@email.com',  'Hyderabad', 'Telangana',   '2024-04-05', FALSE), 
(105, 'Vikram', 'Singh',  'vikram.s@email.com', 'Jaipur',    'Rajasthan',   '2024-05-12', TRUE), 
(106, 'Ananya', 'Iyer',   'ananya.i@email.com', 'Chennai',   'Tamil Nadu',  '2024-06-18', FALSE), 
(107, 'Karan',  'Mehta',  'karan.m@email.com',  'Pune',      'Maharashtra', '2024-07-22', TRUE), 
(108, 'Divya',  'Nair',   'divya.n@email.com',  'Kochi',     'Kerala',      '2024-08-30', FALSE); 

-- ========== INSERT: products ========== 

INSERT INTO products VALUES 
(201, 'Wireless Earbuds',     'Electronics', 'BoAt',          1499.00, 250), 
(202, 'Cotton T-Shirt',       'Clothing',    'Levis',         799.00,  500), 
(203, 'Smart Watch',          'Electronics', 'Noise',         2999.00, 150), 
(204, 'Running Shoes',        'Clothing',    'Nike',          4599.00, 120), 
(205, 'Bluetooth Speaker',    'Electronics', 'JBL',           3499.00, 200), 
(206, 'Bedsheet Set',         'Home',        'Spaces',        1299.00, 300), 
(207, 'Laptop Stand',         'Electronics', 'AmazonBasics',  899.00,  180), 
(208, 'Cushion Covers (Set)', 'Home',        'HomeCenter',    599.00,  400); 

-- ========== INSERT: orders ========== 

INSERT INTO orders VALUES 
(1001, 101, '2024-08-01', 'Delivered',  4498.00), 
(1002, 102, '2024-08-03', 'Delivered',  799.00), 
(1003, 103, '2024-08-05', 'Shipped',    7498.00), 
(1004, 101, '2024-08-10', 'Delivered',  3499.00), 
(1005, 104, '2024-08-12', 'Cancelled',  2999.00), 
(1006, 105, '2024-08-15', 'Delivered',  5898.00), 
(1007, 106, '2024-08-18', 'Pending',    1299.00), 
(1008, 103, '2024-08-20', 'Delivered',  899.00), 
(1009, 107, '2024-08-25', 'Shipped',    6098.00), 
(1010, 108, '2024-08-28', 'Delivered',  1598.00); 

-- ========== INSERT: order_items ==========

INSERT INTO order_items VALUES 
(5001, 1001, 201, 2, 1499.00, 0), 
(5002, 1001, 207, 1, 899.00,  10), 
(5003, 1002, 202, 1, 799.00,  0), 
(5004, 1003, 203, 1, 2999.00, 0), 
(5005, 1003, 204, 1, 4599.00, 5), 
(5006, 1004, 205, 1, 3499.00, 0), 
(5007, 1005, 203, 1, 2999.00, 0), 
(5008, 1006, 201, 1, 1499.00, 10), 
(5009, 1006, 204, 1, 4599.00, 5), 
(5010, 1007, 206, 1, 1299.00, 0), 
(5011, 1008, 207, 1, 899.00,  0), 
(5012, 1009, 205, 1, 3499.00, 0), 
(5013, 1009, 208, 2, 599.00,  15), 
(5014, 1010, 206, 1, 1299.00, 0), 
(5015, 1010, 208, 1, 599.00,  0); 

SELECT * FROM customers LIMIT 5;
SELECT * FROM products LIMIT 5;
SELECT * FROM orders LIMIT 5;
SELECT * FROM order_items LIMIT 5;

-- FILTERING (Q7-Q12)

SELECT * FROM orders WHERE status ='DELIVERED';
SELECT * FROM customers WHERE STATE="MAHARASHTRA";
SELECT * FROM customers WHERE STATE="DELHI";
SELECT * FROM PRODUCTS WHERE CATEGORY IN ('ELECTRONICS','HOME');

SELECT *
FROM orders
WHERE order_date BETWEEN '2024-08-10'
AND '2024-08-25'
AND status != 'Cancelled';

SELECT *
FROM products
WHERE category='Electronics'
AND unit_price > 2000;

-- AGGREGATION (GROUP BY, SUM, COUNT, AVG, MIN, MAX) (Q13-Q18)

SELECT COUNT(*) AS TOTAL_ORDERS FROM ORDERS;

SELECT SUM(total_amount) AS TOTAL_REVENUE FROM ORDERS
WHERE STATUS='DELIVERED';

SELECT category,AVG(unit_price) AS AVG_UNIT_PRICE
FROM products
GROUP BY category;

-- Quantity Sold Per Product

SELECT
product_id,
SUM(quantity) AS total_quantity
FROM order_items
GROUP BY product_id;

-- count of orders and total revenue, sorted by revenue descending

SELECT status,
COUNT(*) AS TOTAL_ORDERS,
SUM(total_amount) AS TOTAL_REVENUE
FROM orders
GROUP BY STATUS
ORDER BY total_revenue DESC;

-- most expensive and cheapest product in each category

SELECT category,
MAX(unit_price) AS most_expensive,
MIN(unit_price) AS cheapest
FROM products
GROUP BY category;

-- categories where average unit price is greater than ₹2000

SELECT
category,
AVG(unit_price) AS avg_price
FROM products
GROUP BY category
HAVING AVG(unit_price) > 2000;

-- JOINS (Q19,Q20,Q21) (Q22,23- THEORY)

-- Q19
-- INNER JOIN: Show each order along with the customer's first name, last name, order date, and total amount.

SELECT
o.order_id,
o.order_date,
c.first_name,
c.last_name,
o.total_amount
FROM orders o
INNER JOIN customers c
    ON o.customer_id = c.customer_id;

-- Q20
-- LEFT JOIN: List ALL customers and their orders. Customers without any orders will also appear,with NULL values in the order-related columns.

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    o.order_id,
    o.order_date,
    o.status,
    o.total_amount
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
ORDER BY c.customer_id;

-- Q21
-- JOIN across three tables:orders , order_items , products
-- Display order ID, product name, quantity purchased,unit price, and discount percentage for each order item.

SELECT
o.order_id,
p.product_name,
oi.quantity,
oi.unit_price,
oi.discount_pct
FROM orders o
INNER JOIN order_items oi
    ON o.order_id = oi.order_id
INNER JOIN products p
    ON oi.product_id = p.product_id
ORDER BY o.order_id;

-- SORTING AND LIMITING

-- Top 5 Products by Quantity Sold

SELECT
product_id,
SUM(quantity) AS qty_sold
FROM order_items
GROUP BY product_id
ORDER BY qty_sold DESC
LIMIT 5;

-- BUSINESS USE CASES

-- Monthly Sales Trend

SELECT
DATE_FORMAT(order_date,'%Y-%m') AS month,
COUNT(*) AS orders,
SUM(total_amount) AS revenue
FROM orders
GROUP BY month
ORDER BY month;

-- Top Customers

SELECT
c.customer_id,
CONCAT(c.first_name,' ',c.last_name) AS customer_name,
SUM(o.total_amount) AS total_spent
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, customer_name
ORDER BY total_spent DESC
LIMIT 5;

-- Duplicate Orders Check

SELECT
order_id,
COUNT(*)
FROM orders
GROUP BY order_id
HAVING COUNT(*) > 1;

-- CASE AND TRANSACTIONS (Q24-Q27)

-- Q24
-- Classify products into Budget, Mid-Range, and Premium based on their unit price using CASE.

SELECT product_name, unit_price,
    CASE
        WHEN unit_price < 1000 THEN 'Budget'
        WHEN unit_price BETWEEN 1000 AND 3000 THEN 'Mid-Range'
        ELSE 'Premium'
    END AS price_tier
FROM products;


-- Q25
-- Count Delivered and Not Delivered orders (single row) using CASE inside aggregate functions.

SELECT
    SUM(CASE WHEN status = 'Delivered' THEN 1 ELSE 0 END) AS delivered_orders,
    SUM(CASE WHEN status != 'Delivered' THEN 1 ELSE 0 END) AS not_delivered_orders
FROM orders;

-- Q27  partially done , hence commented
-- START TRANSACTION;

-- INSERT INTO orders
-- (order_id, customer_id, order_date, status, total_amount)
-- VALUES
-- (1011, 102, CURRENT_DATE, 'Pending', 1598.00);
-- UPDATE products
-- SET stock_qty = stock_qty - 1
-- WHERE product_id = 206;

-- UPDATE products
-- SET stock_qty = stock_qty - 1
-- WHERE product_id = 208;
-- COMMIT;

-- Validate results (row counts, data quality)

SELECT COUNT(*) FROM customers;
SELECT COUNT(*) FROM products;
SELECT COUNT(*) FROM orders;
SELECT COUNT(*) FROM order_items;

-- Missing Values

SELECT *
FROM customers
WHERE first_name IS NULL
OR email IS NULL;


-- Invalid Entries

SELECT *
FROM products
WHERE unit_price <= 0;

