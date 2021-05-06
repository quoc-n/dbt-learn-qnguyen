select * 
from raw.stripe.payment
where status = 'success'