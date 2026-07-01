use LPUDB;


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

