-- common table expression's - CTEs

with cte_ex as
(
select gender,avg(salary) avg_sal,max(salary ) max_sal,min(salary) min_sal
from employee_demographics dem
join employee_salary sal
on  dem.employee_id=sal.employee_id
group by gender
)
select * 
from cte_ex;


-- subquery
select avg(avg_sal)
from (
select gender,avg(salary) avg_sal,max(salary ) max_sal,min(salary) min_sal
from employee_demographics dem
join employee_salary sal
on  dem.employee_id=sal.employee_id
group by gender
) example_subquery;


with cte_ex1 as
(
select employee_id,gender,birth_date 
from employee_demographics 
where birth_date > '1985-01-01'
),
cte_ex2 as
(
select employee_id,salary
from employee_salary
where salary > 50000
)
select * 
from cte_ex1
join cte_ex2
on cte_ex1.employee_id=cte_ex2.employee_id;
