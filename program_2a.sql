--Consider the Employee database given below. The primary keys are
--underlined. Assume relevant data types for attributes.
--EMPLOYEE (Fname, Lname, SSN, Addrs, Sex, Salary, SuperSSN,
--Dno)
--DEPARTMENT (Dname, Dnumber, MgrSSN, MgrStartDate)
--PROJECT(Pno, Pname, Dnum)
--WORKS_ON (ESSN, Pno, Hours)
--Create the above tables in SQL. Specify primary and foreign keys properly.
--Enter at least 5 tuples in each table with relevant data. Solve the following
--queries

i. Retrieve the name of all employees whose salary is greater than the
salary of all employees in dept 5.
ii. Retrieve the ssn of all employees who work on project numbers 1,2
or 3
iii. Display the total Number of hours put in by all employees on every
project. 

-- Create the DEPARTMENT table
CREATE TABLE DEPARTMENT (
    Dnumber INT PRIMARY KEY,
    Dname VARCHAR(50) NOT NULL,
    MgrSSN CHAR(9),
    MgrStartDate DATE
);

-- Create the EMPLOYEE table
CREATE TABLE EMPLOYEE (
    SSN CHAR(9) PRIMARY KEY,
    Fname VARCHAR(50) NOT NULL,
    Lname VARCHAR(50) NOT NULL,
    Addrs VARCHAR(100),
    Sex CHAR(1),
    Salary DECIMAL(10, 2),
    SuperSSN CHAR(9),
    Dno INT,
    FOREIGN KEY (Dno) REFERENCES DEPARTMENT(Dnumber)
);

-- Create the PROJECT table
CREATE TABLE PROJECT (
    Pno INT PRIMARY KEY,
    Pname VARCHAR(100) NOT NULL,
    Dnum INT,
    FOREIGN KEY (Dnum) REFERENCES DEPARTMENT(Dnumber)
);

-- Create the WORKS_ON table
CREATE TABLE WORKS_ON (
    ESSN CHAR(9),
    Pno INT,
    Hours DECIMAL(5, 2),
    PRIMARY KEY (ESSN, Pno),
    FOREIGN KEY (ESSN) REFERENCES EMPLOYEE(SSN),
    FOREIGN KEY (Pno) REFERENCES PROJECT(Pno)
);

-- Insert data into DEPARTMENT
INSERT INTO DEPARTMENT VALUES
    (1, 'HR', '123456789', '2023-01-01'),
    (2, 'IT', '987654321', '2023-02-15');

-- Insert data into EMPLOYEE
INSERT INTO EMPLOYEE VALUES
    ('123456789', 'John', 'Doe', '123 Main St', 'M', 60000.00, NULL, 1),
    ('987654321', 'Jane', 'Smith', '456 Elm St', 'F', 75000.00, '123456789', 2);

-- Insert data into PROJECT
INSERT INTO PROJECT VALUES
    (1, 'Project A', 1),
    (2, 'Project B', 2);

-- Insert data into WORKS_ON
INSERT INTO WORKS_ON VALUES
    ('123456789', 1, 40.0),
    ('987654321', 2, 30.0);

-- Query 1: Retrieve employees with salary greater than all employees in department 5
SELECT E.Fname, E.Lname
FROM EMPLOYEE E
WHERE E.Salary > ALL (SELECT E2.Salary FROM EMPLOYEE E2 WHERE E2.Dno = 5);

-- Query 2: Retrieve SSN of employees working on projects 1, 2, or 3
SELECT DISTINCT W.ESSN
FROM WORKS_ON W
WHERE W.Pno IN (1, 2, 3);

-- Query 3: Display total hours worked by employees on each project
SELECT W.Pno, SUM(W.Hours) AS TotalHours
FROM WORKS_ON W
GROUP BY W.Pno;
