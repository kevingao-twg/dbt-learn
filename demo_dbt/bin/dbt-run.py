import os
import requests

url = 'https://raw.githubusercontent.com/kevingao-twg/dbt-learn/main/demo_dbt/manifest.json'


directory = os.getcwd()
filename = directory + '\manifest.json'
r = requests.get(url)
f = open(filename,'wb')
f.write(r.content)
