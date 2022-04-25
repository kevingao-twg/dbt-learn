{{
    config(
        materialized = 'view'
    )

}}

with source as (

    select * from SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.CUSTOMER
),

renamed as (
    select C_CUSTKEY as customer_key, 
    C_NAME as customer_name,
    c_nationkey as customer_nation_key
    from source
)

select * from renamed