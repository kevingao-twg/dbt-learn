{% macro drop_clone_database() %}

{% set clone_db = 'mydb_307519' %}
{% set results = run_query('drop database if exists ' ~ clone_db) %}
{{ log(results.columns[0].values(), info=True)}}
{% do results.print_table() %}

{%- endmacro %}