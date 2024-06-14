SELECT SUM(price) AS total_revenue 
FROM products;

SELECT * 
FROM products 
WHERE price % 3 = 0;

SELECT pid, pname, price, 
(price - (SELECT AVG(price) FROM products)) AS price_difference 
FROM products;

SELECT * 
FROM products 
WHERE price >= 50000;

SELECT * 
FROM customer 
WHERE age != 30;

SELECT * 
FROM orders 
WHERE amt <= 10000;

SELECT 59 & 47;

SELECT 59 | 47;

SELECT 59 ^ 47;

SELECT * 
FROM products 
WHERE location = 'Mumbai' 
AND stock > 10;

SELECT * 
FROM customer 
WHERE addr LIKE '%Mumbai%' 
OR 
(SELECT SUM(amt) 
FROM orders o 
WHERE o.cid = customer.cid) > 20000;

SELECT * 
FROM payment 
WHERE mode != 'upi' 
AND status = 'completed';