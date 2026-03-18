/*
Business Question:
Which segment had the most increase in unique products in 2021 vs 2020?

Objective:
Identify fastest growing product segment.

Tables Used:
fact_sales_monthly, dim_product
*/

select dp.segment,
count(distinct case when fsm.fiscal_year= 2020 then fsm.product_code end) as
unique_product2020,
count(distinct case when fsm.fiscal_year= 2021 then fsm.product_code end) as
unique_code2021,
(
count(distinct case when fsm.fiscal_year= 2021 then fsm.product_code end)
-
count(distinct case when fsm.fiscal_year= 2020 then fsm.product_code end)
) as difference
from fact_sales_monthly fsm
join dim_product dp
on dp.product_code=fsm.product_code
group by dp.segment
order by fsm.product_code desc;
