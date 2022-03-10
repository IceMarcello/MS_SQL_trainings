Use HR

--1
select a.employee_id, count(a.employee_id) from employees a join employees b on a.employee_id=b.manager_id
group by a.employee_id
having  count(a.employee_id)>5 and count(a.employee_id)<10

--2
select b.last_name, a.last_name from employees a join employees b on a.employee_id=b.manager_id join jobs on jobs.job_id=b.job_id 
group by a.last_name, b.last_name, max_salary, min_salary 
having max_salary-min_salary = min(max_salary-min_salary)

--3
select distinct city from locations join departments on locations.location_id=departments.location_id 
where departments.department_id not in (select departments.department_id from departments inner join employees on employees.department_id=departments.department_id where departments.department_id is not null)

--4
select salary, last_name from employees where last_name like '[P-U]%' and salary>(select avg(a.salary) from employees a join employees b on a.employee_id=b.manager_id)

--5
select department_name, department_id from departments where department_name not in (select departments.department_name from departments inner join employees on employees.department_id=departments.department_id where employees.department_id is not null)

--6

select departments.department_name, avg(salary) from departments join employees on employees.department_id=departments.department_id
group by department_name