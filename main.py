import json
import pprint

import pandas as pd
from bson import json_util

from databases.database import Database
from databases.mongo_atlas import MongoConection


conection: Database = MongoConection()
canales: list = conection.consultar("canal")
print("Tipo de top_dict ", type(canales))
print("Tipo de archivo en top_dict ", type(canales[0]))
canales_json = []
canales_dict = []
for canal in canales:
    canal_json = json_util.dumps(canales)
    canales_json.append(canal_json)

for canal in canales_json:
    archivo_json = json.loads(canal)
    canales_dict.append(archivo_json)

with open(r"C:\Users\HP15DA0023LA\Documents\csv_para_r\canales.json", 'w') as f:
    json.dump(canales_dict, f)

canales_csv = pd.read_json(r"C:\Users\HP15DA0023LA\Documents\csv_para_r\canales.json")
canales_csv.to_csv(r"C:\Users\HP15DA0023LA\Documents\csv_para_r\canales.csv")
