USE ecommerce_db;

SELECT 
    CONCAT(c.first_name, ' ', c.last_name) AS full_name,
    o.order_date,
    o.total_amount
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id;

USE healthcare_db;

SELECT 
    CONCAT(p.first_name, ' ', p.last_name) AS full_name,
    a.appointment_date,
    d.first_name AS doctor_first_name,
    d.last_name AS doctor_last_name
FROM patients p
INNER JOIN appointments a ON p.patient_id = a.patient_id
INNER JOIN doctors d ON a.doctor_id = d.doctor_id;