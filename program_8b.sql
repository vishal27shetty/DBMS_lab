--Consider the following Movie table with the following attributes -
--Actor_name,Actor_id, Actor_birthdate, Director_name,Director_id,
--Director_birthdate, film_title, year of production ,type (thriller,
--comedy, etc.)
--Create 10 documents with data relevant to the following questions.
--Write and execute MongoDB queries:
--i. List all the movies acted by John and Elly in the year 2012.
--ii. List only the name and type of the movie where Ram has acted
--sorted by movie names

-- Create the Movie table
CREATE TABLE Movie (
    Actor_name VARCHAR(50),
    Actor_id INT,
    Actor_birthdate DATE,
    Director_name VARCHAR(50),
    Director_id INT,
    Director_birthdate DATE,
    film_title VARCHAR(100),
    year_of_production INT,
    type VARCHAR(50)
);

-- Insert sample data
INSERT INTO Movie (Actor_name, Actor_id, Actor_birthdate, Director_name, Director_id, Director_birthdate, film_title, year_of_production, type)
VALUES
    ('John', 1, '1980-05-10', 'Director1', 101, '1975-03-20', 'Movie1', 2012, 'Thriller'),
    ('Elly', 2, '1985-09-15', 'Director2', 102, '1980-07-12', 'Movie2', 2012, 'Comedy'),
    ('John', 1, '1980-05-10', 'Director3', 103, '1978-11-30', 'Movie3', 2010, 'Action'),
    ('Ram', 3, '1978-12-25', 'Director4', 104, '1972-09-05', 'Movie4', 2015, 'Drama'),
    ('Elly', 2, '1985-09-15', 'Director5', 105, '1982-04-18', 'Movie5', 2012, 'Romance');

-- i. List all the movies acted by John and Elly in the year 2012.
SELECT *
FROM Movie
WHERE Actor_name IN ('John', 'Elly') AND year_of_production = 2012;

-- ii. List only the name and type of the movie where Ram has acted sorted by movie names.
SELECT film_title, type
FROM Movie
WHERE Actor_name = 'Ram'
ORDER BY film_title;
