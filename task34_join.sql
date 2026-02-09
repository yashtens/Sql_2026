use join_practise;
-- Find out top 10 countries' which have maximum A and D values.
select * from  (select Country,A from country_ab
order by A desc limit 10) a
left join
(select Country,D from country_cd
order by D desc limit 10) b
on a.Country=b.Country
union
select * from  (select Country,A from country_ab
order by A desc limit 10) a
right join
(select Country,D from country_cd
order by D desc limit 10) b
on a.Country=b.Country;

select ab.Region,max(CL)  as 'cl' from country_cl as cl
join country_ab as ab
on cl.Country=ab.Country
group by Region
order by cl desc ;

-- Find top-5 most sold products.
select p.Name,sum(s.Quantity) as product_sold from product as p
join sales1 as s on p.ProductID=s.ProductID
group by p.Name
order by product_sold desc limit 5;

-- Find sales man who sold most no of products.
SELECT s.SalesPersonID,
       e.FirstName,
       e.LastName,
       SUM(s.Quantity) AS total_quantity
FROM sales1 AS s
JOIN employees AS e
ON s.SalesPersonID = e.EmployeeID
GROUP BY s.SalesPersonID, e.FirstName, e.LastName
order by total_quantity desc ;

-- Q-7:` List all customers who have made more than 10 purchases.
select c.CustomerID,count(s.SalesID) from customers as c
join sales1 as s on
c.CustomerID=s.CustomerID
group by c.CustomerID
having count(s.SalesID)>10

--  List all pairs of customers who have made purchases with the same salesperson.

