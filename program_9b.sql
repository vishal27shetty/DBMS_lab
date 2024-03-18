--Consider the following Movie table with the following attributes -
--Actor_name,Actor_id, Actor_birthdate, Director_name,Director_id,
--Director_birthdate, film_title, year of production ,type (thriller,
--comedy, etc.)
--write code to Create 5 tuples and insert values into it  with data relevant to the following questions.
--Write and execute sql queries:
--i. display all the movies acted by John in the year 2018
--ii. display only the actors names and type of the movie directed by Ram put everything in one code

-- Step 1: Create Movie table
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

-- Step 2: Insert 5 tuples into the Movie table
INSERT INTO Movie (Actor_name, Actor_id, Actor_birthdate, Director_name, Director_id, Director_birthdate, film_title, year_of_production, type)
VALUES
    ('John Wick', 1, '1980-05-10', 'David Leitch', 101, '1975-11-16', 'John Wick', 2018, 'thriller'),
    ('John Doe', 2, '1985-08-20', 'Ram Gopal Varma', 102, '1962-04-07', 'Dark Comedy', 2018, 'comedy'),
    ('John Snow', 3, '1990-12-25', 'Christopher Nolan', 103, '1970-07-30', 'Inception', 2018, 'thriller'),
    ('John Carter', 4, '1978-03-15', 'Quentin Tarantino', 104, '1963-03-27', 'Pulp Fiction', 2018, 'thriller'),
    ('John Smith', 5, '1982-06-18', 'Martin Scorsese', 105, '1942-11-17', 'The Wolf of Wall Street', 2018, 'drama');

-- Step 3: Execute SQL queries

-- i. display all the movies acted by John in the year 2018
SELECT *
FROM Movie
WHERE Actor_name LIKE 'John%' AND year_of_production = 2018;

-- ii. display only the actors names and type of the movie directed by Ram
SELECT Actor_name, type
FROM Movie
WHERE Director_name = 'Ram Gopal Varma';
