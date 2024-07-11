Delimiter $$
create trigger Employee_insert
  after insert on employee_salary
  for each row
begin
insert into employee_demographics(employee_id, first_name, last_name)
values (new.employee_id, new.first_name, new.last_name);
end $$
Delimiter ;


insert into employee_salary(employee_id,first_name,last_name,occupation,salary,dept_id)
values (13,'Jean-Ralphio','saperstein','Entertainment 720 CEO', 100000,NULL);

select * 
from employee_demographics;

-- events

delimiter $$
create event delete_retirees
on schedule every 30 second
do
begin
delete
from employee_demographics
where age > 60;
end $$
delimiter ;

select * 
from employee_salary;