from flask_app.config.mysqlconnection import connectToMySQL
from flask import flash

class Agendamiento:
    db_name = 'agendamientovehiculos'

    def __init__(self,db_data):
        self.idagendamiento = db_data['idagendamiento']
        self.fecha = db_data['fecha']
        self.motivouso = db_data['motivouso']
        self.user_id = db_data['user_id']
        self.vehiculo_id = db_data['vehiculo_id']
        self.created_at = db_data['created_at']
        self.updated_at = db_data['updated_at']
        self.first_name= db_data['first_name']
        self.marca= db_data['marca']
        self.imagen= db_data['imagen']


    @classmethod
    def save(cls,data):
        query = """INSERT INTO agendamiento (fecha, motivouso, user_id,vehiculo_id, created_at, updated_at) VALUES (%(fecha)s, %(motivouso)s, %(user_id)s, %(vehiculo_id)s, NOW(), NOW());"""
        return connectToMySQL(cls.db_name).query_db(query, data)

    @classmethod
    def get_all(cls,data):
        query = """SELECT a.idagendamiento, a.fecha, a.motivouso, a.user_id,a.vehiculo_id, a.created_at, a.updated_at, u.first_name AS first_name, v.marca as marca,
        v.imagen as imagen FROM agendamiento a 
        JOIN users u ON a.user_id=u.id JOIN vehiculo v ON a.vehiculo_id = v.idvehiculo order by fecha desc;"""
        results =  connectToMySQL(cls.db_name).query_db(query,data)
        all_agendamientos = []
        for row in results:
            print(row['created_at'])
            all_agendamientos.append( cls(row) )
        return all_agendamientos
    
    @classmethod
    def get_one(cls,data):
        query = """SELECT a.idagendamiento, a.fecha, a.motivouso, a.user_id, a.vehiculo_id, a.created_at, a.updated_at,  u.first_name AS first_name, v.marca AS marca, v.imagen AS imagen FROM agendamiento a 
        JOIN users u ON a.user_id=u.id JOIN vehiculo v ON a.vehiculo_id = v.idvehiculo where a.idagendamiento = %(idagendamiento)s;"""
        results = connectToMySQL(cls.db_name).query_db(query,data)
        return cls( results[0] )

    @classmethod
    def update(cls, data):
        query = "UPDATE agendamiento SET fecha=%(fecha)s, motivouso=%(motivouso)s,updated_at=NOW() WHERE idagendamiento = %(idagendamiento)s;"
        return connectToMySQL(cls.db_name).query_db(query,data)
    
    @classmethod
    def destroy(cls,data):
        query = "DELETE FROM agendamiento WHERE idagendamiento = %(idagendamiento)s;"
        return connectToMySQL(cls.db_name).query_db(query,data)
    @staticmethod
    def validate_agendamiento(agendamiento):
        is_valid = True
        if len(agendamiento['motivouso']) < 10:
            is_valid = False
            flash("El motivo del uso del vehículo debe tener al menos 10 caracteres","agendamiento")
        return is_valid
