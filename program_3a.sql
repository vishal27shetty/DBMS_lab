--Consider the Aircraft database given below. The primary keys are
--underlined. Assume relevant data types for attributes.
--AIRCRAFT (Aircraft ID, Aircraft_name, Cruising_range)
--CERTIFIED (Emp ID, Aircraft ID)
--EMPLOYEE (Emp ID, Ename, Salary)
--Create the above tables in SQL. Specify primary and foreign keys properly.
--Enter at least 5 tuples in each table with relevant data. Solve the following
--queries.

--i. Find the employee ID’s of employee who make the highest
--salary.
--ii. Find the name of aircrafts such that all pilots certified to operate
--them earn more than 50000
--iii. Find the employees who are not certified for operating any
--aircraft. 

-- Create the AIRCRAFT table
CREATE TABLE AIRCRAFT (
    Aircraft_ID INT PRIMARY KEY,
    Aircraft_name VARCHAR(255),
    Cruising_range INT
);

-- Create the CERTIFIED table
CREATE TABLE CERTIFIED (
    Emp_ID INT,
    Aircraft_ID INT,
    PRIMARY KEY (Emp_ID, Aircraft_ID),
    FOREIGN KEY (Emp_ID) REFERENCES EMPLOYEE(Emp_ID),
    FOREIGN KEY (Aircraft_ID) REFERENCES AIRCRAFT(Aircraft_ID)
);

-- Create the EMPLOYEE table
CREATE TABLE EMPLOYEE (
    Emp_ID INT PRIMARY KEY,
    Ename VARCHAR(255),
    Salary INT
);

-- Insert data into AIRCRAFT, CERTIFIED, and EMPLOYEE tables (at least 5 tuples each)
INSERT INTO AIRCRAFT (Aircraft_ID, Aircraft_name, Cruising_range)
VALUES
    (1, 'Boeing 747', 8000),
    (2, 'Airbus A320', 5000),
    -- ... (more rows);

INSERT INTO CERTIFIED (Emp_ID, Aircraft_ID)
VALUES
    (101, 1),
    (102, 2),
    -- ... (more rows);

INSERT INTO EMPLOYEE (Emp_ID, Ename, Salary)
VALUES
    (101, 'John Doe', 60000),
    (102, 'Jane Smith', 75000),
    -- ... (more rows);

-- Query 1: Retrieve employee IDs of employees with the highest salary
SELECT Emp_ID
FROM EMPLOYEE
WHERE Salary = (SELECT MAX(Salary) FROM EMPLOYEE);

-- Query 2: Retrieve names of aircrafts where all pilots certified to operate them earn more than 50000
SELECT DISTINCT A.Aircraft_name
FROM AIRCRAFT A
WHERE NOT EXISTS (
    SELECT *
    FROM CERTIFIED C
    JOIN EMPLOYEE E ON C.Emp_ID = E.Emp_ID
    WHERE C.Aircraft_ID = A.Aircraft_ID
      AND E.Salary <= 50000
);

-- Query 3: Retrieve employees who are not certified for operating any aircraft
SELECT E.Emp_ID, E.Ename
FROM EMPLOYEE E
WHERE NOT EXISTS (
    SELECT *
    FROM CERTIFIED C
    WHERE C.Emp_ID = E.Emp_ID
);

