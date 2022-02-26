
/* This is a total of bucket weight and can weight 
   for the whole summer */

select  sum (recycling.cans_weight_lbs) as total_cans_weight_lbs, 
sum (recycling.bucket_weight_lbs) as total_bucket_weight_lbs 
from recycling;