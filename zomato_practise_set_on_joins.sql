create database zomato;
use zomato;
select count(*) from users;
select * from users order by rand();

select * from orders
where restaurant_rating is null;

update orders
set restaurant_rating=0
where restaurant_rating is null;

-- find the order placed by the each customer
select u.name,count(o.order_id) as count_order from orders as o
join users as u
on o.user_id=u.user_id
group by u.name;

-- find the restuarant with the most number of the menu item
select r.r_name,count(menu_id) as 'number_of_the_menu'
from restaurants as r
join menu as m 
on r.r_id=m.r_id
group by r.r_name;

-- find the nummber of the vote and the avgrage rating of the all restoruant
select r.r_name,round(avg(o.restaurant_rating)) as 'avg_rating',count(*) as no_votes from orders as o
join restaurants as r on
o.r_id=r.r_id
group by r.r_name;

-- find the food that is being sold at most number of the restorants
select f.f_name,count(r.r_id) as number_of_restorants from food as f
join menu as m 
on f.f_id=m.f_id
join restaurants as r
on m.r_id=r.r_id
group by f.f_name
order by number_of_restorants desc;

-- find the revenue by the month
select r.r_name,sum(amount) as 'revenue' from orders as o
join restaurants as r on
o.r_id=r.r_id
where monthname((date))='May'
group by r.r_name;

-- find the resturant with sale > x 
select r.r_name,sum(o.amount) as 'sales' from orders as o
join restaurants as r on
o.r_id=r.r_id
group by r.r_name
having sales > 1000;

-- find the customer who never order
select f.f_name,count(r.r_id) as number_of_restorants from food as f
join menu as m 
on f.f_id=m.f_id
join restaurants as r
on m.r_id=r.r_id
group by f.f_name
order by number_of_restorants desc;

-- favrate food of the customer
select t1.name,t4.f_name,count(*) from users as t1
join orders as t2
on t1.user_id=t2.user_id
join order_details as t3 
on t2.order_id=t3.order_id
join food as t4 
on t3.f_id=t4.f_id
group by t1.name,t4.f_name;

-- find the most cost restaurant with avg(price/dish)
select d.partner_id,count(*) as 'numbers_delivry',round((count(*)*100)+(1000*avg(delivery_rating)),1  ) as compensation from delivery_partner as d 
join orders as o 
on d.partner_id=o.partner_id
group by d.partner_id
order by compensation desc;

-- find the resturant that are veg resturant
select r.r_name from food as f
join menu as m
on f.f_id=m.f_id
join restaurants as r 
on m.r_id=r.r_id
group by r.r_name
having min(type)='Veg' and max(type)='Veg'


