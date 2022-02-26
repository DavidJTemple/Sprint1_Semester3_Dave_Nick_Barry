
/* Eastbound Hoe Down for the win!! */

select venue_locale.event_id,
sum (transactions.total) as best_event
from sales
join transactions
on sales.purchase_id = transactions.purchase_id
join venue_locale
on sales.locale_id = venue_locale.locale_id
group by venue_locale.event_id
order by best_event desc