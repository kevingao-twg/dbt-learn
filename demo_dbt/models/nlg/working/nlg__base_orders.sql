{{
    config(
        materialized = 'view'
    )

}}

with source as (
    select * from {{source('src_orders','orders')}}
),

renamed as (
    select O_ORDERKEY as order_key, 
    O_CUSTKEY as customer_key,
    O_ORDERSTATUS as order_status,
    O_ORDERDATE as order_date,
    O_TOTALPRICE as order_total_price
    -- O_ORDERPRIORITY as order_priority
    from source
)

select * from renamed