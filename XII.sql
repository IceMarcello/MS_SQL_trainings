Use HR

--1
select a.last_name, count(b.manager_id) from employees a , employees b where a.employee_id=b.manager_id group by a.last_name Having COUNT(b.manager_id)>10 or COUNT(b.manager_id)<5

--2
select last_name, first_name, salary from employees where manager_id in (select distinct a.employee_id from employees a , employees b join jobs on b.job_id=jobs.job_id where a.employee_id=b.manager_id  group by a.employee_id, a.salary, max_salary having a.salary>0.9*(max_salary))

--3
select jobs.job_title, count(employee_id) as cnt from employees join jobs on employees.job_id=jobs.job_id
where job_title not like '%Sales%' and jobs.job_title  not like '%Clerk%'
group by jobs.job_title
Order by cnt desc

--4
select distinct last_name from employees right join job_history on employees.employee_id=job_history.employee_id 

--5 
select jobs.job_title from jobs join job_history on job_history.job_id=jobs.job_id where DATEDIFF(MONTH,start_date,end_date)>10

--6 
select country_name from countries where SUBSTRING(country_name, 0, 3)=country_id
