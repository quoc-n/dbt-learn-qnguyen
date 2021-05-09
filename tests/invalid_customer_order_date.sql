select *
from {{ ref('customers') }}
where (first_order_date is null or most_recent_order_date is null) 
  and number_of_orders > 0