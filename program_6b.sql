--Consider the following Tourist places table with the following

--attributes -
--Place, address – (state, id), tourist attractions,best time of the year to
--visit,modes of transport(include nearest airport, railway station etc),
--accommodation, food - what not to miss for sure
--Create 10 documents with data relevant to the following questions.
--Write and execute SQL queries:
--i. List all the tourist places of Karnataka
--ii. List the places sorted state wise

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

-- Insert sample data into Tourist_Places
INSERT INTO Tourist_Places (Place, Address, Tourist_Attractions, Best_Time, Modes_of_Transport, Accommodation, Food)
VALUES
    ('Mysore', 'Karnataka, Mysuru', 'Mysore Palace, Chamundi Hill', 'Throughout the year', 'Mysore Airport, Mysore Junction Railway Station', 'Hotels and guesthouses', 'Try Mysore Pak and local South Indian cuisine'),
    ('Coorg', 'Karnataka, Kodagu', 'Abbey Falls, Raja\'s Seat', 'October to March', 'Mangalore Airport, Mysore Junction Railway Station', 'Resorts and homestays', 'Coorg coffee and traditional Kodava dishes'),
    ('Hampi', 'Karnataka, Bellary', 'Virupaksha Temple, Hampi Bazaar', 'October to February', 'Hubli Airport, Hospet Junction Railway Station', 'Guesthouses and lodges', 'Bisi Bele Bath and local Karnataka cuisine'),
    ('Gokarna', 'Karnataka, Uttara Kannada', 'Om Beach, Mahabaleshwar Temple', 'November to February', 'Dabolim Airport (Goa), Ankola Railway Station', 'Beachside shacks and cottages', 'Fresh seafood and Konkani dishes'),
    ('Badami', 'Karnataka, Bagalkot', 'Badami Caves, Agastya Lake', 'October to April', 'Hubli Airport, Badami Railway Station', 'Hotels and lodges', 'Local Karnataka thali and Badami specialties');

-- Query: List all the tourist places of Karnataka
SELECT Place
FROM Tourist_Places;

-- Query: List the places sorted state-wise
SELECT Place, Address
FROM Tourist_Places
ORDER BY Address;
