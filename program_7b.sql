--Consider the following Movie table with the following attributes - Actor_name,Actor_id, Actor_birthdate, Director_name,Director_id,
--Director_birthdate, film_title, year of production ,type (thriller,
--comedy, etc.)
--Create 5 tuples and insert values into it
--Write and execute SQL queries:
--i. retirve all the movies acted by John in the year 2018
--ii. retirve only the actors names and type of the movie directed by Ram

CREATE TABLE Movie (
    Actor_name VARCHAR(100),
    Actor_id INT,
    Actor_birthdate DATE,
    Director_name VARCHAR(100),
    Director_id INT,
    Director_birthdate DATE,
    film_title VARCHAR(100),
    year_of_production INT,
    type VARCHAR(50)
);

INSERT INTO Movie VALUES
('John', 1, '1980-01-01', 'Ram', 1, '1970-01-01', 'Movie 1', 2018, 'thriller'),
('John', 1, '1980-01-01', 'Sam', 2, '1972-01-01', 'Movie 2', 2019, 'comedy'),
('Alex', 2, '1982-01-01', 'Ram', 1, '1970-01-01', 'Movie 3', 2020, 'thriller'),
('Alex', 2, '1982-01-01', 'Sam', 2, '1972-01-01', 'Movie 4', 2021, 'comedy'),
('John', 1, '1980-01-01', 'Ram', 1, '1970-01-01', 'Movie 5', 2018, 'comedy');

-- Query 1: Retrieve all the movies acted by John in the year 2018
SELECT film_title
FROM Movie
WHERE Actor_name = 'John' AND year_of_production = 2018;

-- Query 2: Retrieve only the actors' names and type of the movie directed by Ram
SELECT Actor_name, type
FROM Movie
WHERE Director_name = 'Ram';

