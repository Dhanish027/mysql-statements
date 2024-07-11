SELECT * FROM employee_demographics as dem 
inner join employee_salary as sal
on dem.employee_id=sal.employee_id;

SELECT * FROM employee_demographics as dem 
left join employee_salary as sal
on dem.employee_id=sal.employee_id;

SELECT * FROM employee_demographics as dem 
right join employee_salary as sal
on dem.employee_id=sal.employee_id;

SELECT * FROM employee_demographics as dem 
inner join employee_salary as sal
on dem.employee_id=sal.employee_id
inner join parks_departments as par
on par.department_id=sal.dept_id ;