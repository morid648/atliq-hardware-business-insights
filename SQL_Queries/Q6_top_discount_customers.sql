/*
Business Question:
Top 5 customers who received highest average discount in 2021 (India).

Objective:
Analyze customer discount strategy.

Tables Used:
fact_pre_invoice_deductions, dim_customer
*/


select
dc.customer_code,dc.customer,
round(avg(pid.pre_invoice_discount_pct)*100,2) as average_discount_percentage
from dim_customer dc
join fact_pre_invoice_deductions pid
on dc.customer_code=pid.customer_code
where pid.fiscal_year= 2021
and dc.market = "India"
group by dc.customer_code,dc.customer
order by average_discount_percentage desc
limit 5;
