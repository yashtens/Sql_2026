SELECT * FROM sql_2026.insurance_data;
use sql_2026;
-- How many patients have claimed more than the average claim amount for patients who are smokers and have at least one child, and belong to the southeast region?
select count(*)
from insurance_data
where claim >( select avg(claim) from  insurance_data
where smoker='Yes' and children>=1 and region='southeast');

--  How many patients have claimed more than the average claim amount for patients who are not smokers and have a BMI greater than the average BMI for patients who have at least one child?

select count(*)
from insurance_data 
where claim>(select avg(claim) from insurance_data
where smoker='No' and bmi>(select avg(bmi) from insurance_data where children>=1));

-- How many patients have claimed more than the average claim amount for patients who have a BMI greater than the average BMI for patients who are diabetic, have at least one child, and are from the southwest region?
select count(*)
from insurance_data
where claim >(select avg(claim)
from insurance_data
where bmi >(select avg(bmi) from insurance_data
where diabetic='Yes' and children>=1 and region='southeast'));

-- What is the difference in the average claim amount between patients who are smokers and patients who are non-smokers, and have the same BMI and number of children?
select (select avg(claim) from insurance_data
where smoker='Yes')-(select avg(claim) from insurance_data
where smoker='No') from insurance_data
