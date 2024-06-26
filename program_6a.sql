--Consider the Employee database given below. The primary keys are
--underlined. Assume relevant data types for attributes.
--EMPLOYEE (Fname, Lname, SSN, Addrs, Sex, Salary, SuperSSN, Dno)
--DEPARTMENT (Dname, Dnumber, MgrSSN, MgrStartDate)
--DEPENDENT(Dname, ESSN)
--Create the above tables in SQL. Specify primary and foreign keys properly.
--Enter at least 5 tuples in each table with relevant data. Solve the following
--queries.
--i. For each department, retrieve the department name and the average
--salary of all employees working in that department
--ii. List the names of managers who have at least one dependent
--iii. Display the details of all departments having ‘tech’ as their
--substring

-- Create the EMPLOYEE table
CREATE TABLE EMPLOYEE (
    Fname VARCHAR(50),
    Lname VARCHAR(50),
    SSN INT PRIMARY KEY,
    Addrs VARCHAR(100),
    Sex CHAR(1),
    Salary DECIMAL(10, 2),
    SuperSSN INT,
    Dno INT
);

-- Create the DEPARTMENT table
CREATE TABLE DEPARTMENT (
    Dname VARCHAR(50),
    Dnumber INT PRIMARY KEY,
    MgrSSN INT,
    MgrStartDate DATE
);

-- Create the DEPENDENT table
CREATE TABLE DEPENDENT (
    Dname VARCHAR(50),
    ESSN INT
);

-- Insert sample data into EMPLOYEE
INSERT INTO EMPLOYEE VALUES
    ('John', 'Doe', 12345, '123 Main St', 'M', 75000.00, NULL, 1),
    ('Jane', 'Smith', 23456, '456 Elm St', 'F', 65000.00, 12345, 1),
    ('Alice', 'Johnson', 34567, '789 Oak St', 'F', 55000.00, 12345, 2),
    ('Bob', 'Brown', 45678, '567 Maple St', 'M', 60000.00, 12345, 2),
    ('David', 'Lee', 56789, '890 Pine St', 'M', 70000.00, NULL, 3);

-- Insert sample data into DEPARTMENT
INSERT INTO DEPARTMENT VALUES
    ('HR', 1, 12345, '2024-01-01'),
    ('IT', 2, 23456, '2023-12-15'),
    ('Finance', 3, NULL, NULL);

-- Insert sample data into DEPENDENT
INSERT INTO DEPENDENT VALUES
    ('Child1', 23456),
    ('Child2', 23456),
    ('Spouse1', 34567),
    ('Spouse2', 45678),
    ('Child3', 56789);

-- Query: Average Salary by Department
SELECT Dname, AVG(Salary) AS AvgSalary
FROM EMPLOYEE
GROUP BY Dno;

-- Query: Managers with Dependents
SELECT DISTINCT E.Fname, E.Lname
FROM EMPLOYEE E
JOIN DEPARTMENT D ON E.SSN = D.MgrSSN
WHERE EXISTS (SELECT 1 FROM DEPENDENT WHERE E.SSN = ESSN);

-- Query: Departments with 'tech' Substring
SELECT Dname
FROM DEPARTMENT
WHERE Dname LIKE '%tech%';
