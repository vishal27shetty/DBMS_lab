--Consider the following restaurant table with the following attributes -
 --Name, address –(building, street, area, pincode), id, cuisine, nearby
--landmarks, online delivery- (yes/no), famousfor(name of the dish)
--Create 10 documents with data relevant to the following questions.
--Write and execute SQL queries:

--i. List the name, address and nearby landmarks of all restaurants in
--Bangalore where north Indian thali(cuisine) is available
--ii. List the name and address of restaurants and also the dish the
--restaurant is famous for, in Bangalore.

-- Create the RESTAURANT table
CREATE TABLE RESTAURANT (
    id INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Address_building VARCHAR(50),
    Address_street VARCHAR(100),
    Address_area VARCHAR(50),
    Pincode VARCHAR(10),
    Cuisine VARCHAR(50),
    Nearby_landmarks VARCHAR(200),
    Online_delivery ENUM('yes', 'no'),
    Famous_for VARCHAR(100)
);

-- Insert 5 sample values into the RESTAURANT table
INSERT INTO RESTAURANT (Name, Address_building, Address_street, Address_area, Pincode, Cuisine, Nearby_landmarks, Online_delivery, Famous_for)
VALUES
    ('Spice Delight', '123', 'MG Road', 'Indiranagar', '560001', 'North Indian', 'Near Metro Station', 'yes', 'Paneer Tikka'),
    ('Tandoori Bites', '456', 'Brigade Road', 'Koramangala', '560034', 'North Indian', 'Opposite Forum Mall', 'yes', 'Butter Chicken'),
    ('Punjab Sizzlers', '789', 'Residency Road', 'Koramangala', '560025', 'North Indian', 'Near UB City', 'yes', 'Dal Makhani'),
    ('Naan Junction', '101', 'Church Street', 'MG Road', '560001', 'North Indian', 'Near Brigade Road', 'yes', 'Naan Platter'),
    ('Royal Curry House', '222', 'Richmond Road', 'Lavelle Road', '560042', 'North Indian', 'Near Garuda Mall', 'yes', 'Biryani');

-- Query 1: Retrieve restaurants in Bangalore where North Indian thali is available
SELECT Name, CONCAT(Address_building, ', ', Address_street, ', ', Address_area, ', ', Pincode) AS Address, Nearby_landmarks
FROM RESTAURANT
WHERE Cuisine = 'North Indian' AND Famous_for = 'Thali';

-- Query 2: Retrieve restaurants and their famous dishes in Bangalore
SELECT Name, CONCAT(Address_building, ', ', Address_street, ', ', Address_area, ', ', Pincode) AS Address, Famous_for
FROM RESTAURANT;
