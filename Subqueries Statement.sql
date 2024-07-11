SELECT * FROM employee_salary
where employee_id in
(select employee_id
from employee_salary
where dept_id=1);

select gender, avg(age),min(age),max(age),count(age)
from employee_demographics
group by gender;

select gender, avg(`max(age)`),avg(min_age)
from (
select gender, avg(age),min(age) as min_age,max(age),count(age)
from employee_demographics
group by gender) as agg_table
group by gender;