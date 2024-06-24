-- View to show customer order details
CREATE VIEW CustomerOrders AS
SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    o.order_date,
    o.total_amount,
    p.product_name
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
INNER JOIN products p ON o.product_id = p.product_id