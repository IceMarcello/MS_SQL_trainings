Use HR

--1
select a.employee_id, b.employee_id from employees a, employees b where a.manager_id=b.manager_id and a.employee_id!=b.employee_id

--3
select distinct city from departments join locations on departments.location_id=locations.location_id where department_id !=all (select department_id from employees where department_id is not null group by department_id)

--2
select last_name, hire_date, dateadd(month,6,hire_date) as po_6msc, datepart(weekday,dateadd(month,6,hire_date)) as dzien_tyg_po_6msc, dateadd(day,(7-(((datepart(weekday,dateadd(month,6,hire_date))))%7))%7, dateadd(month,6,hire_date)) as pierwszy_poniedzia³ek_po6msc, datepart(weekday,dateadd(day,(7-(((datepart(weekday,dateadd(month,6,hire_date))))%7))%7, dateadd(month,6,hire_date))) as czy_poniedzia³ek from employees

--4
select department_name from departments join employees on departments.department_id=employees.department_id group by department_name having count(employee_id)>10

--6
select job_title from jobs inner join job_history on job_history.job_id=jobs.job_id 

--5
select a.employee_id, count(a.manager_id) from employees a, employees b where a.employee_id=b.manager_id and b.manager_id>100 and b.manager_id<110
group by a.employee_id
order by count(a.manager_id) desc
