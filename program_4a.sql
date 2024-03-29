--Consider the Supply-Parts database given below. The primary keys are
--underlined. Assume relevant data types for attributes.
--SUPPLIER (Sid, Sname, Address) 
--PART (PID, Pname, Color)
--SHIPMENT (Sid, PID, Cost)
--Create the above tables in SQL. Specify primary and foreign keys properly.
--Enter at least 5 tuples in each table with relevant data. Solve the following
--queries.
--i. Find the Sid’s of suppliers who supply a green part
--ii. For every supplier print the name of the supplier and the total number
--of parts that he/she supplies
--iii. Update the part color supplied by supplier s3 to yellow

-- Create the SUPPLIER table
CREATE TABLE SUPPLIER (
    Sid INT PRIMARY KEY,
    Sname VARCHAR(255) NOT NULL,
    Address VARCHAR(255)
);

-- Create the PART table
CREATE TABLE PART (
    PID INT PRIMARY KEY,
    Pname VARCHAR(255) NOT NULL,
    Color VARCHAR(50)
);

-- Create the SHIPMENT table
CREATE TABLE SHIPMENT (
    Sid INT,
    PID INT,
    Cost DECIMAL(10, 2),
    PRIMARY KEY (Sid, PID),
    FOREIGN KEY (Sid) REFERENCES SUPPLIER(Sid),
    FOREIGN KEY (PID) REFERENCES PART(PID)
);

-- Insert 5 sample values into the SUPPLIER, PART, and SHIPMENT tables
INSERT INTO SUPPLIER (Sid, Sname, Address)
VALUES
    (1, 'Supplier A', '123 Main St'),
    (2, 'Supplier B', '456 Elm St'),
    (3, 'Supplier C', '789 Oak St'),
    (4, 'Supplier D', '101 Maple St'),
    (5, 'Supplier E', '222 Pine St');

INSERT INTO PART (PID, Pname, Color)
VALUES
    (101, 'Part X', 'Green'),
    (102, 'Part Y', 'Red'),
    (103, 'Part Z', 'Yellow'),
    (104, 'Part W', 'Green'),
    (105, 'Part V', 'Blue');

INSERT INTO SHIPMENT (Sid, PID, Cost)
VALUES
    (1, 101, 50.00),
    (2, 102, 60.00),
    (3, 103, 70.00),
    (4, 104, 55.00),
    (5, 105, 65.00);

-- Query 1: Retrieve the Sid's of suppliers who supply a green part
SELECT DISTINCT Sid
FROM SHIPMENT
WHERE PID IN (SELECT PID FROM PART WHERE Color = 'Green');

-- Query 2: For every supplier, print the name of the supplier and the total number of parts they supply
SELECT S.Sname, COUNT(SH.PID) AS TotalParts
FROM SUPPLIER S
LEFT JOIN SHIPMENT SH ON S.Sid = SH.Sid
GROUP BY S.Sid, S.Sname;

-- Query 3: Update the part color supplied by supplier S3 to yellow
UPDATE PART
SET Color = 'Yellow'
WHERE PID IN (SELECT PID FROM SHIPMENT WHERE Sid = 3);

