
/* We had a tie for highest beer sales
   between Super Sour and Rock Solid IPA */

select sales.product_id,
sum (transactions.quantity) as product_sales
from sales
join transactions
on sales.purchase_id = transactions.purchase_id
group by product_id
order by product_sales desc