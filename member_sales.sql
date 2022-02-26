/* Our highest selling team member was Joey Brennan 
   with 410 beer sold. Way to go Joey!! */

select sales.member_id, 
sum (transactions.quantity) as member_sales
from sales
join transactions
on sales.purchase_id = transactions.purchase_id
group by member_id
order by member_sales desc