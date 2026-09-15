-- ============================================================
-- SQL FUNDAMENTALS — PRACTICE REFERENCE
-- Not a business analysis project — a clean reference of core
-- SQL concepts: joins, set operators, table design, and
-- constraints, using small practice datasets.
-- ============================================================


-- ============================================================
-- 1. JOINS — employees / department / salaries
-- ============================================================

DROP DATABASE IF EXISTS company_joins_demo;
CREATE DATABASE IF NOT EXISTS company_joins_demo;

CREATE TABLE company_joins_demo.employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DepartmentID INT
);
CREATE TABLE company_joins_demo.department (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);
CREATE TABLE company_joins_demo.salaries (
    EmployeeID INT PRIMARY KEY,
    Salary INT
);

INSERT INTO company_joins_demo.employees (EmployeeID, FirstName, LastName, DepartmentID) VALUES
(1, 'Harshvardhan', 'Singh', 1), (2, 'Ankur', 'Gupta', 2), (3, 'Shivam', 'Kumar', 3),
(4, 'Sakshi', 'Awasthi', 4), (5, 'Nitin', 'Kaur', 5), (6, 'Vinit', 'Singhal', 1),
(7, 'Adarsh', 'Sharma', 4), (8, 'Prakash', 'Sakari', 6), (9, 'Puneet', 'Sharma', 7);

INSERT INTO company_joins_demo.department (DepartmentID, DepartmentName) VALUES
(1, 'Mentor'), (2, 'Designer'), (3, 'Editor'), (4, 'Onboarding'), (5, 'Project Manager'), (10, 'CEO');

INSERT INTO company_joins_demo.salaries (EmployeeID, Salary) VALUES
(1, 50000), (2, 54000), (3, 30000), (4, 60000), (5, 58000), (6, 60000), (7, 56000);

USE company_joins_demo;

-- LEFT JOIN
SELECT * FROM employees AS e
LEFT JOIN department AS d ON e.DepartmentID = d.DepartmentID;

SELECT e.EmployeeID, e.FirstName, e.LastName, d.DepartmentName FROM employees AS e
LEFT JOIN department AS d ON e.DepartmentID = d.DepartmentID;

SELECT * FROM employees AS e
LEFT JOIN salaries AS s ON e.EmployeeID = s.EmployeeID;

-- All three tables together
SELECT * FROM employees AS e
LEFT JOIN department AS d ON e.DepartmentID = d.DepartmentID
LEFT JOIN salaries AS s ON e.EmployeeID = s.EmployeeID;

-- RIGHT JOIN
SELECT * FROM employees AS e
RIGHT JOIN department AS d ON e.DepartmentID = d.DepartmentID;

SELECT * FROM employees AS e
RIGHT JOIN department AS d ON e.DepartmentID = d.DepartmentID
RIGHT JOIN salaries AS s ON e.EmployeeID = s.EmployeeID;

-- CROSS JOIN
SELECT COUNT(*) FROM employees CROSS JOIN department;

SELECT * FROM employees
CROSS JOIN department
CROSS JOIN salaries;

-- INNER JOIN (same as JOIN)
SELECT * FROM employees AS e
INNER JOIN department AS d ON e.DepartmentID = d.DepartmentID;

SELECT * FROM employees AS e
INNER JOIN department AS d ON e.DepartmentID = d.DepartmentID
INNER JOIN salaries AS s ON e.EmployeeID = s.EmployeeID;


-- ============================================================
-- 2. SET OPERATORS — UNION / UNION ALL / EXCEPT / INTERSECT
-- Mini case study: tracking a user base across 3 annual snapshots
-- ============================================================

DROP DATABASE IF EXISTS user_snapshots;
CREATE DATABASE user_snapshots;

CREATE TABLE user_snapshots.users_2021 (UserID INT PRIMARY KEY, Name VARCHAR(50));
CREATE TABLE user_snapshots.users_2022 (UserID INT PRIMARY KEY, Name VARCHAR(50));
CREATE TABLE user_snapshots.users_2023 (UserID INT PRIMARY KEY, Name VARCHAR(50));

INSERT INTO user_snapshots.users_2021 (UserID, Name) VALUES (1, 'Harshvardhan'), (2, 'Lena'), (7, 'Prakash');
INSERT INTO user_snapshots.users_2022 (UserID, Name) VALUES (1, 'Harshvardhan'), (2, 'Lena'), (3, 'Charlie'), (4, 'Grace');
INSERT INTO user_snapshots.users_2023 (UserID, Name) VALUES (1, 'Harshvardhan'), (2, 'Lena'), (3, 'Charlie'), (4, 'Grace'), (5, 'Henry');

USE user_snapshots;

-- Combine 2021 and 2022 lists, duplicates removed automatically
SELECT * FROM users_2021 UNION SELECT * FROM users_2022;

