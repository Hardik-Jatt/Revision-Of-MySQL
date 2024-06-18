-- Create the database
CREATE DATABASE healthcare_db;

-- Use the database
USE healthcare_db;

-- Create the patients table
CREATE TABLE patients (
    patient_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL,
    phone VARCHAR(20),
    address VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL,
    state VARCHAR(50) NOT NULL,
    zip VARCHAR(10) NOT NULL,
    date_of_birth DATE NOT NULL,
    gender VARCHAR(10) NOT NULL
);

-- Create the doctors table
CREATE TABLE doctors (
    doctor_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL,
    phone VARCHAR(20),
    specialty VARCHAR(50) NOT NULL,
    years_of_experience INT NOT NULL
);

-- Create the appointments table
CREATE TABLE appointments (
    appointment_id INT PRIMARY KEY,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    appointment_date DATE NOT NULL,
    appointment_time TIME NOT NULL,
    reason VARCHAR(100) NOT NULL,
    diagnosis VARCHAR(100),
    treatment VARCHAR(100),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);

-- Insert data into the patients table
INSERT INTO patients (patient_id, first_name, last_name, email, phone, address, city, state, zip, date_of_birth, gender)
VALUES
    (1, 'John', 'Doe', 'john.doe@healthcare.com', '555-1234', '123 Main St', 'New York', 'NY', '10001', '1980-01-01', 'Male'),
    (2, 'Jane', 'Smith', 'jane.smith@healthcare.com', '555-5678', '456 Oak Rd', 'Los Angeles', 'CA', '90001', '1985-05-15', 'Female'),
    (3, 'Bob', 'Johnson', 'bob.johnson@healthcare.com', '555-9012', '789 Elm St', 'Chicago', 'IL', '60601', '1990-09-01', 'Male'),
    (4, 'Alice', 'Brown', 'alice.brown@healthcare.com', '555-3456', '321 Pine Ave', 'Boston', 'MA', '02101', '1992-03-01', 'Female'),
    (5, 'Mike', 'Davis', 'mike.davis@healthcare.com', '555-7890', '654 Maple Blvd', 'Seattle', 'WA', '98101', '1988-11-15', 'Male');

-- Insert data into the doctors table
INSERT INTO doctors (doctor_id, first_name, last_name, email, phone, specialty, years_of_experience)
VALUES
    (1, 'Dr. Jane', 'Doe', 'jane.doe@healthcare.com', '555-2468', 'Internal Medicine', 10),
    (2, 'Dr. Bob', 'Smith', 'bob.smith@healthcare.com', '555-3691', 'Pediatrics', 8),
    (3, 'Dr. Alice', 'Johnson', 'alice.johnson@healthcare.com', '555-7890', 'Family Medicine', 12);
    
-- ORDER BY
USE healthcare_db;
SELECT first_name, last_name, years_of_experience
FROM doctors
ORDER BY years_of_experience DESC;

-- GROUP BY and COUNT
SELECT specialty, COUNT(*) AS num_doctors
FROM doctors
GROUP BY specialty;

-- GROUP BY and AVG
SELECT gender, AVG(TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE())) AS average_age
FROM patients
GROUP BY gender;

-- HAVING
SELECT specialty, COUNT(*) AS num_doctors
FROM doctors
GROUP BY specialty
HAVING COUNT(*) > 1;

-- Built-in Functions
SELECT 
    CONCAT(first_name, ' ', last_name) AS full_name,
    DATE_FORMAT(appointment_date, '%Y-%m-%d') AS appointment_date,
    TIME_FORMAT(appointment_time, '%h:%i %p') AS appointment_time
FROM appointments
INNER JOIN patients ON appointments.patient_id = patients.patient_id
INNER JOIN doctors ON appointments.doctor_id = doctors.doctor_id;