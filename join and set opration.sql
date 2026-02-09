SELECT * FROM join_query.users1;
use join_query;

-- Cross Join
select * from users1 as u
cross join group_data as g;

-- Inner Join
select * from users1 as u
join membership as m on u.user_id=m.user_id ;

-- left join 
select * from users1 as u
left join membership as m on u.user_id=m.user_id ;

-- Right join 
select * from users1 as u
right join membership as m on u.user_id=m.user_id ;

-- full outer join 
-- select * from users1 as u
-- full outer join membership as m on u.user_id=m.user_id

-- union

select  * from person1
union 
select * from person2;

-- union all

select  * from person1
union all 
select * from person2;

-- intersect

select  * from person1
intersect
select * from person2;

-- except
select  * from person1
except
select * from person2;




