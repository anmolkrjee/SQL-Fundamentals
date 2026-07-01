


-- Day - 01




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

