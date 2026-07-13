USE normalization_lab;

SHOW TABLES;


CREATE DATABASE sql_training;


USE sql_training;

DROP TABLE employees;
CREATE TABLE employees (
    emp_id        INT PRIMARY KEY AUTO_INCREMENT,
    first_name    VARCHAR(50),
    last_name     VARCHAR(50),
    email         VARCHAR(100),
    department    VARCHAR(50),
    salary        DECIMAL(10,2),
    bonus_pct     DECIMAL(5,2),
    hire_date     DATE,
    birth_date    DATE,
    last_login    DATETIME
);

INSERT INTO employees
(first_name, last_name, email, department, salary, bonus_pct, hire_date, birth_date, last_login)
VALUES
('Amit',    'Sharma',   'amit.sharma@company.com',    'Sales',       55000.75, 8.5,  '2019-03-15', '1990-06-12', '2026-07-01 09:15:00'),
('Priya',   'Verma',    'priya.verma@company.com',    'Marketing',   62000.33, 10.25,'2020-07-22', '1988-11-25', '2026-07-05 14:42:00'),
('Rahul',   'Nair',     'rahul.nair@company.com',     'IT',          78500.99, 12.0, '2018-01-10', '1992-02-18', '2026-07-10 08:05:00'),
('Sneha',   'Iyer',     'sneha.iyer@company.com',     'Finance',     49500.12, 6.75, '2021-11-05', '1995-09-30', '2026-06-28 17:30:00'),
('Karan',   'Malhotra', 'karan.malhotra@company.com', 'IT',          91000.50,   15.0, '2016-05-19', '1985-04-02', '2026-07-11 11:20:00'),
('Neha',    'Gupta',    'neha.gupta@company.com',     'Sales',       53000.00,   9.4,  '2022-02-28', '1998-01-15', NULL),
('Vikram',  'Singh',    'vikram.singh@company.com',   'HR',          47000.45,  5.5,  '2023-08-14', '1993-07-08', '2026-07-12 19:10:00'),
('Ananya',  'Das',      'ananya.das@company.com',     'Marketing',   58000.87, 7.2,  '2017-09-01', '1991-12-20', '2026-07-09 10:00:00'),
('Rohan',   'Kapoor',   'rohan.kapoor@company.com',   'Finance',     67000.65, 11.1, '2019-12-12', '1989-03-27', '2026-07-02 13:55:00'),
('Ishita',  'Joshi',    'ishita.joshi@company.com',   'HR',          51000.20,   8.0,  '2020-04-04', '1996-10-10', '2026-07-07 16:25:00');

SELECT * FROM employees;


SHOW TABLES;

-- NUMERIC FUNCTIONS

-- ROUND, TRUNCATE, CEIL/CEILING, FLOOR, ABS, MOD, POWER, SQRT, SIGN

-- GREATES/LEAST, EXP, LOG, LOG10, 

-- TRUNCATE :- cuts off decimal places without rounding

-- FLOOR :- ROUND DOWN
-- CEIL :- ROUND UP 

-- ABS :- Absolute values

-- GREATEST VS MAX :- Max is Aggregate func and Greatest is Scalar

-- RAND :- Generate random values

-- DATE AND TIME FUNCTION

-- Current Date and Time Functions

-- CURDATE
-- CURRENT_DATE
-- CURTIME
-- CURRENT_TIME
-- NOW
-- SYSDATE
-- CURRENT_TIMESTAMP


-- EXTRACTING PART OF DATE


-- YEAR
-- MONTH
-- MONTHNAME
-- DAY
-- DAYNAME
-- DAYOFMONTH
-- QUARTER
-- DAYOFWEE
-- MINUTE
-- SECOND



-- HANDS ON NUMERIC


-- Round every employee salary to the nearest whole number


SELECT ROUND(Salary, 0) AS nearest_whole FROM employees;

-- Display each salary truncated to 1 decimal place


