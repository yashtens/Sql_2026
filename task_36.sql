use window_function;
select * from insurance_data;
### **Problem 1:** What are the top 5 patients who claimed the highest insurance amounts?
select *,dense_rank() over(order by claim desc)
from insurance_data limit 5;

### **Prob-- 2:** What is the average insurance claimed by patients based on the number of children they have?
select children,average_claimed from (select *,round(avg(claim) over(partition by children),2) as 'average_claimed',
row_number() over(partition by children) as 'row_number1'
from insurance_data) as t
where row_number1=1;

### **Problem 3:** What is the highest and lowest claimed amount by patients in each region? 
select region,max_claim,min_claim from(select *,max(claim) over(partition by region) as 'max_claim',
min(claim) over(partition by region) as 'min_claim',
row_number() over(partition by region) as "number"
from insurance_data) t
where t.number=1;

select region,max(claim),min(claim) 
from insurance_data
group by region;

### **Problem 5:** What is the difference between the claimed amount of each patient and the first claimed amount of that patient?
select *,claim-
first_value(claim) over() as 'diff'
from insurance_data;

### **Problem 6:** For each patient, calculate the difference between their claimed amount and the average claimed amount of patients with the same number of children.
select *,claim-round(avg(claim) over(partition by children),2) as 'diff'
from insurance_data;

### **Problem 7:** Show the patient with the highest BMI in each region and their respective rank.
select * from(select *,
rank() over(partition by region order by bmi desc) as 'rank_group'
,rank() over(order by bmi desc) as 'overal_rank'
from insurance_data) t
where t.rank_group=1;

### **Problem 10:** For each patient, find the maximum BMI value among their next three records (ordered by age).
select *,max(bmi) over(order by age rows between 1 following and 3 following) as 'max_bmi_value' from insurance_data;


### **Problem 11:** For each patient, find the rolling average of the last 2 claims.
select *,avg(claim) over(rows between 2 preceding and 1 preceding)
from insurance_data;

### **Problem 12:** Find the first claimed insurance value for male and female patients, within each region order the data by patient age in ascending order, and only include patients who are non-diabetic and have a bmi value between 25 and 30.
select * from (select *,
first_value(claim) over(partition by region,gender order by age) as 'first_value',
row_number() over(partition by region,gender order by age) as 'row'
from insurance_data) t
where t.row=1
and diabetic='No' and bmi between 25 and 30