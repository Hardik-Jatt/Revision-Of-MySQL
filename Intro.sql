-- Creating the employee table
CREATE TABLE employees (
  id INT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  position VARCHAR(50) NOT NULL,
  salary DECIMAL(10,2) NOT NULL
);

-- Inserting a new employee
INSERT INTO employees (id, name, position, salary)
VALUES (1, 'John Doe', 'Software Engineer', 75000);

-- Updating the salary of an employee
UPDATE employees
SET salary = 80000
WHERE id = 1;

-- Deleting an employee
DELETE FROM employees
WHERE id = 1;

-- Creating the students table with constraints
CREATE TABLE students (
  student_id INT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(100) UNIQUE,
  age INT CHECK (age >= 18),
  course_id INT,
  grade CHAR(1) DEFAULT 'F'
);

-- Creating the courses table
CREATE TABLE courses (
  course_id INT PRIMARY KEY,
  course_name VARCHAR(100) NOT NULL
);

-- Adding the foreign key constraint to the students table
ALTER TABLE students
ADD CONSTRAINT fk_course
FOREIGN KEY (course_id)
REFERENCES courses (course_id)
ON DELETE CASCADE;

-- Inserting data into the students table
INSERT INTO students (student_id, name, email, age, course_id, grade)
VALUES (1, 'Alice Johnson', 'alice@example.com', 21, 101, 'A');

-- Retrieving products based on numeric and date conditions
SELECT *
FROM products
WHERE price > 100 AND release_date > '2022-01-01';

-- Updating a product record and setting the last_updated column
UPDATE products
SET price = 1100.00, last_updated = NOW()
WHERE product_id = 1;

-- Deleting products with stock below a certain threshold
DELETE FROM products
WHERE stock < 100;

-- Creating a new table: departments
CREATE TABLE departments (
  dept_id INT PRIMARY KEY,
  dept_name VARCHAR(100) NOT NULL,
  location VARCHAR(100) NOT NULL
);

-- Inserting data into the departments table
INSERT INTO departments (dept_id, dept_name, location)
VALUES (1, 'IT', 'New York'),
       (2, 'Finance', 'Chicago'),
       (3, 'HR', 'Los Angeles');

-- Retrieving departments based on location
SELECT *
FROM departments
WHERE location = 'New York';

-- Updating the location of a department
UPDATE departments
SET location = 'San Francisco'
WHERE dept_id = 1;

-- Deleting a department
DELETE FROM departments
WHERE dept_id = 3;