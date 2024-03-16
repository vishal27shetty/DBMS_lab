--Consider the following shipment schema. The primary keys are
--underlined. Assume relevant data types for attributes.
--CUSTOMER (cust# ,cname, city)
--ORDER (order#, odate, cust #, ord-Amt)
--ORDER – ITEM (order #, Item #, qty)
--ITEM (item #, unit price)
--SHIPMENT (order #, ship-date)
--Create the above tables in SQL. Specify primary and foreign keys properly.
--Enter at least 5 tuples in each table with relevant data. Solve the following
--queries.
--i. List the customer names who have placed more than 2
--orders.
--ii. Find the total order amount for each day
--iii. List the customer details who has the largest order amount.

-- Create CUSTOMER table
CREATE TABLE CUSTOMER (
    cust# INT PRIMARY KEY,
    cname VARCHAR(50),
    city VARCHAR(50)
);

-- Create ORDER table
CREATE TABLE ORDER (
    order# INT PRIMARY KEY,
    odate DATE,
    cust# INT,
    ord_Amt DECIMAL(10, 2),
    FOREIGN KEY (cust#) REFERENCES CUSTOMER(cust#)
);

-- Create ORDER_ITEM table
CREATE TABLE ORDER_ITEM (
    order# INT,
    item# INT,
    qty INT,
    PRIMARY KEY (order#, item#),
    FOREIGN KEY (order#) REFERENCES ORDER(order#)
);

-- Create ITEM table
CREATE TABLE ITEM (
    item# INT PRIMARY KEY,
    unit_price DECIMAL(10, 2)
);

-- Create SHIPMENT table
CREATE TABLE SHIPMENT (
    order# INT,
    ship_date DATE,
    FOREIGN KEY (order#) REFERENCES ORDER(order#)
);

-- Insert sample data into CUSTOMER table
INSERT INTO CUSTOMER (cust#, cname, city) VALUES
(1, 'Customer A', 'New York'),
(2, 'Customer B', 'Los Angeles'),
(3, 'Customer C', 'Chicago'),
(4, 'Customer D', 'Houston'),
(5, 'Customer E', 'Miami');

-- Insert sample data into ORDER table
INSERT INTO ORDER (order#, odate, cust#, ord_Amt) VALUES
(101, '2024-03-01', 1, 500.00),
(102, '2024-03-01', 2, 750.00),
(103, '2024-03-02', 1, 300.00),
(104, '2024-03-03', 3, 1000.00),
(105, '2024-03-03', 4, 600.00);

-- Insert sample data into ORDER_ITEM table
INSERT INTO ORDER_ITEM (order#, item#, qty) VALUES
(101, 1, 2),
(101, 2, 3),
(102, 3, 1),
(103, 1, 1),
(104, 2, 5),
(105, 1, 3);

-- Insert sample data into ITEM table
INSERT INTO ITEM (item#, unit_price) VALUES
(1, 100.00),
(2, 50.00),
(3, 200.00);

-- Insert sample data into SHIPMENT table
INSERT INTO SHIPMENT (order#, ship_date) VALUES
(101, '2024-03-02'),
(102, '2024-03-03'),
(103, '2024-03-04'),
(104, '2024-03-05'),
(105, '2024-03-06');

-- Query 1: List the customer names who have placed more than 2 orders.
SELECT cname
FROM CUSTOMER
WHERE cust# IN (
    SELECT cust#
    FROM ORDER
    GROUP BY cust#
    HAVING COUNT(*) > 2
);

-- Query 2: Find the total order amount for each day.
SELECT odate, SUM(ord_Amt) AS total_order_amount
FROM ORDER
GROUP BY odate;

-- Query 3: List the customer details who has the largest order amount.
SELECT c.*
FROM CUSTOMER c
JOIN (
    SELECT cust#, SUM(ord_Amt) AS total_order_amount
    FROM ORDER
    GROUP BY cust#
    ORDER BY total_order_amount DESC
    LIMIT 1
) AS max_order ON c.cust# = max_order.cust#;
