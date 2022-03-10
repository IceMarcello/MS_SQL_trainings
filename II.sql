use Hr 

--1 

select last_name from employees where job_id in (select job_history.job_id from employees join job_history on employees.employee_id=job_history.employee_id where last_name like 'Whalen') and last_name not like 'Whalen'

--2
select employee_id, hire_date from employees where datepart(month,hire_date)<=6
group by hire_date, employee_id 
order by hire_date ASC

--3
select a.employee_id, count(b.manager_id) from employees a join employees b on a.employee_id=b.manager_id where b.manager_id>100 and b.manager_id<110
group by a.employee_id
order by count(b.manager_id) DESC

--5
select distinct department_name from departments join employees on employees.department_id=departments.department_id where LEN(phone_number)=18

--6
select job_title from jobs 
where jobs.job_id not in (select jobs.job_id from jobs inner join job_history on job_history.job_id=jobs.job_id)
