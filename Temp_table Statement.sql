create temporary table Salary_over_60k
select * 
from employee_salary
where salary < 70000;

select * from 
salary_over_60k;