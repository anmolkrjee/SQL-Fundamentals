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


