mv target\manifest.json .
dbt ls --models state:modified --state .
dbt run --models state:modified --state .