DROP DATABASE IF EXISTS CompanyDB;

CREATE DATABASE CompanyDB;

USE CompanyDB;

CREATE TABLE employees 
(
	emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10, 2)
);


INSERT INTO employees VALUES
(101, 'Rahul', "IT", 55000),
(102, "AMAN", "HR", 42000),
(103, "Priya", "Finance", 70000),
(104, "Sneha", "IT", 60000),
(105, "Rohit", "Sales", 45000),
(106, "Kiran", "HR", 52000);


SELECT * FROM employees;


-- STORED PROCEDURE


DELIMITER //
CREATE PROCEDURE ShowAllEmployees()
BEGIN
	SELECT * FROM employees;
END //
DELIMITER // ;


-- EXECUTE

CALL ShowAllEmployees();

-- WHERE CLAUSE WITH PROCEDURE

DELIMITER //
CREATE PROCEDURE ShowITEmployees()
BEGIN
	SELECT * FROM employees
    WHERE department = "IT";
END //
DELIMITER // ;


-- EXECUTE

CALL ShowITEmployees();


-- IN PARAMETER 

DELIMITER //
CREATE PROCEDURE EmployeeDepartment
(
	IN dept VARCHAR(30)
)
BEGIN
	SELECT * FROM employees
    WHERE department = dept;
END //
DELIMITER ;


-- EXECUTE

CALL EmployeeDepartment("IT");

CALL EmployeeDepartment("HR");


-- FILTER USING SALARY

DELIMITER //
CREATE PROCEDURE SalaryGreaterThan
(
	IN amount DECIMAL(10,2)
)
BEGIN
	SELECT * FROM employees
    WHERE salary > amount;
END //
DELIMITER // ;


CALL SalaryGreaterThan(50000);
CALL SalaryGreaterThan(60000);

-- MULTIPLE PARAMETER

DELIMITER //
CREATE PROCEDURE EmployeeFilter
(
	IN dept VARCHAR(30),
    IN minSalary DECIMAL(10,2)
)
BEGIN
	SELECT * FROM employees
    WHERE department = dept
    AND salary >= minSalary;
END //
DELIMITER // ;


CALL EmployeeFilter("IT", 50000);


-- VIEW EXISTING PROCEDURE

SHOW PROCEDURE STATUS;

SHOW CREATE PROCEDURE ShowAllEmployees;

-- HOW TO DELETE PROCEDURE;

DROP PROCEDURE ShowAllEmployees;

 -- PRACTICE QUESTIONS
 
 -- Create a procedure to display all employees
 
 
 DELIMITER //
 CREATE PROCEDURE DisplayAllEmployees()
 BEGIN
	SELECT * FROM employees;
END //
DELIMITER ;

 
 -- Create a procedure to display all HR employees
 
 DELIMITER //
 CREATE PROCEDURE DisplayHREmployees()
 BEGIN
	SELECT * FROM employees
    WHERE department = "HR";
END //
DELIMITER ;
 
 -- Ctreate a procedure that accepts department as input
 
 DELIMITER //
 CREATE PROCEDURE Displaydepartment
 (
	IN dept VARCHAR(30)
)
 BEGIN
	SELECT * FROM employees
    WHERE department = dept;
END //
DELIMITER ;
 
 -- Create a procedure accepts minimum salary
 
 DELIMITER //
 CREATE PROCEDURE DisplayminSalary
 (
	IN minSalary DECIMAL(10,2)
)
 BEGIN
	SELECT * FROM employees
    WHERE salary > minSalary;
END //
DELIMITER ;
 
 -- Create a procedure with department and salary inputs
 
 DELIMITER //
 CREATE PROCEDURE DisplayDeptAndSal
 (
	IN dept VARCHAR(30),
    IN Sal DECIMAL(10,2)
)
 BEGIN
	SELECT * FROM employees
    WHERE department = dept
    AND salary >= Sal;
END //
DELIMITER ;
 
 
 -- Execute each procedure with different values
 
 CALL DisplayHREmployees();
 
 CALL DisplayDeptAndSal("HR", 50000);
 
 CALL DisplayminSalary(60000);
 
 
 -- Display employees earning more than 60000
 
 CALL DisplayminSalary(60000);
 
 -- Display Finanance employees
 
 CALL Displaydepartment("Finance");
 
 -- View procedure definition
 
 SHOW CREATE PROCEDURE Displaydepartment;
 
 -- Drop a procedure and recreate it
 
 DROP PROCEDURE DisplayAllEmployees;
 
  -- RECREATE
  
  
 DELIMITER //
 CREATE PROCEDURE DisplayAllEmployees()
 BEGIN
	SELECT * FROM employees;
END //
DELIMITER ;


