/*
Business Question:
What is the percentage of unique product increase in 2021 vs 2020?

Objective:
Measure product portfolio growth year-over-year.

Tables Used:
fact_sales_monthly
*/

select
count(distinct case when fiscal_year = 2020 then product_code end) as 
unique_code2020,
count(distinct CASE WHEN fiscal_year = 2021 then product_code end) as
unique_code2021,
round(
count(distinct CASE WHEN fiscal_year = 2021 then product_code end) 
-
count(distinct case when fiscal_year = 2020 then product_code end)
/
count(distinct case when fiscal_year = 2020 then product_code end)
*100,2
) as percentage_CHG
from
fact_sales_monthly;
