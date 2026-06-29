create database LPUDB;
use LPUDB;

create table student_LPU (
	id INT,
    student_name varchar(20),
    REG_NO int,
    section varchar(20),
    age int,
    city varchar(60)
);
desc student_LPU;

alter table student_LPU 
add cgpa decimal(4,2);

alter table student_LPU 
rename column id to student_id;

alter table student_LPU
change REG_NO Student_reg_no int;

alter table student_LPU 
add branch varchar(50);

insert into student_LPU	VALUES
	(124, "Anmol", 1258, "LP", 18, "Patna"),
    (158, "Aman", 1589, "kp", 20, "Darbhanga"),
    (789, "Aditya", 7856, "AB", 21, "Mumbai");

select distinct student_id, student_name
from student_LPU;


select student_name, branch from student_LPU 
where branch = "AI/ML";

insert into student_LPU	VALUES
	(787, "Aditya", 7845, "AB", 21, "Chennai", 7.82, "Full stack");

select student_name from student_LPU 
where branch = "IT";

select student_name from student_LPU 
where branch = "ECE";

select student_name from student_LPU 
where city = "Delhi";


select student_name from student_LPU 
where branch = "IT" and cgpa > 8;


select student_name from student_LPU 
where branch = "ECE" and cgpa > 7.5;

select student_name from student_LPU 
where city = "Delhi" or "Mumbai";

select student_name from student_LPU 
where branch = "CSE" or "IT";

/*Not operator use*/

select student_name from student_LPU 
where not city = "Jalandhar";


select * from student_LPU 
where  branch != "CSE" and branch != "AI/ML";

 
 select student_name from student_LPU 
where  branch not in ( "CSE","AI/ML");

select student_name, age from student_LPU
where age is not null;

select student_name from student_LPU
where branch in ("CSE", "IT", "Mass");

select * from student_LPU
where age between 18 and 21;

select student_name from student_LPU
where city in ("Delhi", "Mumbai", "Jaipur");

-- Like operator


select student_name from student_LPU
where student_name like "A%";

select student_name from student_LPU
where student_name like "%n";

select student_name from student_LPU
where student_name like "%ma%";

-- exactly characters

select student_name from student_LPU
where student_name like "____";

select student_name from student_LPU
order by student_name;



select student_name from student_LPU
order by city;


select student_name from student_LPU
order by cgpa desc;


select student_name from student_LPU
order by branch, student_name; 

select student_name from student_LPU
where branch = "CSE";


select student_name from student_LPU
where age between 19 and 21;


select student_name from student_LPU
where branch in ("CSE", "IT");


select student_name from student_LPU
where student_name like "S%";

select distinct branch from student_LPU;


select student_name, cgpa from student_LPU;


select student_name from student_LPU
order by cgpa desc; 

-- changing the schema of the table

desc student_LPU;

alter table student_LPU
add gender varchar(10);

alter table student_LPU
add semester int;

alter table student_LPU
add email varchar(15);

alter table student_LPU
add phone_no varchar(15);

alter table student_LPU
add admission_date date;

alter table student_LPU
add fees decimal(10,2);

alter table student_LPU
add attendance decimal(5,2); 


-- instead of using multiple alter commands again and again we use single

ALTER TABLE student_LPU
ADD COLUMN gender varchar(10),
ADD COLUMN semester int,
ADD COLUMN admission_date DATE,
ADD COLUMN fees decimal(10,2),
ADD column attendance decimal(5,2);

select * from student_LPU;


SET SQL_SAFE_UPDATES = 0;



UPDATE student_LPU
SET fees = 80000,
    attendance = 95.2,
    semester = 7,
    gender = 'male',
    admission_date = '2025-05-06'
WHERE student_id = 124;



SELECT *
FROM student_LPU
WHERE student_id = '124';

ALTER TABLE student_LPU
DROP COLUMN Student_reg_no;

ALTER TABLE student_LPU
DROP COLUMN section;

UPDATE student_LPU
SET cgpa = 8.2,
    branch = 'CSE',
    gender = 'Male',
    semester = 3,
    email = 'rahul@gmail.com',
    phone_no = '9876543210',
    admission_date = '2025-01-10',
    fees = 80000,
    attendance = 95.5
WHERE student_id = 158;


UPDATE student_LPU
SET cgpa = 8.9,
    branch = 'CSE',
    gender = 'Male',
    semester = 3,
    email = 'adit@gmail.com',
    phone_no = '9876543215',
    admission_date = '2025-01-19',
    fees = 80000,
    attendance = 91.50
WHERE student_id = 789;

select * from student_LPU;

UPDATE student_LPU
SET cgpa = 8.1,
    gender = 'Male',
    semester = 4,
    email = 'adi4@gmail.com',
    phone_no = '9876543210',
    admission_date = '2025-01-21',
    fees = 85000,
    attendance = 90.6
WHERE student_id = 789;


-- hands on practice

select * from student_LPU;

select student_id, student_name, branch from student_LPU;

select distinct city from student_LPU;

SELECT DISTINCT branch
FROM student_LPU;


select student_name from student_LPU 
WHERE branch = "CSE";

select student_name from student_LPU
where age > 20;


select student_name from student_LPU
where cgpa >= 8.5;

select student_name from student_LPU
where city in ("Delhi", "Noida", "Lucknow");

select student_name from student_LPU
where age between 18 and 21;

select student_name from student_LPU
where cgpa between 7.5 and 9.0;

select student_name from student_LPU
where student_name like "A%";

select student_name from student_LPU
where student_name like "%a";

select student_name from student_LPU
where student_name like "%an%";

select student_name from student_LPU
where city like "N%";



select student_name from student_LPU
where branch = "CSE" and cgpa > 8;

select student_name from student_LPU
where city = "Delhi" or branch = "IT";

select student_name from student_LPU
where branch not in ("Mechanical");

select student_name from student_LPU
where age between 19 and 22 and branch = "CSE";


select student_name from student_LPU
WHERE email is null;

select student_name from student_LPU
where phone_no is not null;

select student_name from student_LPU
order by cgpa desc;

select student_name from student_LPU
order by student_name;

SELECT student_name
FROM student_LPU
ORDER BY branch, cgpa DESC;


SELECT student_name, city
FROM student_LPU
where city = "Delhi" and cgpa > 8.5;

SELECT student_name
FROM student_LPU
WHERE city != "Delhi";


SELECT student_name
FROM student_LPU
WHERE student_name like "S%" and city in ("Delhi", "Jaipur");


SELECT student_name
FROM student_LPU
WHERE branch in ("CSE", "IT") and age > 20;

SELECT student_name
FROM student_LPU
WHERE student_name like "%a%" order by student_name;

SELECT student_name, cgpa
FROM student_LPU
WHERE cgpa between 8 and 9;

SELECT student_name
FROM student_LPU
WHERE email != NULL;
