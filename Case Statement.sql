select concat(first_name,' ',
last_name)as full_name,
age,
case
when age>60 then 'On Deaths note'
when age>40 then 'old'
when age<40 then 'young'
end as age_bracket
from employee_demographics;

-- pay increase
-- < 50000  = 5%
-- > 50000 = 7%
-- finance = 10%

select * from employee_salary;

select concat(first_name,last_name) as Full_name,
salary, 
case
when salary<50000 then salary+(salary*0.05)
when salary>50000 then salary+(salary*0.07)
when dept_id=6 then salary+(salary*0.1)
end as New_salary,
case
when dept_id = 6 then salary*0.1
end as Bonus 
from employee_salary;