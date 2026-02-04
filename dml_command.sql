 use sql_2026;
 SELECT * FROM sql_2026.smartphone;
 
 select model as brand_name,price as cost, rating
 from smartphone;
 select distinct(brand_name) as 'All Brands'
 from smartphone;
 select * from smartphone
 where brand_name='samsung';
  select * from smartphone
 where rating between 30 and 60;
-- =================================================================
 select * from smartphone
 where rating> 80 and price <25000;
 
 select * from smartphone
 where brand_name='samsung' and ram_capacity  > 8;
 -- =================================================================
 select distinct(brand_name) from smartphone
 where price > 10000;
select*from smartphone 
  where processor_brand='kirin';

  update smartphone 
  set processor_brand='dimensity'
  where processor_brand='kirin';
  
  select *
  from smartphone;
  
  select round(avg(battery_capacity),2) as avg_battery_capacity,round(avg(primary_camera_rear),2 )as avg_primary_camera
  from smartphone
  where price >= 100000