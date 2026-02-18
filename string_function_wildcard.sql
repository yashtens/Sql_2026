SELECT * FROM subquery.movies;
use subquery;
select name 
from movies
where name like 'A____';

-- finding the ending value:
select name from movies
where name like '%man';

-- finding the starting value:

select name from movies
where name like 'man%';
-- finding the middle value:

select name from movies
where name like '%man%';

-- string function
select upper(name) as 'upper_name',lower(name) as 'lower'
from movies;

-- concat
select * from movies;
select *,concat('rank','-',row_number()over(order by score desc)) as 'top-movie' 
from movies;

-- substr
select name,substr(name,1,5) from movies;
select name,substr(name,1,7) from movies;
-- replace:

select name,replace(name,'The Shining','yash marathe') as 'new_name:'
from movies;
select * from movies
where name='The Shining';

-- reverse
select name,reverse(name) as 'pallindron_word'
from movies;

-- length and char_length()
-- length is used for the count byte of string that type
-- char_length return number charactor that string contains
select name,length(name),char_length(name)
from movies;

select name,insert('The Shining',6,5,'yashmk') from movies;

-- left()
select name ,left(name,4)
from movies;

-- right()
select name,right(name,5)
from movies;

select trim(both '.' from '.........yash         .')as trim_example;
select trim(trailing  '.' from '.........yash         .')as trim_example;

select substring_index2('www.campusx.com',1);
SELECT SUBSTRING_INDEX('www.campusx.com', '.', 2);

-- strcmp

select strcmp('yashl','yashk');

-- locate
select locate('world','hello world')
