-- WHERE Clause

select * 
from employee_salary;


select * 
from employee_salary
WHERE salary >= 75000;

select first_name,last_name,salary
from employee_salary
WHERE occupation= "Office Manager";

select occupation,avg(salary)
from employee_salary
where occupation like '%manager'
group by occupation
having avg(salary) > 5000;