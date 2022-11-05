from abc import ABCMeta, abstractmethod


class Database(metaclass=ABCMeta):
    @abstractmethod
    def consultar(self, coleccion: str):
        raise NotImplementedError
