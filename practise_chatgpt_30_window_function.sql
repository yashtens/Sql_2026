SELECT * FROM window_function.employees;
-- Assign a row number to each employee ordered by salary.
select *,row_number() over(order by salary) as 'order_number'
from employees;

-- Assign row number within each department.
select *,row_number() over(partition by department)
from employees;

-- Rank employees based on salary.
select * ,rank() over(order by salary desc) as 'rank_salary'
from employees;

-- Use DENSE_RANK() based on salary.
select * ,dense_rank() over(order by salary desc) as 'rank_salary'
from employees;

-- Show salary rank within each department.
select * from (select *,rank() over(partition by department order by salary desc) as 'salary_rank'
from employees)t
where t.salary_rank=1;

-- Find highest salary employee using RANK().
-- way 1st
select * from employees
order by salary  desc limit 1;

-- way 2nd
select * from (select * ,rank() over(order by salary desc) as 'salary1'
from employees) t
where t.salary1=1;

-- Find second highest salary using window function.
select * from (select *,dense_rank() over(order by salary desc) as 'salary1'
from employees) t
where t.salary1=2;

SELECT * FROM subquery.orders1;
use subquery;

select f_name,total_sales,Percent_value from (select f_id,sum(amount) as 'total_sales',
round((sum(amount)/sum(sum(amount)) over())*100,2) as 'Percent_value' from (select * from orders1
where user_id=2) t1
join order_details1 as t2 
on t1.order_id=t2.order_id
group by f_id) t4
join food1 as t5
on t4.f_id=t5.f_id
order by Percent_value desc;


-- Show cumulative sum salary ordered by hire_date.
select *,
sum(salary) over(rows between unbounded preceding and current row) as"cumulative_sum" from employees;

-- Show running total of salary within each department.
select *,sum(salary) over(partition by department rows between unbounded preceding and current row ) as 'running_total_department'from employees;

-- Show average salary of all employees using window function.
select *,avg(salary) over() from employees;

-- Show average salary per department using OVER(PARTITION BY department).
select *,round(avg(salary) over(partition by department),2) from employees;

-- Show max salary per department.
select name,department,max_salary from (select *,
first_value(salary) over(partition by department order by salary desc) as'max_salary',
row_number() over(partition by department order by salary desc) as 'row'
from employees) t
where t.row=1;

-- Show min salary per department.
select name,department,max_salary from (select *,
first_value(salary) over(partition by department order by salary) as'max_salary',
row_number() over(partition by department order by salary ) as 'row'
from employees) t
where t.row=1;

-- Show difference between employee salary and department average.
select * from employees;