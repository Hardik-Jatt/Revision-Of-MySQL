-- Complex Join
USE healthcare_db;

SELECT 
    p.first_name AS patient_first_name,
    p.last_name AS patient_last_name,
    a.appointment_date,
    a.appointment_time,
    CONCAT(d.first_name, ' ', d.last_name) AS doctor_name,
    at.appointment_type
FROM patients p
INNER JOIN appointments a ON p.patient_id = a.patient_id
INNER JOIN doctors d ON a.doctor_id = d.doctor_id
INNER JOIN appointment_types at ON a.appointment_type_id = at.appointment_type_id;

-- Subquery
SELECT 
    first_name,
    last_name,
    phone
FROM patients
WHERE patient_id IN (
    SELECT patient_id
    FROM appointments
    WHERE appointment_date = CURDATE()
);

-- Date-Time Function
SELECT 
    first_name,
    last_name,
    DATE_FORMAT(date_of_birth, '%Y-%m-%d') AS date_of_birth,
    TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) AS age
FROM patients;