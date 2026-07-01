use LPUDB;

desc student_LPU;


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


-- Aggregate function

select count(student_id) from student_LPU;

select avg(cgpa) from student_LPU;

select max(attendance) from student_LPU;

select min(age) from student_LPU;

select sum(fees) from student_LPU;

select count(student_id) from student_LPU
where city = "Delhi";


select avg(age) from student_LPU
where branch = "IT";


select count(student_id) from student_LPU
where student_name like "A%";

select sum(fees) from student_LPU
where cgpa > 8;


 select avg(fees)  from student_LPU
 where city in ("Delhi", "Jaipur") and cgpa >=8;
 
 select count(student_id) from student_LPU
 where student_name like "%a" and age between 18 and 22;
 
 
 select max(attendance) from student_LPU
 where branch != "Mechanical";
 
 select sum(fees) from student_LPU
 where email != NULL;
 
 select min(cgpa) from student_LPU
 where student_name like "S%"; 
 
 
 -- flow of writing the query
 
 -- select -> from -> where -> group by -> having -> order by
 
 -- flow of execution
 
 -- from -> where -> group by -> having -> select -> order by
 
 SELECT branch, avg(cgpa)
 FROM student_LPU
 GROUP BY branch;
 
 SELECT branch, count(student_id) as student_count
 FROM student_LPU
 GROUP BY branch;
 
 
 SELECT City, count(student_id)
 FROM student_LPU
 GROUP BY city;
 
 SELECT branch, sum(fees)
 FROM student_LPU
 GROUP BY branch;
 
 SELECT branch, max(cgpa)
 FROM student_LPU
 GROUP BY branch;
 
 SELECT branch, min(attendance)
 FROM student_LPU
 GROUP BY branch;


SELECT branch, avg(cgpa)
FROM student_LPU
GROUP BY branch
HAVING avg(cgpa) > 8;

SELECT city, count(student_id)
FROM student_LPU
GROUP BY city
HAVING count(student_id) > 5;

SELECT branch, SUM(fees)
FROM student_LPU
GROUP BY branch
HAVING SUM(fees) > 50000;



SELECT branch, avg(cgpa)
FROM student_LPU
WHERE branch in ("CSE", "IT")
GROUP BY branch
HAVING avg(cgpa) > 8;


-- hands on practice


SELECT branch, count(student_id)
FROM student_LPU
GROUP BY branch;

SELECT branch, avg(cgpa)
FROM student_LPU
GROUP BY branch;


SELECT city, max(attendance)
FROM student_LPU
GROUP BY city;


SELECT branch, min(fees)
FROM student_LPU
GROUP BY branch;


SELECT branch, count(student_id)
FROM student_LPU
GROUP BY branch
HAVING count(student_id) > 8;


SELECT city, avg(cgpa)
FROM student_LPU
GROUP BY city
HAVING avg(cgpa) > 8;


SELECT city, sum(fees)
FROM student_LPU
GROUP BY city;



SELECT branch, max(cgpa)
FROM student_LPU
GROUP BY branch;


SELECT branch, min(attendance)
FROM student_LPU
GROUP BY branch
HAVING min(attendance) < 70;


SELECT city, sum(fees)
FROM student_LPU
GROUP BY city
HAVING sum(fees) > 30000;



SELECT branch, sum(fees)
FROM student_LPU
GROUP BY branch;


SELECT branch, avg(attendance)
FROM student_LPU
GROUP BY branch;

SELECT semester, sum(fees)
FROM student_LPU
GROUP BY semester;

SELECT city, count(student_id)
FROM student_LPU
GROUP BY city;

SELECT branch, avg(cgpa)
FROM student_LPU
GROUP BY branch
HAVING avg(cgpa) > 8.5;


SELECT semester, max(cgpa)
FROM student_LPU
GROUP BY semester;
