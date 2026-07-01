

use LPUDB;



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
