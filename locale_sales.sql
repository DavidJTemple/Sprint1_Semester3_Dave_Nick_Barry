
/* The top selling venue locale was the Hoe Zone 
   at the Eastbound Hoe Down. Great work team! */

select sales.locale_id, 
sum (transactions.quantity) as locale_sales
from sales
join transactions
on sales.purchase_id = transactions.purchase_id
group by locale_id
order by locale_sales desc