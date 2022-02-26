
/* The Hoe Zone was the most profitable venue locale of
   the Craft Beer Bonanza */

select sales.locale_id,
sum (transactions.total) as money_total
from sales
join transactions
on sales.purchase_id = transactions.purchase_id
group by locale_id
order by money_total desc