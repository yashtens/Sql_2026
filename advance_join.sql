SELECT * FROM join_query.users;
use join_query;

select od.order_id,avg(od.amount) as 'avg_amount',sum(profit) as 'profit' from users as u
join orders as o on u.user_id=o.user_id
join order_details as od on o.order_id=od.order_id
join category as c on od.category_id=c.category_id
group by od.order_id;

select * from order_details as od
join category as c
on od.category_id=c.category_id
where vertical='Chairs';

-- all profitable order 
select od.order_id,sum(od.profit)as profit
from order_details as od
join orders as c
on od.order_id=c.order_id
group by od.order_id
having profit > 0
order by profit desc 



