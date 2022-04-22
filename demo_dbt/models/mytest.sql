-- dbt run -m mytest

-- use jinja
{% if target.name == 'dev' %}
select 'dev' as USERNAME
{% else %}
select 'prod' as USERNAME
{% endif %}

-- call marco in sql
{{ get_user() }}
{{ limit_data() }}
