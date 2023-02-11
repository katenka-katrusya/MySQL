DROP DATABASE IF EXISTS homework;
CREATE DATABASE homework;
USE homework;

-- таблица, содержащая фильмы 
DROP TABLE IF EXISTS cinema;
CREATE TABLE cinema
(
	film_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    film_title VARCHAR(50) NOT NULL,
    film_released YEAR NOT NULL,
    film_original_name VARCHAR(50),
    age_limit VARCHAR(5) NOT NULL
);

-- таблица, содержащая жанры 
DROP TABLE IF EXISTS genre;
CREATE TABLE genre
(
	genre_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    genre_title VARCHAR(30) NOT NULL
);

-- таблица, содержащая студии
DROP TABLE IF EXISTS creator_studio;
CREATE TABLE creator_studio
(
	studio_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    studio_title VARCHAR(50) NOT NULL
);

-- таблица, содержащая страны
DROP TABLE IF EXISTS manufacturer_country;
CREATE TABLE manufacturer_country
(
	country_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    country_title VARCHAR(30) NOT NULL
);

-- таблица, содержащая ID фильмов и соответствующих жанров
DROP TABLE IF EXISTS cinema_genre;
CREATE TABLE cinema_genre
(
	film_id INT,
	genre_id INT,
	FOREIGN KEY (film_id) REFERENCES cinema (film_id) ON DELETE CASCADE,
    FOREIGN KEY (genre_id) REFERENCES genre (genre_id) ON DELETE CASCADE
);

-- таблица, содержащая ID фильмов и соответствующих студий
DROP TABLE IF EXISTS cinema_studio;
CREATE TABLE cinema_studio
(
	film_id INT,
    studio_id INT,
    FOREIGN KEY (film_id) REFERENCES cinema (film_id) ON DELETE CASCADE,
    FOREIGN KEY (studio_id) REFERENCES creator_studio (studio_id) ON DELETE CASCADE
);

-- таблица, содержащая ID фильмов и соответствующих стран
DROP TABLE IF EXISTS cinema_country;
CREATE TABLE cinema_country
(
	film_id INT,
    country_id INT,
    FOREIGN KEY (film_id) REFERENCES cinema (film_id) ON DELETE CASCADE,
    FOREIGN KEY (country_id) REFERENCES manufacturer_country (country_id) ON DELETE CASCADE
);