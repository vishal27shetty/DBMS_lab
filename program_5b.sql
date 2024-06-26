--Consider the following Tourist places table with the following

--attributes -
--Place, address –(state, id), tourist attractions,best time of the year to
--visit,modes of transport(include nearest airport, railway station etc),
--accommodation, food - what not to miss for sure
--Create 10 documents with data relevant to the following questions.
--Write and execute SQL queries:
--i. List the tourist attractions of Kerala. Exclude accommodation
--and food.
--ii. List the places sorted state wise.

-- Create the Tourist_Places table
CREATE TABLE Tourist_Places (
    Place VARCHAR(100),
    Address VARCHAR(100),
    Tourist_Attractions VARCHAR(255),
    Best_Time VARCHAR(50),
    Modes_of_Transport VARCHAR(200),
    Accommodation VARCHAR(200),
    Food VARCHAR(200)
);

-- Insert 5 sample tuples
INSERT INTO Tourist_Places (Place, Address, Tourist_Attractions, Best_Time, Modes_of_Transport, Accommodation, Food)
VALUES
    ('Munnar', 'Kerala, MNR', 'Tea Gardens, Echo Point', 'Throughout the year', 'Cochin International Airport, Aluva Railway Station', 'Various resorts and homestays', 'Try local Kerala cuisine like appam and stew'),
    ('Alleppey (Alappuzha)', 'Kerala, ALP', 'Backwaters, Houseboats', 'November to February', 'Cochin International Airport, Alleppey Railway Station', 'Houseboats or lakeside resorts', 'Fresh seafood and traditional Kerala meals'),
    ('Kochi (Cochin)', 'Kerala, COK', 'Fort Kochi, Chinese Fishing Nets', 'October to March', 'Cochin International Airport, Ernakulam Junction Railway Station', 'Heritage hotels and boutique stays', 'Explore local seafood and Malabar cuisine'),
    ('Wayanad', 'Kerala, WYN', 'Wayanad Wildlife Sanctuary, Edakkal Caves', 'October to May', 'Calicut International Airport, Kozhikode Railway Station', 'Treehouses and jungle lodges', 'Savor traditional Kerala meals and tribal specialties'),
    ('Thiruvananthapuram (Trivandrum)', 'Kerala, TVM', 'Sree Padmanabhaswamy Temple, Kovalam Beach', 'October to February', 'Trivandrum International Airport, Thiruvananthapuram Central Railway Station', 'Beachfront resorts and heritage hotels', 'Don\'t miss Kerala-style fish curry and appam');

-- Retrieve Tourist Attractions of Kerala (excluding accommodation and food)
SELECT Place, Tourist_Attractions
FROM Tourist_Places
WHERE Address LIKE '%Kerala%';

-- Retrieve the Places Sorted State-Wise
SELECT Place, Address
FROM Tourist_Places
ORDER BY Address;
