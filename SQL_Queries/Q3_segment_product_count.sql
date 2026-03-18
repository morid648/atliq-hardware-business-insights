/*
Business Question:
Provide a report with all the unique product counts for each segment.

Objective:
Understand product distribution across segments.

Tables Used:
dim_product
*/


select segment,
count(distinct product_code) as product_count
from dim_product
group by segment
order by product_code desc;
