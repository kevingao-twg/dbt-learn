{{
    config(
        materialized = 'table',
        unique_key = 'dim_nation_key'
    )

}}

with base_orders as (
    select * from {{ref('nlg__base_orders')}}
),

stage as (
    select order_key, customer_key,order_status,order_date, order_total_price from base_orders
),

final as (

    select 
    {{dbt_utils.surrogate_key(['order_key'])}}::varchar(64) as dim_order_key,
    {{dbt_utils.surrogate_key(['customer_key'])}}::varchar(64) as dim_customer_key,
    order_status,
    order_date,
    order_total_price  from stage
)

select * from final