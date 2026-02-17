SELECT * FROM subquery.movies;
use subquery;

-- type of the independent subquery where the answer are scaler 
-- find the movie with the highest profit
select * from movies
order by score desc limit 1;

select * from movies
where score=(select max(score) from movies);
-- find the how  many movies have the rating > the avg of all the movie rating (find the count of the above avreage  movie)
select count(*) from movies
where score > (select avg(score) from movies);

-- find the higest rated movie of the 1996
select * from movies
where year=1996 and score=(select max(score) from movies
where year=1996);

-- Q4
select * from movies
where score=(
select max(score) from movies
where votes >(select avg(votes) from movies));

-- Now here we are using the row subquery but it is independent
-- find the users who never orderd
select * from user3
where user_id not in (
select distinct(user_id) from  orders1);


-- find all the movie made by top 3 directors(in term of total gross income)
with top_director as(select director from movies
 group by director
 order by sum(gross) desc limit 3)
select * from movies
 where director  in(select * from top_director );

-- find the all movies those actor whose filmography avg rating> 8.5(take 25000 votes as cutoff)
select * from movies
where star in(
select star from movies 
where votes>25000
group by star
having avg(score)>=8.5) ;

-- Table subquery

-- find the most profitable movie of the each year
select * from movies
where (year,gross-budget) in(
select year, max(gross-budget)
from movies
group by year);

-- find the higest rated movies of the each genre votes cutoff of 25000
select * from movies
where (genre,score)in (
select genre,max(score)
from  movies 
where votes>25000
group by genre);

-- find the highest grossing movies of the top 5 actor/director combo in terms of total gross income
with actor as (select star,director,max(gross)
from movies
group by star,director
order by sum(gross) desc limit 5)

select * from  movies 
where (star,director,gross) in (select * from actor);
-- find all the movie that have a rating higher than the average rating of the movies in the same genre['animation']
select * from movies as m1
where score > (select avg(score) from movies as m2 where m2.genre=m1.genre);

with a as (
select t1.user_id,t4.f_id ,count(*) as 'freq' from user3 as t1
join orders1 as t2
on t1.user_id=t2.user_id
join order_details1 as t3 
on t2.order_id=t3.order_id
join food1 as t4
on t3.f_id=t4.f_id
group by t1.user_id,t4.f_id)

select * from a as f1
where freq=(select max(freq) from a as f2
where f2.user_id=f1.user_id);

-- get the percentage of the votes for each movie compared to the total number of votes.
	select name,(votes/(select sum(votes) from movies)*100) as 'percentage_of_votes'
from movies;

-- Display all movie names ,genre,score and the avg(score) of genre
select name,genre,score,(select avg(score) as 'score' from movies as m2
where m2.genre=m1.genre ) as 'avg_score'
from movies as m1;

-- subquery on the from

select r_name,avg_rating
from (select r_id,avg(restaurant_rating) as 'avg_rating'
from orders1
group by r_id) t1 join 
restaurants  t2
on t1.r_id=t2.r_id;

-- find the genre having the avg score > avg score of all the movies
select genre,avg(score) from movies
group by genre
having avg(score)>(select avg(score) from movies)
;
create table loyal_users(
user_id integer primary key,
name varchar(255) not null,
money integer)
