-- Complex Join
USE ecommerce_db;

SELECT 
    c.first_name, 
    c.last_name,
    o.order_date,
    o.total_amount,
    p.payment_method
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
LEFT JOIN payment_methods p ON o.payment_method_id = p.payment_method_id;

-- Subquery
SELECT 
    product_name,
    price
FROM products
WHERE price > (
    SELECT AVG(price) 
    FROM products
);

-- Date-Time Function
SELECT 
    first_name,
    last_name,
    TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) AS age
FROM customers;