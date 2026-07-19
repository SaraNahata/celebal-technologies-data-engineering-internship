CREATE TABLE customers (
    customer_id VARCHAR(10) PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    registration_date DATE,
    customer_type ENUM('REGULAR','PREMIUM','VIP')
);

CREATE TABLE orders (
    order_id VARCHAR(12) PRIMARY KEY,
    customer_id VARCHAR(10),
    order_date DATETIME,
    status ENUM(
        'PLACED',
        'SHIPPED',
        'DELIVERED',
        'CANCELLED',
        'RETURNED'
    ),
    region_code VARCHAR(20)
);

CREATE TABLE order_items (
    item_id VARCHAR(12) PRIMARY KEY,
    order_id VARCHAR(12),
    product_id VARCHAR(10),
    quantity INT,
    unit_price DECIMAL(10,2),
    discount_percent DECIMAL(5,2)
);


CREATE TABLE products (
    product_id VARCHAR(10) PRIMARY KEY,
    product_name VARCHAR(150) NOT NULL,
    category VARCHAR(50),
    subcategory VARCHAR(50),
    cost_price DECIMAL(10,2)
);