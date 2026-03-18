/*
Business Question:
Top 3 products in each division based on sold quantity (2021).

Objective:
Identify best-performing products.

Tables Used:
fact_sales_monthly, dim_product
*/

WITH product_sales AS
(
SELECT 
    dp.division,
    fsm.product_code,
    dp.product,
    SUM(fsm.sold_quantity) AS total_sold_quantity

FROM fact_sales_monthly fsm

JOIN dim_product dp
ON fsm.product_code = dp.product_code

WHERE fsm.fiscal_year = 2021

GROUP BY dp.division, fsm.product_code, dp.product
),

ranking AS
(
SELECT *,
    RANK() OVER(
        PARTITION BY division 
        ORDER BY total_sold_quantity DESC
    ) AS rank_order

FROM product_sales
)

SELECT *
FROM ranking
WHERE rank_order <= 3;
