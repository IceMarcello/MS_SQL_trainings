use HR

--1
select a.employee_id, b.employee_id from employees a join employees b on a.manager_id=b.manager_id where a.employee_id!=b.employee_id

--2

select distinct city from locations join departments on departments.location_id=locations.location_id 
where department_id not in (select departments.department_id from departments inner join employees on employees.department_id=departments.department_id where employees.department_id is not null)

--3
select b.last_name, a.last_name from employees a join employees b on a.employee_id=b.manager_id join jobs on jobs.job_id=a.job_id 
group by a.last_name, b.last_name, max_salary, min_salary
having max_salary-min_salary=min(max_salary-min_salary)

--4

select city from locations where location_id not in (select locations.location_id from locations inner join departments on departments.location_id=locations.location_id)

--5
select last_name, job_id, departments.department_id, departments.department_name from employees 
join departments on departments.department_id=employees.department_id
join locations on locations.location_id=departments.location_id
where locations.city like '%toronto%'

--6
select department_name, avg(salary) from departments join employees on employees.department_id=departments.department_id
group by department_name
order by avg(salary) desc