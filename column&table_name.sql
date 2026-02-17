create database yash;
use yash;
create table student(
id integer,
name varchar(255),
age integer ,
marks integer);


select TABLE_NAME from information_schema.tables
where table_schema='zomato';

select  * from information_schema.Constraint
where table_schema='zomato'and table_name='food'
