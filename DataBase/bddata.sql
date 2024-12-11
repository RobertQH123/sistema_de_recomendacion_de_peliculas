-- Usuarios
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- Películas
CREATE TABLE movies (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    year INT NOT NULL,
    posterurl VARCHAR(255),
    genre VARCHAR(50) NOT NULL
);

-- Calificaciones de películas
CREATE TABLE movie_ratings (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    movie_id INT NOT NULL,
    rating INT NOT NULL,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (movie_id) REFERENCES movies(id)
);

-- Preferencias de usuario
CREATE TABLE user_preferences (
    user_id INT NOT NULL,
    genre VARCHAR(50) NOT NULL,
    PRIMARY KEY (user_id, genre),
    FOREIGN KEY (user_id) REFERENCES users(id)
);


-- Tabla: users
INSERT INTO users (id, name)
VALUES
(1, 'Robert'),
(2, 'Alice'),
(3, 'John'),
(4, 'Maria'),
(5, 'Sophia'),
(6, 'David'),
(7, 'Emma'),
(8, 'Lucas'),
(9, 'Olivia'),
(10, 'James'),
(11, 'Liam'),
(12, 'Charlotte'),
(13, 'Noah'),
(14, 'Mia'),
(15, 'Benjamin'),
(16, 'Amelia'),
(17, 'Elijah'),
(18, 'Harper'),
(19, 'Ethan'),
(20, 'Ava');

