create  database datetime;
use datetime;
use data_cleaning;
select * 
from laptopdata
where price is null;

update laptopdata
set price = null
where `index` in (10,2055,465,13,19,586,7894,100,645,325);

update laptopdata as l1
set Price=mode(Price)
where Price is null;

alter table laptopdata
add column ppi integer;

select round(sqrt(resolution_width*resolution_width+resolution_height*resolution_height)/Inches,2) 
from laptopdata;
update laptopdata
set ppi=round(sqrt(resolution_width*resolution_width+resolution_height*resolution_height)/Inches,2) ;

select * from laptopdata;

select  Cpu_brand, case  
when Cpu_brand='Intel' then 1 else 0  end as 'Intel',
case when Cpu_brand='AMD' then 1 else 0 end as 'Amd',
case when Cpu_brand='nvidia' then 1 else 0 end as 'Nvidia',
case when Cpu_brand='arm' then 1 else 0 end as 'Arm'
from laptopdata;

create table uber(
ride_id integer not null,
    user_id integer primary key not null,
    cab_id integer not null,
    start_timme datetime ,
    end_time datetime
);
select * from uber;
INSERT INTO uber (ride_id, user_id, cab_id, start_timme, end_time) VALUES
(1, 101, 201, '2026-02-20 08:00:00', '2026-02-20 08:30:00'),
(2, 102, 202, '2026-02-20 09:00:00', '2026-02-20 09:45:00'),
(3, 103, 203, '2026-02-20 10:00:00', '2026-02-20 10:20:00'),
(4, 104, 201, '2026-02-21 07:30:00', '2026-02-21 08:10:00'),
(5, 105, 204, '2026-02-21 11:00:00', '2026-02-21 11:50:00'),
(6, 106, 205, '2026-02-22 12:00:00', '2026-02-22 12:40:00'),
(7, 107, 202, '2026-02-22 14:00:00', '2026-02-22 14:35:00'),
(8, 108, 206, '2026-02-23 15:00:00', '2026-02-23 15:30:00'),
(9, 109, 207, '2026-02-24 16:00:00', '2026-02-24 16:55:00'),
(10, 110, 208, '2026-02-25 18:00:00', '2026-02-25 18:45:00');

alter table uber
modify column user_id integer not null;

-- we get current date 
select current_date();
-- we get the current time
SELECT current_time();
-- we get both date and time also
select now();

-- To extract the date
select date(start_timme)
from uber;

-- to extract the month
select Month(start_timme)
from uber;

-- to extract the year
select year(start_timme)
from uber;

-- to extract the time
select time(start_timme)
from uber;

-- to extract the monthname
select Monthname(start_timme)
from uber;

-- to extract the day
select Day(start_timme)
from uber;

-- to extract the Dayofweek
select dayofweek(start_timme)
from uber;



