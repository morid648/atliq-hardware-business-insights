/*
Business Question:
Provide the list of markets in which customer "Atliq Exclusive"
operates its business in the APAC region.

Objective:
Identify the regional market presence of a key customer.

Tables Used:
dim_customer
*/

select distinct market
from dim_customer 
where customer = "Atliq Exclusive" 
and region = "APAC";
