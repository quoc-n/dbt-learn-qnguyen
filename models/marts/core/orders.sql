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
        payments.orderid as order_id,
        customers.customer_id,
        sum(payments.amount) as amount
    from customers
        left join orders on customers.customer_id = orders.customer_id
        left join payments on orders.order_id = payments.orderid
    group by payments.orderid,
        customers.customer_id
)

select * from final