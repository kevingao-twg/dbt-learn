{{
    config(
        materialized = 'table',
        unique_key = 'dim_nation_key'
    )

}}

with base_nation as (
    select * from {{ref('nlg__base_nation')}}
),

stage as (
    select nation_key, nation_name from base_nation
),

final as (

    select 
    {{dbt_utils.surrogate_key(['nation_key'])}}::varchar(64) as dim_nation_key,
    nation_name  from stage
)

select * from final