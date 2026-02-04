select * from smartphones_cleaned_v6;
use sql_2026;
select * from smartphones_cleaned_v6
where brand_name='samsung'
order by screen_size desc limit 5;

select model ,num_rear_cameras+num_front_cameras as 'total_cameras'
from smartphones_cleaned_v6
order by total_cameras desc ;
-- find the phone with 2nd largest battery

select model,battery_capacity
from smartphones_cleaned_v6
order by battery_capacity desc  limit 3,1;

-- find the rating and name of the worst rated apple phone
select model, rating
from smartphones_cleaned_v6
where brand_name='apple'
order by rating asc limit 1;
-- Group By:
select brand_name,count(model) as number_of_phone,round(avg(price)) as avg_price,max(rating) as max_rating
from smartphones_cleaned_v6
group by brand_name
order by number_of_phone desc limit 5;

select * from smartphones_cleaned_v6;
select has_nfc,round(avg(price)) as avg_price,round(avg(rating)) as avg_rating
from smartphones_cleaned_v6
group by has_nfc;

select extended_memory_available,round(avg(price)) as avg_price,round(avg(rating)) as avg_rating
from smartphones_cleaned_v6
group by extended_memory_available;

select brand_name,processor_brand,
count(model) as model,
round(avg(primary_camera_rear),2 )as avg_camera_resolution
from smartphones_cleaned_v6
group by brand_name,processor_brand;

select brand_name,avg(price) as total_price
from smartphones_cleaned_v6
group by brand_name 
order by total_price desc limit 5;

select has_5g,avg(price) as avg_price
from smartphones_cleaned_v6
group by has_5g;

select brand_name ,count(model) as 'highest_model' 
from smartphones_cleaned_v6
where has_nfc='True' and has_ir_blaster='True'
group by brand_name
order by highest_model desc;

select has_nfc,avg(price)
from smartphones_cleaned_v6
where  brand_name='samsung'
group by has_nfc;

select model,avg(price) as 'avg_price'
from smartphones_cleaned_v6
group by model
order by avg_price asc limit 1;

select brand_name,count(*) as 'count',round(avg(price)) as 'avg_price'
from smartphones_cleaned_v6
group by brand_name
having count > 20 
order by avg_price desc;

select brand_name ,count(*) as 'count',
round(avg(ram_capacity),2) as 'ram_capcity'
from smartphones_cleaned_v6
where refresh_rate >90 and fast_charging_available=1
group by brand_name
having count >10
order by ram_capcity desc limit 3

