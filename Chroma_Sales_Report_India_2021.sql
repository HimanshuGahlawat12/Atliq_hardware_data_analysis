### FINANCIAL ANALYTICS 2021
### Need following to get the financial outcomes needed 
-- Month
-- Product Name
-- Variant
-- Sold Quantity
-- Gross Price Per Item
-- Gross Total 
### STEPS FOLLOWED
-- We extracted the customer code for croma in India
-- We created two functions to get the financial year (get_fiscal_year) and financial quarter (get_fiscal_quarter)
-- We then joined the dim_product , fact_monthly_sales and fact_gross_price 
-- In join we used the "(get_fiscal_year)" function to get the outcomes of year 2021
-- We performed artimatic function to get our gross_price Total 
Select s.date , s.product_code,p.product,p.variant,s.sold_quantity,g.gross_price ,
round(g.gross_price * s.sold_quantity,2) as gross_price_total
   from fact_sales_monthly s
   join dim_product p
on 
      p.product_code = s.product_code
join fact_gross_price g 
on    g.product_code = s.product_code and 
      g.fiscal_year = get_fiscal_year(s.date)
where customer_code = 90002002 and 
get_fiscal_year(date) = 2021 
order by date asc ;