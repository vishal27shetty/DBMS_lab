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
--i. List name of the customer, no. of orders placed by each customer
--residing in Bangalore city.
--ii. List the names of the customers who have ordered at least 3 items
--iii. List the customer names who have not ordered for item no. 10.


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
    order# INT PRIMARY KEY,
    ship_date DATE,
    FOREIGN KEY (order#) REFERENCES ORDER(order#)
);

-- Insert sample data into CUSTOMER table
INSERT INTO CUSTOMER (cust#, cname, city) VALUES
(1, 'John Doe', 'Bangalore'),
(2, 'Jane Smith', 'Mumbai'),
(3, 'Alice Johnson', 'Bangalore'),
(4, 'Bob Brown', 'Delhi'),
(5, 'Charlie Wilson', 'Bangalore');

-- Insert sample data into ORDER table
INSERT INTO ORDER (order#, odate, cust#, ord_Amt) VALUES
(101, '2024-01-01', 1, 500.00),
(102, '2024-01-02', 2, 750.00),
(103, '2024-01-03', 3, 300.00),
(104, '2024-01-04', 4, 1000.00),
(105, '2024-01-05', 5, 200.00);

-- Insert sample data into ORDER_ITEM table
INSERT INTO ORDER_ITEM (order#, item#, qty) VALUES
(101, 1, 2),
(101, 2, 3),
(102, 3, 1),
(103, 4, 4),
(104, 5, 2),
(105, 6, 1);

-- Insert sample data into ITEM table
INSERT INTO ITEM (item#, unit_price) VALUES
(1, 10.00),
(2, 20.00),
(3, 15.00),
(4, 5.00),
(5, 25.00),
(6, 30.00);

-- Insert sample data into SHIPMENT table
INSERT INTO SHIPMENT (order#, ship_date) VALUES
(101, '2024-01-03'),
(102, '2024-01-05'),
(103, '2024-01-07'),
(104, '2024-01-09'),
(105, '2024-01-11');

-- Queries
-- i. List name of the customer, no. of orders placed by each customer residing in Bangalore city.
SELECT cname, COUNT(order#) AS num_orders
FROM CUSTOMER
JOIN ORDER ON CUSTOMER.cust# = ORDER.cust#
WHERE city = 'Bangalore'
GROUP BY cname;

-- ii. List the names of the customers who have ordered at least 3 items
SELECT DISTINCT cname
FROM CUSTOMER
JOIN ORDER ON CUSTOMER.cust# = ORDER.cust#
JOIN ORDER_ITEM ON ORDER.order# = ORDER_ITEM.order#
GROUP BY cname
HAVING COUNT(item#) >= 3;

-- iii. List the customer names who have not ordered for item no. 10.
SELECT DISTINCT cname
FROM CUSTOMER
LEFT JOIN ORDER ON CUSTOMER.cust# = ORDER.cust#
LEFT JOIN ORDER_ITEM ON ORDER.order# = ORDER_ITEM.order#
WHERE item# IS NULL OR item# != 10;
