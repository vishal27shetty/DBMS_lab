--Consider the Aircraft database given below. The primary keys are
--underlined. Assume relevant data types for attributes.
--AIRCRAFT (Aircraft ID, Aircraft_name, Cruising_range)
--CERTIFIED (Emp ID, Aircraft ID)
--EMPLOYEE (Emp ID, Ename, Salary)
--Create the above tables in SQL. Specify primary and foreign keys properly.
--Enter at least 5 tuples in each table with relevant data. Solve the following
--queries.
--i. Find the names of pilots certified for Boeing aircraft
--ii. Arrange the Aircrafts with respect to the ascending order of
--distance.
--iii. Find the name of pilots who can operate flights with a range greater
--than 3000 miles but are not certified on any Boeing aircraft.
-- Creating the tables
CREATE TABLE AIRCRAFT (
    Aircraft_ID INT PRIMARY KEY,
    Aircraft_name VARCHAR(50),
    Cruising_range INT
);

CREATE TABLE EMPLOYEE (
    Emp_ID INT PRIMARY KEY,
    Ename VARCHAR(50),
    Salary DECIMAL(10, 2)
);

CREATE TABLE CERTIFIED (
    Emp_ID INT,
    Aircraft_ID INT,
    PRIMARY KEY (Emp_ID, Aircraft_ID),
    FOREIGN KEY (Emp_ID) REFERENCES EMPLOYEE(Emp_ID),
    FOREIGN KEY (Aircraft_ID) REFERENCES AIRCRAFT(Aircraft_ID)
);

-- Inserting data into the tables
INSERT INTO AIRCRAFT VALUES (1, 'Boeing 747', 8000), (2, 'Airbus A380', 9000), (3, 'Boeing 777', 7000), (4, 'Airbus A320', 6000), (5, 'Boeing 737', 5000);
INSERT INTO EMPLOYEE VALUES (1, 'John', 50000), (2, 'Emma', 60000), (3, 'Oliver', 70000), (4, 'Ava', 80000), (5, 'Sophia', 90000);
INSERT INTO CERTIFIED VALUES (1, 1), (2, 2), (3, 3), (4, 4), (5, 5);

-- Queries
-- i. Find the names of pilots certified for Boeing aircraft
SELECT E.Ename
FROM EMPLOYEE E, CERTIFIED C, AIRCRAFT A
WHERE E.Emp_ID = C.Emp_ID AND C.Aircraft_ID = A.Aircraft_ID AND A.Aircraft_name LIKE 'Boeing%';

-- ii. Arrange the Aircrafts with respect to the ascending order of distance.
SELECT * FROM AIRCRAFT ORDER BY Cruising_range ASC;

-- iii. Find the name of pilots who can operate flights with a range greater than 3000 miles but are not certified on any Boeing aircraft.
SELECT E.Ename
FROM EMPLOYEE E, CERTIFIED C, AIRCRAFT A
WHERE E.Emp_ID = C.Emp_ID AND C.Aircraft_ID = A.Aircraft_ID AND A.Cruising_range > 3000 AND A.Aircraft_name NOT LIKE 'Boeing%';
