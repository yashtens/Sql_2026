create database data_cleaning;
create table yash as
select * from laptopdata;
use data_cleaning;
select * from laptopdata;

-- it is small type as the info in the sql that we use in the pandas
select * from information_schema.tables
where table_schema='data_cleaning'
and table_name='laptopdata'
;
drop table yash;

-- 1. Change 1st in the dataset that rename the column properly
ALTER TABLE laptopdata
RENAME COLUMN `Unnamed: 0` TO `index`;
-- drop all the null value
select * from laptopdata
where Company is null and TypeName is null and Inches is null and ScreenResolution is null and Cpu is null and Ram is null and Memory is null and Gpu is null and OpSys is null and Weight is null and Price is null ;

select count(*)
from laptopdata;
CREATE TABLE employees (
    emp_id INT,
    name VARCHAR(50),
    department VARCHAR(50),
    salary INT
);

INSERT INTO employees VALUES
(1,'Yash','IT',50000),
(2,'Rahul','HR',40000),
(3,'Amit','Finance',45000),
(4,'Sneha','IT',52000),
(5,'Priya','HR',41000),
(6,'Rohan','IT',50000),
(7,'Neha','Finance',47000),
(8,'Karan','HR',40000),
(9,'Pooja','IT',52000),
(10,'Arjun','Finance',45000),

-- Duplicate rows start
(1,'Yash','IT',50000),
(2,'Rahul','HR',40000),
(3,'Amit','Finance',45000),
(4,'Sneha','IT',52000),
(5,'Priya','HR',41000),

(11,'Yash','IT',50000),
(12,'Rahul','HR',40000),
(13,'Amit','Finance',45000),
(14,'Sneha','IT',52000),
(15,'Priya','HR',41000),

(16,'Rohan','IT',50000),
(17,'Neha','Finance',47000),
(18,'Karan','HR',40000),
(19,'Pooja','IT',52000),
(20,'Arjun','Finance',45000),

(6,'Rohan','IT',50000),
(7,'Neha','Finance',47000),
(8,'Karan','HR',40000),
(9,'Pooja','IT',52000),
(10,'Arjun','Finance',45000),

(21,'Vikas','IT',53000),
(22,'Anjali','HR',42000),
(23,'Manish','Finance',46000),
(24,'Tina','IT',54000),
(25,'Komal','HR',43000),

(21,'Vikas','IT',53000),
(22,'Anjali','HR',42000),
(23,'Manish','Finance',46000),
(24,'Tina','IT',54000),
(25,'Komal','HR',43000);

-- changing the datatype of the column
alter table laptopdata
modify column 
Inches decimal(10,1);

update laptopdata t1
set Ram=replace(Ram,'GB','') ;
select * from laptopdata;
 
 -- rounding the value:
 update laptopdata t1
set Price=round(price) ;

alter table laptopdata
modify column Ram integer;

update laptopdata
set Weight=replace(Weight,'kg','');

alter table laptopdata
modify column Weight decimal(10,5); 

select * from laptopdata;

alter table laptopdata
modify column Price integer;

select * from laptopdata;

select distinct(OpSys) from laptopdata;

select OpSys,case
when OpSys like '%mac%'then 'Macos'
when OpSys like 'window%' then 'window'
when OpSys like 'Android%' then 'Android'
when OpSys like 'chrome%' then 'chromeos'
when OpSys like 'No%' then 'noos'
else 'other'
end as 'os_barnd'
from laptopdata ;

update laptopdata
set OpSys=case
when OpSys like '%mac%'then 'Macos'
when OpSys like 'window%' then 'window'
when OpSys like 'Android%' then 'Android'
when OpSys like 'chrome%' then 'chromeos'
when OpSys like 'No%' then 'N/A'
else 'other'
end;

select * from laptopdata;
alter table laptopdata
add column gpu_brand varchar(255) after Gpu,
add column gpu_name varchar(255) after gpu_brand;

select * from laptopdata;
update laptopdata as l1
set gpu_brand= substring_index(Gpu,' ',1);

select * from laptopdata;
select replace(Gpu,gpu_brand,'')
from laptopdata;

update laptopdata
set gpu_name=replace(Gpu,gpu_brand,'');
select * from laptopdata;

alter table laptopdata
drop column Gpu;

use data_cleaning;
select * from laptopdata;
alter table laptopdata
drop column Cpu_brand,
drop column Cpu_processor,
drop column Cpu_frequency;

alter table laptopdata
add column Cpu_brand varchar(255) After Cpu,
add column Cpu_processor varchar(255) after Cpu_brand ,
add column Cpu_frequency varchar(255) after Cpu_processor;
select * from laptopdata;

update laptopdata
set Cpu_brand=substring_index(Cpu,' ',1);

update laptopdata
set Cpu_processor=
 substring_index(Cpu,' ',3);
 
 update laptopdata
 set Cpu_frequency=substring_index(Cpu,' ',-1);
 
 select substring_index(Cpu,' ',-1)
 from laptopdata;
 alter table laptopdata
 drop column Cpu;
 
 update laptopdata
 set Cpu_frequency=replace(Cpu_frequency,'GHz','')
 ;
 alter table laptopdata
 modify Cpu_frequency decimal(10);
 select * from laptopdata
 
 




