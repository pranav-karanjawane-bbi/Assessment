from abc import ABC, abstractmethod

 

class Vehicle(ABC):
    def __init__(self, make, model):
        self._make = make
        self._model = model

    def get_make(self):
        return self._make

    def get_model(self):
        return self._model

    @abstractmethod    
    def display_info(self):
        pass

class Car(Vehicle):
    def __init__(self, make, model, fuel_type):
        super().__init__(make, model)
        self.__fuel_type = fuel_type

    def get_fuel_type(self):
        return self.__fuel_type

    def display_info(self):
        print(f"Make : {self._make}, Model : {self._model}, fuel_type : {self.__fuel_type}")


class Motorcycle(Vehicle):
    def __init__(self, make, model, engine_capacity):
        super().__init__(make,model)
        self.__engine_capacity = engine_capacity

    def get_engine_capacity(self):
        return self.__engine_capacity

    def display_info(self):
        print(f"Make : {self._make}, Model : {self._model}, engine_capacity : {self.__engine_capacity}")

car = Car("BMW","M5","Petrol")
car.display_info()

 

bike = Motorcycle("Hero", "Splendor", "Petrol")
bike.display_info()