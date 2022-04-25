{{
    config(
        materialized = 'table',
        unique_key = 'dim_customer_key'
    )

}}

with base_customer as (
    select * from {{ref('nlg__base_customer')}}
),

stage as (
    select customer_key, customer_name from base_customer
),

final as (

    select 
    {{dbt_utils.surrogate_key(['customer_key'])}}::varchar(64) as dim_customer_key,
    customer_name  from stage
)

select * from final