-- Tabla: movies
INSERT INTO movies (id, title, year, posterurl, genre)
VALUES
(1, 'The Matrix', 1999, 'https://images-na.ssl-images-amazon.com/images/M/MV5BNzQzOTk3OTAtNDQ0Zi00ZTVkLWI0MTEtMDllZjNkYzNjNTc4L2ltYWdlXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_SY500_CR0,0,332,500_AL_.jpg', 'Sci-Fi'),
(2, 'Inception', 2010, 'https://images-na.ssl-images-amazon.com/images/M/MV5BMjAxMzY3NjcxNF5BMl5BanBnXkFtZTcwNTI5OTM0Mw@@._V1_SY500_CR0,0,337,500_AL_.jpg', 'Sci-Fi'),
(3, 'Interstellar', 2014, 'https://images-na.ssl-images-amazon.com/images/M/MV5BMjIxNTU4MzY4MF5BMl5BanBnXkFtZTgwMzM4ODI3MjE@._V1_SY500_CR0,0,320,500_AL_.jpg', 'Adventure'),
(4, 'The Dark Knight', 2008, 'https://poster.example.com/darkknight.jpg', 'Action'),
(5, 'Parasite', 2019, 'https://poster.example.com/parasite.jpg', 'Drama'),
(6, 'Avengers: Endgame', 2019, 'https://poster.example.com/endgame.jpg', 'Action'),
(7, 'Titanic', 1997, 'https://poster.example.com/titanic.jpg', 'Romance'),
(8, 'Joker', 2019, 'https://poster.example.com/joker.jpg', 'Drama'),
(9, 'The Godfather', 1972, 'https://poster.example.com/godfather.jpg', 'Crime'),
(10, 'Pulp Fiction', 1994, 'https://poster.example.com/pulpfiction.jpg', 'Crime'),
(11, 'The Shawshank Redemption', 1994, 'https://poster.example.com/shawshank.jpg', 'Drama'),
(12, 'Fight Club', 1999, 'https://poster.example.com/fightclub.jpg', 'Action'),
(13, 'The Lion King', 1994, 'https://m.media-amazon.com/images/M/MV5BZGRiZDZhZjItM2M3ZC00Y2IyLTk3Y2MtMWY5YjliNDFkZTJlXkEyXkFqcGc@._V1_SX300.jpg', 'Animation'),
(14, 'The Avengers', 2012, 'https://m.media-amazon.com/images/M/MV5BNGE0YTVjNzUtNzJjOS00NGNlLTgxMzctZTY4YTE1Y2Y1ZTU4XkEyXkFqcGc@._V1_SX300.jpg', 'Action'),
(15, 'Forrest Gump', 1994, 'https://m.media-amazon.com/images/M/MV5BNDYwNzVjMTItZmU5YS00YjQ5LTljYjgtMjY2NDVmYWMyNWFmXkEyXkFqcGc@._V1_SX300.jpg', 'Drama'),
(16, 'Star Wars: The Force Awakens', 2015, 'https://m.media-amazon.com/images/M/MV5BOTAzODEzNDAzMl5BMl5BanBnXkFtZTgwMDU1MTgzNzE@._V1_SX300.jpg', 'Sci-Fi'),
(17, 'The Matrix Reloaded', 2003, 'https://m.media-amazon.com/images/M/MV5BNjAxYjkxNjktYTU0YS00NjFhLWIyMDEtMzEzMTJjMzRkMzQ1XkEyXkFqcGc@._V1_SX300.jpg', 'Sci-Fi'),
(18, 'The Godfather: Part II', 1974, 'https://m.media-amazon.com/images/M/MV5BNzc1OWY5MjktZDllMi00ZDEzLWEwMGItYjk1YmRhYjBjNTVlXkEyXkFqcGc@._V1_SX300.jpg', 'Crime'),
(19, 'Gladiator', 2000, 'https://m.media-amazon.com/images/M/MV5BYWQ4YmNjYjEtOWE1Zi00Y2U4LWI4NTAtMTU0MjkxNWQ1ZmJiXkEyXkFqcGc@._V1_SX300.jpg', 'Action'),
(20, 'Deadpool', 2016, 'https://m.media-amazon.com/images/M/MV5BNzY3ZWU5NGQtOTViNC00ZWVmLTliNjAtNzViNzlkZWQ4YzQ4XkEyXkFqcGc@._V1_SX300.jpg', 'Action'),
(21, 'Black Panther', 2018, 'https://m.media-amazon.com/images/M/MV5BMTg1MTY2MjYzNV5BMl5BanBnXkFtZTgwMTc4NTMwNDI@._V1_SX300.jpg', 'Action'),
(22, 'Coco', 2017, 'https://m.media-amazon.com/images/M/MV5BMDIyM2E2NTAtMzlhNy00ZGUxLWI1NjgtZDY5MzhiMDc5NGU3XkEyXkFqcGc@._V1_SX300.jpg', 'Animation'),
(23, 'Mad Max: Fury Road', 2015, 'https://m.media-amazon.com/images/M/MV5BZDRkODJhOTgtOTc1OC00NTgzLTk4NjItNDgxZDY4YjlmNDY2XkEyXkFqcGc@._V1_SX300.jpg', 'Action'),
(24, 'The Silence of the Lambs', 1991, 'https://m.media-amazon.com/images/M/MV5BNDdhOGJhYzctYzYwZC00YmI2LWI0MjctYjg4ODdlMDExYjBlXkEyXkFqcGc@._V1_SX300.jpg', 'Thriller'),
(25, 'Schindler\s List', 1993, 'https://m.media-amazon.com/images/M/MV5BMTY4MTY0OTY4NV5BMl5BanBnXkFtZTcwOTgxMjMyMQ@@._V1_SX300.jpg', 'Drama'),
(26, 'Finding Nemo', 2003, 'https://m.media-amazon.com/images/M/MV5BMTc5NjExNTA5OV5BMl5BanBnXkFtZTYwMTQ0ODY2._V1_SX300.jpg', 'Animation'),
(27, 'The Social Network', 2010, 'https://m.media-amazon.com/images/M/MV5BMjlkNTE5ZTUtNGEwNy00MGVhLThmZjMtZjU1NDE5Zjk1NDZkXkEyXkFqcGc@._V1_SX300.jpg', 'Drama'),
(28, 'Dune', 2021, 'https://m.media-amazon.com/images/M/MV5BNWIyNmU5MGYtZDZmNi00ZjAwLWJlYjgtZTc0ZGIxMDE4ZGYwXkEyXkFqcGc@._V1_SX300.jpg', 'Sci-Fi'),
(29, 'Toy Story', 1995, 'https://m.media-amazon.com/images/M/MV5BZTA3OWVjOWItNjE1NS00NzZiLWE1MjgtZDZhMWI1ZTlkNzYwXkEyXkFqcGc@._V1_SX300.jpg', 'Animation'),
(30, 'Frozen', 2013, 'https://m.media-amazon.com/images/M/MV5BMTQ1MjQwMTE5OF5BMl5BanBnXkFtZTgwNjk3MTcyMDE@._V1_SX300.jpg', 'Animation');


