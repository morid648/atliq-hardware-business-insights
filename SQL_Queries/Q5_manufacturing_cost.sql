/*
Business Question:
Get the products that have the highest and lowest manufacturing costs.

Objective:
Identify cost extremes for pricing and profitability analysis.

Tables Used:
fact_manufacturing_cost, dim_product
*/


select dm.product_code,dm.product,fmc.manufacturing_cost
from fact_manufacturing_cost fmc
join dim_product dm
on dm.product_code=fmc.product_code
where manufacturing_cost=
(select max(manufacturing_cost) from fact_manufacturing_cost)
union
select dm.product_code,dm.product,fmc.manufacturing_cost
from fact_manufacturing_cost fmc
join dim_product dm
on dm.product_code=fmc.product_code
where manufacturing_cost=
(select min(manufacturing_cost) from fact_manufacturing_cost);
