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

-- переименование делается с помощью команды RENAME
-- 1) RENAME TABLE cinema TO films;
-- или через ALTER TABLE
-- ALTER TABLE cinema
-- RENAME TO films;
-- 2) Если надо переименовать столбец, то 
-- ALTER TABLE cinema 
-- RENAME COLUMN film_title TO film_name;

-- добавление нового столбца происходит с помощью ADD
-- ALTER TABLE cinema
-- ADD actor VARCHAR(50) NOT NULL;

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

-- заполнение таблицы фильмов
INSERT INTO cinema
	(film_title, film_original_name, film_released, age_limit)
VALUES 
	('Зелёная миля', 'The Green Mile', 1999, '16+'),
    ('Форест Гамп', 'Forrest Gump', 1994, '16+'),
    ('Интерстеллар', 'Interstellar', 2014, '16+'),
    ('Игры разума', 'A Beautiful Mind', 2001, '12+'),
    ('Бойцовский клуб', 'Fight Club', 1999, '18+'),
    ('Остров проклятых', 'Shutter Island', 2009, '18+'),
    ('Начало', 'Inception', 2010, '12+');

SELECT * FROM cinema;

-- оператор псевдонима
SELECT 
	film_id AS '№',
    film_title AS 'Название',
    film_released AS 'Премьера фильма',
    film_original_name AS 'Оригинальное название',
    age_limit AS 'Возрастное ограничение'
FROM cinema;

-- CASE
SELECT film_title AS 'Название фильма',
	CASE age_limit
		WHEN '16+' THEN 'Можно с 16 лет'
		WHEN '18+' THEN 'Вам должно быть 18!'
		ELSE 'Смотреть можно детям'
	END AS 'Возраст' 
FROM cinema;

-- IF
SELECT film_title AS 'Название фильма',
    IF (film_released >= 2000, 'Современный фильм', 'Старый фильм') AS 'Современность'
FROM cinema;

-- заполнение таблицы жанров
INSERT INTO genre
	(genre_title)
VALUES
	('Драма'),
	('Фэнтези'),
    ('Криминал'),
    ('Комедия'),
    ('Фантастика'),
    ('Мелодрама'),
    ('Приключения'),
    ('Военный'),
    ('История'),
    ('Биография'),
    ('Триллер'),
    ('Детектив'),
    ('боевик'),
    ('Ужасы');

SELECT * FROM genre;

-- оператор псевдонима
SELECT 
	genre_id AS '№ жанра',
	genre_title AS 'Жанр'
FROM genre;

-- заполнение таблицы студий
INSERT INTO creator_studio
	(studio_title)
VALUES
	('Warner Hollywood Studios'),
    ('Paramount Pictures'),
    ('The Steve Tisch Company'),
    ('Wendy Finerman Productions'),
    ('Legendary Pictures'), 
    ('Lynda Obst Productions'),  
    ('Syncopy'), 
    ('Warner Bros. Pictures'),
    ('Imagine Entertainment'), 
    ('Universal Pictures'),
    ('Fox 2000 Pictures'), 	
    ('Linson Films'),
    ('Appian Way'),
    ('Sikelia Productions');

SELECT * FROM creator_studio;

SELECT
	studio_id AS '№', 
    studio_title AS 'Студия'
FROM creator_studio;

-- заполнение таблицы стран
INSERT INTO manufacturer_country
	(country_title)
VALUES
	('США'),
    ('Великобритания'),
    ('Канада'),
    ('Германия'),
    ('Италия'),
    ('СССР');

SELECT * FROM manufacturer_country;

SELECT 
	country_id AS '№',
	country_title AS 'Страна'
FROM manufacturer_country;

-- заполнение таблицы ID фильмов и соответсвующих жанров
INSERT INTO cinema_genre
	(film_id, genre_id)
VALUES
	(1, 1), (1, 2), (1, 3),
    (2, 1), (2, 4), (2, 6), (2, 9), (2, 8),
    (3, 5), (3, 1), (3, 7),
    (4, 1), (4, 10), (4, 6),
    (5, 11), (5, 1), (5, 3),
    (6, 11), (6, 12), (6, 1),
    (7, 5), (7, 13), (7, 11), (7, 1), (7, 12);

SELECT * FROM cinema_genre;

SELECT 
	film_id AS '№ фильма', 
    genre_id AS '№ жанра'
FROM cinema_genre;

-- заполнение таблицы ID фильмов и соответсвующих студий
INSERT INTO cinema_studio
	(film_id, studio_id)
VALUES
	(1, 1),
    (2, 2), (2, 3), (2, 4),
    (3, 5), (3, 6), (3, 2), (3, 7), (3, 8),
    (4, 9), (4, 10),
    (5, 11), (5, 12),
    (6, 13), (6, 2),
    (7, 5), (7, 7), (7, 8);

SELECT * FROM cinema_studio;
     
SELECT 
	film_id AS '№ фильма', 
    studio_id AS '№ студии'
FROM cinema_studio;

-- заполнение таблицы ID фильмов и соответсвующих стран
INSERT INTO cinema_country
	(film_id, country_id)
VALUES
	(1, 1),
    (2, 1),
    (3, 1), (3, 2), (2, 3),
    (4, 1),
    (5, 1), (5, 4),
    (6, 1),
    (7, 1), (7, 2);

SELECT * FROM cinema_country;

SELECT 
	film_id AS '№ фильма', 
    country_id AS '№ страны'
FROM cinema_countr


-- Подумать и описать проблемы своего проектирования базы данных;
-- 1. Не хватает кучи таблиц (актёры, сценвристы, продюсеры и т.д.) 2. Заполнять их вообще не надо было пока что (зря потратила время) 
-- 3. По-любому неправильно заполнила таблицы с ID (они-то работают, но надо было всё в один столбик, а не как у меня) 
-- 4. Вообще тут ещё пахать и пахать, знания ограничены, оправданий нет