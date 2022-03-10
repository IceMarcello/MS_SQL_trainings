Use HR

--1 
create table SKILL(S_ID int, "Name" varchar, Ranga varchar, primary key (S_ID))
create table SKEMP(S_ID int, Employee_ID int, primary key (S_ID), foreign key(S_ID) references SKILL(S_ID), foreign key (Employee_ID) references Employees(Employee_ID))

--2 
select employees.employee_id from employees join jobs on jobs.job_id=employees.job_id 
join SKEMP on employees.employee_id=SKEMP.Employee_ID
join SKILL on SKEMP.S_ID=SKILL.S_ID
where jobs.max_salary = 10000 and SKILL.Ranga=5

--3
select distinct departments.department_name from departments join employees on employees.department_id=departments.department_id
where commission_pct IS NULL

--4

select jobs.job_title, start_date from jobs 
join employees on jobs.job_id=employees.job_id
join job_history on job_history.job_id=jobs.job_id
--where MIN(hire_date)=job_history.start_date
group by jobs.job_title, start_date
having MIN(hire_date)=job_history.start_date

--5 

select count(employee_id) from employees where phone_number like '%6%6%6%'

--6 
select country_name, country_id from countries where SUBSTRING(country_name, 0, 3)=country_id