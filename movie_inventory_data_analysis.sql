#This is a small educational project made from a fake blockbuster library dataset

# Skills used in this project are: SELECT, ALTER, GROUP BY, RENAME, AVG, ROUND, WHERE, CREATE VIEW

-----------------------------------------------------

#Initial check

SELECT * FROM rental;
SELECT * FROM movies;

# Changing column names to english
ALTER TABLE actors
RENAME COLUMN id_ator TO id_actor, 
RENAME COLUMN nome_ator TO name_actor,
RENAME COLUMN  ano_nascimento TO dob, 
RENAME COLUMN nacionalidade TO nacionality, 
RENAME COLUMN sexo TO gender;

ALTER TABLE acting
RENAME COLUMN id_protagonista TO id_protagonist, 
RENAME COLUMN id_filme TO id_movie,
RENAME COLUMN id_ator TO id_actor;

ALTER TABLE clients
RENAME COLUMN id_cliente TO id_client, 
RENAME COLUMN nome_cliente TO name_client,
RENAME COLUMN estado TO state, 
RENAME COLUMN regiao TO region,
RENAME COLUMN sexo TO gender,
RENAME COLUMN  data_nascimento TO dob, 
RENAME COLUMN data_criacao_conta TO opening_account_date;

ALTER TABLE movies
RENAME COLUMN id_filme TO id_movie,
RENAME COLUMN titulo TO title,
RENAME COLUMN genero TO gender_movie,
RENAME COLUMN duracao TO lenght,
RENAME COLUMN ano_lancamento TO launch_date,
RENAME COLUMN preco_aluguel TO rental_price;

#Checking the average price of movies

SELECT AVG(rental_price) FROM movies;

SELECT gender_movie,
AVG(rental_price) 
FROM movies
GROUP BY gender_movie

SELECT gender_movie,
ROUND(AVG(rental_price),2),
COUNT(*) AS count
FROM movies
GROUP BY gender_movie;

# Checking movies launched in 2011

SELECT gender_movie,
ROUND(AVG(rental_price),2),
COUNT(*) AS count
FROM movies
WHERE launch_date = 2011
GROUP BY gender_movie;

#Checking movies with grade over the average

SELECT AVG(nota) FROM rental;

SELECT *
FROM rental
WHERE nota >= (SELECT AVG(nota) FROM rental);

# Creating views

CREATE VIEW results AS
SELECT
	gender_movie,
    ROUND(AVG(rental_price), 2) AS average_price,
    COUNT(*) AS count
FROM movies
GROUP BY gender_movie;

SELECT * FROM results