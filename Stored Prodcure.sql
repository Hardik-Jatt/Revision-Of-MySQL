-- Stored Procedure to get customer orders by city
USE ecommerce_db;

CREATE PROCEDURE GetOrdersByCustomerCity
    @City VARCHAR(50)
AS
BEGIN
    SELECT 
        c.first_name,
        c.last_name,
        o.order_date,
        o.total_amount
    FROM customers c
    INNER JOIN orders o ON c.customer_id = o.customer_id
    WHERE c.city = @City
END;