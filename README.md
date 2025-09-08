# 🎬 Sistema de Recomendación de Películas  

Aplicación web que recomienda películas usando **Flask + MySQL** en el backend, **React** en el frontend y **Docker** para la base de datos.  
El sistema incluye tres tipos de recomendaciones:  
- ⭐ **Mejores películas** (basado en ratings promedio ≥ 4).  
- 👥 **Usuarios similares** (colaborativo user-based).  
- 🎞️ **Películas similares** (colaborativo item-based).  

---

## 🛠️ Tecnologías  
- **Backend:** Flask, Flask-CORS, mysqlclient  
- **Base de datos:** MySQL en Docker  
- **Frontend:** React  
- **ORM/Conexión:** MySQLdb  
- **Contenedores:** Docker + Docker Compose  

---

---

## ⚙️ Instalación y uso  

### 1️⃣ Clonar el repositorio  
```bash
git clone https://github.com/RobertQH123/sistema_de_recomendacion_de_peliculas.git
cd sistema_de_recomendacion_de_peliculas
```
### 2️⃣ Levantar la base de datos con Docker
```bash
cd Database
docker-compose up -d
docker exec -i mysql_db mysql -u root -prootpassword recomendacion_db < bddata.sql
```
### 3️⃣ Configurar y ejecutar backend (Flask)
```bash
cd ../App
python -m venv env
source env/bin/activate   # Linux/Mac
env\Scripts\activate      # Windows
pip install -r requirements.txt
flask run
```
### 4️⃣ Ejecutar frontend (React)
```bash
cd ../react-buscador-pelicula
npm install
npm start
```
