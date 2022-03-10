use hr

--1

select departments.department_id, departments.department_name, count(employee_id) 
from departments join employees on departments.department_id=employees.department_id
group by departments.department_id, departments.department_name
having count(employee_id) = (select min(xd) from
(select count(employee_id) as xd, departments.department_id from employees join departments on employees.department_id=departments.department_id group by departments.department_id ) as xd)

--2

select city from locations 
join countries on countries.country_id=locations.country_id 
join regions on countries.region_id=regions.region_id
where state_province is null and region_name like 'Asia'

--3

select countries.country_name from countries 
where countries.country_id not in (select country_id from locations)

--4
select salary, last_name from employees 
where salary>(select avg(a.salary) from employees a join employees b on a.employee_id=b.manager_id where b.manager_id=101 or b.manager_id=103) and last_name like '[P-U]%'

--5
select distinct a.employee_id from employees a join employees b on a.employee_id=b.manager_id
where a.employee_id in (select employee_id from job_history)

--6

select distinct a.last_name, a.job_id from employees a 
join employees b on a.employee_id=b.manager_id 
join employees c on b.employee_id=c.manager_id

