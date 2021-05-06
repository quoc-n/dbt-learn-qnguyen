select * 
from {{ source('stripe', 'payment') }}
where status = 'success'