-- Tabla: user_preferences
INSERT INTO user_preferences (user_id, genre)
VALUES
(1, 'Sci-Fi'),
(1, 'Adventure'),
(2, 'Action'),
(2, 'Drama'),
(3, 'Crime'),
(3, 'Action'),
(4, 'Romance'),
(4, 'Drama'),
(5, 'Sci-Fi'),
(5, 'Crime'),
(6, 'Action'),
(6, 'Sci-Fi'),
(7, 'Drama'),
(7, 'Comedy'),
(8, 'Sci-Fi'),
(8, 'Animation'),
(9, 'Action'),
(9, 'Drama'),
(10, 'Sci-Fi'),
(10, 'Adventure'),
(11, 'Action'),
(11, 'Sci-Fi'),
(12, 'Animation'),
(12, 'Drama'),
(13, 'Thriller'),
(13, 'Adventure'),
(14, 'Romance'),
(14, 'Drama'),
(15, 'Crime'),
(15, 'Action'),
(16, 'Animation'),
(16, 'Comedy'),
(17, 'Action'),
(17, 'Sci-Fi'),
(18, 'Drama'),
(18, 'Thriller'),
(19, 'Sci-Fi'),
(19, 'Adventure'),
(20, 'Animation'),
(20, 'Family');

-- Tabla: movie_ratings
INSERT INTO movie_ratings (id, user_id, movie_id, rating, timestamp)
VALUES
(11, 1, 3, 5, '2024-12-11 22:00:00'),
(12, 1, 4, 4, '2024-12-12 10:30:00'),
(13, 2, 6, 5, '2024-12-13 11:45:00'),
(14, 2, 7, 4, '2024-12-14 12:15:00'),
(15, 3, 10, 5, '2024-12-15 13:00:00'),
(16, 3, 11, 5, '2024-12-16 14:30:00'),
(17, 4, 12, 5, '2024-12-17 15:00:00'),
(18, 4, 13, 4, '2024-12-18 16:45:00'),
(19, 5, 14, 5, '2024-12-19 17:30:00'),
(20, 5, 15, 4, '2024-12-20 18:00:00'),
(21, 6, 16, 5, '2024-12-21 19:15:00'),
(22, 6, 17, 4, '2024-12-22 20:00:00'),
(23, 7, 18, 5, '2024-12-23 21:30:00'),
(24, 7, 19, 4, '2024-12-24 22:45:00'),
(25, 8, 20, 5, '2024-12-25 23:30:00'),
(26, 8, 9, 4, '2024-12-26 12:15:00'),
(27, 9, 6, 5, '2024-12-27 13:00:00'),
(28, 9, 5, 4, '2024-12-28 14:45:00'),
(29, 10, 8, 5, '2024-12-29 15:00:00'),
(30, 10, 3, 4, '2024-12-30 16:30:00'),
(31, 11, 21, 5, '2024-12-31 10:00:00'),
(32, 11, 23, 4, '2024-12-31 11:30:00'),
(33, 12, 22, 5, '2024-12-31 12:45:00'),
(34, 12, 30, 4, '2024-12-31 13:15:00'),
(35, 13, 24, 5, '2024-12-31 14:00:00'),
(36, 13, 28, 4, '2024-12-31 15:30:00'),
(37, 14, 25, 5, '2024-12-31 16:00:00'),
(38, 14, 27, 4, '2024-12-31 17:45:00'),
(39, 15, 26, 5, '2024-12-31 18:30:00'),
(40, 15, 29, 4, '2024-12-31 19:00:00'),
(41, 16, 22, 5, '2024-12-31 20:15:00'),
(42, 16, 30, 4, '2024-12-31 21:00:00'),
(43, 17, 23, 5, '2024-12-31 22:30:00'),
(44, 17, 28, 4, '2024-12-31 23:45:00'),
(45, 18, 24, 5, '2025-01-01 00:30:00'),
(46, 18, 27, 4, '2025-01-01 01:15:00'),
(47, 19, 26, 5, '2025-01-01 02:00:00'),
(48, 19, 29, 4, '2025-01-01 02:45:00'),
(49, 20, 22, 5, '2025-01-01 03:30:00'),
(50, 20, 30, 4, '2025-01-01 04:15:00');


