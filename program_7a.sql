--Consider the following Accident Tracker Schema. The primary keys are
--underlined.
--PERSON (driver – id #, name, address)
--CAR (Regno, model, year)
--ACCIDENT (report-number, acc_date, location)
--OWNS (driver-id #, Regno)
--PARTICIPATED (driver-id, Regno, report-number, damageamount)
--Create the above tables in SQL. Specify primary and foreign keys properly.
--Enter at least 5 tuples in each table with relevant data. Solve the following
--queries.
--i. Display the unique Regno’s of the cars involved in accidents.
--ii. Display the car Regno and model of the car which has the maximum
--damage amount.
--iii. Display the number of cars owned by each driver.

-- Create PERSON Table
CREATE TABLE PERSON (
    driver_id INT PRIMARY KEY,
    name VARCHAR(100),
    address VARCHAR(200)
);

-- Insert sample data into PERSON
INSERT INTO PERSON (driver_id, name, address)
VALUES
    (1, 'John Doe', '123 Main St, City A'),
    (2, 'Jane Smith', '456 Elm St, City B');

-- Create CAR Table
CREATE TABLE CAR (
    Regno VARCHAR(10) PRIMARY KEY,
    model VARCHAR(50),
    year INT
);

-- Insert sample data into CAR
INSERT INTO CAR (Regno, model, year)
VALUES
    ('ABC123', 'Toyota', 2018),
    ('XYZ789', 'Honda', 2020);

-- Create ACCIDENT Table
CREATE TABLE ACCIDENT (
    report_number INT PRIMARY KEY,
    acc_date DATE,
    location VARCHAR(100)
);

-- Insert sample data into ACCIDENT
INSERT INTO ACCIDENT (report_number, acc_date, location)
VALUES
    (101, '2024-03-01', 'Intersection A'),
    (102, '2024-03-02', 'Highway B');

-- Create OWNS Table
CREATE TABLE OWNS (
    driver_id INT,
    Regno VARCHAR(10),
    PRIMARY KEY (driver_id, Regno),
    FOREIGN KEY (driver_id) REFERENCES PERSON(driver_id),
    FOREIGN KEY (Regno) REFERENCES CAR(Regno)
);

-- Insert sample data into OWNS
INSERT INTO OWNS (driver_id, Regno)
VALUES
    (1, 'ABC123'),
    (2, 'XYZ789');

-- Create PARTICIPATED Table
CREATE TABLE PARTICIPATED (
    driver_id INT,
    Regno VARCHAR(10),
    report_number INT,
    damageamount DECIMAL(10, 2),
    PRIMARY KEY (driver_id, Regno, report_number),
    FOREIGN KEY (driver_id) REFERENCES PERSON(driver_id),
    FOREIGN KEY (Regno) REFERENCES CAR(Regno),
    FOREIGN KEY (report_number) REFERENCES ACCIDENT(report_number)
);

-- Insert sample data into PARTICIPATED
INSERT INTO PARTICIPATED (driver_id, Regno, report_number, damageamount)
VALUES
    (1, 'ABC123', 101, 500.00),
    (2, 'XYZ789', 102, 1000.00);

-- Queries:

-- i. Unique Regno's of cars involved in accidents
SELECT DISTINCT Regno
FROM PARTICIPATED;

-- ii. Car Regno and model with maximum damage amount
SELECT p.Regno, c.model
FROM PARTICIPATED p
JOIN CAR c ON p.Regno = c.Regno
WHERE p.damageamount = (SELECT MAX(damageamount) FROM PARTICIPATED);

-- iii. Number of cars owned by each driver
SELECT o.driver_id, COUNT(o.Regno) AS num_owned_cars
FROM OWNS o
GROUP BY o.driver_id;

