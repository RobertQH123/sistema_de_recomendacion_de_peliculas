from connection.coneccion_db import obtener_conexion


def Generar_Recomendaciones_Usuarios_Similares(usuario_id):
    db = obtener_conexion()
    cursor = db.cursor()

    consulta = """
    SELECT *  FROM user_recommendations  WHERE user_id = %s;
    """
    cursor.execute(consulta, (usuario_id,))
    resultados = cursor.fetchall()

    cursor.close()
    db.close()

    return [
        {
            "movie_id": fila[1],
            "movie_title": fila[2],
            "img": fila[3],
        }
        for fila in resultados
    ]


def Generar_Recomendaciones_Peliculas_Similares(usuario_id):
    # Establecer conexión y cursor
    db = obtener_conexion()
    cursor = db.cursor()

    # Consulta para obtener puntaje promedio por item
    consulta = """
    SELECT * FROM   item_recommendations WHERE  user_id  = %s;
    """
    cursor.execute(consulta, (usuario_id,))
    resultados = cursor.fetchall()

    # Cerrar cursor y conexión
    cursor.close()
    db.close()

    return [
        {"movie_id": fila[1], "movie_title": fila[2], "img": fila[3]}
        for fila in resultados
    ]


def Generar_Recomendaciones_Mejores_Peliculas():
    db = obtener_conexion()
    cursor = db.cursor()

    consulta = """
    SELECT DISTINCT m.id, m.title, m.genre, m.posterurl, AVG(r.rating) AS average_rating
FROM movies m
JOIN movie_ratings r ON m.id = r.movie_id
GROUP BY m.id, m.title, m.genre
HAVING AVG(r.rating) >= 4
ORDER BY average_rating DESC;
    """
    cursor.execute(consulta)
    resultados = cursor.fetchall()

    cursor.close()
    db.close()

    return [
        {
            "movie_id": fila[0],
            "movie_title": fila[1],
            "genre": fila[2],
            "img": fila[3],
        }
        for fila in resultados
    ]
