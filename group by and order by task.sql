use sql_2026;
SELECT * FROM sql_2026.sleep_efficiency;
-- Find out the average sleep duration of top 15 male candidates who's sleep duration are equal to 7.5 or greater than 7.5.


SELECT avg(`Sleep duration`)
FROM sleep_efficiency
WHERE Gender = 'Male'
  AND `Sleep duration` >= 7.5
order by `Sleep duration` desc limit 15;

select Gender,round(avg(`Sleep duration`* `Deep sleep percentage`)/100,2)as 'Deep_Sleep'
from sleep_efficiency
group by Gender;

select Age,`Light sleep percentage`,
`Deep sleep percentage`
from sleep_efficiency
where `Deep sleep percentage` between 25 and 45
order by `Light sleep percentage` asc limit 10,30;

select `Exercise frequency`,`Smoking status`,round(avg(`Sleep duration`*(`REM sleep percentage`/100)),2) as rem_sleep_time,
round(avg(`Sleep duration`*(`Light sleep percentage`/100)),2) as light_sleep_time,
round(avg(`Sleep duration`*(`Deep sleep percentage`/100)),2) as deep_sleep_time
from sleep_efficiency
group by  `Exercise frequency`,`Smoking status`;

select Awakenings,round(avg(`Caffeine consumption`),2) as 'Caffeine_consumption',round(avg(`Sleep duration`*(`Deep sleep percentage`/100)),2) as 'deep sleep time',
round(avg(`Alcohol consumption`),2) as 'Alcohol_consumption'
from sleep_efficiency
where `Exercise frequency`>=3 
group by Awakenings
order by Awakenings desc 







