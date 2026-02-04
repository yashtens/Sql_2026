SELECT * FROM sql_2026.insurance_data;
-- question1:
select  * from insurance_data
where gender='male' and region='southwest';

-- question 2
select * from insurance_data
where bmi between 30 and 45;

-- Question 3
select max(bloodpressure) as MaxBP, min(bloodpressure) as MinBP
from insurance_data
where smoker='Yes' and diabetic='Yes';
-- Question 4

select count(distinct(PatientID))  from insurance_data
where region not in ('southwest');

-- Question 5
select sum(claim)
from insurance_data
where gender='male';

-- question 6
select * from insurance_data
where region in ('southeast','southwest');

-- Question 7
select count(PatientID) from insurance_data
where bloodpressure between 90 and 120;

-- question 8
select count(*) from insurance_data
where age < 17 and bloodpressure between 80+(age*2) and 100+(age*2);

-- Question 9

select round(avg(claim),2) from insurance_data
where gender='female' and smoker='No' and diabetic='Yes';

-- Question 10
update insurance_data
set claim=5000
where PatientID=1234;

select * from insurance_data
where PatientID=1234;

-- Question 11
delete from insurance_data
where smoker='Yes' and children=0;

select * from insurance_data
where smoker='Yes' and children=0;