SELECT TRUNCATE(Salary, 1) AS truncated_sal FROM employees;


-- Calculate each employee's monthly salary (salary/12), rounded to 2 decimals

SELECT ROUND(Salary/12, 2) AS monthly_salary FROM employees;


-- Calculate bonus amount (salary*bonus_pct/100) for each employee rounded to 2 decimal places , label them bonus_amount

SELECT ROUND(Salary*bonus_pct/100, 2) AS bonus_amount FROM employees;


-- find the difference between each employee salary and the avg salary of all employee ans show its absolute values

SELECT ABS(Salary- (SELECT AVG(Salary) FROM employees)) AS diff_Sal FROM employees;


-- Display the ceiling and dloor values of each employees value side by side

SELECT FLOOR(Salary) AS Floor_value, CEIL(Salary) AS Ceil_Value FROM employees;

-- Using MOD(), List only employees whose emp_id is an odd number

SELECT * FROM employees WHERE MOD(emp_id, 2) = 1;

-- Find the square root of each employee salary

SELECT SQRT(Salary) AS root_salary FROM employees;

-- AMONG (Salary, bonus_pct*10000), display the greater value for each employee using greates

SELECT GREATEST(Salary, bonus_pct*10000) AS greater_value FROM employees;



-- DATE ARITHEMETIC FUNCTIONS

-- DATE_ADD
-- DATE_SUB
-- ADDDATE - Short hand for DATE_ADD
-- SUBDATE - short hand for DATE_SUB


-- DATEDIFF


-- FORMATTING FUNCTION

-- DATE_FORMAT
-- TIME_FORMAT

-- CONVERSION FUNCTIONS

-- STR_TO_DATE
-- CAST

-- DISPLAY EACH EMPLOYEE HIRE DATE FORMATTED AS "DD MONTH YYYY"

-- CALCULATE THE EXACT NUMBER OF DAYS EACH EMPLOYEE HAS WORKED AT THE COMPANY (FROM HIRE DATE TO TODAY)

SELECT first_name, DATEDIFF(CURDATE(), hire_date ) AS Total_days FROM employees;

-- CALCULATE EACH EMPLOYEE CURRENT AGE IN YEARS USING BIRTH DATE

SELECT first_name, TIMESTAMPDIFF(YEAR, birth_date, CURDATE()) AS Age_in_yrs FROM employees;


-- DISPLAY THE DAY OF THE WEEKK ON WHICH EACH EMPLOYEE WAS HIRED ("Friday")

SELECT first_name, DAYNAME(hire_date) AS hired_wee FROM employees;

-- FIND THE EMPLOYEE WHO WERE HIRED IN THE MONTH OF "DECEMBER" (ANY YEAR)

SELECT first_name, hire_date FROM employees WHERE MONTHNAME(hire_date) = "December";

-- ADD THREE YEARS TO EACH EMPLOYEE HIRE DATE AND DISPLAY IT THEIR "ELIGIBLE FOR PENSION" DATE

SELECT first_name, hire_date, DATE_ADD(hire_date, INTERVAL 3 YEAR) AS eligible_for_pension FROM employees;

-- FIND THE LAST DATE OF MONTH IN WHICH EACH EMPLOYEE WAS BORN

SELECT first_name, FROM employees;

-- LIST OF EMPLOYEE HIRED IN THE LAST 5 YEARS, ORDERED BY THE MOST RECENTLY HIRED FIRST

SELECT * FROM employees ORDER BY hire_date DESC LIMIT 5;

-- DISPLAY THE YEAR AND THE QUARTER OF EACH EMPLOYEE'S HIRE DATE " 2019 - Q1"


SELECT YEAR(hire_date) AS YEAR_HIRE, QUARTER(hire_date) AS Quarter_hire FROM employees;



-- LAST_DAY()

-- MIS FUNC

-- MAKEDATE
-- MAKETIME

-- EXTRACT
-- UTC_DATE
-- UTC_TIME
-- UTC_TIMESTAMP