CREATE VIEW top_rated_recommendations AS
SELECT
    u.id AS user_id,
    u.name AS user_name,
    m.id AS movie_id,
    m.title AS movie_title,
    m.genre,
    AVG(r.rating) AS average_rating
FROM users u
JOIN user_preferences up ON u.id = up.user_id
JOIN movies m ON up.genre = m.genre
JOIN movie_ratings r ON m.id = r.movie_id
GROUP BY u.id, m.id, m.title, m.genre
HAVING AVG(r.rating) >= 4
ORDER BY u.id, average_rating DESC;


SELECT * FROM top_rated_recommendations WHERE user_id = 2;



CREATE VIEW item_similarity AS
SELECT 
    m1.id AS movie_id_1,
    m2.id AS movie_id_2,
    SUM(r1.rating * r2.rating) / 
    (SQRT(SUM(POWER(r1.rating, 2))) * SQRT(SUM(POWER(r2.rating, 2)))) AS cosine_similarity
FROM 
    movie_raitings r1
JOIN 
    movie_raitings r2 ON r1.ID_user = r2.ID_user
JOIN 
    movies m1 ON r1.ID_movie = m1.id
JOIN 
    movies m2 ON r2.ID_movie = m2.id
WHERE 
    m1.id != m2.id
GROUP BY 
    m1.id, m2.id;




CREATE VIEW user_recommendations AS
SELECT 
    u_target.id AS user_id,
    m.id AS movie_id,
    m.title,
    m.posterurl,
    AVG(r.rating) AS avg_rating,
    COUNT(r.rating) AS rating_count
FROM 
    user_similarity us
JOIN 
    users u_target ON us.user_id_1 = u_target.id
JOIN 
    users u_similar ON us.user_id_2 = u_similar.id
JOIN 
    movie_ratings r ON r.user_id = u_similar.id
JOIN 
    movies m ON r.movie_id = m.id
WHERE 
    m.id NOT IN (
        SELECT movie_id
        FROM movie_ratings 
        WHERE user_id = u_target.id
    ) -- Excluir películas ya puntuadas por el usuario objetivo
GROUP BY 
    u_target.id, m.id, m.title
ORDER BY 
    avg_rating DESC, rating_count DESC
LIMIT 50; -- Aumentar el límite para obtener más resultados


SELECT * 
FROM user_recommendations 
WHERE user_id = ?;



CREATE VIEW item_recommendations AS
SELECT 
    r.user_id,
    m.id AS movie_id,
    m.title,
    m.posterurl,
    SUM(isim.cosine_similarity * r.rating) AS weighted_score,
    COUNT(isim.cosine_similarity) AS similarity_count
FROM 
    movie_ratings r
JOIN 
    item_similarity isim ON r.movie_id = isim.movie_id_1 -- Comparamos la película calificada con otras
JOIN 
    movies m ON isim.movie_id_2 = m.id -- Traemos los detalles de las películas recomendadas
WHERE 
    r.rating >= 4 -- Solo consideramos las películas que el usuario calificó alto (4 o más)
    AND m.id NOT IN (
        SELECT movie_id 
        FROM movie_ratings 
        WHERE user_id = r.user_id
    ) -- Excluir películas ya puntuadas por el usuario
GROUP BY 
    r.user_id, m.id, m.title
ORDER BY 
    weighted_score DESC, similarity_count DESC
LIMIT 10;


SELECT * FROM   item_recommendations WHERE  user_id = 1