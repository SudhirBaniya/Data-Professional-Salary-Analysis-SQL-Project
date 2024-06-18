
CREATE DATABASE salaries;

CREATE TABLE salaries (
id  int8 primary key,
work_year int8 not null,
experiene_level varchar(50),
employment_type varchar(50),
job_title varchar(50),
salary numeric not null,
salary_currency int8,
salary_usd int8 not null,
employee_residence varchar(50),
remote_ratio int8 not null,
company_location varchar(50),
company_size varchar(50)
)

# Retrieve all records

select * from data_science.ds_salaries;

# Retrieve specific column such as job_title, salary, company_size.

select job_title, salary, company_size 
from  data_science.ds_salaries;

# Find all job title with a salary greater than 100000;

select * from data_science.ds_salaries 
where salary > 100000;

# List employees with a specific job title such as 'data scientist';

select * from data_science.ds_salaries 
where job_title = 'data scientist';

# calculate the avarage salary

select avg(salary) as avarage_salary 
from  data_science.ds_salaries;

# count the number of employees in each job title;

select job_title, count(*) as num_employees 
from  data_science.ds_salaries group by job_title;

# find the avarage salary by job title;

select job_title, avg(salary) as avarage_salary 
from  data_science.ds_salaries group by job_title;


# calculate the total number of employee by company size and location;

select company_size, count(*) as total_employees 
from  data_science.ds_salaries group by company_size;


select company_location, count(*) as total_employees 
from  data_science.ds_salaries group by company_location;


# find the top 5 highest salary;

select * from data_science.ds_salaries 
order by salary desc limit 5;

# Retrieve the employees who have the maximum salary in each job title;

select job_title, max(salary) as max_salary 
from  data_science.ds_salaries group by job_title;


#  List all employees whose salary is above the avarage salary;


select * from  data_science.ds_salaries
where salary > (select avg (salary) from data_science.ds_salaries);


#  calculate the cumulative salary for employees;

select *, sum(salary) over (order by work_year) as cumulative_salary
from  data_science.ds_salaries;

#  Rank employees by salary within each job title;

select *,
        rank() over (partition by job_title order by salary desc) as salary_rank 
        from  data_science.ds_salaries;
        
        
        
        