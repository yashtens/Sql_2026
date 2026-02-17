SELECT * FROM sql_2026.smartphones_cleaned_v6;
use sql_2026;
use window_function;

-- Ntile:
select brand_name,model,price,
case
when bucket=1 then 'budget'
when bucket=2 then 'middle_range'
when bucket=3 then 'preminum'
end as 'phone_type'
from(select brand_name,model,price,
ntile(3) over(order by price) as 'bucket'
from smartphones_cleaned_v6 ) t;

select * from (select *,cume_dist() over(order by marks) as 'percentile_score'
from marks)t
where t.percentile_score>0.90;

use flight;
select * from flight
where price=(select min(price) from flight
where Source='Banglore' and Destination='New Delhi')
and Source='Banglore' and Destination='New Delhi';

select * from (select Airline,Source,Destination,avg(price) as 'avg_fare',
dense_rank() over(partition by Source,Destination order by avg(price)) as 'ran'
from flight
group by Airline,Source,Destination)t
where t.ran<2;