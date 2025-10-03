import mysql.connector
import json
import pandas as pd
conn = mysql.connector.connect(
    host='localhost',
    user='root',
    password='12345678',
    port=3306
)
cursor = conn.cursor()
cursor.execute('use dbMer')
cursor.execute('select * from Produto')
json_itens = cursor.fetchall()
jsonList = pd.DataFrame(json_itens, columns = ['Id','Nome', 'Descricao', 'Preco', 'ImageUrl', 'Quantidade', 'Categoria'])

jsonList.to_json('dados.json', orient='records', indent=4, force_ascii=False)
print(jsonList)
cursor.close()
conn.close()