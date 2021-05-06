select * 
from {{ source('stripe', 'payment') }} --raw.stripe.payment
where status = 'success'