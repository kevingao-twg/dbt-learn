{{
    config(
        materialized = 'view'
    )

}}

with source as (
    select * from {{source('src_nation','nation')}}
),

renamed as (
    select N_NATIONKEY as nation_key, 
    N_NAME as nation_name,
    N_REGIONKEY as nation_region_key
    from source
)

select * from renamed