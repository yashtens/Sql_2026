use sql_2026;
SELECT * FROM sql_2026.ipl_ball_by_ball_2008_2022;
-- most 6 hiter batsman in the ipl
select batter,count(batsman_run) as 'number_of_six'
from ipl_ball_by_ball_2008_2022
where batsman_run =6
group by batter
order by number_of_six desc limit 2;

select ID,batter,sum(batsman_run) as 'match_run' 
 from ipl_ball_by_ball_2008_2022
 group by ID,batter
 having match_run >99
 order by batter desc;
 
 select batter,sum(batsman_run) as  total_run,count(batsman_run) as ball_faced,
 (sum(batsman_run)/count(batsman_run))*100 as 'sr'
 from ipl_ball_by_ball_2008_2022
 group by batter
 having ball_faced>1000
 order by sr desc limit 5;
 
 
