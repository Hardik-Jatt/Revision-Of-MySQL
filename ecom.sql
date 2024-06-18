-- Create the database
CREATE DATABASE ecommerce_db;

-- Use the database
USE ecommerce_db;

-- Create the customers table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL,
    phone VARCHAR(20),
    address VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL,
    state VARCHAR(50) NOT NULL,
    zip VARCHAR(10) NOT NULL
);

-- Create the products table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    description TEXT,
    category VARCHAR(50) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT NOT NULL
);

-- Create the orders table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    product_id INT NOT NULL,
    order_date DATE NOT NULL,
    quantity INT NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Insert data into the customers table
INSERT INTO customers (customer_id, first_name, last_name, email, phone, address, city, state, zip)
VALUES
    (1, 'John', 'Doe', 'john.doe@email.com', '555-1234', '123 Main St', 'New York', 'NY', '10001'),
    (2, 'Jane', 'Smith', 'jane.smith@email.com', '555-5678', '456 Oak Rd', 'Los Angeles', 'CA', '90001'),
    (3, 'Bob', 'Johnson', 'bob.johnson@email.com', '555-9012', '789 Elm St', 'Chicago', 'IL', '60601'),
    (4, 'Alice', 'Brown', 'alice.brown@email.com', '555-3456', '321 Pine Ave', 'Boston', 'MA', '02101'),
    (5, 'Mike', 'Davis', 'mike.davis@email.com', '555-7890', '654 Maple Blvd', 'Seattle', 'WA', '98101');

-- Insert data into the products table
INSERT INTO products (product_id, product_name, description, category, price, stock_quantity)
VALUES
    (1, 'Laptop', 'High-performance laptop for everyday use', 'Electronics', 999.99, 50),
    (2, 'Smartphone', 'Cutting-edge smartphone with advanced features', 'Electronics', 699.99, 100),
    (3, 'T-Shirt', 'Comfortable and stylish cotton t-shirt', 'Apparel', 19.99, 200),
    (4, 'Jeans', 'Classic blue denim jeans', 'Apparel', 49.99, 150),
    (5, 'Backpack', 'Durable and spacious backpack for travel', 'Accessories', 39.99, 75);

-- Insert data into the orders table
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, total_amount)
VALUES
    (1, 1, 1, '2023-04-01', 1, 999.99),
    (2, 2, 2, '2023-05-15', 2, 1399.98),
    (3, 3, 3, '2023-06-01', 3, 59.97),
    (4, 4, 4, '2023-07-01', 1, 49.99),
    (5, 5, 5, '2023-08-01', 2, 79.98),
    (6, 1, 2, '2023-09-01', 1, 699.99),
    (7, 2, 3, '2023-10-01', 2, 39.98),
    (8, 3, 4, '2023-11-01', 1, 49.99),
    (9, 4, 5, '2023-12-01', 3, 119.97),
    (10, 5, 1, '2024-01-01', 1, 999.99);
    
-- ORDER BY
USE ecommerce_db;
SELECT product_name, price
FROM products
ORDER BY price DESC;

-- GROUP BY and SUM
SELECT category, SUM(total_amount) AS total_revenue
FROM orders
INNER JOIN products ON orders.product_id = products.product_id
GROUP BY category;

-- GROUP BY and COUNT
SELECT city, COUNT(*) AS num_customers
FROM customers
GROUP BY city;

-- HAVING
SELECT category, SUM(total_amount) AS total_revenue
FROM orders
INNER JOIN products ON orders.product_id = products.product_id
GROUP BY category
HAVING SUM(total_amount) > 2000;

-- Built-in Functions
SELECT 
    CONCAT(first_name, ' ', last_name) AS full_name,
    DATEDIFF(CURDATE(), order_date) AS days_since_order
FROM customers
INNER JOIN orders ON customers.customer_id = orders.customer_id;