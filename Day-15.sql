USE sql_training;

SHOW TABLES;

-- View :- Virtual table. Stores SQL Query, not separate data.

CREATE VIEW employee_basic AS
SELECT first_name, last_name, department, salary FROM employees;

SELECT * FROM employee_basic;


SHOW FULL TABLES WHERE Table_type = "VIEW";

DESC employee_basic;

-- view with filter

-- CEO WANTS ONLY HIGH SALARY EMPLOYEES

CREATE VIEW high_salary AS
SELECT * FROM employees WHERE salary > 70000;

SELECT * FROM high_salary;


-- UPDATE THROUGH VIEW

SET SQL_SAFE_UPDATES = 0;

UPDATE employee_basic SET salary = 75000 WHERE first_name = "Neha";


SET SQL_SAFE_UPDATES = 1;

SELECT first_name, salary FROM employees WHERE first_name = "Neha";


-- REPLACE AND DROP VIEW

CREATE OR REPLACE VIEW employee_basic AS SELECT first_name, department, salary FROM employees;

SELECT * FROM employee_basic;

CREATE VIEW temp_view AS SELECT * FROM employees;

SELECT * FROM temp_view;

DROP VIEW temp_view;

-- VIEW PRACTICE

-- 1 Create DELHI EMPLOYEES VIEW

SELECT * FROM employees;

CREATE VIEW Delhi_employees AS
SELECT * FROM employees;


-- 2 Create Name and Salary view

CREATE VIEW Name_Salary AS
SELECT first_name, last_name, Salary FROM employees;

-- 3 Employees hired after 2023

CREATE VIEW employees_2023 AS
SELECT first_name, last_name, hire_date FROM employees WHERE YEAR(hire_date) >= 2023;


SELECT * FROM employees_2023;

-- 4 IT department only

CREATE VIEW department AS
SELECT * FROM employees WHERE department = "IT";

-- USE VIEWS :- Security, Simplicity, Hide Complex Queries, Reusable SQL


-- INDEXES



-- Index speeds up searching. Similar to book index
-- Saves time

-- FASTER SEARCH, FASTER SORTING, BETTER FILTERING, BETTER JOINS

-- DISADVANTAGES :-

-- EXTRA STORAGE, SLOWEST INSERT/UPDATE/DELETE
-- TOO MANY INDEXES REDUCE PERFORMANCE


-- CREATE INDEX


CREATE INDEX idx_email ON employees(email);

SHOW INDEX FROM employees;

-- COMPOSITE INDEX

-- Leftmost Prefix Rule :- (Department, Salary)

CREATE INDEX idx_dept_salary ON employees(department, salary);

SHOW INDEX FROM employees;


-- UNIQUE INDEX

CREATE UNIQUE INDEX idx_bonus ON employees(bonus_pct);

SHOW INDEX FROM employees;

-- DROP INDEX

DROP INDEX idx_phone ON employees;

DROP INDEX idx_email ON employees;

SHOW INDEX FROM employees;


-- Practice 

-- Create a view named top_paid_it_employees thjat contains only employees from the IT department having salary greater 
-- than 70,000. Display the records ordered by salary in descending


CREATE VIEW top_paid_it_employees AS
SELECT * FROM employees WHERE department = "IT" AND salary > 70000
ORDER BY salary DESC;


-- Create a view named annual_salary_view displaying Employee ID, full Name (First+Last) , Department, Montly Salary and 
-- Annual Salary

CREATE VIEW annual_salary_view AS
SELECT CONCAT(first_name, " ", last_name) AS full_name, department, Salary AS Monthly_Salary, (salary*12)  AS Annual_Salary
FROM employees;

SELECT * FROM annual_salary_view;

-- Create a view named department_salary_summary, showing Department, Total Employees, Average salary and highest salary

CREATE VIEW department_salary_summary AS
SELECT department, count(emp_id) AS total_employees, AVG(salary) AS avg_salary, max(salary) AS highest_sal FROM employees
GROUP BY department;

SELECT * FROM department_salary_summary;


-- Create a view displaying employees who joined after 1 January 2023. Show employee Nam, Department, Hire date and city


CREATE VIEW employees_joined AS
SELECT CONCAT(first_name, " ", last_name) AS full_name, department, hire_date FROM employees
WHERE hire_date > "2023-01-01";



-- Create a view containing employees whose salary is greater than the average salary of all employees.
-- Display Name, Department and Salary


CREATE VIEW employees_sal AS
SELECT CONCAT(first_name, " ", last_name) AS full_name, department, salary FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);


-- The HR team frequently searches employees using their email_address. Create an appropriate index, 
-- verify it and then delete it

CREATE INDEX idx_email ON employees(email);

SHOW INDEX FROM employees;

DROP INDEX idx_email ON employees;


-- The finance team frequently executes:
-- SELECT * FROM employees WHERE department = 'Finanace' AND city = 'Patna';
-- Create the most suitable composite index and display all indesxes

SELECT *
FROM employees
WHERE department = 'Finance'
  AND city = 'Patna';
  
  
ALTER TABLE employees
ADD COLUMN city VARCHAR(50);


CREATE INDEX idx_department_city
ON employees(department, city);


SHOW INDEXES FROM employees;

-- Create a view showing employees whose city starts with "D" and salary is greater than 50000.
-- Display the results ordered by latest_hire_date.


CREATE VIEW employees_start AS
SELECT * FROM employees 
WHERE first_name LIKE "%A" AND salary > 50000
ORDER BY hire_date DESC;



-- Create a view showing only those departments where the average salary is greater than 65000.
-- Display department, number of employees and average salary


CREATE VIEW employees_department AS
SELECT department,
       COUNT(emp_id) AS Total_employees,
       AVG(salary) AS Avg_Sal
FROM employees
GROUP BY department
HAVING AVG(salary) > 65000;


-- Create a view named employee_report containing Employee ID, full name, department, City Salary and Salary category 
-- using CASE;
-- High >= 80000
-- Medium ( 60000 - 79999)
-- Low < 60000


CREATE VIEW employee_report AS
SELECT
    emp_id AS Employee_ID,
    CONCAT(first_name, ' ', last_name) AS Full_Name,
    department,
    city,
    salary,
    CASE
        WHEN salary >= 80000 THEN 'High'
        WHEN salary BETWEEN 60000 AND 79999 THEN 'Medium'
        ELSE 'Low'
    END AS Salary_Category
FROM employees;