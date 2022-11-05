import pprint

from databases.database import Database
import pymongo


class MongoConection(Database):
    def __init__(self):
        self.myclient = pymongo.MongoClient(
            "mongodb+srv://Bryan:traceon@cluster0.m8f238i.mongodb.net/?retryWrites=true&w=majority")
        self.db = self.myclient.get_database('Proyecto')
        self.canal = self.db.Canal
        self.video = self.db.Video

    def consultar(self, coleccion: str):
        consulta: list = []
        if coleccion == "canal":
            consulta = list(self.canal.find())
        elif coleccion == "video":
            consulta = list(self.video.find())
        else:
            print("No mando parametros validos")
        return consulta
