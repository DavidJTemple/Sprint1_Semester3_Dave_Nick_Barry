
/* Best Kind Brewery's best type of beer is Sour beer*/

select products.type_id, 
sum (transactions.quantity) as best_type
from sales
join products
on sales.product_id = products.product_id
join transactions
on sales.purchase_id = transactions.purchase_id
group by products.type_id
order by best_type desc