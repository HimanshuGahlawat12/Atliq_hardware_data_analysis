CREATE DEFINER=`root`@`localhost` PROCEDURE `monthly_gross_sales`(c_code text)
BEGIN
Select 
    s.date,
    month(date) as month ,
    round(sum(g.gross_price * s.sold_quantity),2) as gross_price_total
from fact_sales_monthly s
join fact_gross_price g
    on 
      g.product_code = s.product_code and
      g.fiscal_year = get_fiscal_year(s.date)      
where 
        find_in_set(s.customer_code , c_code ) > 0   
group by s.date
order by s.date, month asc;
END