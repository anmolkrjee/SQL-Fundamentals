use LPUDB;


desc student_LPU;

-- keys

-- Primary ;- Unique, Not Null, not duplicate values, One key per table

-- Foreign keys :- Links one table to another

-- Constraints - Unique, Not Null, Check, Default

-- Candidate :- Eligible to become a PK, Can be more than 1

-- Composite :- When no PK is there then Taking multiple columns to combine to generate unique and not null property to act as PK


CREATE TABLE Students (
    Student_ID INT PRIMARY KEY,
    Student_Name VARCHAR(100) NOT NULL,
    Age INT CHECK (Age >= 18),
    Gender VARCHAR(10),
    Branch VARCHAR(30) NOT NULL,
    Semester INT CHECK (Semester BETWEEN 1 AND 8),
    CGPA DECIMAL(4,2) CHECK (CGPA BETWEEN 0 AND 10),
    City VARCHAR(50) DEFAULT 'Delhi',
    Email VARCHAR(100) UNIQUE,
    Phone_No VARCHAR(15) UNIQUE,
    Admission_Date DATE,
    Fees DECIMAL(10,2) CHECK (Fees > 0),
    Attendance DECIMAL(5,2) CHECK (Attendance BETWEEN 0 AND 100)
);

SELECT * FROM Students;

DESC Students;

INSERT INTO Students
VALUES
(101, 'Rahul Sharma', 20, 'Male', 'Computer Science', 4, 8.75, 'Delhi', 
'rahul.sharma@example.com', '9876543210', '2023-08-10', 85000.00, 92.50);



INSERT INTO Students
VALUES
(102, 'Priya Verma', 19, 'Female', 'Electronics', 2, 9.20, 'Mumbai', 
'priya.verma@example.com', '9876543211', '2024-07-15', 80000.00, 88.75);



INSERT INTO Students
VALUES
(103, 'Aman Singh', 19, 'Male', 'Mechanical', 6, 7.95, 'Jaipur', 
'aman.singh@example.com', '9876543212', '2022-08-05', 90000.00, 95.00);

SELECT * FROM Students;




INSERT INTO Students (Student_id)
VALUES (101);


INSERT INTO Students (Age)
VALUES (15);



SELECT Student_Name FROM Students
WHERE CGPA >= 9.00;


SELECT Student_Name FROM Students 
WHERE Attendance < 75;


SELECT Student_Name FROM Students
ORDER BY Fees DESC
LIMIT 10;

SELECT city, count(Student_Name) FROM Students
GROUP BY city;


SELECT branch, AVG(CGPA) FROM Students
GROUP BY branch;


SELECT Semester, count(Student_Name) FROM Students
GROUP BY Semester;


SELECT branch FROM Students
GROUP BY branch
HAVING count(Student_Name) > 30;


SELECT * FROM Students
WHERE Admission_Date = "2025";


SELECT Student_Name FROM Students
WHERE city in ("Delhi" , "Noida");





