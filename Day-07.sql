use LPUDB;

 -- Alternate :- Candidate key - PK remaining keys are alternate key
 
 -- Super key :- all columns are unique and not null. One or more columns can be the super key
 
 -- simple key :- A key consists of single key
 
 -- Secondary key :- Used for searching and indexing, may contain duplicate values and not uniquely identify rows
 
 
 -- Candidate Key is a subset of Super Key
 
 
-- Every Candidate Key is a Super Key, but not every Super Key is a Candidate Key.
 
 -- Natural :- Real world identifier
 
 -- Surrogate :- System genetated identifier
 
 -- Auto Increment used with PK
 
     
     
SELECT * FROM Students;


CREATE TABLE Attendance 
(
Student_ID INT,
Subject_Code VARCHAR(10),
Attendance_Date DATE,
PRIMARY KEY(Student_ID, Subject_Code)
);


 INSERT INTO Attendance
 VALUES
 (101, 'SQL101', '2026-07-01');
 
 INSERT INTO Attendance
 VALUES
 (101, 'PHY101', '2026-07-01');
 
 

 CREATE TABLE Enrollments
 (
 Enrollment_ID INT PRIMARY KEY,
 Student_ID INT,
 Course_Nme VARCHAR(50),
 FOREIGN KEY(Student_ID)
 REFERENCES Students(Student_ID)
 );
 
 
 
 INSERT INTO Enrollments
 VALUES
 (1, 101, 'PHYTHON');
 
 
 INSERT INTO Enrollments
 VALUES
 (2,102,'SQL');
 
 
 CREATE TABLE Students_Auto
 (
 Student_ID INT AUTO_INCREMENT PRIMARY KEY,
 Student_Name VARCHAR(100)
 );
 
 INSERT INTO Students_Auto(Student_Name)
 VALUES
 ('Rahul');
 
 INSERT INTO Students_Auto(Student_Name)
 VALUES
 ('Amit');
 
 INSERT INTO Students_Auto(Student_Name)
 VALUES
 ('Priya');
 
 INSERT INTO Students_Auto(Student_Name)
 VALUES
 ('Raja');
 
 
 SELECT * FROM Students_Auto;
 
 DELETE FROM Students_Auto
 WHERE Student_ID = 2;
 
 INSERT INTO Students_Auto(Student_Name)
 VALUES
 ('Rakesh');
 
 INSERT INTO Students_Auto(Student_Name)
 VALUES
 ('Anshu');
 
 
 SELECT * FROM Students;
 
 
 INSERT INTO Students
 VALUES
 (104, 'Anshu Bharti', 21, 'Female', 'IT', 5, 8.88, 'Patna', 'anshubharti@gmailcom', '7033388524', '2023-07-01', 70000, 88);
 
 INSERT INTO Students
 VALUES
 (108, 'Neha Verma', 22, 'Female', 'IT', 6, 9.35, 'Bhopal', 'nehaverma@gmail.com', '9012345678', '2023-07-01', 75000, 94);
 
 INSERT INTO Students
 VALUES
 (109, 'Rohit Gupta', 15, 'Male', 'CSE', 5, 8.10, 'Kolkata', 'rohitgupta@gmail.com', '9871234567', '2023-07-01', 69000, 83);
 
 INSERT INTO Students
 VALUES
 (109, 'Rohit Gupta', 21, 'Male', 'CSE', 5, 11, 'Kolkata', 'rohitgupta@gmail.com', '9871234567', '2023-07-01', 69000, 83);
 
 INSERT INTO Students
 VALUES
  (109, 'Rohit Gupta', 21, 'Male', 'CSE', 5, 8.9, 'Kolkata', 'rohitgupta@gmail.com', '9871234567', '2023-07-01', -1000, 83);
  
  
INSERT INTO Students
VALUES
(109, 'Rohit Gupta', 21, 'Male', 'CSE', 5, 8.9, 'rohitgupta@gmail.com','9871234567', '2023-07-01', 69000, 83);


 -- INFORMATION SCHEMA :- CHECK METADATA
 
 -- SHOW TABLE AND INDEX
 
 