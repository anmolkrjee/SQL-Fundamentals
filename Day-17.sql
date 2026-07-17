
-- Diff between Stored procedure and triggers 


-- Stored 	procedure :- We need to call

-- Triggers :- Automatic call

-- Triggers :- Special database object that executes automatically when a specific event occurs on a table.alter

-- Users do not call triggers manually

-- INSERT, UPDATE AND DELETE

-- NEED :-

-- Audit changes
-- Maintain history tables
-- Validate business rule
-- Prevent invalid data
-- Automatically update related tables


-- TRIGGER SYNTAX

  DROP DATABASE IF EXISTS day17_triggers;
  
  CREATE DATABASE day17_triggers;
  
  USE day17_triggers;
  
  CREATE TABLE employees 
(
	emp_id INT PRIMARY KEY AUTO_INCREMENT,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10, 2)
);



-- LOG TABLE

CREATE TABLE employee_logs 
(
	log_id INT PRIMARY KEY AUTO_INCREMENT,
    emp_id INT,
    action_type VARCHAR(30),
    old_salary DECIMAL(10,2),
    new_salary DECIMAL(10,2),
    action_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- BEFORE INSERT TRIGGER

DELIMITER $$
CREATE TRIGGER trg_before_insert_salary
BEFORE INSERT ON employees
FOR EACH ROW
BEGIN
	IF NEW.salary < 10000 THEN
		SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Salary cannot be below 10000";
	END IF;
END $$

DELIMITER ;

-- Test

INSERT INTO employees (emp_name, department, salary)
VALUES ("Amit", "IT", 25000);


INSERT INTO employees (emp_name, department, salary)
VALUES ("Nitish", "IT", 8000 );


SELECT * FROM employees;

SELECT * FROM employee_logs;


-- AFTER INSERT TRIGGER


DELIMITER $$

CREATE TRIGGER trg_after_insert_salary
AFTER INSERT ON employees
FOR EACH ROW
BEGIN
	INSERT INTO employee_logs(emp_id, action_type, new_salary)
    VALUES(NEW.emp_id, "INSERT", NEW.salary);
END $$

DELIMITER ;


INSERT INTO employees (emp_name, department, salary)
VALUES ("Neha", "Finance", 45000);


SELECT * FROM employee_logs;

-- BEFORE UPDATE TRIGGER


DELIMITER $$

CREATE TRIGGER trg_update_insert_salary
BEFORE UPDATE ON employees
FOR EACH ROW
BEGIN
	IF NEW.salary <=0 THEN
      SIGNAL SQLSTATE "45000"
      SET MESSAGE_TEXT = "Invalid Salary";
	END IF;
END $$

DELIMITER ;


UPDATE employees
SET salary = 32000
WHERE emp_id = 1;


UPDATE employees
SET salary = -500
WHERE emp_id = 1;
