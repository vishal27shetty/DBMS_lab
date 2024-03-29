--1. a)

--Consider the Sailor database given below. The primary keys are underlined.
--Assume relevant data types for attributes.
--SAILORS(Sid, Sname, Rating, Age)
--BOATS(Bid, Bname, Colour)
--RESERVES(Sid, Bid, day)
--Create the above tables in SQL. Specify primary and foreign keys properly.
--Enter at least 5 tuples in each table with relevant data. Solve the following
--queries.
--i. Find the names of sailors who have reserved at least one boat.
--ii. Find the Sid’s of sailors who have reserved a red or a green boat.
--iii. Find the Sid’s of sailors who have not reserved a boat--


-- Creating the tables
CREATE TABLE SAILORS(
    Sid INT PRIMARY KEY,
    Sname VARCHAR(100),
    Rating INT,
    Age INT
);

CREATE TABLE BOATS(
    Bid INT PRIMARY KEY,
    Bname VARCHAR(100),
    Colour VARCHAR(50)
);

CREATE TABLE RESERVES(
    Sid INT,
    Bid INT,
    day DATE,
    PRIMARY KEY (Sid, Bid, day),
    FOREIGN KEY (Sid) REFERENCES SAILORS(Sid),
    FOREIGN KEY (Bid) REFERENCES BOATS(Bid)
);

-- Inserting data into the tables
INSERT INTO SAILORS VALUES (1, 'Jack', 5, 35), (2, 'John', 4, 40), (3, 'Jill', 3, 25), (4, 'James', 2, 30), (5, 'Julia', 1, 20);
INSERT INTO BOATS VALUES (1, 'Boat1', 'Red'), (2, 'Boat2', 'Green'), (3, 'Boat3', 'Blue'), (4, 'Boat4', 'Yellow'), (5, 'Boat5', 'White');
INSERT INTO RESERVES VALUES (1, 1, '2024-02-20'), (2, 2, '2024-02-21'), (3, 3, '2024-02-22'), (4, 4, '2024-02-23'), (5, 5, '2024-02-24');

-- Queries
-- i. Find the names of sailors who have reserved at least one boat.
SELECT Sname FROM SAILORS WHERE Sid IN (SELECT Sid FROM RESERVES);

-- ii. Find the Sid’s of sailors who have reserved a red or a green boat.
SELECT Sid FROM RESERVES WHERE Bid IN (SELECT Bid FROM BOATS WHERE Colour IN ('Red', 'Green'));

-- iii. Find the Sid’s of sailors who have not reserved a boat.
SELECT Sid FROM SAILORS WHERE Sid NOT IN (SELECT Sid FROM RESERVES);

