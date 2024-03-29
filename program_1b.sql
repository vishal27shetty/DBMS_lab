--1. b)

--Consider the following restaurant database with the following
--attributes -
-- Name, address –(building, street, area, pincode),id, cuisine, nearby
--landmarks, online delivery- yes/no, famous for(name of the dish)
--Create 10 documents with data relevant to the following questions.
--Write and execute SQL queries:
--i. List the name and address of all restaurants in Bangalore with Italian
--cuisine
--ii. List the name, address and nearby landmarks of all restaurants in
--Bangalore where north Indianthali(cuisine) is available. 


-- Create the Restaurants table
CREATE TABLE Restaurants (
    id INT PRIMARY KEY,
    Name VARCHAR(255),
    Address VARCHAR(255),
    Cuisine VARCHAR(50),
    NearbyLandmarks VARCHAR(255),
    OnlineDelivery CHAR(3),
    FamousFor VARCHAR(255)
);

-- Insert sample values
INSERT INTO Restaurants (id, Name, Address, Cuisine, NearbyLandmarks, OnlineDelivery, FamousFor)
VALUES
    (1, 'Pizza Paradise', '123, MG Road, Koramangala, 560034', 'Italian', 'Forum Mall, Sony Signal', 'Yes', 'Margherita Pizza'),
    (2, 'Spice Junction', '456, Brigade Road, Indiranagar, 560038', 'North Indian', 'Garuda Mall, CMH Road', 'Yes', 'Paneer Tikka'),
    (3, 'Pasta Palace', '789, Church Street, MG Road, 560001', 'Italian', 'UB City, Cubbon Park', 'No', 'Alfredo Pasta'),
    (4, 'Tandoori Delight', '987, Residency Road, Richmond Town, 560025', 'North Indian', 'Lalbagh, Double Road', 'Yes', 'Chicken Biryani'),
    (5, 'Olive Garden', '654, Lavelle Road, Ashok Nagar, 560020', 'Italian', 'UB City, MG Road Metro Station', 'Yes', 'Garlic Breadsticks'),
    (6, 'Punjabi Dhaba', '321, Commercial Street, Shivajinagar, 560051', 'North Indian', 'Brigade Road, Commercial Street', 'No', 'Chole Bhature');

SELECT Name, Address
FROM Restaurants
WHERE Cuisine = 'Italian';

SELECT Name, Address, NearbyLandmarks
FROM Restaurants
WHERE Cuisine = 'North Indian' AND FamousFor = 'North Indian Thali';

