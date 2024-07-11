select gender,avg(salary) as avg_sal
from employee_demographics dem
join employee_salary sal
on dem.employee_id=sal.employee_id
group by gender;

select gender,avg(salary) over(partition by gender ) as avg_sal
from employee_demographics dem
join employee_salary sal
on dem.employee_id=sal.employee_id;


select concat(dem.first_name,dem.last_name) as full_name,
gender,salary,
sum(salary) over(partition by gender order by dem.employee_id ) as rolling_total
from employee_demographics dem
join employee_salary sal
on dem.employee_id=sal.employee_id;

select concat(dem.first_name,dem.last_name) as full_name,
gender,salary,
row_number() over(partition by gender order by salary desc) as row_num,
rank() over(partition by gender order by salary desc) rank_num,
dense_rank() over(partition by gender order by salary desc) rank_num
from employee_demographics dem
join employee_salary sal
on dem.employee_id=sal.employee_id;
