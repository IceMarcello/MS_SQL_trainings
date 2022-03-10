USE HR

--1
select employees.last_name from employees 
join job_history on employees.employee_id=job_history.employee_id
where job_history.job_id in (select job_history.job_id from job_history join employees on employees.employee_id = job_history.employee_id where last_name='Whalen') and employees.last_name!='Whalen'

--2
select last_name, salary from employees where 0.25*(select salary from employees where job_id='AD_PRES')>salary

--3

select jobs.job_title, count(employee_id) as cnt from employees join jobs on employees.job_id=jobs.job_id
where job_title not like '%Sales%' and jobs.job_title  not like '%Clerk%'
group by jobs.job_title
Order by cnt desc

--4

select concat(first_name,' ',last_name) as pracownicy from employees where last_name like '%a%' and last_name like '%e%'

--5

select job_title, COUNT(employee_id) from jobs join employees on jobs.job_id=employees.job_id group by job_title having COUNT(employee_id)>10

--6

select country_name from countries where SUBSTRING(country_name, 0, 3)=country_id