-- for head
select * from laptopdata
order by `index` limit 5;

-- for tail
select * from laptopdata
order by `index` desc limit 5;

-- sample
select * from laptopdata
order by rand() limit 5;	

select min(Price)over(),
max(price)over(),
count(Price)over(),
avg(price)over(),
std(price)over()

-- percentile_cont(0.5) within group(order by price)over() as 'Q2',
-- percentile_cont(0.75) within group(order by price)over() as 'Q3'
from laptopdata;

--  missing_value
select count(price)
from laptopdata
where price is null;

select * from laptopdata;
select bucket,repeat('*',count(*)/5) as 'histogram' from (select price,
case
when Price between 0 and 25000 then '0-25k'
when Price between 25001 and 50000 then '25-50k'
when Price between 50001 and 70000 then '50-70k'
when Price between 70001 and 100000 then '70-100k'
else '>100k'
end as 'bucket'
from laptopdata)t
group by t.bucket;

select company,count(*)
from laptopdata
group by company