-- Combine all 3 years
SELECT * FROM users_2021 UNION SELECT * FROM users_2022 UNION SELECT * FROM users_2023;

-- Same combination, but keeping duplicates
SELECT * FROM users_2021 UNION ALL SELECT * FROM users_2022 UNION ALL SELECT * FROM users_2023;

-- Users present in 2021 but not 2022 (left the platform)
SELECT * FROM users_2021 EXCEPT SELECT * FROM users_2022;

-- Users common to all 3 years only
SELECT * FROM users_2021 INTERSECT SELECT * FROM users_2022 INTERSECT SELECT * FROM users_2023;

-- Business questions:

-- 1. New users added in 2022
SELECT * FROM users_2022 EXCEPT SELECT * FROM users_2021;

-- 2. New users added in 2023
SELECT * FROM users_2023 EXCEPT SELECT * FROM users_2022;

-- 3. Users who left (present in 2021, gone from both 2022 and 2023)
SELECT * FROM users_2021 EXCEPT SELECT * FROM users_2022 EXCEPT SELECT * FROM users_2023;

-- 4. Everyone present across 2021 and 2022 combined
SELECT * FROM users_2021 UNION SELECT * FROM users_2022;

-- 5. Everyone present across all 3 years combined
SELECT * FROM users_2021 UNION SELECT * FROM users_2022 UNION SELECT * FROM users_2023;

-- 6. Users retained across all 3 years (loyal user base)
SELECT * FROM users_2021 INTERSECT SELECT * FROM users_2022 INTERSECT SELECT * FROM users_2023;

-- 7. Everyone EXCEPT the fully-retained 3-year users (i.e. users with at least one gap year)
SELECT * FROM users_2021 UNION ALL SELECT * FROM users_2022 UNION ALL SELECT * FROM users_2023
EXCEPT
SELECT * FROM users_2021 INTERSECT SELECT * FROM users_2022 INTERSECT SELECT * FROM users_2023;


-- ============================================================
-- 3. TABLE DESIGN & CONSTRAINTS — Bookstore
-- AUTO_INCREMENT, NOT NULL, DEFAULT, DATETIME, CHECK, UNIQUE
-- ============================================================

DROP DATABASE IF EXISTS bookstore;
CREATE DATABASE IF NOT EXISTS bookstore;
USE bookstore;

CREATE TABLE books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(50) NOT NULL,
    author VARCHAR(50) NOT NULL,
    price FLOAT DEFAULT 9.99 NOT NULL,
    published_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    quantity_in_stock INT NOT NULL DEFAULT 10
);

INSERT INTO books (title, author, price, published_date, quantity_in_stock) VALUES
('Learn SQL', 'John Doe', 15.99, '2022-05-15', 50),
('Python for Beginners', 'Jane Smith', 25.99, '2023-01-10', 20),
('Mastering Databases', 'Robert Brown', 29.99, '2021-11-05', 35),
('Advanced SQL', 'Emily Davis', 19.99, '2023-03-20', 40),
('Database Design Basics', 'Chris Johnson', 18.99, '2022-07-22', 60);

-- Relying on DEFAULT values for price, published_date, and quantity_in_stock
INSERT INTO books (title, author) VALUES ('Hello World', 'Charles Davidson');

SELECT * FROM books;

-- CHECK constraint demo: a table that rejects a price under 100
CREATE TABLE priced_orders (
    course_id INT,
    price INT CHECK (price > 100),
    transaction_id INT PRIMARY KEY,
    user_id INT
);

-- This insert violates the CHECK constraint (price = 70) and will error:
-- INSERT INTO priced_orders (course_id, price, transaction_id, user_id) VALUES (9990, 70, 8, 9);

-- This one satisfies it:
INSERT INTO priced_orders (course_id, price, transaction_id, user_id) VALUES (9990, 4567, 8, 9);
SELECT * FROM priced_orders;


-- ============================================================
-- 4. ALTER TABLE — modifying an existing schema
-- ============================================================

DROP DATABASE IF EXISTS bookstore_alter_demo;
CREATE DATABASE IF NOT EXISTS bookstore_alter_demo;
USE bookstore_alter_demo;

CREATE TABLE books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    price FLOAT DEFAULT 9.99 NOT NULL
);

INSERT INTO books (title, author, price) VALUES ('Learn SQL', 'John Doe', 15.99);

-- Add a new column
ALTER TABLE books ADD COLUMN phone_number VARCHAR(15);

-- Modify an existing column's constraint (add UNIQUE, widen size)
ALTER TABLE books MODIFY COLUMN title VARCHAR(200) UNIQUE;

-- Rename a column
ALTER TABLE books CHANGE COLUMN price rate FLOAT;

-- Change a column's default value
ALTER TABLE books ALTER COLUMN rate SET DEFAULT 99;

-- Drop a column
ALTER TABLE books DROP COLUMN phone_number;

SELECT * FROM books;
