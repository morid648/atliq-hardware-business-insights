/*
Business Question:
Which channel contributed most to gross sales in 2021?

Objective:
Analyze channel performance.

Tables Used:
fact_sales_monthly, fact_gross_price, dim_customer
*/

select 
dc.channel,
round(sum(fs.sold_quantity*gp.gross_price)/100000,2) as gross_sales_mln,
round(sum(fs.sold_quantity*gp.gross_price)*100/sum(sum(fs.sold_quantity*gp.gross_price))over(),2) as percentage

from fact_sales_monthly fs
join dim_customer dc
on fs.customer_code=dc.customer_code

join fact_gross_price gp
on fs.product_code=gp.product_code
and fs.fiscal_year=gp.fiscal_year

where fs.fiscal_year= 2021

group by dc.channel
ORDER BY gross_sales_mln DESC;
