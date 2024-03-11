--Consider the Cricket database given below. The primary keys are

--underlined. Assume relevant data types for attributes.
--PLAYER (PId, Lname, Fname, Country, Yborn, Bplace)
--MATCH (MatchId, Team1,Team2, Ground, Date, Winner)
--BATTING (MatchId, Pid, Nruns, Fours, Sixes)
--BOWLING (MatchId, Pid, Novers, Maidens, Nruns, Nwickets)
--Create the above tables in SQL. Specify primary and foreign keys properly.
--Enter at least 5 tuples in each table with relevant data. Solve the following
--queries.
--i. Display the sorted list of ground names where Australia has played
--as team1
--ii. Find the match information of all matches in which Dhoni did
--batting.
--iii. Find the names of players who did batting in match 2689

-- Create PLAYER table
CREATE TABLE PLAYER (
    PId INT PRIMARY KEY,
    Lname VARCHAR(50),
    Fname VARCHAR(50),
    Country VARCHAR(50),
    Yborn INT,
    Bplace VARCHAR(50)
);

-- Sample data for PLAYER table
INSERT INTO PLAYER (PId, Lname, Fname, Country, Yborn, Bplace)
VALUES
    (1, 'Smith', 'Steve', 'Australia', 1989, 'Sydney'),
    (2, 'Kohli', 'Virat', 'India', 1988, 'Delhi'),
    (3, 'Root', 'Joe', 'England', 1990, 'Sheffield'),
    -- Add more players...
    (5, 'Warner', 'David', 'Australia', 1986, 'Sydney');

-- Create MATCH table
CREATE TABLE MATCH (
    MatchId INT PRIMARY KEY,
    Team1 VARCHAR(50),
    Team2 VARCHAR(50),
    Ground VARCHAR(50),
    Date DATE,
    Winner VARCHAR(50)
);

-- Sample data for MATCH table
INSERT INTO MATCH (MatchId, Team1, Team2, Ground, Date, Winner)
VALUES
    (2689, 'Australia', 'India', 'Melbourne', '2024-03-10', 'India'),
    (2690, 'England', 'Pakistan', 'London', '2024-03-12', 'England'),
    -- Add more matches...
    (2694, 'Australia', 'England', 'Sydney', '2024-03-15', 'Australia');

-- Create BATTING table
CREATE TABLE BATTING (
    MatchId INT,
    Pid INT,
    Nruns INT,
    Fours INT,
    Sixes INT,
    PRIMARY KEY (MatchId, Pid),
    FOREIGN KEY (MatchId) REFERENCES MATCH(MatchId)
);

-- Sample data for BATTING table
INSERT INTO BATTING (MatchId, Pid, Nruns, Fours, Sixes)
VALUES
    (2689, 2, 45, 6, 1),
    (2689, 5, 78, 10, 3),
    -- Add more batting records...
    (2694, 1, 32, 4, 0);

-- Create BOWLING table
CREATE TABLE BOWLING (
    MatchId INT,
    Pid INT,
    Novers INT,
    Maidens INT,
    Nruns INT,
    Nwickets INT,
    PRIMARY KEY (MatchId, Pid),
    FOREIGN KEY (MatchId) REFERENCES MATCH(MatchId)
);

-- Sample data for BOWLING table
INSERT INTO BOWLING (MatchId, Pid, Novers, Maidens, Nruns, Nwickets)
VALUES
    (2689, 1, 8, 1, 35, 2),
    (2689, 3, 10, 2, 42, 1),
    -- Add more bowling records...
    (2694, 5, 9, 0, 55, 3);

-- Queries:
-- i. Display the sorted list of ground names where Australia has played as team1
SELECT DISTINCT Ground
FROM MATCH
WHERE Team1 = 'Australia'
ORDER BY Ground;

-- ii. Find the match information of all matches in which Dhoni did batting
SELECT M.MatchId, M.Team1, M.Team2, M.Ground, M.Date, M.Winner
FROM MATCH M
JOIN BATTING B ON M.MatchId = B.MatchId
JOIN PLAYER P ON B.Pid = P.PId
WHERE P.Lname = 'Dhoni';

-- iii. Find the names of players who did batting in match 2689
SELECT DISTINCT P.Fname, P.Lname
FROM PLAYER P
JOIN BATTING B ON P.PId = B.Pid
WHERE B.MatchId = 2689;
