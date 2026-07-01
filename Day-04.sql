use LPUDB;

desc student_LPU;

-- changing the schema of the table


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

