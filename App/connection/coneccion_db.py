import MySQLdb


def obtener_conexion():
    db = MySQLdb.connect(
        host="localhost",
        user="root",
        passwd="rootpassword",
        db="recomendacion_db",
        port=3306,
    )
    return db
