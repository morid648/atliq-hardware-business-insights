# Data Description

This project uses the Atliq Hardware database (gdb023), which contains transactional and dimensional data related to customers, products, and sales.

## Tables Overview

### dim_customer
Contains customer information such as:
- customer_code
- customer name
- market and region
- sales channel (Retail, Direct, Distributor)

### dim_product
Contains product details such as:
- product_code
- division and segment
- category and product name

### fact_sales_monthly
Contains monthly sales transactions:
- date
- product_code
- customer_code
- sold_quantity

### fact_gross_price
Contains pricing information:
- product_code
- fiscal_year
- gross_price

### fact_manufacturing_cost
Contains production cost details:
- product_code
- manufacturing_cost

### fact_pre_invoice_deductions
Contains discount data:
- customer_code
- fiscal_year
- discount percentage

## Data Usage

This dataset is used to analyze:

• Product portfolio growth  
• Sales trends and seasonality  
• Customer discount strategies  
• Channel contribution to revenue  
• Product performance  

The analysis is performed using SQL queries to generate business insights.
