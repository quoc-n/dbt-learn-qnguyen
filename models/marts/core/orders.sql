with customers as (

    select * from {{ ref('stg_customers') }}

),

orders as (

    select * from {{ ref('stg_orders') }}

),

payments as (

    select * from {{ ref('stg_payments') }}

),

final as (

    select
        payments.order_id as order_id,
        customers.customer_id,
        sum(payments.amount_usd) as amount
    from customers
        inner join orders on customers.customer_id = orders.customer_id
        inner join payments on orders.order_id = payments.order_id
    group by payments.order_id,
        customers.customer_id
)

select * from final