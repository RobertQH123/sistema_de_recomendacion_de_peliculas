from flask import Flask, jsonify, request
from flask_cors import CORS
from models.recomendaciones import (
    Generar_Recomendaciones_Usuarios_Similares,
    Generar_Recomendaciones_Peliculas_Similares,
    Generar_Recomendaciones_Mejores_Peliculas,
)


app = Flask(__name__)
CORS(app)


@app.route("/recomendaciones/usuario/<int:usuario_id>", methods=["GET"])
def recomendaciones_por_usuario(usuario_id):
    resultados = Generar_Recomendaciones_Usuarios_Similares(usuario_id)
    return jsonify(resultados)


@app.route("/recomendaciones/item/<int:usuario_id>", methods=["GET"])
def recomendaciones_por_item(usuario_id):
    resultados = Generar_Recomendaciones_Peliculas_Similares(usuario_id)
    return jsonify(resultados)


@app.route("/recomendaciones/mejores/", methods=["GET"])
def recomendaciones_mejores():
    resultados = Generar_Recomendaciones_Mejores_Peliculas()
    return jsonify(resultados)


if __name__ == "__main__":
    app.run(debug=True)
