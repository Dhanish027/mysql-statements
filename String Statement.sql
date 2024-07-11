select first_name, length(first_name)
from employee_demographics
order by 2;

select upper(first_name), length(first_name)
from employee_demographics
order by 2;

select lower(first_name), length(first_name)
from employee_demographics
order by 2;

select first_name,
length(first_name), 
left(first_name,3),
right(first_name,3),
substring(first_name,2,4),
birth_date,
substring(birth_date,6,2) as month
from employee_demographics
order by 2;

select first_name, replace(first_name,'n','e')
from employee_demographics;

select first_name,last_name, concat(first_name,' ',last_name) as Full_Name
from employee_demographics;