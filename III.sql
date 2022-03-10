use HR

--1
select last_name
from employees
where job_id in (select job_history.job_id from job_history join employees on job_history.employee_id = employees.employee_id where last_name='Whalen') and employees.last_name!='Whalen'

--2
select a.employee_id, c.employee_id
from employees a, employees b, employees c
where a.manager_id = b.employee_id and b.manager_id = c.employee_id

--3
select a.last_name, b.last_name
from employees a
join employees b
on a.manager_id = b.employee_id
where a.job_id in (select job_id from jobs where max_salary-min_salary=(select min(max_salary-min_salary) from jobs))

--4
select distinct locations.city
from locations 
join departments 
on locations.location_id = departments.location_id
where departments.department_id not in (select employees.department_id from employees where employees.department_id is not null)

--5
select concat(first_name, ' ', last_name) as pracownicy
from employees
where last_name like '%a%' and last_name like '%e%'

--6
select department_name
from departments
where department_id in (select department_id from employees group by department_id having count(department_id) > 10)