
with payments as (
    select 
        id as payment_id,
        orderid as order_id,
        paymentmethod as payment_method,
        status,
        amount/100 as amount_USD,
        created as created_at
    from {{ source('stripe', 'payment') }} --raw.stripe.payment
)
select * from payments
where status = 'success'

/*
select * 
from {{ source('stripe', 'payment') }} --raw.stripe.payment
where status = 'success'
*/