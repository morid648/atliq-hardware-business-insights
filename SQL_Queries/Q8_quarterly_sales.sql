/*
Business Question:
Which quarter of 2020 had the maximum sold quantity?

Objective:
Identify peak sales period.

Tables Used:
fact_sales_monthly
*/

select concat("Q", quarter(date)) as Quarter,
sum(sold_quantity) as total_sold_qty
from fact_sales_monthly
where fiscal_year= 2020
group by quarter
order by total_sold_qty desc;
