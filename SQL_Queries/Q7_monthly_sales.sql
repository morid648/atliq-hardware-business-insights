/*
Business Question:
Monthly gross sales amount for Atliq Exclusive.

Objective:
Analyze monthly sales trends.

Tables Used:
fact_sales_monthly, fact_gross_price, dim_customer
*/


select 
month(fs.date) as month,
year(fs.date) as year,
sum(gp.gross_price*fs.sold_quantity) as gross_sales_amount

from fact_sales_monthly fs
join fact_gross_price gp
on fs.product_code=gp.product_code
and fs.fiscal_year=gp.fiscal_year

join dim_customer dc
on fs.customer_code=dc.customer_code

where dc.customer="Atliq Exclusive"

group by month,year
order by year,month;

select concat("Q", quarter(date)) as Quarter,
sum(sold_quantity) as total_sold_qty
from fact_sales_monthly
where fiscal_year= 2020
group by quarter
order by total_sold_qty desc;
