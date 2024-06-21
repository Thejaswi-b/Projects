Drop database if exists HotelDb;
Create database if not exists HotelDb;
-- table 1
Use HotelDb;
-- DROP TABLE IF EXISTS date_info;
-- DROP TABLE IF EXISTS date_table;
CREATE TABLE date_info (
    Date DATE PRIMARY KEY,
    DayOfMonth INT,
    WeekOfYear INT,
    DayOfWeek INT,
    WeekdayName VARCHAR(20)
);
-- table 2
-- Generate and insert dates for two years
INSERT INTO date_info (Date, DayOfMonth, WeekOfYear, DayOfWeek, WeekdayName)
SELECT
    date_table.Date,
    DAY(date_table.Date) AS DayOfMonth,
    WEEK(date_table.Date) AS WeekOfYear,
    DAYOFWEEK(date_table.Date) AS DayOfWeek,
    DAYNAME(date_table.Date) AS WeekdayName
FROM (
    SELECT DATE_ADD('2024-01-01', INTERVAL seq DAY) AS Date
    FROM (
        SELECT
            (a.N + b.N * 10 + c.N * 100 + d.N * 1000) AS seq
        FROM
            (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) AS a,
            (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) AS b,
            (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) AS c,
            (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) AS d
    ) AS sequence
    WHERE DATE_ADD('2024-01-01', INTERVAL seq DAY) <= '2026-12-31'
) AS date_table;

-- table 3
-- DROP TABLE IF EXISTS Hotel;

CREATE TABLE Hotel (

    Hotel_ID INT PRIMARY KEY,

    Hotel_Name VARCHAR(100),

    Hotel_Address VARCHAR(100),

    Hotel_City VARCHAR(50),
    
    Hotel_State VARCHAR(50),

    Hotel_Rating INT,
    
    Hotel_Type VARCHAR(50),
    
    Price bigint

);

INSERT INTO Hotel (Hotel_ID, Hotel_Name, Hotel_Address, Hotel_City, Hotel_State, Hotel_Rating, Hotel_Type, Price) VALUES

(1, 'Grand Hotel', '123 Main Street', 'New York', 'NY', 5, 'Luxury', 500),
(2, 'Beachside Resort', '456 Ocean Avenue', 'Miami', 'FL', 4, 'Resort', 300),
(3, 'Mountain Lodge', '789 Pine Street', 'Aspen', 'CO', 4, 'Lodge', 250),
(4, 'City Center Inn', '101 Downtown Boulevard', 'Chicago', 'IL', 3, 'Budget', 150),
(5, 'Riverside Hotel', '555 River Road', 'San Francisco', 'CA', 4, 'Boutique', 350),
(6, 'Seaside Retreat', '777 Beach Boulevard', 'Los Angeles', 'CA', 4, 'Resort', 400),
(7, 'Country Manor', '888 Countryside Lane', 'Dallas', 'TX', 3, 'Inn', 200),
(8, 'Mountain View Resort', '999 Mountain Road', 'Denver', 'CO', 5, 'Resort', 450),
(9, 'Urban Oasis', '333 Downtown Avenue', 'Seattle', 'WA', 4, 'Boutique', 300),
(10, 'Lakeside Inn', '222 Lakefront Lane', 'Orlando', 'FL', 3, 'Inn', 175),
(11, 'Sunset Resort', '101 Beachfront Boulevard', 'Honolulu', 'HI', 5, 'Resort', 600),
(12, 'Valley View Hotel', '555 Valley Road', 'Phoenix', 'AZ', 4, 'Hotel', 275),
(13, 'Downtown Suites', '789 City Center Plaza', 'Las Vegas', 'NV', 4, 'Suites', 350),
(14, 'Tropical Paradise Inn', '123 Palm Tree Lane', 'Miami Beach', 'FL', 3, 'Inn', 200),
(15, 'Harbor View Lodge', '456 Harbor Drive', 'San Diego', 'CA', 4, 'Lodge', 300),
(16, 'Countryside Retreat', '777 Rural Road', 'Nashville', 'TN', 3, 'Retreat', 225),
(17, 'Oceanfront Oasis', '888 Ocean View Avenue', 'Santa Monica', 'CA', 5, 'Resort', 550),
(18, 'Hillside Hideaway', '111 Hilltop Road', 'Asheville', 'NC', 4, 'Hideaway', 325),
(19, 'City Lights Hotel', '222 Nightlife Boulevard', 'New Orleans', 'LA', 3, 'Hotel', 175),
(20, 'Lakeside Resort', '999 Lakeview Lane', 'Salt Lake City', 'UT', 4, 'Resort', 400),
(21, 'Mountain View Chalet', '333 Summit Avenue', 'Park City', 'UT', 4, 'Chalet', 375),
(22, 'Seaside Serenity', '444 Coastal Boulevard', 'Portland', 'OR', 4, 'Serenity', 350),
(23, 'Country Club Resort', '555 Golf Course Drive', 'Austin', 'TX', 5, 'Resort', 600),
(24, 'City Center Comfort Inn', '666 Main Street', 'Atlanta', 'GA', 3, 'Inn', 200),
(25, 'Riverfront Retreat', '777 Riverbank Road', 'Kansas City', 'MO', 4, 'Retreat', 325),
(26, 'Skyline Suites', '888 Downtown Plaza', 'Detroit', 'MI', 4, 'Suites', 375),
(27, 'Seaside Splendor Resort', '999 Beachfront Avenue', 'Fort Lauderdale', 'FL', 5, 'Resort', 575),
(28, 'Mountain Majesty Inn', '111 Summit Drive', 'Salt Lake City', 'UT', 3, 'Inn', 175),
(29, 'Downtown Delight Hotel', '222 City Center Boulevard', 'Houston', 'TX', 4, 'Hotel', 250),
(30, 'Beachfront Bliss Resort', '333 Beachside Lane', 'Clearwater', 'FL', 5, 'Resort', 600),
(31, 'Cityscape Suites', '444 Skyline Avenue', 'San Antonio', 'TX', 4, 'Suites', 350),
(32, 'Riverfront Resort', '555 Riverside Lane', 'Louisville', 'KY', 5, 'Resort', 575),
(33, 'Mountain View Manor', '666 Mountain Road', 'Boulder', 'CO', 4, 'Manor', 375),
(34, 'Coastal Retreat Inn', '777 Coastal Boulevard', 'Miami', 'FL', 3, 'Inn', 200),
(35, 'City Center Courtyard', '888 Courtyard Plaza', 'Charlotte', 'NC', 4, 'Courtyard', 275),
(36, 'Urban Elegance Hotel', '999 Urban Avenue', 'Philadelphia', 'PA', 4, 'Hotel', 300),
(37, 'Oceanfront Oasis Resort', '111 Ocean View Lane', 'Fort Myers', 'FL', 5, 'Resort', 600),
(38, 'Mountain Vista Lodge', '222 Mountain View Road', 'Boise', 'ID', 4, 'Lodge', 325),
(39, 'Downtown Dreams Hotel', '333 Dream Street', 'Memphis', 'TN', 3, 'Hotel', 175),
(40, 'Lakeside Paradise Inn', '444 Lakeside Avenue', 'Minneapolis', 'MN', 4, 'Inn', 225),

(41, 'Seaside Serenity Resort', '555 Serenity Lane', 'Tampa', 'FL', 5, 'Resort', 575),
(42, 'Country Club Chalet', '666 Country Club Drive', 'Charleston', 'SC', 4, 'Chalet', 375),
(43, 'Mountain Hideaway Lodge', '777 Hideaway Lane', 'Portland', 'ME', 4, 'Lodge', 350),
(44, 'City Center Charm Inn', '888 Charm Boulevard', 'Jacksonville', 'FL', 3, 'Inn', 200),
(45, 'Riverside Reflections Resort', '999 Riverside Road', 'Reno', 'NV', 5, 'Resort', 600),

(46, 'Skyline Splendor Suites', '111 Skyline Avenue', 'Richmond', 'VA', 4, 'Suites', 375),
(47, 'Beachfront Beauty Resort', '222 Beachfront Lane', 'Sarasota', 'FL', 5, 'Resort', 600),
(48, 'Mountain Magic Inn', '333 Magic Drive', 'Flagstaff', 'AZ', 3, 'Inn', 175),
(49, 'City Center Comfort Suites', '444 Comfort Plaza', 'Pittsburgh', 'PA', 4, 'Suites', 350),
(50, 'Lakeside Luxury Resort', '555 Lakeside Lane', 'Madison', 'WI', 5, 'Resort', 600),

(51, 'Riverside Retreat Resort', '666 Riverside Avenue', 'Wilmington', 'NC', 5, 'Resort', 575),
(52, 'Mountain Majesty Chalet', '777 Majesty Lane', 'Providence', 'RI', 4, 'Chalet', 375),
(53, 'Beachfront Bliss Inn', '888 Beachside Lane', 'Daytona Beach', 'FL', 3, 'Inn', 200),
(54, 'City Center Suites', '999 Center Plaza', 'Oklahoma City', 'OK', 4, 'Suites', 350),
(55, 'Seaside Sanctuary Resort', '111 Seaside Avenue', 'Savannah', 'GA', 5, 'Resort', 600),

(56, 'Mountain View Manor Inn', '222 Manor Lane', 'Tacoma', 'WA', 4, 'Inn', 325),
(57, 'Country Club Charm Resort', '333 Country Club Lane', 'Winston-Salem', 'NC', 5, 'Resort', 600),
(58, 'Riverfront Romance Lodge', '444 Romance Road', 'Augusta', 'GA', 4, 'Lodge', 350),
(59, 'City Center Suites', '555 City Plaza', 'Albuquerque', 'NM', 4, 'Suites', 300),
(60, 'Lakeside Luxury Inn', '666 Luxury Lane', 'Hartford', 'CT', 4, 'Inn', 275),

(61, 'Riverside Resort', '777 Riverside Lane', 'Tallahassee', 'FL', 5, 'Resort', 575),
(62, 'Mountain Majesty Retreat', '888 Majesty Lane', 'Bozeman', 'MT', 4, 'Retreat', 350),
(63, 'Beachfront Bliss Resort', '999 Beachfront Boulevard', 'Panama City Beach', 'FL', 5, 'Resort', 600),
(64, 'City Center Suites', '111 City Plaza', 'Spokane', 'WA', 4, 'Suites', 325),
(65, 'Seaside Sanctuary Inn', '222 Sanctuary Lane', 'Destin', 'FL', 3, 'Inn', 200),

(66, 'Mountain View Manor Resort', '333 Manor Lane', 'Eugene', 'OR', 4, 'Resort', 375),
(67, 'Country Club Charm Inn', '444 Country Club Lane', 'Gainesville', 'FL', 3, 'Inn', 175),
(68, 'Riverfront Romance Resort', '555 Romance Road', 'Annapolis', 'MD', 5, 'Resort', 600),
(69, 'City Center Charm Suites', '666 Charm Plaza', 'Charlottesville', 'VA', 4, 'Suites', 350),
(70, 'Lakeside Luxury Lodge', '777 Luxury Lane', 'Salem', 'MA', 4, 'Lodge', 325),

(71, 'Riverside Romance Resort', '888 Riverside Lane', 'Wilmington', 'DE', 5, 'Resort', 575),
(72, 'Mountain Majesty Manor', '999 Majesty Lane', 'Boise', 'ID', 4, 'Manor', 375),
(73, 'Beachfront Bliss Inn', '111 Beachfront Lane', 'Naples', 'FL', 3, 'Inn', 200),
(74, 'City Center Suites', '222 City Plaza', 'Portland', 'OR', 4, 'Suites', 350),
(75, 'Seaside Sanctuary Lodge', '333 Sanctuary Lane', 'St. Augustine', 'FL', 4, 'Lodge', 300),

(76, 'Mountain View Manor Resort', '444 Manor Lane', 'Salem', 'OR', 4, 'Resort', 375),
(77, 'Country Club Charm Inn', '555 Country Club Lane', 'Tallahassee', 'FL', 3, 'Inn', 175),
(78, 'Riverfront Romance Resort', '666 Romance Road', 'Richmond', 'VA', 5, 'Resort', 600),
(79, 'City Center Charm Suites', '777 Charm Plaza', 'Louisville', 'KY', 4, 'Suites', 350),
(80, 'Lakeside Luxury Lodge', '888 Luxury Lane', 'Nashville', 'TN', 4, 'Lodge', 325),

(81, 'Riverside Romance Resort', '999 Riverside Lane', 'Hartford', 'CT', 5, 'Resort', 575),
(82, 'Mountain Majesty Manor', '111 Majesty Lane', 'Bozeman', 'MT', 4, 'Manor', 375),
(83, 'Beachfront Bliss Inn', '222 Beachfront Lane', 'Boise', 'ID', 3, 'Inn', 200),
(84, 'City Center Suites', '333 City Plaza', 'Phoenix', 'AZ', 4, 'Suites', 350),
(85, 'Seaside Sanctuary Lodge', '444 Sanctuary Lane', 'San Diego', 'CA', 4, 'Lodge', 300),

(86, 'Mountain View Manor Resort', '555 Manor Lane', 'Las Vegas', 'NV', 4, 'Resort', 375),
(87, 'Country Club Charm Inn', '666 Country Club Lane', 'Dallas', 'TX', 3, 'Inn', 175),
(88, 'Riverfront Romance Resort', '777 Romance Road', 'Miami', 'FL', 5, 'Resort', 600),
(89, 'City Center Charm Suites', '888 Charm Plaza', 'Chicago', 'IL', 4, 'Suites', 350),
(90, 'Lakeside Luxury Lodge', '999 Luxury Lane', 'Atlanta', 'GA', 4, 'Lodge', 325),

(91, 'Riverside Romance Resort', '111 Riverside Lane', 'New York', 'NY', 5, 'Resort', 575),
(92, 'Mountain Majesty Manor', '222 Majesty Lane', 'Los Angeles', 'CA', 4, 'Manor', 375),
(93, 'Beachfront Bliss Inn', '333 Beachfront Lane', 'San Francisco', 'CA', 3, 'Inn', 200),
(94, 'City Center Suites', '444 City Plaza', 'Seattle', 'WA', 4, 'Suites', 350),
(95, 'Seaside Sanctuary Lodge', '555 Sanctuary Lane', 'Portland', 'OR', 4, 'Lodge', 300),

(96, 'Mountain View Manor Resort', '666 Manor Lane', 'Denver', 'CO', 4, 'Resort', 375),
(97, 'Country Club Charm Inn', '777 Country Club Lane', 'Dallas', 'TX', 3, 'Inn', 175),
(98, 'Riverfront Romance Resort', '888 Romance Road', 'Miami', 'FL', 5, 'Resort', 600),
(99, 'City Center Charm Suites', '999 Charm Plaza', 'Las Vegas', 'NV', 4, 'Suites', 350),
(100, 'Lakeside Luxury Lodge', '111 Luxury Lane', 'Phoenix', 'AZ', 4, 'Lodge', 325),

(101, 'Riverside Romance Resort', '222 Riverside Lane', 'Orlando', 'FL', 5, 'Resort', 575),
(102, 'Mountain Majesty Manor', '333 Majesty Lane', 'Denver', 'CO', 4, 'Manor', 375),
(103, 'Beachfront Bliss Inn', '444 Beachfront Lane', 'Miami', 'FL', 3, 'Inn', 200),
(104, 'City Center Suites', '555 City Plaza', 'New York', 'NY', 4, 'Suites', 350),
(105, 'Seaside Sanctuary Lodge', '666 Sanctuary Lane', 'Los Angeles', 'CA', 4, 'Lodge', 300),

(106, 'Mountain View Manor Resort', '777 Manor Lane', 'San Francisco', 'CA', 4, 'Resort', 375),
(107, 'Country Club Charm Inn', '888 Country Club Lane', 'Seattle', 'WA', 3, 'Inn', 175),
(108, 'Riverfront Romance Resort', '999 Romance Road', 'Portland', 'OR', 5, 'Resort', 600),
(109, 'City Center Charm Suites', '111 Charm Plaza', 'San Diego', 'CA', 4, 'Suites', 350),
(110, 'Lakeside Luxury Lodge', '222 Luxury Lane', 'Chicago', 'IL', 4, 'Resort', 425);
 -- table 4
-- DROP TABLE IF EXISTS Room;
CREATE TABLE Room (

    Room_ID INT PRIMARY KEY,

    Hotel_ID INT,

    Room_No INT,

    Room_Type VARCHAR(50),

    Room_Price BIGINT,
    
    Room_Occupancy INT,
    
    Room_Floor INT , 
    
    Balcony INT,  -- 0 or 1

    FOREIGN KEY (Hotel_ID) REFERENCES Hotel(Hotel_ID)

);

INSERT INTO Room (Room_ID, Hotel_ID, Room_No, Room_Type, Room_Price, Room_Occupancy, Room_Floor, Balcony) VALUES
(1, 1, 101, 'Standard', 100, 2, 1, 0),
(2, 1, 102, 'Standard', 100, 3, 1, 0),
(3, 1, 103, 'Standard', 100, 2, 1, 0),
(4, 1, 104, 'Deluxe', 150, 4, 1, 1),
(5, 1, 105, 'Deluxe', 150, 2, 1, 1),
(6, 2, 101, 'Standard', 100, 2, 1, 0),
(7, 2, 102, 'Standard', 100, 3, 1, 0),
(8, 2, 103, 'Standard', 100, 2, 1, 0),
(9, 2, 104, 'Deluxe', 150, 4, 1, 1),
(10, 2, 105, 'Deluxe', 150, 2, 1, 1),
(11, 3, 101, 'Standard', 100, 2, 1, 0),
(12, 3, 102, 'Standard', 100, 3, 1, 0),
(13, 3, 103, 'Standard', 100, 2, 1, 0),
(14, 3, 104, 'Deluxe', 150, 4, 1, 1),
(15, 3, 105, 'Deluxe', 150, 2, 1, 1),
(16, 4, 101, 'Standard', 100, 2, 1, 0),
(17, 4, 102, 'Standard', 100, 3, 1, 0),
(18, 4, 103, 'Standard', 100, 2, 1, 0),
(19, 4, 104, 'Deluxe', 150, 4, 1, 1),
(20, 4, 105, 'Deluxe', 150, 2, 1, 1),

(21, 5, 101, 'Standard', 100, 3, 1, 0),
(22, 5, 102, 'Standard', 100, 2, 1, 0),
(23, 5, 103, 'Standard', 100, 4, 1, 0),
(24, 5, 104, 'Deluxe', 150, 2, 1, 1),
(25, 5, 105, 'Deluxe', 150, 2, 1, 1),
(26, 6, 101, 'Standard', 100, 3, 1, 0),
(27, 6, 102, 'Standard', 100, 2, 1, 0),
(28, 6, 103, 'Standard', 100, 4, 1, 0),
(29, 6, 104, 'Deluxe', 150, 2, 1, 1),
(30, 6, 105, 'Deluxe', 150, 2, 1, 1),

(31, 7, 101, 'Standard', 100, 2, 1, 0),
(32, 7, 102, 'Standard', 100, 4, 1, 0),
(33, 7, 103, 'Standard', 100, 2, 1, 0),
(34, 7, 104, 'Deluxe', 150, 2, 1, 1),
(35, 7, 105, 'Deluxe', 150, 3, 1, 1),
(36, 8, 101, 'Standard', 100, 2, 1, 0),
(37, 8, 102, 'Standard', 100, 4, 1, 0),
(38, 8, 103, 'Standard', 100, 2, 1, 0),
(39, 8, 104, 'Deluxe', 150, 2, 1, 1),
(40, 8, 105, 'Deluxe', 150, 3, 1, 1),

(41, 9, 101, 'Standard', 100, 4, 1, 0),
(42, 9, 102, 'Standard', 100, 2, 1, 0),
(43, 9, 103, 'Standard', 100, 2, 1, 0),
(44, 9, 104, 'Deluxe', 150, 3, 1, 1),
(45, 9, 105, 'Deluxe', 150, 2, 1, 1),
(46, 10, 101, 'Standard', 100, 4, 1, 0),
(47, 10, 102, 'Standard', 100, 2, 1, 0),
(48, 10, 103, 'Standard', 100, 2, 1, 0),
(49, 10, 104, 'Deluxe', 150, 3, 1, 1),
(50, 10, 105, 'Deluxe', 150, 2, 1, 1),

(51, 11, 101, 'Standard', 100, 2, 1, 0),
(52, 11, 102, 'Standard', 100, 2, 1, 0),
(53, 11, 103, 'Standard', 100, 3, 1, 0),
(54, 11, 104, 'Deluxe', 150, 2, 1, 1),
(55, 11, 105, 'Deluxe', 150, 4, 1, 1),
(56, 12, 101, 'Standard', 100, 2, 1, 0),
(57, 12, 102, 'Standard', 100, 2, 1, 0),
(58, 12, 103, 'Standard', 100, 3, 1, 0),
(59, 12, 104, 'Deluxe', 150, 2, 1, 1),
(60, 12, 105, 'Deluxe', 150, 4, 1, 1),

(61, 13, 101, 'Standard', 100, 2, 1, 0),
(62, 13, 102, 'Standard', 100, 3, 1, 0),
(63, 13, 103, 'Standard', 100, 2, 1, 0),
(64, 13, 104, 'Deluxe', 150, 4, 1, 1),
(65, 13, 105, 'Deluxe', 150, 2, 1, 1),
(66, 14, 101, 'Standard', 100, 2, 1, 0),
(67, 14, 102, 'Standard', 100, 3, 1, 0),
(68, 14, 103, 'Standard', 100, 2, 1, 0),
(69, 14, 104, 'Deluxe', 150, 4, 1, 1),
(70, 14, 105, 'Deluxe', 150, 2, 1, 1),
-- Add mor2 entries
(71, 15, 101, 'Standard', 100, 3, 1, 0),
(72, 15, 102, 'Standard', 100, 2, 1, 0),
(73, 15, 103, 'Standard', 100, 4, 1, 0),
(74, 15, 104, 'Deluxe', 150, 2, 1, 1),
(75, 15, 105, 'Deluxe', 150, 2, 1, 1),
(76, 16, 101, 'Standard', 100, 3, 1, 0),
(77, 16, 102, 'Standard', 100, 2, 1, 0),
(78, 16, 103, 'Standard', 100, 4, 1, 0),
(79, 16, 104, 'Deluxe', 150, 2, 1, 1),
(80, 16, 105, 'Deluxe', 150, 2, 1, 1),

(81, 17, 101, 'Standard', 100, 2, 1, 0),
(82, 17, 102, 'Standard', 100, 4, 1, 0),
(83, 17, 103, 'Standard', 100, 2, 1, 0),
(84, 17, 104, 'Deluxe', 150, 2, 1, 1),
(85, 17, 105, 'Deluxe', 150, 3, 1, 1),
(86, 18, 101, 'Standard', 100, 2, 1, 0),
(87, 18, 102, 'Standard', 100, 4, 1, 0),
(88, 18, 103, 'Standard', 100, 2, 1, 0),
(89, 18, 104, 'Deluxe', 150, 2, 1, 1),
(90, 18, 105, 'Deluxe', 150, 3, 1, 1),

(91, 19, 101, 'Standard', 100, 4, 1, 0),
(92, 19, 102, 'Standard', 100, 2, 1, 0),
(93, 19, 103, 'Standard', 100, 2, 1, 0),
(94, 19, 104, 'Deluxe', 150, 3, 1, 1),
(95, 19, 105, 'Deluxe', 150, 2, 1, 1),
(96, 20, 101, 'Standard', 100, 4, 1, 0),
(97, 20, 102, 'Standard', 100, 2, 1, 0),
(98, 20, 103, 'Standard', 100, 2, 1, 0),
(99, 20, 104, 'Deluxe', 150, 3, 1, 1),
(100, 20, 105, 'Deluxe', 150, 2, 1, 1),

(101, 21, 101, 'Standard', 100, 2, 1, 0),
(102, 21, 102, 'Standard', 100, 2, 1, 0),
(103, 21, 103, 'Standard', 100, 3, 1, 0),
(104, 21, 104, 'Deluxe', 150, 2, 1, 1),
(105, 21, 105, 'Deluxe', 150, 4, 1, 1),
(106, 22, 101, 'Standard', 100, 2, 1, 0),
(107, 22, 102, 'Standard', 100, 2, 1, 0),
(108, 22, 103, 'Standard', 100, 3, 1, 0),
(109, 22, 104, 'Deluxe', 150, 2, 1, 1),
(110, 22, 105, 'Deluxe', 150, 4, 1, 1),

(111, 23, 101, 'Standard', 100, 2, 1, 0),
(112, 23, 102, 'Standard', 100, 3, 1, 0),
(113, 23, 103, 'Standard', 100, 2, 1, 0),
(114, 23, 104, 'Deluxe', 150, 4, 1, 1),
(115, 23, 105, 'Deluxe', 150, 2, 1, 1),
(116, 24, 101, 'Standard', 100, 2, 1, 0),
(117, 24, 102, 'Standard', 100, 3, 1, 0),
(118, 24, 103, 'Standard', 100, 2, 1, 0),
(119, 24, 104, 'Deluxe', 150, 4, 1, 1),
(120, 24, 105, 'Deluxe', 150, 2, 1, 1),

(121, 25, 101, 'Standard', 100, 3, 1, 0),
(122, 25, 102, 'Standard', 100, 2, 1, 0),
(123, 25, 103, 'Standard', 100, 4, 1, 0),
(124, 25, 104, 'Deluxe', 150, 2, 1, 1),
(125, 25, 105, 'Deluxe', 150, 2, 1, 1),
(126, 26, 101, 'Standard', 100, 3, 1, 0),
(127, 26, 102, 'Standard', 100, 2, 1, 0),
(128, 26, 103, 'Standard', 100, 4, 1, 0),
(129, 26, 104, 'Deluxe', 150, 2, 1, 1),
(130, 26, 105, 'Deluxe', 150, 2, 1, 1),

(131, 27, 101, 'Standard', 100, 2, 1, 0),
(132, 27, 102, 'Standard', 100, 4, 1, 0),
(133, 27, 103, 'Standard', 100, 2, 1, 0),
(134, 27, 104, 'Deluxe', 150, 2, 1, 1),
(135, 27, 105, 'Deluxe', 150, 3, 1, 1),
(136, 28, 101, 'Standard', 100, 2, 1, 0),
(137, 28, 102, 'Standard', 100, 4, 1, 0),
(138, 28, 103, 'Standard', 100, 2, 1, 0),
(139, 28, 104, 'Deluxe', 150, 2, 1, 1),
(140, 28, 105, 'Deluxe', 150, 3, 1, 1),

(141, 29, 101, 'Standard', 100, 4, 1, 0),
(142, 29, 102, 'Standard', 100, 2, 1, 0),
(143, 29, 103, 'Standard', 100, 2, 1, 0),
(144, 29, 104, 'Deluxe', 150, 3, 1, 1),
(145, 29, 105, 'Deluxe', 150, 2, 1, 1),
(146, 30, 101, 'Standard', 100, 4, 1, 0),
(147, 30, 102, 'Standard', 100, 2, 1, 0),
(148, 30, 103, 'Standard', 100, 2, 1, 0),
(149, 30, 104, 'Deluxe', 150, 3, 1, 1),
(150, 30, 105, 'Deluxe', 150, 2, 1, 1),
(151, 31, 101, 'Standard', 100, 2, 1, 0),
(152, 31, 102, 'Standard', 100, 2, 1, 0),
(153, 31, 103, 'Standard', 100, 3, 1, 0),
(154, 31, 104, 'Deluxe', 150, 2, 1, 1),
(155, 31, 105, 'Deluxe', 150, 4, 1, 1),
(156, 32, 101, 'Standard', 100, 2, 1, 0),
(157, 32, 102, 'Standard', 100, 2, 1, 0),
(158, 32, 103, 'Standard', 100, 3, 1, 0),
(159, 32, 104, 'Deluxe', 150, 2, 1, 1),
(160, 32, 105, 'Deluxe', 150, 4, 1, 1),

(161, 33, 101, 'Standard', 100, 2, 1, 0),
(162, 33, 102, 'Standard', 100, 3, 1, 0),
(163, 33, 103, 'Standard', 100, 2, 1, 0),
(164, 33, 104, 'Deluxe', 150, 4, 1, 1),
(165, 33, 105, 'Deluxe', 150, 2, 1, 1),
(166, 34, 101, 'Standard', 100, 2, 1, 0),
(167, 34, 102, 'Standard', 100, 3, 1, 0),
(168, 34, 103, 'Standard', 100, 2, 1, 0),
(169, 34, 104, 'Deluxe', 150, 4, 1, 1),
(170, 34, 105, 'Deluxe', 150, 2, 1, 1),

(171, 35, 101, 'Standard', 100, 3, 1, 0),
(172, 35, 102, 'Standard', 100, 2, 1, 0),
(173, 35, 103, 'Standard', 100, 4, 1, 0),
(174, 35, 104, 'Deluxe', 150, 2, 1, 1),
(175, 35, 105, 'Deluxe', 150, 2, 1, 1),
(176, 36, 101, 'Standard', 100, 3, 1, 0),
(177, 36, 102, 'Standard', 100, 2, 1, 0),
(178, 36, 103, 'Standard', 100, 4, 1, 0),
(179, 36, 104, 'Deluxe', 150, 2, 1, 1),
(180, 36, 105, 'Deluxe', 150, 2, 1, 1),

(181, 37, 101, 'Standard', 100, 2, 1, 0),
(182, 37, 102, 'Standard', 100, 4, 1, 0),
(183, 37, 103, 'Standard', 100, 2, 1, 0),
(184, 37, 104, 'Deluxe', 150, 2, 1, 1),
(185, 37, 105, 'Deluxe', 150, 3, 1, 1),
(186, 38, 101, 'Standard', 100, 2, 1, 0),
(187, 38, 102, 'Standard', 100, 4, 1, 0),
(188, 38, 103, 'Standard', 100, 2, 1, 0),
(189, 38, 104, 'Deluxe', 150, 2, 1, 1),
(190, 38, 105, 'Deluxe', 150, 3, 1, 1),

(191, 39, 101, 'Standard', 100, 4, 1, 0),
(192, 39, 102, 'Standard', 100, 2, 1, 0),
(193, 39, 103, 'Standard', 100, 2, 1, 0),
(194, 39, 104, 'Deluxe', 150, 3, 1, 1),
(195, 39, 105, 'Deluxe', 150, 2, 1, 1),
(196, 40, 101, 'Standard', 100, 4, 1, 0),
(197, 40, 102, 'Standard', 100, 2, 1, 0),
(198, 40, 103, 'Standard', 100, 2, 1, 0),
(199, 40, 104, 'Deluxe', 150, 3, 1, 1),
(200, 40, 105, 'Deluxe', 150, 2, 1, 1),
(201, 41, 101, 'Standard', 90, 2, 1, 0),
(202, 41, 102, 'Standard', 95, 2, 1, 0),
(203, 41, 103, 'Standard', 100, 3, 1, 0),
(204, 41, 104, 'Deluxe', 110, 2, 1, 1),
(205, 41, 105, 'Deluxe', 120, 4, 1, 1),
(206, 42, 101, 'Standard', 85, 2, 1, 0),
(207, 42, 102, 'Standard', 95, 2, 1, 0),
(208, 42, 103, 'Standard', 100, 3, 1, 0),
(209, 42, 104, 'Deluxe', 120, 2, 1, 1),
(210, 42, 105, 'Deluxe', 130, 4, 1, 1),

(211, 43, 101, 'Standard', 90, 2, 1, 0),
(212, 43, 102, 'Standard', 95, 3, 1, 0),
(213, 43, 103, 'Standard', 100, 2, 1, 0),
(214, 43, 104, 'Deluxe', 110, 4, 1, 1),
(215, 43, 105, 'Deluxe', 120, 2, 1, 1),
(216, 44, 101, 'Standard', 85, 2, 1, 0),
(217, 44, 102, 'Standard', 95, 3, 1, 0),
(218, 44, 103, 'Standard', 100, 2, 1, 0),
(219, 44, 104, 'Deluxe', 120, 4, 1, 1),
(220, 44, 105, 'Deluxe', 130, 2, 1, 1),

(221, 45, 101, 'Standard', 90, 3, 1, 0),
(222, 45, 102, 'Standard', 95, 2, 1, 0),
(223, 45, 103, 'Standard', 100, 4, 1, 0),
(224, 45, 104, 'Deluxe', 110, 2, 1, 1),
(225, 45, 105, 'Deluxe', 120, 2, 1, 1),
(226, 46, 101, 'Standard', 85, 3, 1, 0),
(227, 46, 102, 'Standard', 95, 2, 1, 0),
(228, 46, 103, 'Standard', 100, 4, 1, 0),
(229, 46, 104, 'Deluxe', 120, 2, 1, 1),
(230, 46, 105, 'Deluxe', 130, 2, 1, 1),

(231, 47, 101, 'Standard', 90, 2, 1, 0),
(232, 47, 102, 'Standard', 95, 4, 1, 0),
(233, 47, 103, 'Standard', 100, 2, 1, 0),
(234, 47, 104, 'Deluxe', 110, 2, 1, 1),
(235, 47, 105, 'Deluxe', 120, 3, 1, 1),
(236, 48, 101, 'Standard', 85, 2, 1, 0),
(237, 48, 102, 'Standard', 95, 4, 1, 0),
(238, 48, 103, 'Standard', 100, 2, 1, 0),
(239, 48, 104, 'Deluxe', 120, 2, 1, 1),
(240, 48, 105, 'Deluxe', 130, 3, 1, 1),

(241, 49, 101, 'Standard', 90, 4, 1, 0),
(242, 49, 102, 'Standard', 95, 2, 1, 0),
(243, 49, 103, 'Standard', 100, 2, 1, 0),
(244, 49, 104, 'Deluxe', 110, 3, 1, 1),
(245, 49, 105, 'Deluxe', 120, 2, 1, 1),
(246, 50, 101, 'Standard', 85, 4, 1, 0),
(247, 50, 102, 'Standard', 95, 2, 1, 0),
(248, 50, 103, 'Standard', 100, 2, 1, 0),
(249, 50, 104, 'Deluxe', 120, 3, 1, 1),
(250, 50, 105, 'Deluxe', 130, 2, 1, 1),

(251, 51, 101, 'Standard', 90, 2, 1, 0),
(252, 51, 102, 'Standard', 95, 2, 1, 0),
(253, 51, 103, 'Standard', 100, 3, 1, 0),
(254, 51, 104, 'Deluxe', 110, 2, 1, 1),
(255, 51, 105, 'Deluxe', 120, 4, 1, 1),
(256, 52, 101, 'Standard', 85, 2, 1, 0),
(257, 52, 102, 'Standard', 95, 2, 1, 0),
(258, 52, 103, 'Standard', 100, 3, 1, 0),
(259, 52, 104, 'Deluxe', 120, 2, 1, 1),
(260, 52, 105, 'Deluxe', 130, 4, 1, 1),

(261, 53, 101, 'Standard', 90, 2, 1, 0),
(262, 53, 102, 'Standard', 95, 3, 1, 0),
(263, 53, 103, 'Standard', 100, 2, 1, 0),
(264, 53, 104, 'Deluxe', 110, 4, 1, 1),
(265, 53, 105, 'Deluxe', 120, 2, 1, 1),
(266, 54, 101, 'Standard', 85, 2, 1, 0),
(267, 54, 102, 'Standard', 95, 3, 1, 0),
(268, 54, 103, 'Standard', 100, 2, 1, 0),
(269, 54, 104, 'Deluxe', 120, 4, 1, 1),
(270, 54, 105, 'Deluxe', 130, 2, 1, 1),

(271, 55, 101, 'Standard', 90, 3, 1, 0),
(272, 55, 102, 'Standard', 95, 2, 1, 0),
(273, 55, 103, 'Standard', 100, 4, 1, 0),
(274, 55, 104, 'Deluxe', 110, 2, 1, 1),
(275, 55, 105, 'Deluxe', 120, 2, 1, 1),
(276, 56, 101, 'Standard', 85, 3, 1, 0),
(277, 56, 102, 'Standard', 95, 2, 1, 0),
(278, 56, 103, 'Standard', 100, 4, 1, 0),
(279, 56, 104, 'Deluxe', 120, 2, 1, 1),
(280, 56, 105, 'Deluxe', 130, 2, 1, 1),

(281, 57, 101, 'Standard', 90, 2, 1, 0),
(282, 57, 102, 'Standard', 95, 4, 1, 0),
(283, 57, 103, 'Standard', 100, 2, 1, 0),
(284, 57, 104, 'Deluxe', 110, 2, 1, 1),
(285, 57, 105, 'Deluxe', 120, 3, 1, 1),
(286, 58, 101, 'Standard', 85, 2, 1, 0),
(287, 58, 102, 'Standard', 95, 4, 1, 0),
(288, 58, 103, 'Standard', 100, 2, 1, 0),
(289, 58, 104, 'Deluxe', 120, 2, 1, 1),
(290, 58, 105, 'Deluxe', 130, 3, 1, 1),

(291, 59, 101, 'Standard', 90, 4, 1, 0),
(292, 59, 102, 'Standard', 95, 2, 1, 0),
(293, 59, 103, 'Standard', 100, 2, 1, 0),
(294, 59, 104, 'Deluxe', 110, 3, 1, 1),
(295, 59, 105, 'Deluxe', 120, 2, 1, 1),
(296, 60, 101, 'Standard', 85, 4, 1, 0),
(297, 60, 102, 'Standard', 95, 2, 1, 0),
(298, 60, 103, 'Standard', 100, 2, 1, 0),
(299, 60, 104, 'Deluxe', 120, 3, 1, 1),
(300, 60, 105, 'Deluxe', 130, 2, 1, 1),
(301, 61, 101, 'Standard', 80, 2, 1, 0),
(302, 61, 102, 'Standard', 85, 2, 1, 0),
(303, 61, 103, 'Standard', 90, 3, 1, 0),
(304, 61, 104, 'Deluxe', 100, 2, 1, 1),
(305, 61, 105, 'Deluxe', 110, 4, 1, 1),
(306, 62, 101, 'Standard', 75, 2, 1, 0),
(307, 62, 102, 'Standard', 85, 2, 1, 0),
(308, 62, 103, 'Standard', 90, 3, 1, 0),
(309, 62, 104, 'Deluxe', 110, 2, 1, 1),
(310, 62, 105, 'Deluxe', 120, 4, 1, 1),

(311, 63, 101, 'Standard', 80, 2, 1, 0),
(312, 63, 102, 'Standard', 85, 3, 1, 0),
(313, 63, 103, 'Standard', 90, 2, 1, 0),
(314, 63, 104, 'Deluxe', 100, 4, 1, 1),
(315, 63, 105, 'Deluxe', 110, 2, 1, 1),
(316, 64, 101, 'Standard', 75, 2, 1, 0),
(317, 64, 102, 'Standard', 85, 3, 1, 0),
(318, 64, 103, 'Standard', 90, 2, 1, 0),
(319, 64, 104, 'Deluxe', 110, 4, 1, 1),
(320, 64, 105, 'Deluxe', 120, 2, 1, 1),

(321, 65, 101, 'Standard', 80, 3, 1, 0),
(322, 65, 102, 'Standard', 85, 2, 1, 0),
(323, 65, 103, 'Standard', 90, 4, 1, 0),
(324, 65, 104, 'Deluxe', 100, 2, 1, 1),
(325, 65, 105, 'Deluxe', 110, 2, 1, 1),
(326, 66, 101, 'Standard', 75, 3, 1, 0),
(327, 66, 102, 'Standard', 85, 2, 1, 0),
(328, 66, 103, 'Standard', 90, 4, 1, 0),
(329, 66, 104, 'Deluxe', 110, 2, 1, 1),
(330, 66, 105, 'Deluxe', 120, 2, 1, 1),

(331, 67, 101, 'Standard', 80, 2, 1, 0),
(332, 67, 102, 'Standard', 85, 4, 1, 0),
(333, 67, 103, 'Standard', 90, 2, 1, 0),
(334, 67, 104, 'Deluxe', 100, 2, 1, 1),
(335, 67, 105, 'Deluxe', 110, 3, 1, 1),
(336, 68, 101, 'Standard', 75, 2, 1, 0),
(337, 68, 102, 'Standard', 85, 4, 1, 0),
(338, 68, 103, 'Standard', 90, 2, 1, 0),
(339, 68, 104, 'Deluxe', 110, 2, 1, 1),
(340, 68, 105, 'Deluxe', 120, 3, 1, 1),

(341, 69, 101, 'Standard', 80, 4, 1, 0),
(342, 69, 102, 'Standard', 85, 2, 1, 0),
(343, 69, 103, 'Standard', 90, 2, 1, 0),
(344, 69, 104, 'Deluxe', 100, 3, 1, 1),
(345, 69, 105, 'Deluxe', 110, 2, 1, 1),
(346, 70, 101, 'Standard', 75, 4, 1, 0),
(347, 70, 102, 'Standard', 85, 2, 1, 0),
(348, 70, 103, 'Standard', 90, 2, 1, 0),
(349, 70, 104, 'Deluxe', 110, 3, 1, 1),
(350, 70, 105, 'Deluxe', 120, 2, 1, 1),

(351, 71, 101, 'Standard', 80, 2, 1, 0),
(352, 71, 102, 'Standard', 85, 2, 1, 0),
(353, 71, 103, 'Standard', 90, 3, 1, 0),
(354, 71, 104, 'Deluxe', 100, 2, 1, 1),
(355, 71, 105, 'Deluxe', 110, 4, 1, 1),
(356, 72, 101, 'Standard', 75, 2, 1, 0),
(357, 72, 102, 'Standard', 85, 2, 1, 0),
(358, 72, 103, 'Standard', 90, 3, 1, 0),
(359, 72, 104, 'Deluxe', 110, 2, 1, 1),
(360, 72, 105, 'Deluxe', 120, 4, 1, 1),

(361, 73, 101, 'Standard', 80, 2, 1, 0),
(362, 73, 102, 'Standard', 85, 3, 1, 0),
(363, 73, 103, 'Standard', 90, 2, 1, 0),
(364, 73, 104, 'Deluxe', 100, 4, 1, 1),
(365, 73, 105, 'Deluxe', 110, 2, 1, 1),
(366, 74, 101, 'Standard', 75, 2, 1, 0),
(367, 74, 102, 'Standard', 85, 3, 1, 0),
(368, 74, 103, 'Standard', 90, 2, 1, 0),
(369, 74, 104, 'Deluxe', 110, 4, 1, 1),
(370, 74, 105, 'Deluxe', 120, 2, 1, 1),

(371, 75, 101, 'Standard', 80, 3, 1, 0),
(372, 75, 102, 'Standard', 85, 2, 1, 0),
(373, 75, 103, 'Standard', 90, 4, 1, 0),
(374, 75, 104, 'Deluxe', 100, 2, 1, 1),
(375, 75, 105, 'Deluxe', 110, 2, 1, 1),
(376, 76, 101, 'Standard', 75, 3, 1, 0),
(377, 76, 102, 'Standard', 85, 2, 1, 0),
(378, 76, 103, 'Standard', 90, 4, 1, 0),
(379, 76, 104, 'Deluxe', 110, 2, 1, 1),
(380, 76, 105, 'Deluxe', 120, 2, 1, 1),

(381, 77, 101, 'Standard', 80, 2, 1, 0),
(382, 77, 102, 'Standard', 85, 4, 1, 0),
(383, 77, 103, 'Standard', 90, 2, 1, 0),
(384, 77, 104, 'Deluxe', 100, 2, 1, 1),
(385, 77, 105, 'Deluxe', 110, 3, 1, 1),
(386, 78, 101, 'Standard', 75, 2, 1, 0),
(387, 78, 102, 'Standard', 85, 4, 1, 0),
(388, 78, 103, 'Standard', 90, 2, 1, 0),
(389, 78, 104, 'Deluxe', 110, 2, 1, 1),
(390, 78, 105, 'Deluxe', 120, 3, 1, 1),

(391, 79, 101, 'Standard', 80, 4, 1, 0),
(392, 79, 102, 'Standard', 85, 2, 1, 0),
(393, 79, 103, 'Standard', 90, 2, 1, 0),
(394, 79, 104, 'Deluxe', 100, 3, 1, 1),
(395, 79, 105, 'Deluxe', 110, 2, 1, 1),
(396, 80, 101, 'Standard', 75, 4, 1, 0),
(397, 80, 102, 'Standard', 85, 2, 1, 0),
(398, 80, 103, 'Standard', 90, 2, 1, 0),
(399, 80, 104, 'Deluxe', 110, 3, 1, 1),
(400, 80, 105, 'Deluxe', 120, 2, 1, 1),

(401, 81, 101, 'Standard', 80, 2, 1, 0),
(402, 81, 102, 'Standard', 85, 2, 1, 0),
(403, 81, 103, 'Standard', 90, 3, 1, 0),
(404, 81, 104, 'Deluxe', 100, 2, 1, 1),
(405, 81, 105, 'Deluxe', 110, 4, 1, 1),
(406, 82, 101, 'Standard', 75, 2, 1, 0),
(407, 82, 102, 'Standard', 85, 2, 1, 0),
(408, 82, 103, 'Standard', 90, 3, 1, 0),
(409, 82, 104, 'Deluxe', 110, 2, 1, 1),
(410, 82, 105, 'Deluxe', 120, 4, 1, 1),

(411, 83, 101, 'Standard', 80, 2, 1, 0),
(412, 83, 102, 'Standard', 85, 3, 1, 0),
(413, 83, 103, 'Standard', 90, 2, 1, 0),
(414, 83, 104, 'Deluxe', 100, 4, 1, 1),
(415, 83, 105, 'Deluxe', 110, 2, 1, 1),
(416, 84, 101, 'Standard', 75, 2, 1, 0),
(417, 84, 102, 'Standard', 85, 3, 1, 0),
(418, 84, 103, 'Standard', 90, 2, 1, 0),
(419, 84, 104, 'Deluxe', 110, 4, 1, 1),
(420, 84, 105, 'Deluxe', 120, 2, 1, 1),

(421, 85, 101, 'Standard', 80, 3, 1, 0),
(422, 85, 102, 'Standard', 85, 2, 1, 0),
(423, 85, 103, 'Standard', 90, 4, 1, 0),
(424, 85, 104, 'Deluxe', 100, 2, 1, 1),
(425, 85, 105, 'Deluxe', 110, 2, 1, 1),
(426, 86, 101, 'Standard', 75, 3, 1, 0),
(427, 86, 102, 'Standard', 85, 2, 1, 0),
(428, 86, 103, 'Standard', 90, 4, 1, 0),
(429, 86, 104, 'Deluxe', 110, 2, 1, 1),
(430, 86, 105, 'Deluxe', 120, 2, 1, 1),

(431, 87, 101, 'Standard', 80, 2, 1, 0),
(432, 87, 102, 'Standard', 85, 4, 1, 0),
(433, 87, 103, 'Standard', 90, 2, 1, 0),
(434, 87, 104, 'Deluxe', 100, 2, 1, 1),
(435, 87, 105, 'Deluxe', 110, 3, 1, 1),
(436, 88, 101, 'Standard', 75, 2, 1, 0),
(437, 88, 102, 'Standard', 85, 4, 1, 0),
(438, 88, 103, 'Standard', 90, 2, 1, 0),
(439, 88, 104, 'Deluxe', 110, 2, 1, 1),
(440, 88, 105, 'Deluxe', 120, 3, 1, 1),

(441, 89, 101, 'Standard', 80, 4, 1, 0),
(442, 89, 102, 'Standard', 85, 2, 1, 0),
(443, 89, 103, 'Standard', 90, 2, 1, 0),
(444, 89, 104, 'Deluxe', 100, 3, 1, 1),
(445, 89, 105, 'Deluxe', 110, 2, 1, 1),
(446, 90, 101, 'Standard', 75, 4, 1, 0),
(447, 90, 102, 'Standard', 85, 2, 1, 0),
(448, 90, 103, 'Standard', 90, 2, 1, 0),
(449, 90, 104, 'Deluxe', 110, 3, 1, 1),
(450, 90, 105, 'Deluxe', 120, 2, 1, 1),

(451, 91, 101, 'Standard', 80, 2, 1, 0),
(452, 91, 102, 'Standard', 85, 2, 1, 0),
(453, 91, 103, 'Standard', 90, 3, 1, 0),
(454, 91, 104, 'Deluxe', 100, 2, 1, 1),
(455, 91, 105, 'Deluxe', 110, 4, 1, 1),
(456, 92, 101, 'Standard', 75, 2, 1, 0),
(457, 92, 102, 'Standard', 85, 2, 1, 0),
(458, 92, 103, 'Standard', 90, 3, 1, 0),
(459, 92, 104, 'Deluxe', 110, 2, 1, 1),
(460, 92, 105, 'Deluxe', 120, 4, 1, 1),

(461, 93, 101, 'Standard', 80, 2, 1, 0),
(462, 93, 102, 'Standard', 85, 3, 1, 0),
(463, 93, 103, 'Standard', 90, 2, 1, 0),
(464, 93, 104, 'Deluxe', 100, 4, 1, 1),
(465, 93, 105, 'Deluxe', 110, 2, 1, 1),
(466, 94, 101, 'Standard', 75, 2, 1, 0),
(467, 94, 102, 'Standard', 85, 3, 1, 0),
(468, 94, 103, 'Standard', 90, 2, 1, 0),
(469, 94, 104, 'Deluxe', 110, 4, 1, 1),
(470, 94, 105, 'Deluxe', 120, 2, 1, 1),
#NAME?
(471, 95, 101, 'Standard', 80, 3, 1, 0),
(472, 95, 102, 'Standard', 85, 2, 1, 0),
(473, 95, 103, 'Standard', 90, 4, 1, 0),
(474, 95, 104, 'Deluxe', 100, 2, 1, 1),
(475, 95, 105, 'Deluxe', 110, 2, 1, 1),
(476, 96, 101, 'Standard', 75, 3, 1, 0),
(477, 96, 102, 'Standard', 85, 2, 1, 0),
(478, 96, 103, 'Standard', 90, 4, 1, 0),
(479, 96, 104, 'Deluxe', 110, 2, 1, 1),
(480, 96, 105, 'Deluxe', 120, 2, 1, 1),

(481, 97, 101, 'Standard', 80, 2, 1, 0),
(482, 97, 102, 'Standard', 85, 4, 1, 0),
(483, 97, 103, 'Standard', 90, 2, 1, 0),
(484, 97, 104, 'Deluxe', 100, 2, 1, 1),
(485, 97, 105, 'Deluxe', 110, 3, 1, 1),
(486, 98, 101, 'Standard', 75, 2, 1, 0),
(487, 98, 102, 'Standard', 85, 4, 1, 0),
(488, 98, 103, 'Standard', 90, 2, 1, 0),
(489, 98, 104, 'Deluxe', 110, 2, 1, 1),
(490, 98, 105, 'Deluxe', 120, 3, 1, 1),

(491, 99, 101, 'Standard', 80, 4, 1, 0),
(492, 99, 102, 'Standard', 85, 2, 1, 0),
(493, 99, 103, 'Standard', 90, 2, 1, 0),
(494, 99, 104, 'Deluxe', 100, 3, 1, 1),
(495, 99, 105, 'Deluxe', 110, 2, 1, 1),
(496, 100, 101, 'Standard', 75, 4, 1, 0),
(497, 100, 102, 'Standard', 85, 2, 1, 0),
(498, 100, 103, 'Standard', 90, 2, 1, 0),
(499, 100, 104, 'Deluxe', 110, 3, 1, 1),
(500, 100, 105, 'Deluxe', 120, 2, 1, 1),
(501, 101, 101, 'Standard', 80, 2, 1, 0),
(502, 101, 102, 'Standard', 85, 2, 1, 0),
(503, 101, 103, 'Standard', 90, 3, 1, 0),
(504, 101, 104, 'Deluxe', 100, 2, 1, 1),
(505, 101, 105, 'Deluxe', 110, 4, 1, 1),
(506, 102, 101, 'Standard', 75, 2, 1, 0),
(507, 102, 102, 'Standard', 85, 2, 1, 0),
(508, 102, 103, 'Standard', 90, 3, 1, 0),
(509, 102, 104, 'Deluxe', 110, 2, 1, 1),
(510, 102, 105, 'Deluxe', 120, 4, 1, 1);

 -- table 5
-- DROP TABLE IF EXISTS RoomAvailability;
CREATE TABLE RoomAvailability (
    Availability_ID INT AUTO_INCREMENT PRIMARY KEY,
    Room_ID INT,
    Hotel_ID INT,
    Room_No INT,
    Room_Type VARCHAR(50),
    Room_Price BIGINT,
    Room_Occupancy INT,
    Room_Floor INT,
    Balcony INT,
    Date DATE,
    DayOfMonth INT,
    WeekOfYear INT,
    DayOfWeek INT,
    WeekdayName VARCHAR(50),
    Booking_ID INT,
    Available TINYINT,
    FOREIGN KEY (Room_ID) REFERENCES Room(Room_ID)
) ;
 
 INSERT INTO RoomAvailability (Room_ID, Hotel_ID, Room_No, Room_Type, Room_Price, Room_Occupancy, Room_Floor, Balcony, Date, DayOfMonth, WeekOfYear, DayOfWeek, WeekdayName, Booking_ID, Available)
SELECT
    r.Room_ID,
    r.Hotel_ID,
    r.Room_No,
    r.Room_Type,
    r.Room_Price,
    r.Room_Occupancy,
    r.Room_Floor,
    r.Balcony,
    d.Date,
    DAY(d.Date) AS DayOfMonth,
    WEEK(d.Date) AS WeekOfYear,
    DAYOFWEEK(d.Date) AS DayOfWeek,
    DAYNAME(d.Date) AS WeekdayName,
    NULL AS Booking_ID,
    1 AS Available
FROM Room r CROSS JOIN date_info d;
    -- table 6
-- DROP TABLE IF EXISTS Employee_Info;    
    CREATE TABLE Employee_Info (
    Emp_ID INT PRIMARY KEY,
    Emp_First_Name VARCHAR(50),
    Emp_Last_Name VARCHAR(50),
    Employee_Address VARCHAR(100),
    Emp_Position VARCHAR(50),
    Emp_Building_Apt VARCHAR(50),
    Emp_Bank_Details VARCHAR(100),
    Emp_City VARCHAR(50),
    Emp_State VARCHAR(2),
    Emp_County VARCHAR(50),
    Emp_Zip_Code VARCHAR(10),
    Emp_Phone_Number VARCHAR(20),
    Emp_Email VARCHAR(100),
    Emp_State_ID INT,
    current_active INT DEFAULT 1
);


INSERT INTO Employee_Info (Emp_ID, Emp_First_Name, Emp_Last_Name, Employee_Address, Emp_Position, Emp_Building_Apt, Emp_Bank_Details, Emp_City, Emp_State, Emp_County, Emp_Zip_Code, Emp_Phone_Number, Emp_Email, Emp_State_ID)
VALUES
(1,'John', 'Doe', '123 Main St', 'Manager', 'Apt 101', 'ABC Bank, 1234', 'New York', 'NY', 'New York', '10001', '555-123-4567','john.doe@example.com', 1),
(2, 'Jane', 'Smith', '456 Elm St', 'Assistant Manager', 'Unit 202', 'DEF Bank, 5678', 'Los Angeles', 'CA', 'Los Angeles', '90001', '555-234-5678', 'jane.smith@example.com', 2),
(3, 'Michael', 'Johnson', '789 Oak St', 'Supervisor', 'Suite 303', 'GHI Bank, 9012', 'Chicago', 'IL', 'Cook', '60601', '555-345-6789', 'michael.johnson@example.com', 3),
(4, 'Emily', 'Brown', '101 Pine St', 'Team Leader', 'Apt 404', 'JKL Bank, 3456', 'Houston', 'TX', 'Harris', '77001', '555-456-7890', 'emily.brown@example.com', 4),
(5, 'William', 'Martinez', '222 Cedar St', 'Staff', 'Unit 505', 'MNO Bank, 7890', 'Phoenix', 'AZ', 'Maricopa', '85001', '555-567-8901', 'william.martinez@example.com', 5),
(6, 'Olivia', 'Garcia', '333 Walnut St', 'Intern', 'Suite 606', 'PQR Bank, 2345', 'Philadelphia', 'PA', 'Philadelphia', '19101', '555-678-9012', 'olivia.garcia@example.com', 6),
(7, 'James', 'Lopez', '444 Maple St', 'Manager', 'Apt 707', 'STU Bank, 6789', 'San Antonio', 'TX', 'Bexar', '78201', '555-789-0123', 'james.lopez@example.com', 7),
(8, 'Sophia', 'Gonzalez', '555 Oak St', 'Assistant Manager', 'Unit 808', 'VWX Bank, 1234', 'San Diego', 'CA', 'San Diego', '92101', '555-890-1234', 'sophia.gonzalez@example.com', 8),
(9, 'Benjamin', 'Rodriguez', '666 Elm St', 'Supervisor', 'Suite 909', 'YZA Bank, 5678', 'Dallas', 'TX', 'Dallas', '75201', '555-901-2345', 'benjamin.rodriguez@example.com', 9),
(10, 'Mia', 'Hernandez', '777 Pine St', 'Team Leader', 'Apt 1010', 'BCD Bank, 9012', 'San Jose', 'CA', 'Santa Clara', '95101', '555-012-3456', 'mia.hernandez@example.com', 10),
(11, 'Ethan', 'Perez', '888 Cedar St', 'Staff', 'Unit 1111', 'EFG Bank, 3456', 'Austin', 'TX', 'Travis', '78701', '555-123-4567', 'ethan.perez@example.com', 11),
(12, 'Isabella', 'Sanchez', '999 Walnut St', 'Intern', 'Suite 1212', 'HIJ Bank, 7890', 'Jacksonville', 'FL', 'Duval', '32099', '555-234-5678', 'isabella.sanchez@example.com', 12),
(13, 'Alexander', 'Smith', '111 Pine St', 'Manager', 'Apt 1313', 'KLM Bank, 1234', 'San Francisco', 'CA', 'San Francisco', '94101', '555-345-6789', 'alexander.smith@example.com', 13),
(14, 'Charlotte', 'Johnson', '222 Elm St', 'Assistant Manager', 'Unit 1414', 'NOP Bank, 5678', 'Indianapolis', 'IN', 'Marion', '46201', '555-456-7890', 'charlotte.johnson@example.com', 14),
(15, 'Daniel', 'Williams', '333 Oak St', 'Supervisor', 'Suite 1515', 'QRS Bank, 9012', 'Columbus', 'OH', 'Franklin', '43201', '555-567-8901', 'daniel.williams@example.com', 15),
(16, 'Amelia', 'Brown', '444 Cedar St', 'Team Leader', 'Apt 1616', 'TUV Bank, 2345', 'Fort Worth', 'TX', 'Tarrant', '76101', '555-678-9012', 'amelia.brown@example.com', 16),
(17, 'Michael', 'Jones', '555 Walnut St', 'Staff', 'Unit 1717', 'WXY Bank, 6789', 'Charlotte', 'NC', 'Mecklenburg', '28201', '555-789-0123', 'michael.jones@example.com', 17),
(18, 'Evelyn', 'Garcia', '666 Pine St', 'Intern', 'Suite 1818', 'ZAB Bank, 1234', 'Seattle', 'WA', 'King', '98101', '555-890-1234', 'evelyn.garcia@example.com', 18),
(19, 'William', 'Rodriguez', '777 Elm St', 'Manager', 'Apt 1919', 'BCD Bank, 5678', 'Denver', 'CO', 'Denver', '80201', '555-901-2345', 'william.rodriguez@example.com', 19),
(20, 'Ava', 'Martinez', '888 Oak St', 'Assistant Manager', 'Unit 2020', 'EFG Bank, 9012', 'Washington', 'DC', 'District of Columbia', '20001', '555-012-3456', 'ava.martinez@example.com', 20),
(21, 'James', 'Hernandez', '999 Cedar St', 'Supervisor', 'Suite 2121', 'HIJ Bank, 2345', 'Boston', 'MA', 'Suffolk', '02101', '555-123-4567', 'james.hernandez@example.com', 21),
(22, 'Olivia', 'Lopez', '111 Walnut St', 'Team Leader', 'Apt 2222', 'KLM Bank, 6789', 'Nashville', 'TN', 'Davidson', '37201', '555-234-5678', 'olivia.lopez@example.com', 22),
(23, 'Alexander', 'Gonzalez', '222 Pine St', 'Staff', 'Unit 2323', 'NOP Bank, 1234', 'Baltimore', 'MD', 'Baltimore City', '21201', '555-345-6789', 'alexander.gonzalez@example.com', 23),
(24, 'Mia', 'Sanchez', '333 Elm St', 'Intern', 'Suite 2424', 'QRS Bank, 5678', 'Louisville', 'KY', 'Jefferson', '40201', '555-456-7890', 'mia.sanchez@example.com', 24),
(25, 'Ethan', 'Martinez', '444 Oak St', 'Manager', 'Apt 2525', 'TUV Bank, 9012', 'Milwaukee', 'WI', 'Milwaukee', '53201', '555-567-8901', 'ethan.martinez@example.com', 25),
(26, 'Isabella', 'Perez', '555 Cedar St', 'Assistant Manager', 'Unit 2626', 'WXY Bank, 2345', 'Portland', 'OR', 'Multnomah', '97201', '555-678-9012', 'isabella.perez@example.com', 26),
(27, 'James', 'Brown', '666 Walnut St', 'Supervisor', 'Suite 2727', 'ZAB Bank, 6789', 'Oklahoma City', 'OK', 'Oklahoma', '73101', '555-789-0123', 'james.brown@example.com', 27),
(28, 'Sophia', 'Jones', '777 Pine St', 'Team Leader', 'Apt 2828', 'BCD Bank, 1234', 'Las Vegas', 'NV', 'Clark', '89101', '555-890-1234', 'sophia.jones@example.com', 28),
(29, 'William', 'Garcia', '888 Elm St', 'Staff', 'Unit 2929', 'EFG Bank, 5678', 'Louis', 'MO', 'St. Louis City', '63101', '555-901-2345', 'william.garcia@example.com', 29),
(30, 'Ava', 'Rodriguez', '999 Oak St', 'Intern', 'Suite 3030', 'HIJ Bank, 9012', 'Tucson', 'AZ', 'Pima', '85701', '555-012-3456', 'ava.rodriguez@example.com', 30),
(31, 'Michael', 'Smith', '111 Cedar St', 'Manager', 'Apt 3131', 'KLM Bank, 2345', 'Fresno', 'CA', 'Fresno', '93650', '555-123-4567', 'michael.smith@example.com', 31),
(32, 'Charlotte', 'Johnson', '222 Walnut St', 'Assistant Manager', 'Unit 3232', 'NOP Bank, 6789', 'Sacramento', 'CA', 'Sacramento', '95814', '555-234-5678', 'charlotte.johnson@example.com', 32),
(33, 'Daniel', 'Williams', '333 Pine St', 'Supervisor', 'Suite 3333', 'QRS Bank, 1234', 'Long Beach', 'CA', 'Los Angeles', '90802', '555-345-6789', 'daniel.williams@example.com', 33),
(34, 'Amelia', 'Brown', '444 Oak St', 'Team Leader', 'Apt 3434', 'TUV Bank, 5678', 'Kansas City', 'MO', 'Jackson', '64101', '555-456-7890', 'amelia.brown@example.com', 34),
(35, 'Michael', 'Jones', '555 Cedar St', 'Staff', 'Unit 3535', 'WXY Bank, 9012', 'Miami', 'FL', 'Miami-Dade', '33101', '555-567-8901', 'michael.jones@example.com', 35),
(36, 'Evelyn', 'Garcia', '666 Walnut St', 'Intern', 'Suite 3636', 'ZAB Bank, 2345', 'Cleveland', 'OH', 'Cuyahoga', '44101', '555-678-9012', 'evelyn.garcia@example.com', 36),
(37, 'William', 'Rodriguez', '777 Elm St', 'Manager', 'Apt 3737', 'BCD Bank, 6789', 'Oakland', 'CA', 'Alameda', '94601', '555-789-0123', 'william.rodriguez@example.com', 37),
(38, 'Ava', 'Martinez', '888 Oak St', 'Assistant Manager', 'Unit 3838', 'EFG Bank, 1234', 'Minneapolis', 'MN', 'Hennepin', '55401', '555-890-1234', 'ava.martinez@example.com', 38),
(39, 'James', 'Hernandez', '999 Cedar St', 'Supervisor', 'Suite 3939', 'HIJ Bank, 5678', 'Honolulu', 'HI', 'Honolulu', '96813', '555-901-2345', 'james.hernandez@example.com', 39),
(40, 'Olivia', 'Lopez', '111 Walnut St', 'Team Leader', 'Apt 4040', 'KLM Bank, 9012', 'Anaheim', 'CA', 'Orange', '92801', '555-012-3456', 'olivia.lopez@example.com', 40),
(41, 'Alexander', 'Gonzalez', '222 Pine St', 'Staff', 'Unit 4141', 'NOP Bank, 2345', 'Tampa', 'FL', 'Hillsborough', '33601', '555-123-4567', 'alexander.gonzalez@example.com', 41),
(42, 'Mia', 'Sanchez', '333 Elm St', 'Intern', 'Suite 4242', 'QRS Bank, 6789', 'Arlington', 'TX', 'Tarrant', '76001', '555-234-5678', 'mia.sanchez@example.com', 42),
(43, 'Ethan', 'Martinez', '444 Oak St', 'Manager', 'Apt 4343', 'TUV Bank, 1234', 'New Orleans', 'LA', 'Orleans', '70112', '555-345-6789', 'ethan.martinez@example.com', 43),
(44, 'Isabella', 'Perez', '555 Cedar St', 'Assistant Manager', 'Unit 4444', 'WXY Bank, 5678', 'Pittsburgh', 'PA', 'Allegheny', '15201', '555-456-7890', 'isabella.perez@example.com', 44),
(45, 'James', 'Brown', '666 Walnut St', 'Supervisor', 'Suite 4545', 'ZAB Bank, 9012', 'St. Paul', 'MN', 'Ramsey', '55101', '555-567-8901', 'james.brown@example.com', 45),
(46, 'Sophia', 'Jones', '777 Pine St', 'Team Leader', 'Apt 4646', 'BCD Bank, 2345', 'Cincinnati', 'OH', 'Hamilton', '45201', '555-678-9012', 'sophia.jones@example.com', 46),
(47, 'William', 'Garcia', '888 Elm St', 'Staff', 'Unit 4747', 'EFG Bank, 6789', 'Buffalo', 'NY', 'Erie', '14201', '555-789-0123', 'william.garcia@example.com', 47),
(48, 'Ava', 'Rodriguez', '999 Oak St', 'Intern', 'Suite 4848', 'HIJ Bank, 1234', 'Henderson', 'NV', 'Clark', '89002', '555-890-1234', 'ava.rodriguez@example.com', 48),
(49, 'Michael', 'Smith', '111 Cedar St', 'Manager', 'Apt 4949', 'KLM Bank, 5678', 'Lincoln', 'NE', 'Lancaster', '68501', '555-901-2345', 'michael.smith@example.com', 49),
(50, 'Charlotte', 'Johnson', '222 Walnut St', 'Assistant Manager', 'Unit 5050', 'NOP Bank, 9012', 'Orlando', 'FL', 'Orange', '32801', '555-012-3456', 'charlotte.johnson@example.com', 50),
(51, 'Daniel', 'Williams', '333 Pine St', 'Supervisor', 'Suite 5151', 'QRS Bank, 2345', 'Durham', 'NC', 'Durham', '27701', '555-123-4567', 'daniel.williams@example.com', 51),
(52, 'Amelia', 'Brown', '444 Oak St', 'Team Leader', 'Apt 5252', 'TUV Bank, 6789', 'Madison', 'WI', 'Dane', '53701', '555-234-5678', 'amelia.brown@example.com', 52),
(53, 'Michael', 'Jones', '555 Cedar St', 'Staff', 'Unit 5353', 'WXY Bank, 1234', 'Winston-Salem', 'NC', 'Forsyth', '27101', '555-345-6789', 'michael.jones@example.com', 53),
(54, 'Evelyn', 'Garcia', '666 Walnut St', 'Intern', 'Suite 5454', 'ZAB Bank, 5678', 'Norfolk', 'VA', 'Norfolk', '23501', '555-456-7890', 'evelyn.garcia@example.com', 54),
(55, 'William', 'Rodriguez', '777 Elm St', 'Manager', 'Apt 5555', 'BCD Bank, 9012', 'Chandler', 'AZ', 'Maricopa', '85224', '555-567-8901', 'william.rodriguez@example.com', 55),
(56, 'Ava', 'Martinez', '888 Oak St', 'Assistant Manager', 'Unit 5656', 'EFG Bank, 1234', 'Scottsdale', 'AZ', 'Maricopa', '85250', '555-678-9012', 'ava.martinez@example.com', 56),
(57, 'James', 'Hernandez', '999 Cedar St', 'Supervisor', 'Suite 5757', 'HIJ Bank, 5678', 'Lubbock', 'TX', 'Lubbock', '79401', '555-789-0123', 'james.hernandez@example.com', 57),
(58, 'Olivia', 'Lopez', '111 Walnut St', 'Team Leader', 'Apt 5858', 'KLM Bank, 9012', 'Irving', 'TX', 'Dallas', '75014', '555-890-1234', 'olivia.lopez@example.com', 58),
(59, 'Alexander', 'Gonzalez', '222 Pine St', 'Staff', 'Unit 5959', 'NOP Bank, 2345', 'Baton Rouge', 'LA', 'East Baton Rouge', '70801', '555-901-2345', 'alexander.gonzalez@example.com', 59),
(60, 'Mia', 'Sanchez', '333 Elm St', 'Intern', 'Suite 6060', 'QRS Bank, 6789', 'Boise', 'ID', 'Ada', '83701', '555-012-3456', 'mia.sanchez@example.com', 60);
    
   -- table 7
   -- select * from RoomAvailability limit 100
-- Drop table if exists Customer;
	CREATE TABLE Customer (

		Cust_ID INT PRIMARY KEY,

		Cust_Name VARCHAR(100),

		Cust_Age INT,

		Cust_Address VARCHAR(100),

		Cust_State VARCHAR(50),

		Cust_City VARCHAR(50),

		Cust_County VARCHAR(50),

		Cust_Zip_Code VARCHAR(20),

		Cust_Phone_No VARCHAR(20),

		Cust_Email_Id VARCHAR(100),

		Cust_State_ID INT,

		Cust_SSN_No VARCHAR(20),

		Cust_Passport_No VARCHAR(20)

);


INSERT INTO Customer (Cust_ID, Cust_Name, Cust_Age, Cust_Address, Cust_State, Cust_City, Cust_County, Cust_Zip_Code, Cust_Phone_No, Cust_Email_Id, Cust_State_ID, Cust_SSN_No, Cust_Passport_No) VALUES
(1, 'John Smith', 35, '123 Main St', 'CA', 'Los Angeles', 'Los Angeles', '90001', '555-123-4567', 'john.smith@example.com', 1, '123-45-6789', 'AB123456'),
(2, 'Mary Johnson', 28, '456 Elm St', 'NY', 'New York', 'New York', '10001', '555-234-5678', 'mary.johnson@example.com', 2, '234-56-7890', 'CD234567'),
(3, 'James Williams', 40, '789 Oak St', 'TX', 'Houston', 'Harris', '77001', '555-345-6789', 'james.williams@example.com', 3, '345-67-8901', 'EF345678'),
(4, 'Patricia Jones', 50, '101 Pine St', 'IL', 'Chicago', 'Cook', '60601', '555-456-7890', 'patricia.jones@example.com', 4, '456-78-9012', 'GH456789'),
(5, 'Michael Brown', 45, '202 Walnut St', 'FL', 'Miami', 'Miami-Dade', '33101', '555-567-8901', 'michael.brown@example.com', 5, '567-89-0123', 'IJ567890'),
(6, 'Jennifer Davis', 33, '303 Cedar St', 'CA', 'San Francisco', 'San Francisco', '94101', '555-678-9012', 'jennifer.davis@example.com', 6, '678-90-1234', 'KL678901'),
(7, 'David Miller', 38, '404 Elm St', 'TX', 'Dallas', 'Dallas', '75201', '555-789-0123', 'david.miller@example.com', 7, '789-01-2345', 'MN789012'),
(8, 'Linda Wilson', 42, '505 Oak St', 'PA', 'Philadelphia', 'Philadelphia', '19101', '555-890-1234', 'linda.wilson@example.com', 8, '890-12-3456', 'OP890123'),
(9, 'William Moore', 29, '606 Pine St', 'AZ', 'Phoenix', 'Maricopa', '85001', '555-901-2345', 'william.moore@example.com', 9, '901-23-4567', 'PQ901234'),
(10, 'Elizabeth Taylor', 48, '707 Walnut St', 'CA', 'San Diego', 'San Diego', '92101', '555-012-3456', 'elizabeth.taylor@example.com', 10, '012-34-5678', 'QR012345'),
(11, 'Richard Anderson', 55, '808 Cedar St', 'TX', 'Austin', 'Travis', '78701', '555-123-4567', 'richard.anderson@example.com', 11, '123-45-6789', 'RS123456'),
(12, 'Barbara Thomas', 31, '909 Elm St', 'IL', 'Springfield', 'Sangamon', '62701', '555-234-5678', 'barbara.thomas@example.com', 12, '234-56-7890', 'ST234567'),
(13, 'Joseph Jackson', 37, '1010 Oak St', 'PA', 'Pittsburgh', 'Allegheny', '15201', '555-345-6789', 'joseph.jackson@example.com', 13, '345-67-8901', 'TU345678'),
(14, 'Margaret White', 47, '1111 Pine St', 'FL', 'Orlando', 'Orange', '32801', '555-456-7890', 'margaret.white@example.com', 14, '456-78-9012', 'UV456789'),
(15, 'Christopher Harris', 36, '1212 Walnut St', 'CA', 'Sacramento', 'Sacramento', '95814', '555-567-8901', 'christopher.harris@example.com', 15, '567-89-0123', 'VW567890'),
(16, 'Sarah Martin', 44, '1313 Cedar St', 'TX', 'Fort Worth', 'Tarrant', '76101', '555-678-9012', 'sarah.martin@example.com', 16, '678-90-1234', 'WX678901'),
(17, 'Thomas Thompson', 30, '1414 Elm St', 'OH', 'Columbus', 'Franklin', '43201', '555-789-0123', 'thomas.thompson@example.com', 17, '789-01-2345', 'XY789012'),
(18, 'Patricia Garcia', 39, '1515 Oak St', 'FL', 'Tallahassee', 'Leon', '32301', '555-890-1234', 'patricia.garcia@example.com', 18, '890-12-3456', 'YZ890123'),
(19, 'Daniel Martinez', 32, '1616 Pine St', 'CA', 'San Jose', 'Santa Clara', '95101', '555-901-2345', 'daniel.martinez@example.com', 19, '901-23-4567', 'ZA901234'),
(20, 'Karen Robinson', 41, '1717 Walnut St', 'TX', 'San Antonio', 'Bexar', '78201', '555-012-3456', 'karen.robinson@example.com', 20, '012-34-5678', 'AB012345'),
(21, 'Gary Clark', 35, '1818 Cedar St', 'IL', 'Naperville', 'DuPage', '60540', '555-123-4567', 'gary.clark@example.com', 21, '123-45-6789', 'BC123456'),
(22, 'Nancy Rodriguez', 28, '1919 Elm St', 'NY', 'Buffalo', 'Erie', '14201', '555-234-5678', 'nancy.rodriguez@example.com', 22, '234-56-7890', 'CD234567'),
(23, 'Edward Lewis', 40, '2020 Oak St', 'TX', 'El Paso', 'El Paso', '79901', '555-345-6789', 'edward.lewis@example.com', 23, '345-67-8901', 'DE345678'),
(24, 'Michelle Lee', 50, '2121 Pine St', 'FL', 'Fort Lauderdale', 'Broward', '33301', '555-456-7890', 'michelle.lee@example.com', 24, '456-78-9012', 'EF456789'),
(25, 'William Walker', 45, '2222 Walnut St', 'CA', 'Long Beach', 'Los Angeles', '90801', '555-567-8901', 'william.walker@example.com', 25, '567-89-0123', 'FG567890'),
(26, 'Amanda Hall', 33, '2323 Cedar St', 'TX', 'Corpus Christi', 'Nueces', '78401', '555-678-9012', 'amanda.hall@example.com', 26, '678-90-1234', 'GH678901'),
(27, 'Ryan Young', 38, '2424 Elm St', 'OH', 'Cleveland', 'Cuyahoga', '44101', '555-789-0123', 'ryan.young@example.com', 27, '789-01-2345', 'HI789012'),
(28, 'Deborah Hernandez', 42, '2525 Oak St', 'FL', 'Fort Myers', 'Lee', '33901', '555-890-1234', 'deborah.hernandez@example.com', 28, '890-12-3456', 'IJ890123'),
(29, 'Ronald King', 29, '2626 Pine St', 'CA', 'Oakland', 'Alameda', '94601', '555-901-2345', 'ronald.king@example.com', 29, '901-23-4567', 'JK901234'),
(30, 'Laura Wright', 48, '2727 Walnut St', 'TX', 'Plano', 'Collin', '75023', '555-012-3456', 'laura.wright@example.com', 30, '012-34-5678', 'KL012345'),
(31, 'Scott Lopez', 55, '2828 Cedar St', 'IL', 'Rockford', 'Winnebago', '61101', '555-123-4567', 'scott.lopez@example.com', 31, '123-45-6789', 'LM123456'),
(32, 'Kimberly Scott', 31, '2929 Elm St', 'NY', 'Rochester', 'Monroe', '14601', '555-234-5678', 'kimberly.scott@example.com', 32, '234-56-7890', 'MN234567'),
(33, 'Gary Green', 37, '3030 Oak St', 'PA', 'Allentown', 'Lehigh', '18101', '555-345-6789', 'gary.green@example.com', 33, '345-67-8901', 'NO345678'),
(34, 'Rebecca Adams', 47, '3131 Pine St', 'FL', 'Naples', 'Collier', '34101', '555-456-7890', 'rebecca.adams@example.com', 34, '456-78-9012', 'OP456789'),
(35, 'Larry Baker', 36, '3232 Walnut St', 'CA', 'Anaheim', 'Orange', '92801', '555-567-8901', 'larry.baker@example.com', 35, '567-89-0123', 'PQ567890'),
(36, 'Angela Gonzalez', 44, '3333 Cedar St', 'TX', 'McAllen', 'Hidalgo', '78501', '555-678-9012', 'angela.gonzalez@example.com', 36, '678-90-1234', 'QR678901'),
(37, 'Stephen Perez', 30, '3434 Elm St', 'OH', 'Toledo', 'Lucas', '43601', '555-789-0123', 'stephen.perez@example.com', 37, '789-01-2345', 'RS789012'),
(38, 'Jessica Carter', 39, '3535 Oak St', 'FL', 'Tampa', 'Hillsborough', '33601', '555-890-1234', 'jessica.carter@example.com', 38, '890-12-3456', 'ST890123'),
(39, 'Justin Wright', 32, '3636 Pine St', 'CA', 'Santa Ana', 'Orange', '92701', '555-901-2345', 'justin.wright@example.com', 39, '901-23-4567', 'TU901234'),
(40, 'Brenda Mitchell', 41, '3737 Walnut St', 'TX', 'Garland', 'Dallas', '75040', '555-012-3456', 'brenda.mitchell@example.com', 40, '012-34-5678', 'UV012345'),
(41, 'Jose King', 35, '3838 Cedar St', 'IL', 'Peoria', 'Peoria', '61601', '555-123-4567', 'jose.king@example.com', 41, '123-45-6789', 'VW123456'),
(42, 'Melissa Hall', 28, '3939 Elm St', 'NY', 'Yonkers', 'Westchester', '10701', '555-234-5678', 'melissa.hall@example.com', 42, '234-56-7890', 'WX234567'),
(43, 'Kevin Adams', 40, '4040 Oak St', 'TX', 'Irving', 'Dallas', '75014', '555-345-6789', 'kevin.adams@example.com', 43, '345-67-8901', 'XY345678'),
(44, 'Amanda Foster', 50, '4141 Pine St', 'FL', 'Sarasota', 'Sarasota', '34201', '555-456-7890', 'amanda.foster@example.com', 44, '456-78-9012', 'YZ456789'),
(45, 'Ronald Gonzales', 45, '4242 Walnut St', 'CA', 'Riverside', 'Riverside', '92501', '555-567-8901', 'ronald.gonzales@example.com', 45, '567-89-0123', 'ZA567890'),
(46, 'Nicole Wood', 33, '4343 Cedar St', 'TX', 'Brownsville', 'Cameron', '78520', '555-678-9012', 'nicole.wood@example.com', 46, '678-90-1234', 'AB678901'),
(47, 'Daniel Mitchell', 38, '4444 Elm St', 'OH', 'Akron', 'Summit', '44301', '555-789-0123', 'daniel.mitchell@example.com', 47, '789-01-2345', 'BC789012'),
(48, 'Emily Baker', 42, '4545 Oak St', 'FL', 'Gainesville', 'Alachua', '32601', '555-890-1234', 'emily.baker@example.com', 48, '890-12-3456', 'CD890123'),
(49, 'Charles Garcia', 29, '4646 Pine St', 'CA', 'Bakersfield', 'Kern', '93301', '555-901-2345', 'charles.garcia@example.com', 49, '901-23-4567', 'DE901234'),
(50, 'Ashley Gonzalez', 48, '4747 Walnut St', 'TX', 'Laredo', 'Webb', '78040', '555-012-3456', 'ashley.gonzalez@example.com', 50, '012-34-5678', 'EF012345'),
(51, 'Kenneth Turner', 55, '4848 Cedar St', 'IL', 'Champaign', 'Champaign', '61820', '555-123-4567', 'kenneth.turner@example.com', 51, '123-45-6789', 'FG123456'),
(52, 'Michelle Ramirez', 31, '4949 Elm St', 'NY', 'Syracuse', 'Onondaga', '13201', '555-234-5678', 'michelle.ramirez@example.com', 52, '234-56-7890', 'GH234567'),
(53, 'Steven Scott', 37, '5050 Oak St', 'PA', 'Erie', 'Erie', '16501', '555-345-6789', 'steven.scott@example.com', 53, '345-67-8901', 'HI345678'),
(54, 'Amy Diaz', 47, '5151 Pine St', 'FL', 'Pensacola', 'Escambia', '32501', '555-456-7890', 'amy.diaz@example.com', 54, '456-78-9012', 'IJ456789'),
(55, 'Mark Perez', 36, '5252 Walnut St', 'CA', 'Santa Barbara', 'Santa Barbara', '93101', '555-567-8901', 'mark.perez@example.com', 55, '567-89-0123', 'JK567890'),
(56, 'Stephanie Rivera', 44, '5353 Cedar St', 'TX', 'Beaumont', 'Jefferson', '77701', '555-678-9012', 'stephanie.rivera@example.com', 56, '678-90-1234', 'KL678901'),
(57, 'Patrick Ward', 30, '5454 Elm St', 'OH', 'Dayton', 'Montgomery', '45401', '555-789-0123', 'patrick.ward@example.com', 57, '789-01-2345', 'MN789012'),
(58, 'Rachel Evans', 39, '5555 Oak St', 'FL', 'Clearwater', 'Pinellas', '33755', '555-890-1234', 'rachel.evans@example.com', 58, '890-12-3456', 'OP890123'),
(59, 'Larry Ramirez', 32, '5656 Pine St', 'CA', 'Modesto', 'Stanislaus', '95350', '555-901-2345', 'larry.ramirez@example.com', 59, '901-23-4567', 'PQ901234'),
(60, 'Debra Ross', 41, '5757 Walnut St', 'TX', 'Waco', 'McLennan', '76701', '555-012-3456', 'debra.ross@example.com', 60, '012-34-5678', 'QR012345'),
(61, 'Joseph Coleman', 35, '5858 Cedar St', 'IL', 'Decatur', 'Macon', '62521', '555-123-4567', 'joseph.coleman@example.com', 61, '123-45-6789', 'RS123456'),
(62, 'Katherine Powell', 28, '5959 Elm St', 'NY', 'Albany', 'Albany', '12201', '555-234-5678', 'katherine.powell@example.com', 62, '234-56-7890', 'ST234567'),
(63, 'Brian Nelson', 40, '6060 Oak St', 'TX', 'Abilene', 'Taylor', '79601', '555-345-6789', 'brian.nelson@example.com', 63, '345-67-8901', 'TU345678'),
(64, 'Cynthia Barnes', 50, '6161 Pine St', 'FL', 'Palm Bay', 'Brevard', '32905', '555-456-7890', 'cynthia.barnes@example.com', 64, '456-78-9012', 'UV456789'),
(65, 'Timothy Coleman', 45, '6262 Walnut St', 'CA', 'Santa Clarita', 'Los Angeles', '91350', '555-567-8901', 'timothy.coleman@example.com', 65, '567-89-0123', 'VW567890'),
(66, 'Heather Howard', 33, '6363 Cedar St', 'TX', 'Denton', 'Denton', '76201', '555-678-9012', 'heather.howard@example.com', 66, '678-90-1234', 'WX678901'),
(67, 'George Long', 38, '6464 Elm St', 'OH', 'Youngstown', 'Mahoning', '44501', '555-789-0123', 'george.long@example.com', 67, '789-01-2345', 'XY789012'),
(68, 'Tiffany Gonzales', 42, '6565 Oak St', 'FL', 'Cape Coral', 'Lee', '33904', '555-890-1234', 'tiffany.gonzales@example.com', 68, '890-12-3456', 'YZ890123'),
(69, 'Brandon Ward', 29, '6666 Pine St', 'CA', 'Visalia', 'Tulare', '93277', '555-901-2345', 'brandon.ward@example.com', 69, '901-23-4567', 'ZA901234'),
(70, 'Megan Hamilton', 48, '6767 Walnut St', 'TX', 'Midland', 'Midland', '79701', '555-012-3456', 'megan.hamilton@example.com', 70, '012-34-5678', 'AB012345'),
(71, 'Edward Mitchell', 55, '6868 Cedar St', 'IL', 'Bloomington', 'McLean', '61701', '555-123-4567', 'edward.mitchell@example.com', 71, '123-45-6789', 'BC123456'),
(72, 'Amanda Griffin', 31, '6969 Elm St', 'NY', 'Schenectady', 'Schenectady', '12301', '555-234-5678', 'amanda.griffin@example.com', 72, '234-56-7890', 'CD234567'),
(73, 'Matthew Howard', 37, '7070 Oak St', 'PA', 'Reading', 'Berks', '19601', '555-345-6789', 'matthew.howard@example.com', 73, '345-67-8901', 'DE345678'),
(74, 'Anna Marshall', 47, '7171 Pine St', 'FL', 'St. Petersburg', 'Pinellas', '33701', '555-456-7890', 'anna.marshall@example.com', 74, '456-78-9012', 'EF456789'),
(75, 'Keith Thompson', 36, '7272 Walnut St', 'CA', 'Vallejo', 'Solano', '94589', '555-567-8901', 'keith.thompson@example.com', 75, '567-89-0123', 'FG567890'),
(76, 'Lisa Flores', 44, '7373 Cedar St', 'TX', 'Tyler', 'Smith', '75701', '555-678-9012', 'lisa.flores@example.com', 76, '678-90-1234', 'GH678901'),
(77, 'Eric Ross', 30, '7474 Elm St', 'OH', 'Springfield', 'Clark', '45501', '555-789-0123', 'eric.ross@example.com', 77, '789-01-2345', 'HI789012'),
(78, 'Christina Morris', 39, '7575 Oak St', 'FL', 'Port St. Lucie', 'St. Lucie', '34952', '555-890-1234', 'christina.morris@example.com', 78, '890-12-3456', 'IJ890123'),
(79, 'Stephen Ward', 32, '7676 Pine St', 'CA', 'Simi Valley', 'Ventura', '93063', '555-901-2345', 'stephen.ward@example.com', 79, '901-23-4567', 'JK901234'),
(80, 'Catherine Nelson', 41, '7777 Walnut St', 'TX', 'Carrollton', 'Denton', '75006', '555-012-3456', 'catherine.nelson@example.com', 80, '012-34-5678', 'KL012345'),
(81, 'Brian Lopez', 35, '7878 Cedar St', 'IL', 'Cicero', 'Cook', '60804', '555-123-4567', 'brian.lopez@example.com', 81, '123-45-6789', 'LM123456'),
(82, 'Megan Cox', 28, '7979 Elm St', 'NY', 'Utica', 'Oneida', '13501', '555-234-5678', 'megan.cox@example.com', 82, '234-56-7890', 'MN234567'),
(83, 'Jeremy Young', 40, '8080 Oak St', 'TX', 'Richardson', 'Dallas', '75080', '555-345-6789', 'jeremy.young@example.com', 83, '345-67-8901', 'NO345678'),
(84, 'Holly Stewart', 50, '8181 Pine St', 'FL', 'Coral Springs', 'Broward', '33065', '555-456-7890', 'holly.stewart@example.com', 84, '456-78-9012', 'OP456789'),
(85, 'Brandon Scott', 45, '8282 Walnut St', 'CA', 'Concord', 'Contra Costa', '94520', '555-567-8901', 'brandon.scott@example.com', 85, '567-89-0123', 'PQ567890'),
(86, 'Rachel White', 33, '8383 Cedar St', 'TX', 'Galveston', 'Galveston', '77550', '555-678-9012', 'rachel.white@example.com', 86, '678-90-1234', 'QR678901'),
(87, 'Joshua Hill', 38, '8484 Elm St', 'OH', 'Lorain', 'Lorain', '44052', '555-789-0123', 'joshua.hill@example.com', 87, '789-01-2345', 'RS789012'),
(88, 'Laura Wright', 42, '8585 Oak St', 'FL', 'Lakeland', 'Polk', '33801', '555-890-1234', 'laura.wright@example.com', 88, '890-12-3456', 'ST890123'),
(89, 'James Davis', 29, '8686 Pine St', 'CA', 'Santa Rosa', 'Sonoma', '95401', '555-901-2345', 'james.davis@example.com', 89, '901-23-4567', 'TU901234'),
(90, 'Julie Gonzalez', 48, '8787 Walnut St', 'TX', 'Round Rock', 'Williamson', '78664', '555-012-3456', 'julie.gonzalez@example.com', 90, '012-34-5678', 'UV012345'),
(91, 'Andrew Russell', 55, '8888 Cedar St', 'IL', 'Bolingbrook', 'Will', '60440', '555-123-4567', 'andrew.russell@example.com', 91, '123-45-6789', 'VW123456'),
(92, 'Stephanie Cook', 31, '8989 Elm St', 'NY', 'White Plains', 'Westchester', '10601', '555-234-5678', 'stephanie.cook@example.com', 92, '234-56-7890', 'WX234567'),
(93, 'Michael Carter', 37, '9090 Oak St', 'PA', 'Bethlehem', 'Northampton', '18015', '555-345-6789', 'michael.carter@example.com', 93, '345-67-8901', 'XY345678'),
(94, 'Angela Peterson', 47, '9191 Pine St', 'FL', 'Coral Gables', 'Miami-Dade', '33134', '555-456-7890', 'angela.peterson@example.com', 94, '456-78-9012', 'YZ456789'),
(95, 'Brian Hill', 36, '9292 Walnut St', 'CA', 'Costa Mesa', 'Orange', '92626', '555-567-8901', 'brian.hill@example.com', 95, '567-89-0123', 'ZA567890'),
(96, 'Nicole Reed', 44, '9393 Cedar St', 'TX', 'Sugar Land', 'Fort Bend', '77478', '555-678-9012', 'nicole.reed@example.com', 96, '678-90-1234', 'AB678901'),
(97, 'Christopher Evans', 30, '9494 Elm St', 'OH', 'Hamilton', 'Butler', '45011', '555-789-0123', 'christopher.evans@example.com', 97, '789-01-2345', 'BC789012'),
(98, 'Kimberly Gonzalez', 39, '9595 Oak St', 'FL', 'Deltona', 'Volusia', '32725', '555-890-1234', 'kimberly.gonzalez@example.com', 98, '890-12-3456', 'CD890123'),
(99, 'Charles Sanchez', 32, '9696 Pine St', 'CA', 'Inglewood', 'Los Angeles', '90301', '555-901-2345', 'charles.sanchez@example.com', 99, '901-23-4567', 'DE901234'),
(100, 'Christine Bell', 41, '9797 Walnut St', 'TX', 'Odessa', 'Ector', '79761', '555-012-3456', 'christine.bell@example.com', 100, '012-34-5678', 'EF012345'),
(101, 'David Cox', 35, '9898 Cedar St', 'IL', 'Waukegan', 'Lake', '60085', '555-123-4567', 'david.cox@example.com', 101, '123-45-6789', 'FG123456'),
(102, 'Jennifer Cooper', 28, '9999 Elm St', 'NY', 'New Rochelle', 'Westchester', '10801', '555-234-5678', 'jennifer.cooper@example.com', 102, '234-56-7890', 'GH234567'),
(103, 'Matthew Rivera', 40, '10101 Oak St', 'TX', 'Pearland', 'Brazoria', '77581', '555-345-6789', 'matthew.rivera@example.com', 103, '345-67-8901', 'HI345678'),
(104, 'Ashley Hayes', 50, '10202 Pine St', 'FL', 'Boynton Beach', 'Palm Beach', '33426', '555-456-7890', 'ashley.hayes@example.com', 104, '456-78-9012', 'IJ456789'),
(105, 'Justin Henderson', 45, '10303 Walnut St', 'CA', 'Norwalk', 'Los Angeles', '90650', '555-567-8901', 'justin.henderson@example.com', 105, '567-89-0123', 'JK567890'),
(106, 'Rachel Cox', 33, '10404 Cedar St', 'TX', 'Baytown', 'Harris', '77520', '555-678-9012', 'rachel.cox@example.com', 106, '678-90-1234', 'KL678901'),
(107, 'Brian Rivera', 38, '10505 Elm St', 'OH', 'Kettering', 'Montgomery', '45409', '555-789-0123', 'brian.rivera@example.com', 107, '789-01-2345', 'MN789012'),
(108, 'Brittany Bennett', 42, '10606 Oak St', 'FL', 'Deerfield Beach', 'Broward', '33441', '555-890-1234', 'brittany.bennett@example.com', 108, '890-12-3456', 'OP890123'),
(109, 'Andrew Peterson', 29, '10707 Pine St', 'CA', 'Carson', 'Los Angeles', '90745', '555-901-2345', 'andrew.peterson@example.com', 109, '901-23-4567', 'PQ901234'),
(110, 'Alyssa Murphy', 48, '10808 Walnut St', 'TX', 'League City', 'Galveston', '77573', '555-012-3456', 'alyssa.murphy@example.com', 110, '012-34-5678', 'QR012345'),
(111, 'Scott Bell', 55, '10909 Cedar St', 'IL', 'Bloomington', 'McLean', '61704', '555-123-4567', 'scott.bell@example.com', 111, '123-45-6789', 'RS123456'),
(112, 'Megan Parker', 31, '11010 Elm St', 'NY', 'Mount Vernon', 'Westchester', '10550', '555-234-5678', 'megan.parker@example.com', 112, '234-56-7890', 'ST234567'),
(113, 'Kevin Barnes', 37, '11111 Oak St', 'PA', 'Lower Merion', 'Montgomery', '19096', '555-345-6789', 'kevin.barnes@example.com', 113, '345-67-8901', 'TU345678'),
(114, 'Kelly Lewis', 47, '11212 Pine St', 'FL', 'Sunrise', 'Broward', '33323', '555-456-7890', 'kelly.lewis@example.com', 114, '456-78-9012', 'UV456789'),
(115, 'Samantha Diaz', 36, '11313 Walnut St', 'CA', 'Santa Monica', 'Los Angeles', '90401', '555-567-8901', 'samantha.diaz@example.com', 115, '567-89-0123', 'VW567890'),
(116, 'Daniel Howard', 44, '11414 Cedar St', 'TX', 'Mansfield', 'Tarrant', '76063', '555-678-9012', 'daniel.howard@example.com', 116, '678-90-1234', 'WX678901'),
(117, 'Heather Flores', 30, '11515 Elm St', 'OH', 'Cuyahoga Falls', 'Summit', '44221', '555-789-0123', 'heather.flores@example.com', 117, '789-01-2345', 'XY789012'),
(118, 'Matthew Garcia', 39, '11616 Oak St', 'FL', 'Plantation', 'Broward', '33324', '555-890-1234', 'matthew.garcia@example.com', 118, '890-12-3456', 'YZ890123'),
(119, 'Brianna Lee', 32, '11717 Pine St', 'CA', 'Redding', 'Shasta', '96001', '555-901-2345', 'brianna.lee@example.com', 119, '901-23-4567', 'ZA901234'),
(120, 'Jeffrey Wood', 41, '11818 Walnut St', 'TX', 'San Angelo', 'Tom Green', '76901', '555-012-3456', 'jeffrey.wood@example.com', 120, '012-34-5678', 'AB012345'),
(121, 'Nicole Ward', 35, '11919 Cedar St', 'IL', 'Skokie', 'Cook', '60076', '555-123-4567', 'nicole.ward@example.com', 121, '123-45-6789', 'BC123456'),
(122, 'Anthony Simmons', 28, '12020 Elm St', 'NY', 'New York', 'New York', '10001', '555-234-5678', 'anthony.simmons@example.com', 122, '234-56-7890', 'CD234567'),
(123, 'Amy Lopez', 40, '12121 Oak St', 'TX', 'College Station', 'Brazos', '77840', '555-345-6789', 'amy.lopez@example.com', 123, '345-67-8901', 'DE345678'),
(124, 'Stephen Ramirez', 50, '12222 Pine St', 'FL', 'West Palm Beach', 'Palm Beach', '33401', '555-456-7890', 'stephen.ramirez@example.com', 124, '456-78-9012', 'EF456789'),
(125, 'Karen Turner', 45, '12323 Walnut St', 'CA', 'San Buenaventura (Ventura)', 'Ventura', '93001', '555-567-8901', 'karen.turner@example.com', 125, '567-89-0123', 'FG567890'),
(126, 'Nicholas Stewart', 33, '12424 Cedar St', 'TX', 'Temple', 'Bell', '76501', '555-678-9012', 'nicholas.stewart@example.com', 126, '678-90-1234', 'GH678901'),
(127, 'Rachel Hernandez', 38, '12525 Elm St', 'OH', 'Lima', 'Allen', '45801', '555-789-0123', 'rachel.hernandez@example.com', 127, '789-01-2345', 'HI789012'),
(128, 'Gregory Powell', 42, '12626 Oak St', 'FL', 'Largo', 'Pinellas', '33770', '555-890-1234', 'gregory.powell@example.com', 128, '890-12-3456', 'IJ890123'),
(129, 'Alexis Ramirez', 29, '12727 Pine St', 'CA', 'Santa Maria', 'Santa Barbara', '93454', '555-901-2345', 'alexis.ramirez@example.com', 129, '901-23-4567', 'JK901234'),
(130, 'Rachel Hamilton', 48, '12828 Walnut St', 'TX', 'Harlingen', 'Cameron', '78550', '555-012-3456', 'rachel.hamilton@example.com', 130, '012-34-5678', 'KL012345'),
(131, 'Diana Flores', 55, '12929 Cedar St', 'IL', 'Skokie', 'Cook', '60077', '555-123-4567', 'diana.flores@example.com', 131, '123-45-6789', 'LM123456'),
(132, 'Travis Simmons', 31, '13030 Elm St', 'NY', 'Mount Vernon', 'Westchester', '10552', '555-234-5678', 'travis.simmons@example.com', 132, '234-56-7890', 'MN234567'),
(133, 'Lauren Nelson', 37, '13131 Oak St', 'PA', 'Upper Darby', 'Delaware', '19082', '555-345-6789', 'lauren.nelson@example.com', 133, '345-67-8901', 'NO345678'),
(134, 'James Bennett', 47, '13232 Pine St', 'FL', 'Lauderhill', 'Broward', '33313', '555-456-7890', 'james.bennett@example.com', 134, '456-78-9012', 'OP456789'),
(135, 'Laura Gonzalez', 36, '13333 Walnut St', 'CA', 'Burbank', 'Los Angeles', '91501', '555-567-8901', 'laura.gonzalez@example.com', 135, '567-89-0123', 'PQ567890'),
(136, 'Matthew Evans', 44, '13434 Cedar St', 'TX', 'Missouri City', 'Fort Bend', '77459', '555-678-9012', 'matthew.evans@example.com', 136, '678-90-1234', 'QR678901'),
(137, 'Jennifer Turner', 30, '13535 Elm St', 'OH', 'Canton', 'Stark', '44702', '555-789-0123', 'jennifer.turner@example.com', 137, '789-01-2345', 'RS789012'),
(138, 'Anthony Martinez', 39, '13636 Oak St', 'FL', 'Kendall', 'Miami-Dade', '33176', '555-890-1234', 'anthony.martinez@example.com', 138, '890-12-3456', 'ST890123'),
(139, 'Emily Nelson', 32, '13737 Pine St', 'CA', 'Santa Cruz', 'Santa Cruz', '95060', '555-901-2345', 'emily.nelson@example.com', 139, '901-23-4567', 'TU901234'),
(140, 'Jeffrey Hernandez', 41, '13838 Walnut St', 'TX', 'Victoria', 'Victoria', '77901', '555-012-3456', 'jeffrey.hernandez@example.com', 140, '012-34-5678', 'UV012345'),
(141, 'Emily Davis', 35, '13939 Cedar St', 'IL', 'Wheaton', 'DuPage', '60187', '555-123-4567', 'emily.davis@example.com', 141, '123-45-6789', 'VW123456'),
(142, 'Michael Lee', 28, '14040 Elm St', 'NY', 'Hempstead', 'Nassau', '11550', '555-234-5678', 'michael.lee@example.com', 142, '234-56-7890', 'WX234567'),
(143, 'Emily Parker', 40, '14141 Oak St', 'TX', 'Galveston', 'Galveston', '77551', '555-345-6789', 'emily.parker@example.com', 143, '345-67-8901', 'XY345678'),
(144, 'John Butler', 50, '14242 Pine St', 'FL', 'Port St. Lucie', 'St. Lucie', '34953', '555-456-7890', 'john.butler@example.com', 144, '456-78-9012', 'YZ456789'),
(145, 'Stephanie Carter', 45, '14343 Walnut St', 'CA', 'San Buenaventura (Ventura)', 'Ventura', '93003', '555-567-8901', 'stephanie.carter@example.com', 145, '567-89-0123', 'ZA567890'),
(146, 'Michael Rivera', 33, '14444 Cedar St', 'TX', 'North Richland Hills', 'Tarrant', '76180', '555-678-9012', 'michael.rivera@example.com', 146, '678-90-1234', 'AB678901'),
(147, 'Catherine Roberts', 38, '14545 Elm St', 'OH', 'Elyria', 'Lorain', '44035', '555-789-0123', 'catherine.roberts@example.com', 147, '789-01-2345', 'BC789012'),
(148, 'Kyle Perry', 42, '14646 Oak St', 'FL', 'Daytona Beach', 'Volusia', '32114', '555-890-1234', 'kyle.perry@example.com', 148, '890-12-3456', 'CD890123'),
(149, 'Stephanie Stewart', 29, '14747 Pine St', 'CA', 'El Cajon', 'San Diego', '92020', '555-901-2345', 'stephanie.stewart@example.com', 149, '901-23-4567', 'DE901234'),
(150, 'Scott Turner', 48, '14848 Walnut St', 'TX', 'Baytown', 'Harris', '77521', '555-012-3456', 'scott.turner@example.com', 150, '012-34-5678', 'EF012345'),
(151, 'Jessica Scott', 55, '14949 Cedar St', 'IL', 'Tinley Park', 'Cook', '60477', '555-123-4567', 'jessica.scott@example.com', 151, '123-45-6789', 'FG123456'),
(152, 'Kenneth Thomas', 31, '15050 Elm St', 'NY', 'Binghamton', 'Broome', '13901', '555-234-5678', 'kenneth.thomas@example.com', 152, '234-56-7890', 'GH234567'),
(153, 'Amanda Hill', 37, '15151 Oak St', 'PA', 'Upper Providence', 'Montgomery', '19403', '555-345-6789', 'amanda.hill@example.com', 153, '345-67-8901', 'HI345678'),
(154, 'Sarah Reed', 47, '15252 Pine St', 'FL', 'Tamarac', 'Broward', '33321', '555-456-7890', 'sarah.reed@example.com', 154, '456-78-9012', 'IJ456789'),
(155, 'John Edwards', 36, '15353 Walnut St', 'CA', 'Daly City', 'San Mateo', '94015', '555-567-8901', 'john.edwards@example.com', 155, '567-89-0123', 'JK567890'),
(156, 'Stephanie Parker', 44, '15454 Cedar St', 'TX', 'Edinburg', 'Hidalgo', '78539', '555-678-9012', 'stephanie.parker@example.com', 156, '678-90-1234', 'KL678901'),
(157, 'David Howard', 30, '15555 Elm St', 'OH', 'Parma', 'Cuyahoga', '44129', '555-789-0123', 'david.howard@example.com', 157, '789-01-2345', 'MN789012'),
(158, 'Heather Rogers', 39, '15656 Oak St', 'FL', 'Plantation', 'Broward', '33317', '555-890-1234', 'heather.rogers@example.com', 158, '890-12-3456', 'OP890123'),
(159, 'Brian Lewis', 32, '15757 Pine St', 'CA', 'El Monte', 'Los Angeles', '91731', '555-901-2345', 'brian.lewis@example.com', 159, '901-23-4567', 'PQ901234'),
(160, 'Jessica Smith', 41, '15858 Walnut St', 'TX', 'Huntsville', 'Walker', '77320', '555-012-3456', 'jessica.smith@example.com', 160, '012-34-5678', 'QR012345'),
(161, 'Steven Powell', 35, '15959 Cedar St', 'IL', 'Skokie', 'Cook', '60077', '555-123-4567', 'steven.powell@example.com', 161, '123-45-6789', 'RS123456'),
(162, 'Katherine Powell', 28, '16060 Elm St', 'NY', 'Mount Vernon', 'Westchester', '10553', '555-234-5678', 'katherine.powell@example.com', 162, '234-56-7890', 'ST234567'),
(163, 'Jonathan Martinez', 40, '16161 Oak St', 'TX', 'Brownsville', 'Cameron', '78520', '555-345-6789', 'jonathan.martinez@example.com', 163, '345-67-8901', 'TU345678'),
(164, 'Jennifer Hernandez', 50, '16262 Pine St', 'FL', 'North Miami', 'Miami-Dade', '33161', '555-456-7890', 'jennifer.hernandez@example.com', 164, '456-78-9012', 'UV456789'),
(165, 'Jason Diaz', 45, '16363 Walnut St', 'CA', 'Pomona', 'Los Angeles', '91768', '555-567-8901', 'jason.diaz@example.com', 165, '567-89-0123', 'VW567890'),
(166, 'Laura Powell', 33, '16464 Cedar St', 'TX', 'The Colony', 'Denton', '75056', '555-678-9012', 'laura.powell@example.com', 166, '678-90-1234', 'WX678901'),
(167, 'William Green', 38, '16565 Elm St', 'OH', 'Lorain', 'Lorain', '44053', '555-789-0123', 'william.green@example.com', 167, '789-01-2345', 'XY789012'),
(168, 'Jennifer Smith', 42, '16666 Oak St', 'FL', 'Tallahassee', 'Leon', '32303', '555-890-1234', 'jennifer.smith@example.com', 168, '890-12-3456', 'YZ890123'),
(169, 'Daniel Davis', 29, '16767 Pine St', 'CA', 'Vacaville', 'Solano', '95687', '555-901-2345', 'daniel.davis@example.com', 169, '901-23-4567', 'ZA901234'),
(170, 'Jessica Morris', 48, '16868 Walnut St', 'TX', 'Plano', 'Collin', '75023', '555-012-3456', 'jessica.morris@example.com', 170, '012-34-5678', 'AB012345'),
(171, 'Eric White', 55, '16969 Cedar St', 'IL', 'Elgin', 'Kane', '60120', '555-123-4567', 'eric.white@example.com', 171, '123-45-6789', 'BC123456'),
(172, 'Nicole Nelson', 31, '17070 Elm St', 'NY', 'Buffalo', 'Erie', '14215', '555-234-5678', 'nicole.nelson@example.com', 172, '234-56-7890', 'CD234567'),
(173, 'Andrew Campbell', 37, '17171 Oak St', 'PA', 'Norristown', 'Montgomery', '19401', '555-345-6789', 'andrew.campbell@example.com', 173, '345-67-8901', 'DE345678'),
(174, 'Sarah Hall', 47, '17272 Pine St', 'FL', 'Fort Myers', 'Lee', '33901', '555-456-7890', 'sarah.hall@example.com', 174, '456-78-9012', 'EF456789'),
(175, 'Joshua Johnson', 36, '17373 Walnut St', 'CA', 'Fremont', 'Alameda', '94536', '555-567-8901', 'joshua.johnson@example.com', 175, '567-89-0123', 'FG567890'),
(176, 'Michelle Powell', 44, '17474 Cedar St', 'TX', 'Wichita Falls', 'Wichita', '76301', '555-678-9012', 'michelle.powell@example.com', 176, '678-90-1234', 'GH678901'),
(177, 'Jeffrey Sanders', 30, '17575 Elm St', 'OH', 'Newark', 'Licking', '43055', '555-789-0123', 'jeffrey.sanders@example.com', 177, '789-01-2345', 'HI789012'),
(178, 'Ashley Wright', 39, '17676 Oak St', 'FL', 'Sunrise', 'Broward', '33322', '555-890-1234', 'ashley.wright@example.com', 178, '890-12-3456', 'IJ890123'),
(179, 'Tyler Harris', 32, '17777 Pine St', 'CA', 'Merced', 'Merced', '95340', '555-901-2345', 'tyler.harris@example.com', 179, '901-23-4567', 'JK901234'),
(180, 'Katherine Garcia', 41, '17878 Walnut St', 'TX', 'Lubbock', 'Lubbock', '79401', '555-012-3456', 'katherine.garcia@example.com', 180, '012-34-5678', 'KL012345'),
(181, 'Brandon Lopez', 35, '17979 Cedar St', 'IL', 'Mount Prospect', 'Cook', '60056', '555-123-4567', 'brandon.lopez@example.com', 181, '123-45-6789', 'LM123456'),
(182, 'Stephanie Ross', 28, '18080 Elm St', 'NY', 'Tonawanda', 'Erie', '14150', '555-234-5678', 'stephanie.ross@example.com', 182, '234-56-7890', 'MN234567'),
(183, 'Nicholas King', 40, '18181 Oak St', 'TX', 'Euless', 'Tarrant', '76039', '555-345-6789', 'nicholas.king@example.com', 183, '345-67-8901', 'NO345678'),
(184, 'Jessica Howard', 50, '18282 Pine St', 'FL', 'Cape Coral', 'Lee', '33904', '555-456-7890', 'jessica.howard@example.com', 184, '456-78-9012', 'OP456789'),
(185, 'Joshua Lopez', 36, '18383 Walnut St', 'CA', 'Livermore', 'Alameda', '94550', '555-567-8901', 'joshua.lopez@example.com', 185, '567-89-0123', 'PQ567890'),
(186, 'Laura Carter', 44, '18484 Cedar St', 'TX', 'Burleson', 'Johnson', '76028', '555-678-9012', 'laura.carter@example.com', 186, '678-90-1234', 'QR678901'),
(187, 'Brandon Rogers', 31, '18585 Elm St', 'OH', 'Canton', 'Stark', '44708', '555-789-0123', 'brandon.rogers@example.com', 187, '789-01-2345', 'RS789012'),
(188, 'Danielle Powell', 38, '18686 Oak St', 'FL', 'Doral', 'Miami-Dade', '33172', '555-890-1234', 'danielle.powell@example.com', 188, '890-12-3456', 'ST890123'),
(189, 'Jonathan Nelson', 42, '18787 Pine St', 'CA', 'Chico', 'Butte', '95926', '555-901-2345', 'jonathan.nelson@example.com', 189, '901-23-4567', 'TU901234'),
(190, 'Jennifer Martinez', 29, '18888 Walnut St', 'TX', 'Tyler', 'Smith', '75701', '555-012-3456', 'jennifer.martinez@example.com', 190, '012-34-5678', 'UV012345'),
(191, 'Matthew Mitchell', 48, '18989 Cedar St', 'IL', 'Schaumburg', 'Cook', '60193', '555-123-4567', 'matthew.mitchell@example.com', 191, '123-45-6789', 'VW123456'),
(192, 'Brittany Lewis', 55, '19090 Elm St', 'NY', 'New York', 'New York', '10002', '555-234-5678', 'brittany.lewis@example.com', 192, '234-56-7890', 'WX234567'),
(193, 'Justin Rodriguez', 31, '19191 Oak St', 'PA', 'Norristown', 'Montgomery', '19403', '555-345-6789', 'justin.rodriguez@example.com', 193, '345-67-8901', 'XY345678'),
(194, 'Emily Williams', 37, '19292 Pine St', 'FL', 'Fort Lauderdale', 'Broward', '33304', '555-456-7890', 'emily.williams@example.com', 194, '456-78-9012', 'YZ456789'),
(195, 'Christopher Lopez', 32, '19393 Walnut St', 'CA', 'Inglewood', 'Los Angeles', '90301', '555-567-8901', 'christopher.lopez@example.com', 195, '567-89-0123', 'ZA567890'),
(196, 'Elizabeth Diaz', 41, '19494 Cedar St', 'TX', 'Grapevine', 'Tarrant', '76051', '555-678-9012', 'elizabeth.diaz@example.com', 196, '678-90-1234', 'AB678901'),
(197, 'Brandon Hall', 35, '19595 Elm St', 'OH', 'Dayton', 'Montgomery', '45402', '555-789-0123', 'brandon.hall@example.com', 197, '789-01-2345', 'BC789012'),
(198, 'Brittany Martinez', 28, '19696 Oak St', 'NY', 'Hempstead', 'Nassau', '11550', '555-890-1234', 'brittany.martinez@example.com', 198, '890-12-3456', 'CD890123'),
(199, 'Benjamin Young', 40, '19797 Pine St', 'CA', 'Lake Forest', 'Orange', '92630', '555-901-2345', 'benjamin.young@example.com', 199, '901-23-4567', 'DE901234'),
(200, 'Stephanie Ramirez', 50, '19898 Walnut St', 'TX', 'San Antonio', 'Bexar', '78207', '555-012-3456', 'stephanie.ramirez@example.com', 200, '012-34-5678', 'EF012345');
INSERT INTO Customer (Cust_ID, Cust_Name, Cust_Age, Cust_Address, Cust_State, Cust_City, Cust_County, Cust_Zip_Code, Cust_Phone_No, Cust_Email_Id, Cust_State_ID, Cust_SSN_No, Cust_Passport_No) VALUES
(201, 'Andrew Scott', 36, '19999 Cedar St', 'FL', 'West Palm Beach', 'Palm Beach', '33401', '555-123-4567', 'andrew.scott@example.com', 201, '123-45-6789', 'FG123456'),
(202, 'Samantha Wright', 29, '20000 Elm St', 'TX', 'Pasadena', 'Harris', '77506', '555-234-5678', 'samantha.wright@example.com', 202, '234-56-7890', 'GH234567'),
(203, 'Matthew Gonzalez', 42, '20101 Oak St', 'NY', 'Hicksville', 'Nassau', '11801', '555-345-6789', 'matthew.gonzalez@example.com', 203, '345-67-8901', 'HI345678'),
(204, 'Ashley Perez', 38, '20202 Pine St', 'CA', 'Simi Valley', 'Ventura', '93063', '555-456-7890', 'ashley.perez@example.com', 204, '456-78-9012', 'IJ456789'),
(205, 'Justin King', 33, '20303 Walnut St', 'TX', 'Richardson', 'Dallas', '75080', '555-567-8901', 'justin.king@example.com', 205, '567-89-0123', 'JK567890'),
(206, 'Jessica Mitchell', 47, '20404 Cedar St', 'OH', 'Lima', 'Allen', '45801', '555-678-9012', 'jessica.mitchell@example.com', 206, '678-90-1234', 'KL678901'),
(207, 'Nicholas Lee', 31, '20505 Elm St', 'FL', 'Ocala', 'Marion', '34471', '555-789-0123', 'nicholas.lee@example.com', 207, '789-01-2345', 'LM789012'),
(208, 'Lauren Lewis', 44, '20606 Oak St', 'CA', 'Chino Hills', 'San Bernardino', '91709', '555-890-1234', 'lauren.lewis@example.com', 208, '890-12-3456', 'MN890123'),
(209, 'Ryan Rodriguez', 29, '20707 Pine St', 'TX', 'Galveston', 'Galveston', '77550', '555-901-2345', 'ryan.rodriguez@example.com', 209, '901-23-4567', 'NO901234'),
(210, 'Kayla Hernandez', 42, '20808 Walnut St', 'NY', 'Mount Vernon', 'Westchester', '10550', '555-012-3456', 'kayla.hernandez@example.com', 210, '012-34-5678', 'OP012345'),
(211, 'Kyle Turner', 35, '20909 Cedar St', 'CA', 'Redwood City', 'San Mateo', '94061', '555-123-4567', 'kyle.turner@example.com', 211, '123-45-6789', 'PQ123456'),
(212, 'Emily Moore', 50, '21010 Elm St', 'TX', 'Sugar Land', 'Fort Bend', '77478', '555-234-5678', 'emily.moore@example.com', 212, '234-56-7890', 'QR234567'),
(213, 'Daniel Taylor', 37, '21111 Oak St', 'OH', 'Hamilton', 'Butler', '45011', '555-345-6789', 'daniel.taylor@example.com', 213, '345-67-8901', 'RS345678'),
(214, 'Brittany Turner', 43, '21212 Pine St', 'FL', 'Port St. Lucie', 'St. Lucie', '34952', '555-456-7890', 'brittany.turner@example.com', 214, '456-78-9012', 'ST456789'),
(215, 'Joshua Hernandez', 36, '21313 Walnut St', 'CA', 'Palo Alto', 'Santa Clara', '94301', '555-567-8901', 'joshua.hernandez@example.com', 215, '567-89-0123', 'TU567890'),
(216, 'Maria Rodriguez', 48, '21414 Cedar St', 'TX', 'Pasadena', 'Harris', '77506', '555-678-9012', 'maria.rodriguez@example.com', 216, '678-90-1234', 'UV678901'),
(217, 'John Hernandez', 30, '21515 Elm St', 'NY', 'Freeport', 'Nassau', '11520', '555-789-0123', 'john.hernandez@example.com', 217, '789-01-2345', 'VW789012'),
(218, 'Jennifer Torres', 39, '21616 Oak St', 'CA', 'Fresno', 'Fresno', '93722', '555-890-1234', 'jennifer.torres@example.com', 218, '890-12-3456', 'WX890123'),
(219, 'Kevin Thompson', 32, '21717 Pine St', 'TX', 'Garland', 'Dallas', '75040', '555-901-2345', 'kevin.thompson@example.com', 219, '901-23-4567', 'XY901234'),
(220, 'Rachel Moore', 41, '21818 Walnut St', 'OH', 'Springfield', 'Clark', '45503', '555-012-3456', 'rachel.moore@example.com', 220, '012-34-5678', 'YZ012345'),
(221, 'Tyler Lee', 28, '21919 Cedar St', 'FL', 'Pembroke Pines', 'Broward', '33024', '555-123-4567', 'tyler.lee@example.com', 221, '123-45-6789', 'ZA123456'),
(222, 'Jessica Johnson', 41, '22020 Elm St', 'CA', 'San Mateo', 'San Mateo', '94401', '555-234-5678', 'jessica.johnson@example.com', 222, '234-56-7890', 'AB234567'),
(223, 'Michael Harris', 34, '22121 Oak St', 'TX', 'Grand Prairie', 'Dallas', '75050', '555-345-6789', 'michael.harris@example.com', 223, '345-67-8901', 'BC345678'),
(224, 'Amanda Thompson', 49, '22222 Pine St', 'NY', 'Hempstead', 'Nassau', '11550', '555-456-7890', 'amanda.thompson@example.com', 224, '456-78-9012', 'CD456789'),
(225, 'David Martin', 33, '22323 Walnut St', 'CA', 'Modesto', 'Stanislaus', '95350', '555-567-8901', 'david.martin@example.com', 225, '567-89-0123', 'DE567890'),
(226, 'Christina Garcia', 45, '22424 Cedar St', 'TX', 'Killeen', 'Bell', '76541', '555-678-9012', 'christina.garcia@example.com', 226, '678-90-1234', 'EF678901'),
(227, 'Jose Martinez', 31, '22525 Elm St', 'OH', 'Cincinnati', 'Hamilton', '45202', '555-789-0123', 'jose.martinez@example.com', 227, '789-01-2345', 'FG789012'),
(228, 'Emily Thompson', 47, '22626 Oak St', 'CA', 'Santa Barbara', 'Santa Barbara', '93101', '555-890-1234', 'emily.thompson@example.com', 228, '890-12-3456', 'GH890123'),
(229, 'Jason Lee', 34, '22727 Pine St', 'TX', 'Longview', 'Gregg', '75601', '555-901-2345', 'jason.lee@example.com', 229, '901-23-4567', 'HI901234'),
(230, 'Sarah Taylor', 42, '22828 Walnut St', 'NY', 'Yonkers', 'Westchester', '10701', '555-012-3456', 'sarah.taylor@example.com', 230, '012-34-5678', 'IJ012345'),
(231, 'Brandon Young', 29, '22929 Cedar St', 'FL', 'Deltona', 'Volusia', '32725', '555-123-4567', 'brandon.young@example.com', 231, '123-45-6789', 'JK123456'),
(232, 'Melissa Hernandez', 48, '23030 Elm St', 'CA', 'Santa Clarita', 'Los Angeles', '91350', '555-234-5678', 'melissa.hernandez@example.com', 232, '234-56-7890', 'KL234567'),
(233, 'Daniel White', 31, '23131 Oak St', 'TX', 'Mesquite', 'Dallas', '75150', '555-345-6789', 'daniel.white@example.com', 233, '345-67-8901', 'LM345678'),
(234, 'Alyssa Lopez', 39, '23232 Pine St', 'OH', 'Youngstown', 'Mahoning', '44503', '555-456-7890', 'alyssa.lopez@example.com', 234, '456-78-9012', 'MN456789'),
(235, 'Matthew Thomas', 30, '23333 Walnut St', 'CA', 'San Francisco', 'San Francisco', '94109', '555-567-8901', 'matthew.thomas@example.com', 235, '567-89-0123', 'NO567890'),
(236, 'Stephanie Perez', 50, '23434 Cedar St', 'TX', 'San Angelo', 'Tom Green', '76903', '555-678-9012', 'stephanie.perez@example.com', 236, '678-90-1234', 'OP678901'),
(237, 'Nathan Martinez', 33, '23535 Elm St', 'NY', 'Brentwood', 'Suffolk', '11717', '555-789-0123', 'nathan.martinez@example.com', 237, '789-01-2345', 'PQ789012'),
(238, 'Taylor Thomas', 44, '23636 Oak St', 'CA', 'Chula Vista', 'San Diego', '91910', '555-890-1234', 'taylor.thomas@example.com', 238, '890-12-3456', 'QR890123'),
(239, 'Jessica Wilson', 38, '23737 Pine St', 'TX', 'Denton', 'Denton', '76201', '555-901-2345', 'jessica.wilson@example.com', 239, '901-23-4567', 'RS901234'),
(240, 'Jacob Martinez', 43, '23838 Walnut St', 'OH', 'Elyria', 'Lorain', '44035', '555-012-3456', 'jacob.martinez@example.com', 240, '012-34-5678', 'ST012345'),
(241, 'Emily Rodriguez', 28, '23939 Cedar St', 'FL', 'Sunrise', 'Broward', '33323', '555-123-4567', 'emily.rodriguez@example.com', 241, '123-45-6789', 'TU123456'),
(242, 'Christopher Lewis', 43, '24040 Elm St', 'CA', 'San Francisco', 'San Francisco', '94112', '555-234-5678', 'christopher.lewis@example.com', 242, '234-56-7890', 'UV234567'),
(243, 'Sarah Johnson', 36, '24141 Oak St', 'TX', 'Wichita Falls', 'Wichita', '76301', '555-345-6789', 'sarah.johnson@example.com', 243, '345-67-8901', 'VW345678'),
(244, 'Michael Rodriguez', 49, '24242 Pine St', 'NY', 'White Plains', 'Westchester', '10601', '555-456-7890', 'michael.rodriguez@example.com', 244, '456-78-9012', 'WX456789'),
(245, 'Jessica Thompson', 34, '24343 Walnut St', 'CA', 'Glendale', 'Los Angeles', '91201', '555-567-8901', 'jessica.thompson@example.com', 245, '567-89-0123', 'XY567890'),
(246, 'David Hernandez', 48, '24444 Cedar St', 'TX', 'Waco', 'McLennan', '76706', '555-678-9012', 'david.hernandez@example.com', 246, '678-90-1234', 'YZ678901'),
(247, 'Jennifer Harris', 31, '24545 Elm St', 'OH', 'Lorain', 'Lorain', '44052', '555-789-0123', 'jennifer.harris@example.com', 247, '789-01-2345', 'ZA789012'),
(248, 'Daniel White', 47, '24646 Oak St', 'CA', 'Riverside', 'Riverside', '92501', '555-890-1234', 'daniel.white@example.com', 248, '890-12-3456', 'AB890123'),
(249, 'Lindsey Brown', 35, '24747 Pine St', 'TX', 'Amarillo', 'Potter', '79109', '555-901-2345', 'lindsey.brown@example.com', 249, '901-23-4567', 'BC901234'),
(250, 'Joseph Taylor', 42, '24848 Walnut St', 'NY', 'Schenectady', 'Schenectady', '12309', '555-012-3456', 'joseph.taylor@example.com', 250, '012-34-5678', 'CD012345'),
(251, 'Ashley Lee', 28, '24949 Cedar St', 'FL', 'Miami', 'Miami-Dade', '33125', '555-123-4567', 'ashley.lee@example.com', 251, '123-45-6789', 'DE123456'),
(252, 'Brandon Thompson', 44, '25050 Elm St', 'CA', 'Oakland', 'Alameda', '94601', '555-234-5678', 'brandon.thompson@example.com', 252, '234-56-7890', 'EF234567'),
(253, 'Rachel Martinez', 37, '25151 Oak St', 'TX', 'Carrollton', 'Denton', '75006', '555-345-6789', 'rachel.martinez@example.com', 253, '345-67-8901', 'FG345678'),
(254, 'Justin Brown', 45, '25252 Pine St', 'OH', 'Dayton', 'Montgomery', '45402', '555-456-7890', 'justin.brown@example.com', 254, '456-78-9012', 'GH456789'),
(255, 'Amanda Thompson', 31, '25353 Walnut St', 'CA', 'Pomona', 'Los Angeles', '91766', '555-567-8901', 'amanda.thompson@example.com', 255, '567-89-0123', 'HI567890'),
(256, 'Andrew Hernandez', 50, '25454 Cedar St', 'TX', 'McAllen', 'Hidalgo', '78501', '555-678-9012', 'andrew.hernandez@example.com', 256, '678-90-1234', 'IJ678901'),
(257, 'Lauren Gonzalez', 30, '25555 Elm St', 'NY', 'Troy', 'Rensselaer', '12180', '555-789-0123', 'lauren.gonzalez@example.com', 257, '789-01-2345', 'JK789012'),
(258, 'Joshua Perez', 45, '25656 Oak St', 'CA', 'Rancho Cucamonga', 'San Bernardino', '91730', '555-890-1234', 'joshua.perez@example.com', 258, '890-12-3456', 'KL890123'),
(259, 'Brittany Harris', 33, '25757 Pine St', 'TX', 'Temple', 'Bell', '76502', '555-901-2345', 'brittany.harris@example.com', 259, '901-23-4567', 'MN901234'),
(260, 'David Wilson', 47, '25858 Walnut St', 'OH', 'Hamilton', 'Butler', '45011', '555-012-3456', 'david.wilson@example.com', 260, '012-34-5678', 'OP012345'),
(261, 'Stephanie Garcia', 28, '25959 Cedar St', 'FL', 'Lakeland', 'Polk', '33801', '555-123-4567', 'stephanie.garcia@example.com', 261, '123-45-6789', 'PQ123456'),
(262, 'Michael Johnson', 43, '26060 Elm St', 'CA', 'Santa Rosa', 'Sonoma', '95401', '555-234-5678', 'michael.johnson@example.com', 262, '234-56-7890', 'QR234567'),
(263, 'Amanda Rodriguez', 35, '26161 Oak St', 'TX', 'Missouri City', 'Fort Bend', '77459', '555-345-6789', 'amanda.rodriguez@example.com', 263, '345-67-8901', 'RS345678'),
(264, 'Christopher Jackson', 46, '26262 Pine St', 'NY', 'Mount Vernon', 'Westchester', '10550', '555-456-7890', 'christopher.jackson@example.com', 264, '456-78-9012', 'ST456789'),
(265, 'Lauren Hernandez', 30, '26363 Walnut St', 'CA', 'El Monte', 'Los Angeles', '91731', '555-567-8901', 'lauren.hernandez@example.com', 265, '567-89-0123', 'TU567890'),
(266, 'David Moore', 49, '26464 Cedar St', 'TX', 'Richardson', 'Dallas', '75080', '555-678-9012', 'david.moore@example.com', 266, '678-90-1234', 'UV678901'),
(267, 'Jennifer White', 34, '26565 Elm St', 'OH', 'Hamilton', 'Butler', '45011', '555-789-0123', 'jennifer.white@example.com', 267, '789-01-2345', 'VW789012'),
(268, 'Ryan Johnson', 47, '26666 Oak St', 'CA', 'Santa Ana', 'Orange', '92701', '555-890-1234', 'ryan.johnson@example.com', 268, '890-12-3456', 'WX890123'),
(269, 'Emily Lee', 36, '26767 Pine St', 'TX', 'Pasadena', 'Harris', '77506', '555-901-2345', 'emily.lee@example.com', 269, '901-23-4567', 'XY901234'),
(270, 'Andrew Martinez', 41, '26868 Walnut St', 'NY', 'Buffalo', 'Erie', '14201', '555-012-3456', 'andrew.martinez@example.com', 270, '012-34-5678', 'YZ012345'),
(271, 'Jessica Thomas', 29, '26969 Cedar St', 'FL', 'Hialeah', 'Miami-Dade', '33012', '555-123-4567', 'jessica.thomas@example.com', 271, '123-45-6789', 'ZA123456'),
(272, 'Michael Clark', 45, '27070 Elm St', 'CA', 'Huntington Beach', 'Orange', '92646', '555-234-5678', 'michael.clark@example.com', 272, '234-56-7890', 'AB234567'),
(273, 'Sarah Davis', 31, '27171 Oak St', 'TX', 'Tyler', 'Smith', '75701', '555-345-6789', 'sarah.davis@example.com', 273, '345-67-8901', 'BC345678'),
(274, 'Matthew Hernandez', 47, '27272 Pine St', 'OH', 'Lorain', 'Lorain', '44052', '555-456-7890', 'matthew.hernandez@example.com', 274, '456-78-9012', 'CD456789'),
(275, 'Stephanie Thomas', 35, '27373 Walnut St', 'CA', 'Fremont', 'Alameda', '94536', '555-567-8901', 'stephanie.thomas@example.com', 275, '567-89-0123', 'DE567890'),
(276, 'Christopher Moore', 50, '27474 Cedar St', 'TX', 'Richardson', 'Dallas', '75080', '555-678-9012', 'christopher.moore@example.com', 276, '678-90-1234', 'EF678901'),
(277, 'Amanda Jackson', 30, '27575 Elm St', 'NY', 'Valley Stream', 'Nassau', '11580', '555-789-0123', 'amanda.jackson@example.com', 277, '789-01-2345', 'FG789012'),
(278, 'Michael Martinez', 45, '27676 Oak St', 'CA', 'Concord', 'Contra Costa', '94520', '555-890-1234', 'michael.martinez@example.com', 278, '890-12-3456', 'GH890123'),
(279, 'Lauren Clark', 32, '27777 Pine St', 'TX', 'Arlington', 'Tarrant', '76010', '555-901-2345', 'lauren.clark@example.com', 279, '901-23-4567', 'HI901234'),
(280, 'Joseph Rodriguez', 46, '27878 Walnut St', 'OH', 'Cleveland', 'Cuyahoga', '44102', '555-012-3456', 'joseph.rodriguez@example.com', 280, '012-34-5678', 'IJ012345'),
(281, 'Jessica White', 37, '27979 Cedar St', 'FL', 'Miramar', 'Broward', '33023', '555-123-4567', 'jessica.white@example.com', 281, '123-45-6789', 'JK123456'),
(282, 'Michael Rodriguez', 49, '28080 Elm St', 'CA', 'Escondido', 'San Diego', '92025', '555-234-5678', 'michael.rodriguez@example.com', 282, '234-56-7890', 'KL234567'),
(283, 'Jennifer Hernandez', 33, '28181 Oak St', 'TX', 'College Station', 'Brazos', '77840', '555-345-6789', 'jennifer.hernandez@example.com', 283, '345-67-8901', 'LM345678'),
(284, 'Matthew Rodriguez', 50, '28282 Pine St', 'NY', 'Utica', 'Oneida', '13501', '555-456-7890', 'matthew.rodriguez@example.com', 284, '456-78-9012', 'MN456789'),
(285, 'Jessica Thompson', 30, '28383 Walnut St', 'CA', 'Los Angeles', 'Los Angeles', '90011', '555-567-8901', 'jessica.thompson@example.com', 285, '567-89-0123', 'NO567890'),
(286, 'Michael Brown', 45, '28484 Cedar St', 'TX', 'Irving', 'Dallas', '75060', '555-678-9012', 'michael.brown@example.com', 286, '678-90-1234', 'OP678901'),
(287, 'Jennifer Taylor', 32, '28585 Elm St', 'OH', 'Youngstown', 'Mahoning', '44512', '555-789-0123', 'jennifer.taylor@example.com', 287, '789-01-2345', 'PQ789012'),
(288, 'David Thompson', 46, '28686 Oak St', 'CA', 'Costa Mesa', 'Orange', '92627', '555-890-1234', 'david.thompson@example.com', 288, '890-12-3456', 'QR890123'),
(289, 'Stephanie Clark', 34, '28787 Pine St', 'TX', 'Mission', 'Hidalgo', '78572', '555-901-2345', 'stephanie.clark@example.com', 289, '901-23-4567', 'RS901234'),
(290, 'Joseph Hernandez', 50, '28888 Walnut St', 'NY', 'Mount Vernon', 'Westchester', '10550', '555-012-3456', 'joseph.hernandez@example.com', 290, '012-34-5678', 'ST012345'),
(291, 'Emily Taylor', 31, '28989 Cedar St', 'FL', 'Davie', 'Broward', '33314', '555-123-4567', 'emily.taylor@example.com', 291, '123-45-6789', 'TU123456'),
(292, 'Ryan Hernandez', 47, '29090 Elm St', 'CA', 'Huntington Park', 'Los Angeles', '90255', '555-234-5678', 'ryan.hernandez@example.com', 292, '234-56-7890', 'UV234567'),
(293, 'Jessica Smith', 35, '29191 Oak St', 'TX', 'Richardson', 'Dallas', '75080', '555-345-6789', 'jessica.smith@example.com', 293, '345-67-8901', 'VW345678'),
(294, 'Michael Lee', 46, '29292 Pine St', 'OH', 'Mansfield', 'Richland', '44902', '555-456-7890', 'michael.lee@example.com', 294, '456-78-9012', 'WX456789'),
(295, 'Emily Hernandez', 32, '29393 Walnut St', 'CA', 'Santa Monica', 'Los Angeles', '90403', '555-567-8901', 'emily.hernandez@example.com', 295, '567-89-0123', 'XY567890'),
(296, 'Lauren Johnson', 50, '29494 Cedar St', 'TX', 'San Angelo', 'Tom Green', '76903', '555-678-9012', 'lauren.johnson@example.com', 296, '678-90-1234', 'YZ678901'),
(297, 'Joseph Brown', 31, '29595 Elm St', 'NY', 'Schenectady', 'Schenectady', '12309', '555-789-0123', 'joseph.brown@example.com', 297, '789-01-2345', 'ZA789012'),
(298, 'Stephanie Thompson', 47, '29696 Oak St', 'CA', 'Berkeley', 'Alameda', '94704', '555-890-1234', 'stephanie.thompson@example.com', 298, '890-12-3456', 'AB890123'),
(299, 'David Martinez', 34, '29797 Pine St', 'TX', 'Euless', 'Tarrant', '76039', '555-901-2345', 'david.martinez@example.com', 299, '901-23-4567', 'BC901234'),
(300, 'Jessica Martinez', 50, '29898 Walnut St', 'OH', 'Mansfield', 'Richland', '44902', '555-012-3456', 'jessica.martinez@example.com', 300, '012-34-5678', 'CD012345'),
(301, 'Michael Perez', 29, '29999 Cedar St', 'FL', 'Doral', 'Miami-Dade', '33122', '555-123-4567', 'michael.perez@example.com', 301, '123-45-6789', 'DE123456'),
(302, 'Jennifer Lewis', 46, '30000 Elm St', 'CA', 'Downey', 'Los Angeles', '90240', '555-234-5678', 'jennifer.lewis@example.com', 302, '234-56-7890', 'EF234567'),
(303, 'Daniel Rodriguez', 32, '30101 Oak St', 'TX', 'Victoria', 'Victoria', '77901', '555-345-6789', 'daniel.rodriguez@example.com', 303, '345-67-8901', 'FG345678'),
(304, 'Jessica Davis', 50, '30202 Pine St', 'NY', 'West Babylon', 'Suffolk', '11704', '555-456-7890', 'jessica.davis@example.com', 304, '456-78-9012', 'GH456789'),
(305, 'Michael Taylor', 31, '30303 Walnut St', 'CA', 'Hayward', 'Alameda', '94541', '555-567-8901', 'michael.taylor@example.com', 305, '567-89-0123', 'HI567890'),
(306, 'Lauren Brown', 47, '30404 Cedar St', 'TX', 'Mission', 'Hidalgo', '78572', '555-678-9012', 'lauren.brown@example.com', 306, '678-90-1234', 'IJ678901'),
(307, 'Joseph Moore', 33, '30505 Elm St', 'OH', 'Mansfield', 'Richland', '44907', '555-789-0123', 'joseph.moore@example.com', 307, '789-01-2345', 'JK789012'),
(308, 'Stephanie Hernandez', 50, '30606 Oak St', 'CA', 'Elk Grove', 'Sacramento', '95624', '555-890-1234', 'stephanie.hernandez@example.com', 308, '890-12-3456', 'KL890123'),
(309, 'Daniel Martinez', 32, '30707 Pine St', 'TX', 'San Antonio', 'Bexar', '78201', '555-901-2345', 'daniel.martinez@example.com', 309, '901-23-4567', 'MN901234'),
(310, 'Emily Johnson', 49, '30808 Walnut St', 'NY', 'Poughkeepsie', 'Dutchess', '12601', '555-012-3456', 'emily.johnson@example.com', 310, '012-34-5678', 'OP012345'),
(311, 'Michael Brown', 31, '30909 Cedar St', 'FL', 'Ocala', 'Marion', '34471', '555-123-4567', 'michael.brown@example.com', 311, '123-45-6789', 'PQ123456'),
(312, 'Jessica Johnson', 48, '31010 Elm St', 'CA', 'Livermore', 'Alameda', '94550', '555-234-5678', 'jessica.johnson@example.com', 312, '234-56-7890', 'QR234567'),
(313, 'David Clark', 33, '31111 Oak St', 'TX', 'Richardson', 'Dallas', '75080', '555-345-6789', 'david.clark@example.com', 313, '345-67-8901', 'RS345678'),
(314, 'Jennifer Garcia', 49, '31212 Pine St', 'OH', 'Canton', 'Stark', '44702', '555-456-7890', 'jennifer.garcia@example.com', 314, '456-78-9012', 'ST456789'),
(315, 'Stephanie Thomas', 31, '31313 Walnut St', 'CA', 'Glendale', 'Los Angeles', '91201', '555-567-8901', 'stephanie.thomas@example.com', 315, '567-89-0123', 'TU567890'),
(316, 'Joseph Hernandez', 48, '31414 Cedar St', 'TX', 'San Angelo', 'Tom Green', '76903', '555-678-9012', 'joseph.hernandez@example.com', 316, '678-90-1234', 'UV678901'),
(317, 'Emily Brown', 30, '31515 Elm St', 'NY', 'Binghamton', 'Broome', '13901', '555-789-0123', 'emily.brown@example.com', 317, '789-01-2345', 'VW789012'),
(318, 'Michael Johnson', 49, '31616 Oak St', 'CA', 'San Diego', 'San Diego', '92109', '555-890-1234', 'michael.johnson@example.com', 318, '890-12-3456', 'WX890123'),
(319, 'Jessica Hernandez', 31, '31717 Pine St', 'TX', 'Pasadena', 'Harris', '77506', '555-901-2345', 'jessica.hernandez@example.com', 319, '901-23-4567', 'XY901234'),
(320, 'Jennifer Brown', 49, '31818 Walnut St', 'OH', 'Cleveland', 'Cuyahoga', '44102', '555-012-3456', 'jennifer.brown@example.com', 320, '012-34-5678', 'YZ012345'),
(321, 'Stephanie Davis', 32, '31919 Cedar St', 'CA', 'San Bernardino', 'San Bernardino', '92404', '555-123-4567', 'stephanie.davis@example.com', 321, '123-45-6789', 'ZA123456'),
(322, 'Michael Miller', 48, '32020 Elm St', 'TX', 'Waco', 'McLennan', '76706', '555-234-5678', 'michael.miller@example.com', 322, '234-56-7890', 'AB234567'),
(323, 'Jennifer Perez', 30, '32121 Oak St', 'NY', 'New Rochelle', 'Westchester', '10801', '555-345-6789', 'jennifer.perez@example.com', 323, '345-67-8901', 'BC345678'),
(324, 'Jessica Taylor', 47, '32222 Pine St', 'CA', 'Fullerton', 'Orange', '92831', '555-456-7890', 'jessica.taylor@example.com', 324, '456-78-9012', 'CD456789'),
(325, 'David Rodriguez', 31, '32323 Walnut St', 'TX', 'Killeen', 'Bell', '76541', '555-567-8901', 'david.rodriguez@example.com', 325, '567-89-0123', 'DE567890'),
(326, 'Jennifer Moore', 50, '32424 Cedar St', 'OH', 'Hamilton', 'Butler', '45011', '555-678-9012', 'jennifer.moore@example.com', 326, '678-90-1234', 'EF678901'),
(327, 'Stephanie Taylor', 32, '32525 Elm St', 'CA', 'Lancaster', 'Los Angeles', '93535', '555-789-0123', 'stephanie.taylor@example.com', 327, '789-01-2345', 'FG789012'),
(328, 'Michael White', 48, '32626 Oak St', 'TX', 'Mesquite', 'Dallas', '75150', '555-890-1234', 'michael.white@example.com', 328, '890-12-3456', 'GH890123'),
(329, 'Jennifer Harris', 29, '32727 Pine St', 'NY', 'Schenectady', 'Schenectady', '12309', '555-901-2345', 'jennifer.harris@example.com', 329, '901-23-4567', 'HI901234'),
(330, 'Jessica Rodriguez', 49, '32828 Walnut St', 'CA', 'Pasadena', 'Los Angeles', '91101', '555-012-3456', 'jessica.rodriguez@example.com', 330, '012-34-5678', 'IJ012345'),
(331, 'Michael Davis', 31, '32929 Cedar St', 'TX', 'Lewisville', 'Denton', '75057', '555-123-4567', 'michael.davis@example.com', 331, '123-45-6789', 'JK123456'),
(332, 'Jennifer Taylor', 48, '33030 Elm St', 'OH', 'Toledo', 'Lucas', '43604', '555-234-5678', 'jennifer.taylor@example.com', 332, '234-56-7890', 'KL234567'),
(333, 'Jessica Thomas', 31, '33131 Oak St', 'CA', 'Santa Monica', 'Los Angeles', '90403', '555-345-6789', 'jessica.thomas@example.com', 333, '345-67-8901', 'LM345678'),
(334, 'Michael Hernandez', 48, '33232 Pine St', 'TX', 'Irving', 'Dallas', '75060', '555-456-7890', 'michael.hernandez@example.com', 334, '456-78-9012', 'MN456789'),
(335, 'Jennifer Clark', 30, '33333 Walnut St', 'NY', 'New York', 'New York', '10011', '555-567-8901', 'jennifer.clark@example.com', 335, '567-89-0123', 'NO567890'),
(336, 'Stephanie Martinez', 49, '33434 Cedar St', 'CA', 'Lancaster', 'Los Angeles', '93535', '555-678-9012', 'stephanie.martinez@example.com', 336, '678-90-1234', 'OP678901'),
(337, 'Michael Smith', 30, '33535 Elm St', 'TX', 'Beaumont', 'Jefferson', '77701', '555-789-0123', 'michael.smith@example.com', 337, '789-01-2345', 'PQ789012'),
(338, 'Jennifer Lewis', 47, '33636 Oak St', 'OH', 'Elyria', 'Lorain', '44035', '555-890-1234', 'jennifer.lewis@example.com', 338, '890-12-3456', 'QR890123'),
(339, 'Jessica Lee', 31, '33737 Pine St', 'CA', 'San Mateo', 'San Mateo', '94403', '555-901-2345', 'jessica.lee@example.com', 339, '901-23-4567', 'RS901234'),
(340, 'Michael Taylor', 49, '33838 Walnut St', 'TX', 'Denton', 'Denton', '76201', '555-012-3456', 'michael.taylor@example.com', 340, '012-34-5678', 'ST012345'),
(341, 'Jennifer Brown', 30, '33939 Cedar St', 'NY', 'White Plains', 'Westchester', '10601', '555-123-4567', 'jennifer.brown@example.com', 341, '123-45-6789', 'TU123456'),
(342, 'Jessica Garcia', 48, '34040 Elm St', 'CA', 'Torrance', 'Los Angeles', '90501', '555-234-5678', 'jessica.garcia@example.com', 342, '234-56-7890', 'UV234567'),
(343, 'Michael Johnson', 32, '34141 Oak St', 'TX', 'Richardson', 'Dallas', '75080', '555-345-6789', 'michael.johnson@example.com', 343, '345-67-8901', 'VW345678'),
(344, 'Jennifer Martinez', 49, '34242 Pine St', 'OH', 'Canton', 'Stark', '44702', '555-456-7890', 'jennifer.martinez@example.com', 344, '456-78-9012', 'WX456789'),
(345, 'Jessica Thomas', 30, '34343 Walnut St', 'CA', 'Salinas', 'Monterey', '93901', '555-567-8901', 'jessica.thomas@example.com', 345, '567-89-0123', 'XY567890'),
(346, 'Michael White', 48, '34444 Cedar St', 'TX', 'Edinburg', 'Hidalgo', '78539', '555-678-9012', 'michael.white@example.com', 346, '678-90-1234', 'YZ678901'),
(347, 'Jennifer Smith', 31, '34545 Elm St', 'NY', 'Hempstead', 'Nassau', '11550', '555-789-0123', 'jennifer.smith@example.com', 347, '789-01-2345', 'ZA789012'),
(348, 'Jessica Davis', 49, '34646 Oak St', 'CA', 'Los Angeles', 'Los Angeles', '90011', '555-890-1234', 'jessica.davis@example.com', 348, '890-12-3456', 'AB890123'),
(349, 'Michael Taylor', 32, '34747 Pine St', 'TX', 'Wichita Falls', 'Wichita', '76301', '555-901-2345', 'michael.taylor@example.com', 349, '901-23-4567', 'BC901234'),
(350, 'Jennifer Hernandez', 48, '34848 Walnut St', 'OH', 'Cleveland', 'Cuyahoga', '44102', '555-012-3456', 'jennifer.hernandez@example.com', 350, '012-34-5678', 'CD012345'),
(351, 'Jessica Perez', 30, '34949 Cedar St', 'CA', 'Costa Mesa', 'Orange', '92627', '555-123-4567', 'jessica.perez@example.com', 351, '123-45-6789', 'DE123456'),
(352, 'Michael Moore', 49, '35050 Elm St', 'TX', 'Pasadena', 'Harris', '77506', '555-234-5678', 'michael.moore@example.com', 352, '234-56-7890', 'EF234567'),
(353, 'Jennifer Johnson', 31, '35151 Oak St', 'NY', 'Buffalo', 'Erie', '14201', '555-345-6789', 'jennifer.johnson@example.com', 353, '345-67-8901', 'FG345678'),
(354, 'Jessica Brown', 49, '35252 Pine St', 'CA', 'San Mateo', 'San Mateo', '94403', '555-456-7890', 'jessica.brown@example.com', 354, '456-78-9012', 'GH456789'),
(355, 'Michael Hernandez', 32, '35353 Walnut St', 'TX', 'McAllen', 'Hidalgo', '78501', '555-567-8901', 'michael.hernandez@example.com', 355, '567-89-0123', 'HI567890'),
(356, 'Jennifer White', 48, '35454 Cedar St', 'OH', 'Mansfield', 'Richland', '44902', '555-678-9012', 'jennifer.white@example.com', 356, '678-90-1234', 'IJ678901'),
(357, 'Jessica Taylor', 30, '35555 Elm St', 'CA', 'Oxnard', 'Ventura', '93030', '555-789-0123', 'jessica.taylor@example.com', 357, '789-01-2345', 'JK789012'),
(358, 'Michael Martinez', 49, '35656 Oak St', 'TX', 'League City', 'Galveston', '77573', '555-890-1234', 'michael.martinez@example.com', 358, '890-12-3456', 'KL890123'),
(359, 'Jennifer Clark', 31, '35757 Pine St', 'NY', 'Jamestown', 'Chautauqua', '14701', '555-901-2345', 'jennifer.clark@example.com', 359, '901-23-4567', 'MN901234'),
(360, 'Jessica Gonzalez', 48, '35858 Walnut St', 'CA', 'Fremont', 'Alameda', '94536', '555-012-3456', 'jessica.gonzalez@example.com', 360, '012-34-5678', 'OP012345'),
(361, 'Michael Lewis', 32, '35959 Cedar St', 'TX', 'Denton', 'Denton', '76201', '555-123-4567', 'michael.lewis@example.com', 361, '123-45-6789', 'PQ123456'),
(362, 'Jennifer Rodriguez', 50, '36060 Elm St', 'OH', 'Hamilton', 'Butler', '45011', '555-234-5678', 'jennifer.rodriguez@example.com', 362, '234-56-7890', 'QR234567'),
(363, 'Jessica Lewis', 30, '36161 Oak St', 'CA', 'Inglewood', 'Los Angeles', '90301', '555-345-6789', 'jessica.lewis@example.com', 363, '345-67-8901', 'RS345678'),
(364, 'Michael Hernandez', 48, '36262 Pine St', 'TX', 'Beaumont', 'Jefferson', '77701', '555-456-7890', 'michael.hernandez@example.com', 364, '456-78-9012', 'ST456789'),
(365, 'Jennifer Smith', 31, '36363 Walnut St', 'NY', 'Buffalo', 'Erie', '14201', '555-567-8901', 'jennifer.smith@example.com', 365, '567-89-0123', 'TU567890'),
(366, 'Jessica Perez', 50, '36464 Cedar St', 'CA', 'Chula Vista', 'San Diego', '91910', '555-678-9012', 'jessica.perez@example.com', 366, '678-90-1234', 'UV678901'),
(367, 'Michael Lewis', 33, '36565 Elm St', 'TX', 'Amarillo', 'Potter', '79109', '555-789-0123', 'michael.lewis@example.com', 367, '789-01-2345', 'VW789012'),
(368, 'Jennifer White', 49, '36666 Oak St', 'OH', 'Lakewood', 'Cuyahoga', '44107', '555-890-1234', 'jennifer.white@example.com', 368, '890-12-3456', 'WX890123'),
(369, 'Jessica Jackson', 30, '36767 Pine St', 'CA', 'Modesto', 'Stanislaus', '95350', '555-901-2345', 'jessica.jackson@example.com', 369, '901-23-4567', 'XY901234'),
(370, 'Michael Thompson', 48, '36868 Walnut St', 'TX', 'Dallas', 'Dallas', '75217', '555-012-3456', 'michael.thompson@example.com', 370, '012-34-5678', 'YZ012345'),
(371, 'Jennifer Lewis', 31, '36969 Cedar St', 'NY', 'New York', 'New York', '10011', '555-123-4567', 'jennifer.lewis@example.com', 371, '123-45-6789', 'ZA123456'),
(372, 'Jessica Hernandez', 49, '37070 Elm St', 'CA', 'Rialto', 'San Bernardino', '92376', '555-234-5678', 'jessica.hernandez@example.com', 372, '234-56-7890', 'AB234567'),
(373, 'Michael Martinez', 30, '37171 Oak St', 'TX', 'Edinburg', 'Hidalgo', '78539', '555-345-6789', 'michael.martinez@example.com', 373, '345-67-8901', 'BC345678'),
(374, 'Jennifer Lee', 48, '37272 Pine St', 'OH', 'Hamilton', 'Butler', '45011', '555-456-7890', 'jennifer.lee@example.com', 374, '456-78-9012', 'CD456789'),
(375, 'Jessica Thompson', 31, '37373 Walnut St', 'CA', 'Antioch', 'Contra Costa', '94509', '555-567-8901', 'jessica.thompson@example.com', 375, '567-89-0123', 'DE567890'),
(376, 'Michael Thomas', 49, '37474 Cedar St', 'TX', 'Garland', 'Dallas', '75043', '555-678-9012', 'michael.thomas@example.com', 376, '678-90-1234', 'EF678901'),
(377, 'Jennifer Gonzalez', 33, '37575 Elm St', 'NY', 'New York', 'New York', '10011', '555-789-0123', 'jennifer.gonzalez@example.com', 377, '789-01-2345', 'FG789012'),
(378, 'Jessica Harris', 48, '37676 Oak St', 'CA', 'Moreno Valley', 'Riverside', '92553', '555-890-1234', 'jessica.harris@example.com', 378, '890-12-3456', 'GH890123'),
(379, 'Michael Clark', 31, '37777 Pine St', 'TX', 'Garland', 'Dallas', '75043', '555-901-2345', 'michael.clark@example.com', 379, '901-23-4567', 'HI901234'),
(380, 'Jennifer Smith', 49, '37878 Walnut St', 'OH', 'Youngstown', 'Mahoning', '44512', '555-012-3456', 'jennifer.smith@example.com', 380, '012-34-5678', 'IJ012345'),
(381, 'Jessica Davis', 33, '37979 Cedar St', 'CA', 'Carlsbad', 'San Diego', '92008', '555-123-4567', 'jessica.davis@example.com', 381, '123-45-6789', 'JK123456'),
(382, 'Michael Taylor', 49, '38080 Elm St', 'TX', 'Mission', 'Hidalgo', '78572', '555-234-5678', 'michael.taylor@example.com', 382, '234-56-7890', 'KL234567'),
(383, 'Jennifer Hernandez', 30, '38181 Oak St', 'NY', 'Mount Vernon', 'Westchester', '10550', '555-345-6789', 'jennifer.hernandez@example.com', 383, '345-67-8901', 'LM345678'),
(384, 'Jessica Johnson', 48, '38282 Pine St', 'CA', 'Napa', 'Napa', '94558', '555-456-7890', 'jessica.johnson@example.com', 384, '456-78-9012', 'MN456789'),
(385, 'Michael Rodriguez', 33, '38383 Walnut St', 'TX', 'Mcallen', 'Hidalgo', '78501', '555-567-8901', 'michael.rodriguez@example.com', 385, '567-89-0123', 'NO567890'),
(386, 'Jennifer Moore', 49, '38484 Cedar St', 'OH', 'Lorain', 'Lorain', '44052', '555-678-9012', 'jennifer.moore@example.com', 386, '678-90-1234', 'OP678901'),
(387, 'Jessica Lewis', 34, '38585 Elm St', 'CA', 'Concord', 'Contra Costa', '94520', '555-789-0123', 'jessica.lewis@example.com', 387, '789-01-2345', 'PQ789012'),
(388, 'Michael Taylor', 49, '38686 Oak St', 'TX', 'McKinney', 'Collin', '75070', '555-890-1234', 'michael.taylor@example.com', 388, '890-12-3456', 'QR890123'),
(389, 'Jennifer Johnson', 30, '38787 Pine St', 'NY', 'Westbury', 'Nassau', '11590', '555-901-2345', 'jennifer.johnson@example.com', 389, '901-23-4567', 'RS901234'),
(390, 'Jessica Perez', 47, '38888 Walnut St', 'CA', 'Buena Park', 'Orange', '90620', '555-012-3456', 'jessica.perez@example.com', 390, '012-34-5678', 'ST012345'),
(391, 'Michael Brown', 34, '38989 Cedar St', 'TX', 'Missouri City', 'Fort Bend', '77459', '555-123-4567', 'michael.brown@example.com', 391, '123-45-6789', 'TU123456'),
(392, 'Jennifer Gonzalez', 50, '39090 Elm St', 'OH', 'Canton', 'Stark', '44702', '555-234-5678', 'jennifer.gonzalez@example.com', 392, '234-56-7890', 'UV234567'),
(393, 'Jessica Taylor', 30, '39191 Oak St', 'CA', 'San Rafael', 'Marin', '94901', '555-345-6789', 'jessica.taylor@example.com', 393, '345-67-8901', 'VW345678'),
(394, 'Michael Hernandez', 49, '39292 Pine St', 'TX', 'Laredo', 'Webb', '78041', '555-456-7890', 'michael.hernandez@example.com', 394, '456-78-9012', 'WX456789'),
(395, 'Jennifer Lopez', 33, '39393 Walnut St', 'NY', 'Albany', 'Albany', '12203', '555-567-8901', 'jennifer.lopez@example.com', 395, '567-89-0123', 'XY567890'),
(396, 'Jessica Clark', 48, '39494 Cedar St', 'CA', 'West Covina', 'Los Angeles', '91790', '555-678-9012', 'jessica.clark@example.com', 396, '678-90-1234', 'YZ678901'),
(397, 'Michael Lee', 32, '39595 Elm St', 'TX', 'San Marcos', 'Hays', '78666', '555-789-0123', 'michael.lee@example.com', 397, '789-01-2345', 'ZA789012'),
(398, 'Jennifer Martinez', 50, '39696 Oak St', 'OH', 'Hamilton', 'Butler', '45011', '555-890-1234', 'jennifer.martinez@example.com', 398, '890-12-3456', 'AB890123'),
(399, 'Jessica Lee', 31, '39797 Pine St', 'CA', 'Indio', 'Riverside', '92201', '555-901-2345', 'jessica.lee@example.com', 399, '901-23-4567', 'BC901234'),
(400, 'Michael Brown', 49, '39898 Walnut St', 'TX', 'Amarillo', 'Potter', '79109', '555-012-3456', 'michael.brown@example.com', 400, '012-34-5678', 'CD012345'),
(401, 'Jennifer Jackson', 34, '39999 Cedar St', 'NY', 'Mount Vernon', 'Westchester', '10550', '555-123-4567', 'jennifer.jackson@example.com', 401, '123-45-6789', 'DE123456'),
(402, 'Jessica Thompson', 50, '40000 Elm St', 'CA', 'Santa Maria', 'Santa Barbara', '93454', '555-234-5678', 'jessica.thompson@example.com', 402, '234-56-7890', 'EF234567'),
(403, 'Michael Taylor', 31, '40101 Oak St', 'TX', 'Dallas', 'Dallas', '75217', '555-345-6789', 'michael.taylor@example.com', 403, '345-67-8901', 'FG345678'),
(404, 'Jennifer Rodriguez', 49, '40202 Pine St', 'OH', 'Cleveland', 'Cuyahoga', '44102', '555-456-7890', 'jennifer.rodriguez@example.com', 404, '456-78-9012', 'GH456789'),
(405, 'Jessica Gonzalez', 31, '40303 Walnut St', 'CA', 'Baldwin Park', 'Los Angeles', '91706', '555-567-8901', 'jessica.gonzalez@example.com', 405, '567-89-0123', 'HI567890'),
(406, 'Michael Martinez', 49, '40404 Cedar St', 'TX', 'Pasadena', 'Harris', '77506', '555-678-9012', 'michael.martinez@example.com', 406, '678-90-1234', 'IJ678901'),
(407, 'Jennifer Lee', 30, '40505 Elm St', 'NY', 'New York', 'New York', '10011', '555-789-0123', 'jennifer.lee@example.com', 407, '789-01-2345', 'JK789012'),
(408, 'Jessica Clark', 49, '40606 Oak St', 'CA', 'Modesto', 'Stanislaus', '95350', '555-890-1234', 'jessica.clark@example.com', 408, '890-12-3456', 'KL890123'),
(409, 'Michael Taylor', 31, '40707 Pine St', 'TX', 'Longview', 'Gregg', '75601', '555-901-2345', 'michael.taylor@example.com', 409, '901-23-4567', 'MN901234'),
(410, 'Jennifer Martinez', 50, '40808 Walnut St', 'OH', 'Hamilton', 'Butler', '45011', '555-012-3456', 'jennifer.martinez@example.com', 410, '012-34-5678', 'OP012345'),
(411, 'Jessica Lee', 31, '40909 Cedar St', 'CA', 'Temecula', 'Riverside', '92592', '555-123-4567', 'jessica.lee@example.com', 411, '123-45-6789', 'PQ123456'),
(412, 'Michael Brown', 49, '41010 Elm St', 'TX', 'Tyler', 'Smith', '75701', '555-234-5678', 'michael.brown@example.com', 412, '234-56-7890', 'QR234567');

-- table 8

CREATE TABLE Booking (
    Booking_ID INT AUTO_INCREMENT PRIMARY KEY,
    Cust_ID INT,
    Room_ID INT,
    Hotel_ID INT,
    Checkin_Date DATE,
    Checkout_Date DATE,
    Created_At TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Updated_At TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    Booking_amount DECIMAL(10, 2),
    Settled_Amount DECIMAL(10, 2) Default 0,
    Current_Active BOOLEAN,
    FOREIGN KEY (Cust_ID) REFERENCES Customer(Cust_ID),
    FOREIGN KEY (Room_ID) REFERENCES Room(Room_ID),
    FOREIGN KEY (Hotel_ID) REFERENCES Hotel(Hotel_ID)
);



-- table 9
 -- Drop table if exists Royalty_Points;
CREATE TABLE Royalty_Points (

    ID INT AUTO_INCREMENT PRIMARY KEY,
     Booking_ID INT,
    Cust_ID INT,

    Points DECIMAL(10, 2),
    Settled_Amount DECIMAL(10, 2) Default 0,
    FOREIGN KEY (Cust_ID) REFERENCES Customer(Cust_ID)

);
-- trigger for royality table
-- DROP TRIGGER IF EXISTS populate_royalty_points;
DELIMITER //

CREATE TRIGGER populate_royalty_points
AFTER INSERT ON Booking
FOR EACH ROW
BEGIN
    DECLARE points DECIMAL(10, 2);
    
    -- Calculate the points based on the booking amount
    SET points = NEW.Booking_amount * 0.05; --  5 point for every $100 spent
    
    -- Insert the points into the Royalty_Points table
    INSERT INTO Royalty_Points (Booking_ID, Cust_ID, Points, Settled_Amount)
    VALUES (NEW.Booking_ID, NEW.Cust_ID, points, 0);
END;
//

DELIMITER ;
 
 -- table 10
CREATE TABLE Payment_Recivables (

    ID INT AUTO_INCREMENT PRIMARY KEY,

    Booking_ID INT,
    
    Cust_ID INT,

    Amount DECIMAL(10, 2),
    
    Settled_Amount DECIMAL(10, 2) Default 0,
    
    Type VARCHAR(20),

    FOREIGN KEY (Booking_ID) REFERENCES Booking(Booking_ID)

);

DELIMITER //

CREATE TRIGGER populate_payment_recivables
AFTER INSERT ON Booking
FOR EACH ROW
BEGIN
    -- Insert a record into Payment_Recivables for the newly inserted booking
    INSERT INTO Payment_Recivables (Booking_ID, Cust_ID, Amount, Settled_Amount, Type)
    VALUES (NEW.Booking_ID, NEW.Cust_ID, NEW.Booking_amount, 0, 'receivable');
END;
//

DELIMITER ;
 -- table 11
 -- Drop table if exists Payment_Payable;
CREATE TABLE Payment_Payable (

    ID INT AUTO_INCREMENT PRIMARY KEY,

    Booking_ID INT,
    
    Hotel_ID INT,
    
    Cust_ID INT,

    Amount DECIMAL(10, 2),
    
    Settled_Amount DECIMAL(10, 2) Default 0,
    Type VARCHAR(20),
    FOREIGN KEY (Booking_ID) REFERENCES Booking(Booking_ID)

);

-- payable for hotels for the booking 
-- DROP TRIGGER IF EXISTS populate_payment_payable;
DELIMITER //

CREATE TRIGGER populate_payment_payable
AFTER INSERT ON Booking
FOR EACH ROW
BEGIN
    
    DECLARE points DECIMAL(10, 2);
    
    -- Calculate the points based on the booking amount
    SET points = NEW.Booking_amount * 0.90;
    
    -- Insert a record into Payment_Payable for the newly inserted booking
    INSERT INTO Payment_Payable (Booking_ID, Hotel_ID,Cust_ID,  Amount, Settled_Amount, type)
    VALUES (NEW.Booking_ID, NEW.Hotel_ID, NUll, points, 0 , "payable");
END;
//

DELIMITER ;

 -- royality payment payable to customer
 DELIMITER //

CREATE TRIGGER populate_payment_to_customer
AFTER INSERT ON Royalty_Points
FOR EACH ROW
BEGIN
    
    
    -- Insert a record into Payment_Payable for the newly inserted Royalty_Points entry
    INSERT INTO Payment_Payable (Booking_ID, Hotel_ID, Cust_ID, Amount, Settled_Amount, type )
    VALUES (NEW.Booking_ID, NULL,NEW.Cust_ID, NEW.Points,0, "royality payable");
END;
//

DELIMITER ;


--   last updated on 15/4 Akshay


DELIMITER //
CREATE TRIGGER BeforeBookingInsert
BEFORE INSERT ON Booking
FOR EACH ROW
BEGIN
    DECLARE available_count INT;

    -- Calculate the number of rows where the room is not available for the given check-in and check-out dates
    SELECT COUNT(*)
    INTO available_count
    FROM RoomAvailability
    WHERE Room_ID = NEW.Room_ID
        AND Hotel_ID = NEW.Hotel_ID
        AND Date BETWEEN NEW.Checkin_Date AND NEW.Checkout_Date
        AND Available = 0;

    -- If available_count is greater than 0, then raise an error
    IF available_count > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Room is not available for the selected dates';
    END IF;
END //
DELIMITER ;

-- DROP TRIGGER IF EXISTS BeforeBookingInsert_update_booking;
DELIMITER //

CREATE TRIGGER BeforeBookingInsert_update_booking
After INSERT ON Booking
FOR EACH ROW
BEGIN
    DECLARE d_date DATE;
    
    -- Set current date to check-in date
    SET d_date = NEW.Checkin_Date;
    
    -- Loop through each date from check-in to check-out
    WHILE d_date <= NEW.Checkout_Date DO
        -- Update the RoomAvailability table to set "available" to 0 for the given room and hotel on each date
        UPDATE RoomAvailability
        SET Available = 0
        WHERE Room_ID = NEW.Room_ID
            AND Hotel_ID = NEW.Hotel_ID
            AND Date = d_date;

        -- Move to the next date
        SET d_date = DATE_ADD(d_date, INTERVAL 1 DAY);
    END WHILE;
END //

DELIMITER ;

-- table 12
-- drop table if exists Payment;
CREATE TABLE Payment (
    Payment_ID INT AUTO_INCREMENT PRIMARY KEY,
    Cust_ID INT,
    Amount DECIMAL(10, 2),
    Payment_Date DATE,
    Payment_Method VARCHAR(50),
    FOREIGN KEY (Cust_ID) REFERENCES Customer(Cust_ID)
);


-- Royality points table 
DELIMITER //

CREATE TRIGGER InsertPaymentAfterPayableInsert
AFTER INSERT ON Payment_Payable
FOR EACH ROW
BEGIN
    IF NEW.Type = 'royalty payable' THEN
        INSERT INTO Payment (Cust_ID, Amount, Payment_Date, Payment_Method)
        VALUES (NEW.Cust_ID, NEW.Amount, CURDATE(), 'Royalty Payment');
    END IF;
END//

DELIMITER ;




 
CREATE TABLE State_Transition (

    ID INT PRIMARY KEY,

    Booking_ID INT,
    
    date_of_change TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    Status VARCHAR(50),

    FOREIGN KEY (Booking_ID) REFERENCES Booking(Booking_ID)

);
-- trigger to fill state_transtion based on booking changes 

 
CREATE TABLE Booking_Changes (

    ID INT PRIMARY KEY,

    Booking_ID INT,

    Change_Booking_Name VARCHAR(100),

    Change_Booking_Address VARCHAR(100),

    Change_Booking_Dates DATE,

    Change_Booking_Phone VARCHAR(20),

    Change_Booking_Email VARCHAR(100),

    FOREIGN KEY (Booking_ID) REFERENCES Booking(Booking_ID)

);

DELIMITER //

CREATE TRIGGER AfterBookingChangesInsert
AFTER INSERT ON Booking_Changes
FOR EACH ROW
BEGIN
    -- Insert into State_Transition based on the type of change
    IF NEW.Change_Booking_Dates IS NOT NULL THEN
        -- Date change
        INSERT INTO State_Transition (Booking_ID, Status)
        VALUES (NEW.Booking_ID, 'Date change');
    ELSE
        -- Other changes (assuming cancellation)
        INSERT INTO State_Transition (Booking_ID, Status)
        VALUES (NEW.Booking_ID, 'Cancelled');
    END IF;
END //

DELIMITER ;

-- trigger to update booking table based on booking changes 
 DELIMITER //

CREATE TRIGGER AfterBookingChangesInsertToBooking
AFTER INSERT ON Booking_Changes
FOR EACH ROW
BEGIN
    DECLARE bookingStatus VARCHAR(50);
    
    -- Determine the booking status based on the change
    IF NEW.Change_Booking_Dates IS NOT NULL THEN
        SET bookingStatus = 'Date change';
        -- Update Checkin_Date and Checkout_Date in Booking table
        UPDATE Booking
        SET Checkin_Date = NEW.Change_Booking_Dates,
            Checkout_Date = DATE_ADD(NEW.Change_Booking_Dates, INTERVAL 1 DAY)
        WHERE Booking_ID = NEW.Booking_ID;
    ELSE
        SET bookingStatus = 'Cancelled';
        -- Mark Current_Active as 0 in Booking table
        UPDATE Booking
        SET Current_Active = 0
        WHERE Booking_ID = NEW.Booking_ID;
    END IF;
    
    -- Insert into State_Transition table
    INSERT INTO State_Transition (Booking_ID, Status)
    VALUES (NEW.Booking_ID, bookingStatus);
END //

DELIMITER ;


 
-- drop table if exists Employees_Salary;
CREATE TABLE Employees_Salary (

    Emp_ID INT,

    Salary DECIMAL(10, 2),

    Joining_date DATE,

    FOREIGN KEY (Emp_ID) REFERENCES Employee_Info(Emp_ID)

);
 
INSERT INTO Employees_Salary (Emp_ID, Salary, Joining_date) VALUES
(1, 55000, '2024-06-04'),
(2, 65000, '2025-01-04'),
(3, 60000, '2025-11-15'),
(4, 75000, '2025-06-13'),
(5, 50000, '2025-04-05'),
(6, 85000, '2024-05-04'),
(7, 95000, '2025-03-21'),
(8, 55000, '2025-07-21'),
(9, 55000, '2024-10-23'),
(10, 65000, '2026-08-20'),
(11, 60000, '2024-08-23'),
(12, 75000, '2026-02-09'),
(13, 50000, '2024-11-03'),
(14, 85000, '2026-03-06'),
(15, 95000, '2024-10-09'),
(16, 55000, '2024-12-19'),
(17, 65000, '2025-07-12'),
(18, 60000, '2026-02-03'),
(19, 75000, '2024-01-17'),
(20, 50000, '2025-07-19'),
(21, 85000, '2024-11-19'),
(22, 95000, '2024-11-22'),
(23, 55000, '2025-06-27'),
(24, 55000, '2024-11-07'),
(25, 65000, '2024-09-28'),
(26, 60000, '2026-02-26'),
(27, 75000, '2024-05-30'),
(28, 50000, '2025-08-03'),
(29, 85000, '2026-04-11'),
(30, 95000, '2025-05-10'),
(31, 55000, '2024-09-02'),
(32, 65000, '2024-11-09'),
(33, 60000, '2024-07-03'),
(34, 75000, '2024-01-18'),
(35, 50000, '2024-01-08'),
(36, 85000, '2025-08-07'),
(37, 95000, '2026-02-06'),
(38, 55000, '2024-09-14'),
(39, 55000, '2025-03-08'),
(40, 65000, '2024-02-12'),
(41, 60000, '2026-05-10'),
(42, 75000, '2025-03-09'),
(43, 50000, '2026-09-12'),
(44, 85000, '2024-02-03'),
(45, 95000, '2025-03-15'),
(46, 55000, '2024-05-07'),
(47, 65000, '2026-06-14'),
(48, 60000, '2024-08-27'),
(49, 75000, '2025-01-02'),
(50, 50000, '2026-05-28'),
(51, 85000, '2024-09-23'),
(52, 95000, '2024-11-01'),
(53, 55000, '2024-01-20'),
(54, 55000, '2026-04-23'),
(55, 65000, '2024-10-23'),
(56, 60000, '2024-12-08'),
(57, 75000, '2024-06-10'),
(58, 50000, '2025-12-18'),
(59, 85000, '2026-05-07'),
(60, 95000, '2025-06-28');


 

CREATE TABLE Payment_Excecution (

    ID INT PRIMARY KEY,

    Booking_ID INT,

    Ref_Number INT,

    FOREIGN KEY (Booking_ID) REFERENCES Booking(Booking_ID)

);
 
CREATE TABLE Payment_Request (

    ID INT PRIMARY KEY,

    Booking_ID INT,

    Amount DECIMAL(10, 2),

    FOREIGN KEY (Booking_ID) REFERENCES Booking(Booking_ID)

);
INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(163, 41, 9, '2024-10-30', '2024-10-31', 100,1),
(206, 172, 35, '2025-10-05', '2025-10-12', 700,1),
(90, 422, 85, '2026-08-17', '2026-08-19', 170,1),
(55, 57, 12, '2024-02-08', '2024-02-09', 100,1),
(28, 141, 29, '2025-07-14', '2025-07-18', 400,1),
(142, 238, 48, '2026-08-16', '2026-08-18', 200,1),
(322, 368, 74, '2024-08-06', '2024-08-09', 270,1),
(212, 262, 53, '2025-02-14', '2025-02-17', 285,1),
(399, 40, 8, '2024-09-22', '2024-09-28', 900,1),
(364, 35, 7, '2026-03-29', '2026-04-01', 450,1),
(65, 69, 14, '2026-08-22', '2026-08-24', 300,1),
(113, 182, 37, '2025-05-19', '2025-05-22', 300,1),
(364, 507, 102, '2026-04-14', '2026-04-17', 255,1),
(94, 472, 95, '2025-05-13', '2025-05-17', 340,1),
(202, 264, 53, '2026-04-27', '2026-04-28', 110,1),
(180, 172, 35, '2024-03-30', '2024-04-02', 300,1),
(263, 253, 51, '2024-12-06', '2024-12-12', 600,1),
(150, 44, 9, '2025-03-23', '2025-03-27', 600,1),
(276, 146, 30, '2024-04-01', '2024-04-04', 300,1),
(307, 355, 71, '2025-04-12', '2025-04-19', 770,1),
(401, 381, 77, '2026-07-20', '2026-07-22', 160,1),
(390, 216, 44, '2024-10-20', '2024-10-25', 425,1),
(229, 501, 101, '2024-01-18', '2024-01-22', 320,1),
(65, 256, 52, '2024-02-16', '2024-02-21', 425,1),
(172, 406, 82, '2024-11-16', '2024-11-20', 300,1),
(388, 160, 32, '2024-07-12', '2024-07-17', 750,1),
(272, 236, 48, '2024-01-10', '2024-01-15', 425,1),
(336, 452, 91, '2024-03-11', '2024-03-12', 85,1),
(116, 465, 93, '2024-06-03', '2024-06-10', 770,1),
(41, 498, 100, '2026-08-12', '2026-08-16', 360,1),
(295, 472, 95, '2024-08-02', '2024-08-04', 170,1),
(336, 336, 68, '2026-04-19', '2026-04-26', 525,1),
(245, 361, 73, '2026-09-03', '2026-09-05', 160,1),
(36, 236, 48, '2024-10-11', '2024-10-13', 170,1),
(66, 58, 12, '2024-05-11', '2024-05-16', 500,1),
(70, 315, 63, '2026-08-14', '2026-08-17', 330,1),
(363, 278, 56, '2025-04-24', '2025-04-28', 400,1),
(300, 450, 90, '2025-09-21', '2025-09-25', 480,1),
(19, 288, 58, '2025-12-29', '2026-01-02', 400,1),
(116, 395, 79, '2024-03-06', '2024-03-13', 770,1),
(178, 393, 79, '2024-12-18', '2024-12-20', 180,1),
(349, 102, 21, '2025-05-13', '2025-05-16', 300,1),
(171, 203, 41, '2024-12-20', '2024-12-21', 100,1),
(374, 153, 31, '2024-12-09', '2024-12-10', 100,1),
(43, 25, 5, '2026-06-25', '2026-06-29', 600,1),
(70, 82, 17, '2026-08-15', '2026-08-17', 200,1),
(331, 310, 62, '2025-01-06', '2025-01-13', 840,1),
(284, 355, 71, '2026-05-23', '2026-05-30', 770,1),
(92, 88, 18, '2025-10-11', '2025-10-16', 500,1),
(401, 345, 69, '2026-08-29', '2026-09-04', 660,1),
(58, 59, 12, '2026-06-03', '2026-06-05', 300,1),
(61, 174, 35, '2026-04-05', '2026-04-11', 900,1),
(121, 417, 84, '2024-01-10', '2024-01-14', 340,1),
(148, 149, 30, '2025-04-22', '2025-04-24', 300,1),
(177, 232, 47, '2024-01-07', '2024-01-13', 570,1),
(138, 190, 38, '2025-08-30', '2025-09-04', 750,1),
(125, 243, 49, '2024-08-24', '2024-08-25', 100,1),
(241, 73, 15, '2024-06-26', '2024-06-29', 300,1),
(133, 12, 3, '2026-06-20', '2026-06-23', 300,1),
(325, 468, 94, '2026-01-26', '2026-02-01', 540,1),
(185, 149, 30, '2024-02-23', '2024-02-25', 300,1),
(186, 462, 93, '2026-02-16', '2026-02-18', 170,1),
(281, 60, 12, '2026-08-16', '2026-08-18', 300,1),
(332, 477, 96, '2025-10-16', '2025-10-18', 170,1),
(47, 35, 7, '2025-08-26', '2025-09-02', 1050,1),
(307, 40, 8, '2026-08-04', '2026-08-08', 600,1),
(177, 238, 48, '2025-02-13', '2025-02-15', 200,1),
(184, 288, 58, '2024-01-09', '2024-01-12', 300,1),
(397, 149, 30, '2025-05-29', '2025-06-02', 600,1),
(221, 65, 13, '2025-06-04', '2025-06-08', 600,1),
(258, 123, 25, '2026-08-09', '2026-08-16', 700,1),
(266, 331, 67, '2025-05-24', '2025-05-28', 320,1),
(408, 99, 20, '2025-07-20', '2025-07-22', 300,1),
(81, 496, 100, '2026-03-27', '2026-03-30', 225,1),
(191, 274, 55, '2024-11-27', '2024-12-03', 660,1),
(238, 142, 29, '2024-05-17', '2024-05-23', 600,1),
(184, 358, 72, '2024-07-01', '2024-07-05', 360,1),
(173, 68, 14, '2024-11-14', '2024-11-21', 700,1),
(405, 262, 53, '2025-04-02', '2025-04-07', 475,1),
(13, 332, 67, '2026-01-07', '2026-01-11', 340,1),
(411, 438, 88, '2024-01-14', '2024-01-21', 630,1),
(100, 350, 70, '2025-02-10', '2025-02-15', 600,1),
(327, 107, 22, '2025-03-06', '2025-03-13', 700,1),
(309, 97, 20, '2024-02-21', '2024-02-28', 700,1),
(153, 422, 85, '2026-01-17', '2026-01-20', 255,1),
(330, 250, 50, '2025-07-23', '2025-07-30', 910,1),
(205, 388, 78, '2025-03-06', '2025-03-07', 90,1),
(279, 67, 14, '2025-06-12', '2025-06-13', 100,1),
(127, 241, 49, '2025-09-03', '2025-09-06', 270,1),
(119, 290, 58, '2026-09-13', '2026-09-15', 260,1),
(17, 182, 37, '2024-11-27', '2024-12-04', 700,1),
(290, 464, 93, '2025-10-26', '2025-10-29', 300,1),
(138, 254, 51, '2024-05-01', '2024-05-07', 660,1),
(97, 417, 84, '2025-09-27', '2025-10-01', 340,1),
(406, 34, 7, '2024-01-01', '2024-01-04', 450,1),
(191, 100, 20, '2026-08-12', '2026-08-13', 150,1),
(352, 420, 84, '2024-10-29', '2024-11-02', 480,1),
(150, 60, 12, '2024-06-24', '2024-06-29', 750,1),
(369, 490, 98, '2024-04-05', '2024-04-11', 720,1),
(69, 333, 67, '2026-05-08', '2026-05-14', 540,1),
(122, 457, 92, '2024-09-12', '2024-09-19', 595,1),
(320, 371, 75, '2024-11-23', '2024-11-30', 560,1),
(360, 73, 15, '2025-07-24', '2025-07-27', 300,1),
(151, 270, 54, '2025-04-12', '2025-04-14', 260,1),
(112, 234, 47, '2024-10-19', '2024-10-24', 550,1),
(79, 211, 43, '2024-10-13', '2024-10-14', 90,1),
(263, 5, 1, '2025-07-31', '2025-08-07', 1050,1),
(65, 325, 65, '2024-04-02', '2024-04-07', 550,1),
(31, 354, 71, '2024-02-07', '2024-02-10', 300,1),
(77, 127, 26, '2025-03-06', '2025-03-07', 100,1),
(223, 342, 69, '2025-01-14', '2025-01-16', 170,1),
(331, 83, 17, '2025-03-07', '2025-03-11', 400,1),
(142, 432, 87, '2025-04-24', '2025-04-28', 340,1),
(90, 200, 40, '2026-01-18', '2026-01-19', 150,1),
(346, 329, 66, '2024-09-10', '2024-09-11', 110,1),
(304, 489, 98, '2024-08-30', '2024-09-02', 330,1),
(134, 251, 51, '2024-01-06', '2024-01-10', 360,1),
(83, 330, 66, '2025-04-20', '2025-04-22', 240,1),
(222, 437, 88, '2024-07-29', '2024-08-04', 510,1),
(361, 357, 72, '2024-01-02', '2024-01-07', 425,1),
(82, 337, 68, '2025-10-09', '2025-10-11', 170,1),
(74, 199, 40, '2026-04-07', '2026-04-13', 900,1),
(334, 453, 91, '2026-01-18', '2026-01-20', 180,1),
(306, 98, 20, '2025-04-06', '2025-04-12', 600,1),
(172, 348, 70, '2026-01-14', '2026-01-21', 630,1);


INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(186, 375, 75, '2024-07-21', '2024-07-24', 330,1),
(36, 419, 84, '2024-06-21', '2024-06-28', 770,1),
(144, 316, 64, '2025-09-27', '2025-10-02', 375,1),
(45, 26, 6, '2026-06-29', '2026-07-04', 500,1),
(410, 278, 56, '2024-01-17', '2024-01-23', 600,1),
(263, 305, 61, '2024-08-05', '2024-08-11', 660,1),
(360, 20, 4, '2025-11-23', '2025-11-26', 450,1),
(277, 198, 40, '2024-10-16', '2024-10-18', 200,1),
(237, 470, 94, '2024-01-05', '2024-01-10', 600,1),
(276, 163, 33, '2024-04-02', '2024-04-04', 200,1),
(208, 332, 67, '2025-04-26', '2025-04-27', 85,1),
(261, 59, 12, '2026-06-08', '2026-06-12', 600,1),
(395, 101, 21, '2025-12-22', '2025-12-26', 400,1),
(287, 308, 62, '2025-09-24', '2025-09-27', 270,1),
(203, 172, 35, '2025-05-04', '2025-05-07', 300,1),
(86, 176, 36, '2025-03-23', '2025-03-26', 300,1),
(221, 113, 23, '2024-05-03', '2024-05-09', 600,1),
(76, 101, 21, '2026-02-23', '2026-02-24', 100,1),
(48, 221, 45, '2024-11-16', '2024-11-23', 630,1),
(361, 51, 11, '2024-01-29', '2024-02-03', 500,1),
(11, 245, 49, '2025-03-21', '2025-03-27', 720,1),
(132, 471, 95, '2024-04-26', '2024-04-28', 160,1),
(283, 74, 15, '2026-04-13', '2026-04-17', 600,1),
(84, 210, 42, '2025-08-17', '2025-08-23', 780,1),
(178, 329, 66, '2026-01-25', '2026-01-31', 660,1),
(291, 36, 8, '2025-11-27', '2025-12-02', 500,1),
(147, 269, 54, '2025-12-21', '2025-12-27', 720,1),
(402, 243, 49, '2025-07-20', '2025-07-27', 700,1),
(210, 129, 26, '2025-08-29', '2025-08-31', 300,1),
(218, 402, 81, '2024-09-10', '2024-09-17', 595,1),
(145, 141, 29, '2024-02-17', '2024-02-22', 500,1),
(141, 186, 38, '2024-01-27', '2024-02-01', 500,1),
(317, 322, 65, '2025-07-19', '2025-07-25', 510,1),
(65, 445, 89, '2024-02-22', '2024-02-23', 110,1),
(89, 354, 71, '2024-05-10', '2024-05-17', 700,1),
(311, 64, 13, '2025-05-27', '2025-05-28', 150,1),
(131, 298, 60, '2024-08-03', '2024-08-04', 100,1),
(292, 22, 5, '2025-01-06', '2025-01-12', 600,1);

INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(212, 110, 22, '2024-10-12', '2024-10-13', 150,1),
(204, 97, 20, '2025-07-24', '2025-07-25', 100,1),
(121, 364, 73, '2025-03-10', '2025-03-12', 200,1),
(16, 184, 37, '2024-09-14', '2024-09-18', 600,1),
(357, 452, 91, '2025-07-15', '2025-07-19', 340,1),
(267, 386, 78, '2025-05-21', '2025-05-27', 450,1),
(87, 388, 78, '2026-02-28', '2026-03-04', 360,1),
(129, 208, 42, '2025-09-01', '2025-09-07', 600,1),
(10, 137, 28, '2026-02-23', '2026-02-26', 300,1),
(249, 187, 38, '2026-07-20', '2026-07-23', 300,1),
(129, 143, 29, '2024-07-30', '2024-08-05', 600,1),
(278, 259, 52, '2026-04-04', '2026-04-11', 840,1),
(105, 182, 37, '2025-09-15', '2025-09-18', 300,1),
(290, 293, 59, '2026-02-25', '2026-02-28', 300,1),
(144, 143, 29, '2024-12-29', '2024-12-31', 200,1),
(29, 231, 47, '2024-11-16', '2024-11-20', 360,1),
(64, 196, 40, '2025-03-31', '2025-04-02', 200,1),
(10, 115, 23, '2024-03-10', '2024-03-13', 450,1),
(381, 210, 42, '2024-07-04', '2024-07-08', 520,1),
(301, 103, 21, '2025-02-08', '2025-02-10', 200,1),
(200, 74, 15, '2025-01-18', '2025-01-19', 150,1),
(390, 476, 96, '2024-04-18', '2024-04-21', 225,1),
(259, 453, 91, '2026-06-16', '2026-06-22', 540,1),
(96, 296, 60, '2026-05-10', '2026-05-16', 510,1),
(235, 29, 6, '2026-02-12', '2026-02-19', 1050,1),
(311, 224, 45, '2025-09-21', '2025-09-23', 220,1),
(201, 247, 50, '2024-05-07', '2024-05-12', 475,1),
(371, 311, 63, '2024-09-01', '2024-09-08', 560,1),
(391, 249, 50, '2026-03-28', '2026-03-30', 240,1),
(387, 171, 35, '2025-01-19', '2025-01-20', 100,1),
(14, 75, 15, '2024-05-12', '2024-05-13', 150,1),
(412, 373, 75, '2026-03-17', '2026-03-18', 90,1),
(120, 390, 78, '2024-12-05', '2024-12-10', 600,1),
(15, 27, 6, '2026-07-10', '2026-07-14', 400,1),
(80, 371, 75, '2025-10-15', '2025-10-16', 80,1),
(227, 425, 85, '2026-07-21', '2026-07-28', 770,1),
(315, 173, 35, '2025-04-19', '2025-04-24', 500,1),
(92, 150, 30, '2025-01-28', '2025-02-04', 1050,1),
(181, 120, 24, '2026-09-06', '2026-09-08', 300,1),
(245, 92, 19, '2024-01-23', '2024-01-29', 600,1),
(326, 31, 7, '2025-01-27', '2025-01-30', 300,1),
(39, 290, 58, '2024-12-04', '2024-12-08', 520,1),
(155, 1, 1, '2024-04-16', '2024-04-23', 700,1),
(64, 175, 35, '2026-01-13', '2026-01-15', 300,1),
(213, 211, 43, '2024-04-11', '2024-04-15', 360,1),
(43, 335, 67, '2024-10-02', '2024-10-08', 660,1),
(79, 186, 38, '2024-07-18', '2024-07-25', 700,1),
(315, 202, 41, '2024-03-20', '2024-03-23', 285,1),
(84, 131, 27, '2024-08-25', '2024-08-26', 100,1),
(91, 335, 67, '2026-02-21', '2026-02-23', 220,1),
(363, 419, 84, '2024-06-15', '2024-06-20', 550,1),
(62, 428, 86, '2024-10-13', '2024-10-16', 270,1),
(349, 433, 87, '2024-12-18', '2024-12-23', 450,1),
(35, 424, 85, '2025-06-30', '2025-07-01', 100,1),
(2, 134, 27, '2026-06-23', '2026-06-26', 450,1),
(30, 238, 48, '2024-12-31', '2025-01-01', 100,1),
(349, 111, 23, '2025-11-13', '2025-11-18', 500,1),
(15, 56, 12, '2024-05-05', '2024-05-10', 500,1),
(324, 201, 41, '2025-02-22', '2025-02-26', 360,1),
(309, 461, 93, '2026-04-20', '2026-04-21', 80,1),
(357, 98, 20, '2025-07-05', '2025-07-10', 500,1),
(161, 101, 21, '2025-06-02', '2025-06-04', 200,1),
(313, 485, 97, '2024-06-27', '2024-07-04', 770,1),
(83, 91, 19, '2024-06-09', '2024-06-11', 200,1),
(94, 181, 37, '2026-03-11', '2026-03-16', 500,1),
(15, 363, 73, '2024-12-30', '2025-01-06', 630,1),
(60, 32, 7, '2025-11-25', '2025-11-26', 100,1),
(89, 334, 67, '2024-02-16', '2024-02-21', 500,1),
(115, 450, 90, '2026-07-27', '2026-08-01', 600,1),
(150, 114, 23, '2024-04-01', '2024-04-04', 450,1),
(364, 375, 75, '2024-12-13', '2024-12-14', 110,1),
(15, 414, 83, '2024-04-30', '2024-05-01', 100,1),
(343, 211, 43, '2025-06-25', '2025-07-01', 540,1),
(147, 165, 33, '2024-05-08', '2024-05-14', 900,1),
(304, 133, 27, '2024-09-26', '2024-10-02', 600,1),
(341, 146, 30, '2025-09-26', '2025-10-01', 500,1),
(132, 409, 82, '2025-02-04', '2025-02-11', 770,1),
(21, 134, 27, '2025-01-18', '2025-01-24', 900,1),
(312, 101, 21, '2024-06-18', '2024-06-22', 400,1),
(190, 24, 5, '2025-04-14', '2025-04-17', 450,1),
(281, 270, 54, '2025-09-23', '2025-09-24', 130,1),
(379, 453, 91, '2025-02-18', '2025-02-24', 540,1),
(77, 322, 65, '2026-05-13', '2026-05-16', 255,1),
(126, 432, 87, '2026-05-07', '2026-05-08', 85,1),
(126, 66, 14, '2024-08-27', '2024-08-30', 300,1),
(191, 181, 37, '2025-12-09', '2025-12-12', 300,1),
(392, 364, 73, '2026-06-26', '2026-06-28', 200,1),
(209, 246, 50, '2025-08-22', '2025-08-26', 340,1),
(151, 361, 73, '2024-06-28', '2024-06-30', 160,1),
(191, 246, 50, '2026-07-15', '2026-07-21', 510,1),
(197, 382, 77, '2026-04-21', '2026-04-25', 340,1),
(285, 299, 60, '2024-08-28', '2024-09-02', 600,1),
(175, 305, 61, '2026-05-11', '2026-05-14', 330,1),
(81, 108, 22, '2024-09-30', '2024-10-07', 700,1),
(121, 425, 85, '2024-08-24', '2024-08-26', 220,1),
(155, 211, 43, '2026-02-10', '2026-02-15', 450,1),
(32, 110, 22, '2025-04-19', '2025-04-24', 750,1),
(191, 181, 37, '2026-08-19', '2026-08-21', 200,1),
(108, 89, 18, '2026-07-11', '2026-07-16', 750,1),
(412, 253, 51, '2024-02-15', '2024-02-20', 500,1),
(28, 473, 95, '2024-03-08', '2024-03-13', 450,1),
(111, 149, 30, '2025-11-19', '2025-11-25', 900,1),
(355, 488, 98, '2024-09-14', '2024-09-15', 90,1),
(283, 260, 52, '2024-01-03', '2024-01-09', 780,1),
(119, 428, 86, '2024-05-17', '2024-05-19', 180,1),
(406, 41, 9, '2024-03-14', '2024-03-19', 500,1),
(116, 221, 45, '2025-01-18', '2025-01-24', 540,1),
(162, 111, 23, '2026-02-03', '2026-02-08', 500,1),
(32, 441, 89, '2026-02-23', '2026-02-24', 80,1),
(173, 380, 76, '2024-10-27', '2024-10-30', 360,1),
(279, 19, 4, '2024-07-21', '2024-07-22', 150,1),
(96, 64, 13, '2024-04-07', '2024-04-11', 600,1),
(350, 493, 99, '2024-08-25', '2024-08-31', 540,1),
(63, 355, 71, '2024-11-08', '2024-11-12', 440,1),
(54, 146, 30, '2024-04-25', '2024-04-30', 500,1),
(28, 430, 86, '2024-09-10', '2024-09-12', 240,1),
(122, 21, 5, '2024-04-04', '2024-04-05', 100,1),
(222, 163, 33, '2025-12-17', '2025-12-19', 200,1);

INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(203, 312, 63, '2024-02-22', '2024-02-28', 510,1),
(189, 445, 89, '2025-01-01', '2025-01-04', 330,1),
(229, 375, 75, '2026-05-24', '2026-05-31', 770,1),
(395, 85, 17, '2025-04-17', '2025-04-18', 150,1),
(228, 380, 76, '2026-04-04', '2026-04-11', 840,1),
(291, 99, 20, '2024-11-18', '2024-11-23', 750,1),
(411, 452, 91, '2024-07-11', '2024-07-16', 425,1),
(179, 476, 96, '2024-06-26', '2024-07-03', 525,1),
(332, 411, 83, '2024-02-16', '2024-02-18', 160,1),
(36, 347, 70, '2024-03-09', '2024-03-13', 340,1),
(287, 157, 32, '2025-02-07', '2025-02-12', 500,1),
(118, 341, 69, '2025-06-04', '2025-06-05', 80,1),
(53, 388, 78, '2024-11-20', '2024-11-21', 90,1),
(278, 348, 70, '2024-02-03', '2024-02-04', 90,1),
(176, 424, 85, '2026-07-28', '2026-07-30', 200,1),
(179, 421, 85, '2026-07-07', '2026-07-10', 240,1),
(255, 181, 37, '2025-02-05', '2025-02-08', 300,1),
(95, 152, 31, '2024-09-21', '2024-09-26', 500,1),
(350, 26, 6, '2025-11-08', '2025-11-11', 300,1),
(351, 441, 89, '2024-04-11', '2024-04-14', 240,1),
(281, 443, 89, '2025-03-01', '2025-03-03', 180,1),
(169, 509, 102, '2025-12-15', '2025-12-21', 660,1),
(74, 371, 75, '2026-06-20', '2026-06-24', 320,1),
(323, 301, 61, '2024-07-28', '2024-07-30', 160,1),
(348, 84, 17, '2025-08-02', '2025-08-06', 600,1),
(63, 137, 28, '2025-01-24', '2025-01-26', 200,1),
(18, 240, 48, '2024-06-24', '2024-06-25', 130,1),
(403, 420, 84, '2024-09-04', '2024-09-10', 720,1),
(17, 125, 25, '2024-04-07', '2024-04-13', 900,1),
(298, 118, 24, '2025-05-12', '2025-05-14', 200,1),
(8, 172, 35, '2025-07-11', '2025-07-12', 100,1),
(224, 117, 24, '2025-05-29', '2025-05-30', 100,1),
(101, 346, 70, '2024-03-10', '2024-03-14', 300,1),
(399, 287, 58, '2025-11-11', '2025-11-12', 95,1),
(166, 128, 26, '2025-01-23', '2025-01-27', 400,1),
(56, 362, 73, '2025-10-18', '2025-10-21', 255,1),
(120, 54, 11, '2026-05-20', '2026-05-21', 150,1),
(234, 206, 42, '2026-04-03', '2026-04-04', 85,1),
(239, 395, 79, '2026-08-12', '2026-08-18', 660,1),
(260, 262, 53, '2024-05-26', '2024-06-01', 570,1),
(8, 60, 12, '2024-04-19', '2024-04-21', 300,1),
(23, 263, 53, '2026-07-20', '2026-07-22', 200,1),
(190, 395, 79, '2026-01-29', '2026-01-30', 110,1),
(250, 66, 14, '2024-07-20', '2024-07-21', 100,1),
(308, 168, 34, '2025-10-17', '2025-10-21', 400,1),
(377, 190, 38, '2026-09-15', '2026-09-17', 300,1),
(87, 480, 96, '2024-01-06', '2024-01-08', 240,1),
(30, 454, 91, '2025-04-15', '2025-04-18', 300,1),
(228, 422, 85, '2026-09-09', '2026-09-15', 510,1),
(369, 465, 93, '2026-06-30', '2026-07-04', 440,1),
(383, 186, 38, '2024-09-11', '2024-09-16', 500,1),
(279, 458, 92, '2024-07-01', '2024-07-06', 450,1),
(150, 336, 68, '2024-04-28', '2024-05-01', 225,1),
(275, 354, 71, '2026-08-23', '2026-08-25', 200,1),
(95, 475, 95, '2025-12-30', '2026-01-04', 550,1),
(352, 505, 101, '2025-08-22', '2025-08-23', 110,1),
(148, 85, 17, '2026-04-27', '2026-04-29', 300,1),
(164, 137, 28, '2026-07-29', '2026-08-01', 300,1),
(74, 79, 16, '2025-01-28', '2025-02-02', 750,1),
(311, 8, 2, '2025-09-05', '2025-09-12', 700,1),
(289, 174, 35, '2025-04-16', '2025-04-19', 450,1),
(96, 65, 13, '2025-12-28', '2026-01-01', 600,1),
(291, 451, 91, '2025-08-11', '2025-08-16', 400,1),
(187, 346, 70, '2026-02-28', '2026-03-07', 525,1),
(401, 129, 26, '2025-11-23', '2025-11-27', 600,1),
(410, 172, 35, '2024-01-21', '2024-01-23', 200,1),
(238, 253, 51, '2026-09-04', '2026-09-06', 200,1),
(234, 128, 26, '2025-08-02', '2025-08-06', 400,1),
(253, 403, 81, '2024-03-02', '2024-03-09', 630,1),
(203, 111, 23, '2024-09-11', '2024-09-16', 500,1),
(139, 388, 78, '2025-07-19', '2025-07-22', 270,1),
(132, 501, 101, '2025-11-03', '2025-11-10', 560,1),
(214, 99, 20, '2026-03-15', '2026-03-22', 1050,1),
(364, 90, 18, '2024-04-09', '2024-04-11', 300,1),
(129, 34, 7, '2025-10-29', '2025-11-03', 750,1),
(276, 34, 7, '2024-06-19', '2024-06-26', 1050,1),
(301, 165, 33, '2024-04-07', '2024-04-12', 750,1),
(204, 210, 42, '2025-09-30', '2025-10-05', 650,1),
(244, 154, 31, '2025-08-08', '2025-08-12', 600,1),
(53, 258, 52, '2026-06-22', '2026-06-28', 600,1),
(119, 226, 46, '2024-11-16', '2024-11-19', 255,1),
(280, 117, 24, '2024-01-18', '2024-01-21', 300,1),
(303, 302, 61, '2025-07-10', '2025-07-12', 170,1),
(305, 116, 24, '2024-10-19', '2024-10-24', 500,1),
(314, 356, 72, '2025-03-12', '2025-03-15', 225,1),
(134, 97, 20, '2025-05-23', '2025-05-24', 100,1),
(111, 299, 60, '2025-02-23', '2025-03-01', 720,1),
(75, 236, 48, '2024-09-03', '2024-09-08', 425,1),
(407, 335, 67, '2025-10-09', '2025-10-13', 440,1),
(72, 227, 46, '2026-02-22', '2026-03-01', 665,1),
(24, 178, 36, '2026-05-17', '2026-05-22', 500,1),
(299, 121, 25, '2026-02-20', '2026-02-21', 100,1),
(153, 200, 40, '2024-11-24', '2024-11-25', 150,1),
(338, 178, 36, '2025-01-08', '2025-01-13', 500,1),
(181, 335, 67, '2026-09-14', '2026-09-19', 550,1),
(124, 354, 71, '2024-12-01', '2024-12-06', 500,1),
(151, 19, 4, '2024-09-30', '2024-10-04', 600,1),
(375, 480, 96, '2025-04-27', '2025-04-28', 120,1),
(258, 39, 8, '2025-05-24', '2025-05-27', 450,1),
(235, 8, 2, '2024-01-11', '2024-01-13', 200,1),
(367, 15, 3, '2026-06-07', '2026-06-14', 1050,1),
(270, 484, 97, '2025-04-19', '2025-04-26', 700,1),
(71, 221, 45, '2026-02-10', '2026-02-16', 540,1),
(20, 428, 86, '2024-07-24', '2024-07-26', 180,1),
(18, 212, 43, '2025-09-28', '2025-10-05', 665,1),
(130, 302, 61, '2024-07-01', '2024-07-07', 510,1),
(301, 314, 63, '2024-06-03', '2024-06-04', 100,1),
(136, 257, 52, '2025-07-14', '2025-07-20', 570,1),
(163, 274, 55, '2026-01-21', '2026-01-23', 220,1),
(257, 377, 76, '2024-11-16', '2024-11-17', 85,1),
(38, 330, 66, '2026-01-24', '2026-01-27', 360,1),
(16, 382, 77, '2024-01-25', '2024-01-30', 425,1),
(228, 167, 34, '2026-05-10', '2026-05-15', 500,1),
(341, 344, 69, '2024-02-09', '2024-02-11', 200,1),
(24, 357, 72, '2025-03-28', '2025-03-29', 85,1);

INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(120, 207, 42, '2025-06-05', '2025-06-09', 380,1),
(151, 13, 3, '2026-04-30', '2026-05-04', 400,1),
(267, 423, 85, '2024-02-24', '2024-03-02', 630,1),
(214, 174, 35, '2026-06-17', '2026-06-20', 450,1),
(250, 292, 59, '2025-07-04', '2025-07-11', 665,1),
(410, 419, 84, '2024-06-06', '2024-06-09', 330,1),
(134, 439, 88, '2026-07-11', '2026-07-12', 110,1),
(191, 261, 53, '2024-05-13', '2024-05-20', 630,1),
(145, 452, 91, '2024-04-12', '2024-04-15', 255,1),
(150, 167, 34, '2026-06-20', '2026-06-25', 500,1),
(208, 216, 44, '2025-05-06', '2025-05-09', 255,1);

INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(116, 103, 21, '2026-08-04', '2026-08-09', 500,1),
(186, 478, 96, '2026-01-10', '2026-01-17', 630,1),
(273, 330, 66, '2025-11-15', '2025-11-22', 840,1),
(313, 453, 91, '2025-01-10', '2025-01-12', 180,1),
(74, 310, 62, '2025-11-10', '2025-11-12', 240,1),
(314, 264, 53, '2024-06-21', '2024-06-22', 110,1),
(327, 320, 64, '2024-02-05', '2024-02-06', 120,1),
(331, 434, 87, '2026-03-04', '2026-03-09', 500,1),
(286, 260, 52, '2025-08-22', '2025-08-29', 910,1),
(384, 39, 8, '2024-07-04', '2024-07-05', 150,1),
(316, 3, 1, '2025-03-11', '2025-03-14', 300,1),
(388, 467, 94, '2025-08-09', '2025-08-12', 255,1),
(220, 251, 51, '2025-02-28', '2025-03-02', 180,1),
(179, 437, 88, '2026-07-11', '2026-07-14', 255,1),
(76, 442, 89, '2024-11-29', '2024-12-01', 170,1),
(214, 82, 17, '2025-04-18', '2025-04-21', 300,1),
(158, 40, 8, '2024-05-21', '2024-05-22', 150,1),
(133, 146, 30, '2025-07-12', '2025-07-16', 400,1),
(30, 392, 79, '2026-02-20', '2026-02-22', 170,1),
(373, 174, 35, '2026-07-26', '2026-08-02', 1050,1),
(364, 64, 13, '2025-03-21', '2025-03-24', 450,1),
(335, 419, 84, '2025-03-06', '2025-03-07', 110,1),
(232, 423, 85, '2024-05-26', '2024-06-01', 540,1),
(400, 332, 67, '2024-08-25', '2024-08-27', 170,1);


INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(386, 331, 67, '2024-12-30', '2025-01-03', 320,1),
(95, 3, 1, '2025-05-29', '2025-06-01', 300,1),
(146, 318, 64, '2024-02-05', '2024-02-11', 540,1),
(307, 90, 18, '2025-06-04', '2025-06-08', 600,1),
(201, 89, 18, '2024-02-14', '2024-02-19', 750,1),
(193, 168, 34, '2024-02-05', '2024-02-06', 100,1),
(233, 427, 86, '2025-03-20', '2025-03-27', 595,1),
(4, 87, 18, '2025-05-19', '2025-05-23', 400,1),
(291, 118, 24, '2025-10-08', '2025-10-14', 600,1),
(317, 21, 5, '2025-11-14', '2025-11-18', 400,1),
(14, 241, 49, '2025-04-22', '2025-04-25', 270,1),
(235, 320, 64, '2024-06-07', '2024-06-13', 720,1),
(409, 40, 8, '2024-09-12', '2024-09-18', 900,1),
(388, 132, 27, '2026-01-21', '2026-01-24', 300,1),
(130, 179, 36, '2025-12-14', '2025-12-18', 600,1),
(214, 4, 1, '2024-10-31', '2024-11-04', 600,1);



INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(40, 328, 66, '2024-11-03', '2024-11-06', 270,1),
(204, 231, 47, '2025-10-28', '2025-11-01', 360,1),
(75, 166, 34, '2024-05-23', '2024-05-24', 100,1),
(190, 498, 100, '2024-01-01', '2024-01-06', 450,1),
(80, 176, 36, '2024-04-08', '2024-04-11', 300,1),
(192, 500, 100, '2024-01-27', '2024-02-02', 720,1),
(12, 28, 6, '2024-08-27', '2024-08-31', 400,1),
(55, 344, 69, '2025-02-25', '2025-03-04', 700,1),
(270, 164, 33, '2025-02-06', '2025-02-08', 300,1),
(195, 320, 64, '2025-06-17', '2025-06-21', 480,1),
(398, 223, 45, '2025-12-09', '2025-12-15', 600,1),
(348, 96, 20, '2024-03-04', '2024-03-05', 100,1),
(25, 55, 11, '2026-07-19', '2026-07-21', 300,1),
(230, 224, 45, '2026-08-04', '2026-08-07', 330,1),
(17, 216, 44, '2024-07-23', '2024-07-29', 510,1),
(107, 503, 101, '2026-02-22', '2026-02-25', 270,1),
(16, 487, 98, '2026-03-11', '2026-03-17', 510,1),
(201, 154, 31, '2024-01-10', '2024-01-11', 150,1),
(248, 43, 9, '2024-02-28', '2024-03-05', 600,1),
(152, 303, 61, '2025-03-11', '2025-03-13', 180,1),
(136, 129, 26, '2026-08-06', '2026-08-11', 750,1);

INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(227, 335, 67, '2024-10-21', '2024-10-24', 330,1),
(234, 171, 35, '2024-01-08', '2024-01-14', 600,1),
(126, 116, 24, '2025-11-02', '2025-11-03', 100,1),
(159, 298, 60, '2024-04-27', '2024-05-02', 500,1),
(184, 145, 29, '2024-08-05', '2024-08-10', 750,1),
(217, 406, 82, '2024-12-18', '2024-12-19', 75,1),
(22, 30, 6, '2025-09-22', '2025-09-27', 750,1),
(225, 8, 2, '2024-10-14', '2024-10-20', 600,1),
(60, 490, 98, '2025-12-20', '2025-12-27', 840,1),
(228, 445, 89, '2024-11-11', '2024-11-17', 660,1),
(381, 323, 65, '2024-03-17', '2024-03-19', 180,1),
(265, 295, 59, '2024-12-26', '2024-12-30', 480,1),
(268, 166, 34, '2025-04-26', '2025-04-27', 100,1),
(111, 398, 80, '2026-09-03', '2026-09-06', 270,1),
(32, 425, 85, '2024-04-08', '2024-04-10', 220,1),
(42, 398, 80, '2025-02-22', '2025-02-23', 90,1),
(370, 429, 86, '2024-03-14', '2024-03-19', 550,1);


INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(140, 380, 76, '2025-10-27', '2025-10-29', 240,1),
(372, 466, 94, '2025-01-30', '2025-02-04', 375,1),
(193, 324, 65, '2024-05-25', '2024-05-26', 100,1),
(50, 303, 61, '2024-08-13', '2024-08-16', 270,1),
(348, 48, 10, '2024-11-29', '2024-12-02', 300,1),
(11, 156, 32, '2026-07-10', '2026-07-13', 300,1),
(250, 286, 58, '2024-12-13', '2024-12-15', 170,1),
(203, 307, 62, '2026-05-26', '2026-05-28', 170,1),
(172, 466, 94, '2026-06-27', '2026-06-28', 75,1),
(89, 164, 33, '2026-01-17', '2026-01-23', 900,1),
(192, 460, 92, '2025-07-19', '2025-07-25', 720,1),
(303, 117, 24, '2025-04-15', '2025-04-21', 600,1),
(306, 55, 11, '2024-06-09', '2024-06-16', 1050,1),
(308, 25, 5, '2024-06-04', '2024-06-07', 450,1);

INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(94, 364, 73, '2024-07-27', '2024-07-30', 300,1),
(29, 364, 73, '2026-08-02', '2026-08-07', 500,1),
(184, 385, 77, '2024-10-01', '2024-10-05', 440,1),
(81, 335, 67, '2026-03-21', '2026-03-25', 440,1),
(220, 236, 48, '2025-06-08', '2025-06-14', 510,1),
(73, 481, 97, '2026-05-12', '2026-05-17', 400,1),
(326, 446, 90, '2025-12-15', '2025-12-21', 450,1),
(116, 149, 30, '2025-12-03', '2025-12-10', 1050,1),
(116, 38, 8, '2025-12-24', '2025-12-30', 600,1),
(204, 203, 41, '2025-12-15', '2025-12-16', 100,1),
(213, 6, 2, '2025-11-11', '2025-11-16', 500,1),
(308, 449, 90, '2026-02-19', '2026-02-20', 110,1);

INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(30, 87, 18, '2024-02-22', '2024-02-25', 300,1),
(373, 103, 21, '2026-01-07', '2026-01-10', 300,1),
(395, 39, 8, '2026-09-09', '2026-09-10', 150,1),
(6, 307, 62, '2026-09-11', '2026-09-16', 425,1),
(185, 330, 66, '2025-10-14', '2025-10-21', 840,1),
(372, 281, 57, '2025-10-18', '2025-10-25', 630,1),
(24, 327, 66, '2024-12-22', '2024-12-23', 85,1),
(285, 393, 79, '2025-09-19', '2025-09-20', 90,1),
(378, 418, 84, '2024-03-07', '2024-03-08', 90,1),
(150, 110, 22, '2026-04-18', '2026-04-23', 750,1),
(47, 30, 6, '2024-07-06', '2024-07-13', 1050,1),
(354, 84, 17, '2026-07-22', '2026-07-24', 300,1),
(396, 398, 80, '2026-03-06', '2026-03-12', 540,1),
(19, 334, 67, '2025-12-15', '2025-12-18', 300,1),
(189, 484, 97, '2025-04-03', '2025-04-05', 200,1),
(97, 264, 53, '2026-01-14', '2026-01-17', 330,1),
(125, 290, 58, '2024-08-26', '2024-09-02', 910,1),
(4, 429, 86, '2024-11-06', '2024-11-13', 770,1);


INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(238, 394, 79, '2026-07-08', '2026-07-09', 100,1),
(3, 406, 82, '2024-11-03', '2024-11-07', 300,1),
(183, 264, 53, '2026-02-17', '2026-02-19', 220,1),
(271, 252, 51, '2025-01-21', '2025-01-23', 190,1),
(322, 359, 72, '2024-11-23', '2024-11-25', 220,1),
(234, 348, 70, '2024-04-21', '2024-04-24', 270,1),
(28, 385, 77, '2024-04-23', '2024-04-30', 770,1),
(176, 127, 26, '2026-06-10', '2026-06-14', 400,1),
(150, 507, 102, '2024-07-28', '2024-08-02', 425,1),
(148, 219, 44, '2026-01-03', '2026-01-10', 840,1),
(145, 360, 72, '2024-12-02', '2024-12-03', 120,1),
(303, 316, 64, '2025-09-04', '2025-09-07', 225,1),
(187, 499, 100, '2024-09-01', '2024-09-03', 220,1),
(250, 295, 59, '2025-03-25', '2025-04-01', 840,1),
(118, 406, 82, '2024-02-16', '2024-02-19', 225,1),
(170, 496, 100, '2026-08-14', '2026-08-15', 75,1),
(294, 286, 58, '2024-05-16', '2024-05-18', 170,1),
(364, 359, 72, '2024-01-06', '2024-01-13', 770,1),
(200, 56, 12, '2024-08-09', '2024-08-14', 500,1),
(230, 87, 18, '2025-09-06', '2025-09-09', 300,1),
(335, 506, 102, '2025-12-11', '2025-12-16', 375,1),
(109, 66, 14, '2024-04-02', '2024-04-07', 500,1),
(25, 31, 7, '2025-02-06', '2025-02-08', 200,1),
(207, 165, 33, '2025-12-27', '2025-12-28', 150,1),
(228, 317, 64, '2025-03-19', '2025-03-26', 595,1),
(326, 359, 72, '2025-08-31', '2025-09-03', 330,1),
(218, 462, 93, '2024-10-27', '2024-10-29', 170,1),
(230, 237, 48, '2026-04-24', '2026-04-25', 95,1),
(265, 90, 18, '2025-05-11', '2025-05-17', 900,1),
(214, 84, 17, '2024-12-26', '2025-01-02', 1050,1),
(297, 176, 36, '2025-12-18', '2025-12-25', 700,1),
(53, 267, 54, '2025-06-10', '2025-06-14', 380,1),
(202, 248, 50, '2025-08-23', '2025-08-29', 600,1),
(191, 392, 79, '2026-09-01', '2026-09-05', 340,1),
(107, 10, 2, '2026-03-01', '2026-03-02', 150,1),
(103, 161, 33, '2025-05-16', '2025-05-19', 300,1),
(222, 350, 70, '2025-09-25', '2025-09-26', 120,1),
(158, 164, 33, '2024-03-30', '2024-04-02', 450,1),
(37, 91, 19, '2025-10-14', '2025-10-19', 500,1),
(343, 463, 93, '2026-06-22', '2026-06-27', 450,1),
(255, 339, 68, '2025-12-05', '2025-12-11', 660,1),
(176, 38, 8, '2025-02-26', '2025-03-05', 700,1),
(57, 73, 15, '2024-09-08', '2024-09-11', 300,1),
(198, 47, 10, '2024-11-03', '2024-11-09', 600,1),
(312, 174, 35, '2025-02-28', '2025-03-07', 1050,1),
(389, 177, 36, '2025-12-18', '2025-12-20', 200,1),
(247, 47, 10, '2026-04-18', '2026-04-23', 500,1),
(2, 436, 88, '2025-03-14', '2025-03-15', 75,1),
(198, 115, 23, '2026-07-18', '2026-07-24', 900,1),
(317, 42, 9, '2026-05-28', '2026-05-29', 100,1),
(209, 381, 77, '2024-08-23', '2024-08-27', 320,1),
(380, 261, 53, '2026-08-14', '2026-08-19', 450,1),
(409, 257, 52, '2024-07-03', '2024-07-07', 380,1),
(408, 313, 63, '2024-01-02', '2024-01-05', 270,1),
(205, 322, 65, '2025-02-04', '2025-02-09', 425,1),
(189, 384, 77, '2025-03-16', '2025-03-23', 700,1),
(224, 64, 13, '2024-02-07', '2024-02-14', 1050,1),
(136, 410, 82, '2026-04-10', '2026-04-15', 600,1),
(269, 391, 79, '2025-12-23', '2025-12-30', 560,1),
(102, 120, 24, '2026-08-07', '2026-08-10', 450,1),
(190, 203, 41, '2024-05-01', '2024-05-08', 700,1),
(247, 128, 26, '2024-01-18', '2024-01-22', 400,1),
(64, 247, 50, '2025-03-20', '2025-03-24', 380,1),
(57, 127, 26, '2024-01-27', '2024-01-29', 200,1),
(350, 493, 99, '2026-02-20', '2026-02-22', 180,1),
(401, 380, 76, '2026-05-23', '2026-05-27', 480,1),
(402, 42, 9, '2025-10-31', '2025-11-07', 700,1),
(263, 349, 70, '2024-02-20', '2024-02-24', 440,1),
(102, 133, 27, '2026-06-17', '2026-06-19', 200,1),
(386, 205, 41, '2026-05-25', '2026-05-26', 120,1),
(305, 507, 102, '2024-07-22', '2024-07-24', 170,1),
(109, 79, 16, '2026-08-06', '2026-08-10', 600,1),
(229, 21, 5, '2024-10-14', '2024-10-21', 700,1),
(375, 367, 74, '2026-06-07', '2026-06-11', 340,1),
(116, 250, 50, '2025-06-28', '2025-07-04', 780,1),
(19, 248, 50, '2025-06-09', '2025-06-14', 500,1),
(159, 434, 87, '2025-09-03', '2025-09-10', 700,1),
(204, 118, 24, '2026-04-13', '2026-04-19', 600,1),
(198, 31, 7, '2024-07-24', '2024-07-31', 700,1),
(62, 321, 65, '2025-08-18', '2025-08-20', 160,1),
(197, 189, 38, '2024-07-14', '2024-07-20', 900,1),
(163, 260, 52, '2025-09-24', '2025-10-01', 910,1),
(225, 192, 39, '2025-06-16', '2025-06-19', 300,1),
(174, 230, 46, '2025-08-10', '2025-08-14', 520,1),
(406, 345, 69, '2024-01-27', '2024-01-30', 330,1),
(297, 220, 44, '2025-08-13', '2025-08-15', 260,1),
(274, 335, 67, '2025-06-27', '2025-07-04', 770,1),
(26, 101, 21, '2024-03-20', '2024-03-27', 700,1),
(283, 431, 87, '2024-08-24', '2024-08-29', 400,1),
(72, 1, 1, '2026-01-21', '2026-01-26', 500,1),
(291, 333, 67, '2024-05-17', '2024-05-20', 270,1),
(221, 100, 20, '2025-07-05', '2025-07-12', 1050,1),
(78, 311, 63, '2026-03-30', '2026-04-02', 240,1),
(190, 315, 63, '2024-10-06', '2024-10-12', 660,1),
(378, 426, 86, '2025-09-04', '2025-09-09', 375,1),
(231, 413, 83, '2024-03-27', '2024-03-29', 180,1),
(92, 412, 83, '2024-03-15', '2024-03-20', 425,1),
(136, 301, 61, '2024-05-10', '2024-05-12', 160,1),
(158, 236, 48, '2024-04-03', '2024-04-04', 85,1),
(130, 347, 70, '2024-06-14', '2024-06-20', 510,1),
(254, 31, 7, '2024-06-12', '2024-06-15', 300,1),
(351, 160, 32, '2025-08-18', '2025-08-24', 900,1),
(94, 248, 50, '2025-03-29', '2025-04-01', 300,1),
(96, 320, 64, '2024-05-28', '2024-06-02', 600,1),
(56, 195, 39, '2025-04-08', '2025-04-12', 600,1),
(72, 278, 56, '2026-06-27', '2026-07-02', 500,1),
(256, 353, 71, '2025-07-09', '2025-07-13', 360,1),
(286, 328, 66, '2026-04-29', '2026-05-06', 630,1),
(245, 27, 6, '2024-06-01', '2024-06-04', 300,1),
(278, 53, 11, '2024-12-22', '2024-12-28', 600,1),
(106, 52, 11, '2025-02-04', '2025-02-11', 700,1),
(390, 60, 12, '2025-09-14', '2025-09-21', 1050,1),
(118, 119, 24, '2025-08-23', '2025-08-25', 300,1),
(156, 226, 46, '2025-07-20', '2025-07-21', 85,1),
(309, 11, 3, '2026-08-17', '2026-08-23', 600,1),
(181, 352, 71, '2025-01-16', '2025-01-17', 85,1),
(54, 50, 10, '2024-10-30', '2024-11-01', 300,1),
(336, 308, 62, '2025-12-31', '2026-01-04', 360,1),
(49, 274, 55, '2025-03-02', '2025-03-06', 440,1),
(371, 304, 61, '2024-02-16', '2024-02-20', 400,1);

INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES

(264, 141, 29, '2025-09-11', '2025-09-12', 100,1),
(368, 148, 30, '2025-10-16', '2025-10-22', 600,1),
(306, 287, 58, '2024-04-10', '2024-04-14', 380,1),
(317, 179, 36, '2024-06-17', '2024-06-21', 600,1),
(192, 465, 93, '2026-01-26', '2026-01-30', 440,1),
(350, 8, 2, '2025-06-29', '2025-07-03', 400,1),
(146, 237, 48, '2024-04-12', '2024-04-16', 380,1),
(16, 161, 33, '2024-09-17', '2024-09-18', 100,1),
(117, 93, 19, '2024-07-08', '2024-07-12', 400,1),
(7, 317, 64, '2025-09-29', '2025-10-06', 595,1),
(377, 502, 101, '2024-05-11', '2024-05-14', 255,1); 

INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(9, 213, 43, '2026-01-28', '2026-01-30', 200,1),
(259, 467, 94, '2025-01-03', '2025-01-04', 85,1),
(315, 39, 8, '2024-12-07', '2024-12-12', 750,1);

INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(214, 478, 96, '2026-08-27', '2026-09-03', 630,1),
(30, 255, 51, '2024-05-17', '2024-05-21', 480,1),
(262, 445, 89, '2026-04-24', '2026-05-01', 770,1),
(205, 112, 23, '2026-07-19', '2026-07-25', 600,1);

INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(208, 485, 97, '2026-03-07', '2026-03-10', 330,1),
(344, 290, 58, '2026-08-07', '2026-08-10', 390,1),
(155, 136, 28, '2025-10-12', '2025-10-14', 200,1),
(166, 250, 50, '2024-08-24', '2024-08-27', 390,1),
(324, 55, 11, '2026-03-01', '2026-03-04', 450,1),
(403, 300, 60, '2025-12-18', '2025-12-25', 910,1);


INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES

(372, 142, 29, '2025-12-02', '2025-12-06', 400,1),
(347, 45, 9, '2024-04-07', '2024-04-10', 450,1),
(208, 118, 24, '2025-07-14', '2025-07-15', 100,1),
(31, 126, 26, '2025-08-19', '2025-08-23', 400,1),
(349, 305, 61, '2025-06-26', '2025-07-03', 770,1),
(325, 192, 39, '2024-11-08', '2024-11-15', 700,1),
(93, 80, 16, '2024-10-16', '2024-10-19', 450,1),
(299, 432, 87, '2024-12-08', '2024-12-15', 595,1);

INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(389, 449, 90, '2025-04-06', '2025-04-13', 770,1),
(252, 95, 19, '2026-06-09', '2026-06-10', 150,1),
(128, 7, 2, '2026-07-16', '2026-07-21', 500,1),
(49, 441, 89, '2024-11-02', '2024-11-06', 320,1),
(74, 227, 46, '2024-07-10', '2024-07-15', 475,1),
(227, 128, 26, '2024-12-28', '2024-12-29', 100,1),
(220, 481, 97, '2024-06-09', '2024-06-16', 560,1),
(208, 159, 32, '2024-03-12', '2024-03-13', 150,1),
(228, 109, 22, '2024-04-16', '2024-04-22', 900,1),
(405, 221, 45, '2025-12-02', '2025-12-05', 270,1),
(273, 435, 87, '2024-10-19', '2024-10-26', 770,1),
(95, 242, 49, '2025-01-18', '2025-01-22', 380,1),
(223, 472, 95, '2025-10-29', '2025-11-03', 425,1),
(133, 146, 30, '2025-07-10', '2025-07-11', 100,1);



INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(176, 457, 92, '2024-06-02', '2024-06-06', 340,1),
(309, 263, 53, '2026-01-08', '2026-01-10', 200,1),
(280, 26, 6, '2025-07-27', '2025-07-31', 400,1),
(29, 67, 14, '2025-05-15', '2025-05-22', 700,1),
(120, 355, 71, '2024-05-02', '2024-05-08', 660,1),
(19, 100, 20, '2025-08-03', '2025-08-07', 600,1),
(166, 298, 60, '2026-02-16', '2026-02-18', 200,1),
(286, 226, 46, '2024-01-15', '2024-01-22', 595,1),
(235, 500, 100, '2025-08-28', '2025-08-29', 120,1),
(213, 495, 99, '2026-02-18', '2026-02-22', 440,1);

INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(107, 71, 15, '2025-05-12', '2025-05-16', 400,1),
(40, 30, 6, '2024-05-28', '2024-06-02', 750,1),
(31, 153, 31, '2024-12-25', '2024-12-29', 400,1),
(99, 267, 54, '2024-10-02', '2024-10-04', 190,1),
(249, 178, 36, '2024-02-04', '2024-02-10', 600,1),
(222, 67, 14, '2025-10-26', '2025-10-30', 400,1),
(1, 333, 67, '2025-07-04', '2025-07-06', 180,1),
(89, 363, 73, '2024-03-06', '2024-03-13', 630,1),
(314, 303, 61, '2024-02-17', '2024-02-23', 540,1),
(401, 319, 64, '2026-05-25', '2026-05-31', 660,1);





INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(338, 265, 53, '2026-02-13', '2026-02-17', 480,1),
(115, 447, 90, '2026-02-12', '2026-02-16', 340,1),
(111, 104, 21, '2026-02-12', '2026-02-15', 450,1),
(299, 329, 66, '2025-09-14', '2025-09-15', 110,1),
(140, 70, 14, '2024-10-26', '2024-11-02', 1050,1),
(68, 217, 44, '2024-12-28', '2025-01-02', 475,1),
(398, 424, 85, '2026-05-06', '2026-05-08', 200,1),
(180, 87, 18, '2024-02-07', '2024-02-09', 200,1),
(191, 400, 80, '2026-09-05', '2026-09-10', 600,1),
(18, 32, 7, '2026-08-16', '2026-08-21', 500,1);
INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(395, 354, 71, '2024-11-14', '2024-11-16', 200,1),
(231, 478, 96, '2026-05-15', '2026-05-21', 540,1),
(368, 223, 45, '2024-10-28', '2024-11-02', 500,1),
(120, 284, 57, '2026-04-28', '2026-05-04', 660,1),
(363, 393, 79, '2025-08-12', '2025-08-18', 540,1),
(359, 395, 79, '2025-12-04', '2025-12-05', 110,1),
(73, 34, 7, '2025-03-22', '2025-03-26', 600,1),
(5, 112, 23, '2025-11-18', '2025-11-25', 700,1),
(193, 267, 54, '2025-04-29', '2025-05-04', 475,1),
(308, 166, 34, '2025-10-21', '2025-10-23', 200,1);
INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(71, 453, 91, '2026-03-13', '2026-03-16', 270,1),
(253, 439, 88, '2025-01-31', '2025-02-05', 550,1),
(103, 307, 62, '2025-09-12', '2025-09-13', 85,1),
(25, 223, 45, '2025-02-26', '2025-02-28', 200,1),
(133, 33, 7, '2025-05-20', '2025-05-21', 100,1),
(185, 320, 64, '2026-04-24', '2026-04-29', 600,1),
(61, 388, 78, '2025-08-11', '2025-08-18', 630,1),
(59, 108, 22, '2024-03-01', '2024-03-03', 200,1),
(24, 480, 96, '2026-03-11', '2026-03-14', 360,1),
(79, 470, 94, '2026-07-29', '2026-07-30', 120,1);
INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(349, 273, 55, '2024-08-08', '2024-08-14', 600,1),
(160, 138, 28, '2026-09-11', '2026-09-12', 100,1),
(38, 485, 97, '2025-01-20', '2025-01-24', 440,1),
(267, 327, 66, '2025-01-14', '2025-01-21', 595,1),
(203, 169, 34, '2025-07-28', '2025-08-04', 1050,1),
(10, 152, 31, '2026-03-06', '2026-03-11', 500,1),
(100, 33, 7, '2024-06-01', '2024-06-02', 100,1),
(160, 471, 95, '2025-10-17', '2025-10-19', 160,1),
(374, 232, 47, '2026-01-13', '2026-01-15', 190,1),
(374, 414, 83, '2025-10-19', '2025-10-26', 700,1);
INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(45, 398, 80, '2026-07-09', '2026-07-16', 630,1),
(21, 21, 5, '2025-01-15', '2025-01-16', 100,1),
(222, 352, 71, '2024-09-05', '2024-09-12', 595,1),
(181, 360, 72, '2026-06-18', '2026-06-21', 360,1),
(19, 407, 82, '2024-04-11', '2024-04-14', 255,1),
(312, 83, 17, '2024-07-12', '2024-07-14', 200,1),
(389, 413, 83, '2024-04-02', '2024-04-07', 450,1),
(402, 203, 41, '2026-05-19', '2026-05-25', 600,1),
(9, 213, 43, '2025-09-11', '2025-09-16', 500,1),
(242, 9, 2, '2025-05-07', '2025-05-14', 1050,1);
INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(405, 268, 54, '2026-05-16', '2026-05-21', 500,1),
(219, 482, 97, '2025-07-17', '2025-07-24', 595,1),
(133, 49, 10, '2024-02-05', '2024-02-10', 750,1),
(165, 275, 55, '2026-05-26', '2026-05-30', 480,1),
(322, 264, 53, '2024-12-08', '2024-12-09', 110,1),
(48, 43, 9, '2025-01-04', '2025-01-07', 300,1),
(235, 231, 47, '2024-09-22', '2024-09-29', 630,1),
(303, 260, 52, '2024-07-14', '2024-07-15', 130,1),
(76, 75, 15, '2025-07-24', '2025-07-30', 900,1),
(278, 442, 89, '2026-01-25', '2026-01-29', 340,1);
INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(145, 50, 10, '2025-11-15', '2025-11-21', 900,1),
(311, 66, 14, '2026-01-03', '2026-01-04', 100,1),
(115, 268, 54, '2024-11-13', '2024-11-17', 400,1),
(292, 401, 81, '2024-01-15', '2024-01-22', 560,1),
(409, 313, 63, '2024-03-18', '2024-03-22', 360,1),
(249, 205, 41, '2026-03-26', '2026-03-29', 360,1),
(282, 62, 13, '2024-04-08', '2024-04-11', 300,1),
(26, 498, 100, '2025-01-23', '2025-01-27', 360,1),
(377, 94, 19, '2025-06-12', '2025-06-18', 900,1),
(252, 401, 81, '2024-05-08', '2024-05-13', 400,1);

INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(166, 23, 5, '2025-11-10', '2025-11-16', 600,1),
(101, 164, 33, '2026-02-15', '2026-02-20', 750,1),
(282, 24, 5, '2026-02-22', '2026-02-25', 450,1),
(75, 210, 42, '2025-07-12', '2025-07-17', 650,1),
(271, 206, 42, '2026-08-21', '2026-08-25', 340,1),
(291, 480, 96, '2024-11-20', '2024-11-25', 600,1),
(192, 138, 28, '2026-02-23', '2026-02-28', 500,1),
(18, 102, 21, '2026-06-02', '2026-06-04', 200,1),
(339, 381, 77, '2024-06-22', '2024-06-29', 560,1),
(144, 282, 57, '2024-10-08', '2024-10-15', 665,1);
INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(333, 112, 23, '2025-09-13', '2025-09-17', 400,1),
(372, 173, 35, '2024-10-16', '2024-10-23', 700,1),
(305, 479, 96, '2026-05-09', '2026-05-15', 660,1),
(317, 369, 74, '2025-12-09', '2025-12-11', 220,1),
(254, 277, 56, '2024-11-13', '2024-11-14', 95,1),
(168, 14, 3, '2024-03-11', '2024-03-16', 750,1),
(259, 169, 34, '2024-06-09', '2024-06-15', 900,1),
(315, 364, 73, '2024-07-12', '2024-07-19', 700,1),
(236, 262, 53, '2025-12-14', '2025-12-15', 95,1),
(180, 244, 49, '2025-10-02', '2025-10-04', 220,1);
INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(5, 336, 68, '2024-03-24', '2024-03-29', 375,1),
(144, 319, 64, '2024-09-21', '2024-09-23', 220,1),
(109, 260, 52, '2024-12-25', '2024-12-29', 520,1),
(139, 65, 13, '2024-03-26', '2024-03-27', 150,1),
(333, 240, 48, '2024-12-20', '2024-12-26', 780,1),
(210, 315, 63, '2025-01-04', '2025-01-06', 220,1),
(194, 88, 18, '2026-07-18', '2026-07-23', 500,1),
(303, 436, 88, '2024-03-19', '2024-03-26', 525,1),
(285, 29, 6, '2025-11-06', '2025-11-10', 600,1),
(142, 82, 17, '2026-04-06', '2026-04-10', 400,1);
INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(60, 217, 44, '2025-04-10', '2025-04-16', 570,1),
(3, 429, 86, '2025-04-26', '2025-04-30', 440,1),
(384, 115, 23, '2024-06-05', '2024-06-08', 450,1),
(187, 79, 16, '2026-04-09', '2026-04-15', 900,1),
(253, 363, 73, '2026-04-29', '2026-05-04', 450,1),
(378, 463, 93, '2025-10-18', '2025-10-19', 90,1),
(254, 502, 101, '2026-05-04', '2026-05-09', 425,1),
(106, 17, 4, '2024-02-25', '2024-02-28', 300,1),
(285, 280, 56, '2026-05-22', '2026-05-27', 650,1),
(221, 93, 19, '2025-06-10', '2025-06-16', 600,1);
INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(134, 406, 82, '2024-02-06', '2024-02-07', 75,1),
(372, 124, 25, '2024-03-06', '2024-03-10', 600,1),
(340, 350, 70, '2025-06-10', '2025-06-17', 840,1),
(29, 270, 54, '2024-11-28', '2024-12-02', 520,1),
(236, 294, 59, '2025-03-23', '2025-03-28', 550,1),
(84, 26, 6, '2024-10-16', '2024-10-18', 200,1),
(237, 89, 18, '2024-04-16', '2024-04-17', 150,1),
(186, 462, 93, '2025-11-27', '2025-12-01', 340,1),
(162, 26, 6, '2026-08-29', '2026-08-30', 100,1),
(122, 206, 42, '2025-03-13', '2025-03-16', 255,1);
INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(380, 135, 27, '2026-06-06', '2026-06-10', 600,1),
(133, 490, 98, '2024-11-26', '2024-12-03', 840,1),
(276, 144, 29, '2026-05-29', '2026-06-01', 450,1),
(259, 238, 48, '2024-05-29', '2024-06-05', 700,1),
(293, 16, 4, '2026-04-02', '2026-04-06', 400,1),
(168, 127, 26, '2024-02-29', '2024-03-02', 200,1),
(396, 362, 73, '2026-05-26', '2026-05-27', 85,1),
(204, 192, 39, '2024-09-15', '2024-09-17', 200,1),
(142, 153, 31, '2025-01-29', '2025-01-30', 100,1),
(120, 254, 51, '2024-10-14', '2024-10-21', 770,1);
INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(132, 288, 58, '2024-09-12', '2024-09-15', 300,1),
(109, 31, 7, '2026-07-12', '2026-07-18', 600,1),
(361, 492, 99, '2025-08-06', '2025-08-10', 340,1),
(364, 502, 101, '2026-04-02', '2026-04-09', 595,1),
(147, 175, 35, '2026-03-12', '2026-03-14', 300,1),
(210, 220, 44, '2024-09-28', '2024-10-05', 910,1),
(66, 183, 37, '2026-01-01', '2026-01-03', 200,1),
(193, 402, 81, '2024-06-08', '2024-06-13', 425,1),
(328, 218, 44, '2025-05-05', '2025-05-07', 200,1),
(23, 475, 95, '2025-08-11', '2025-08-14', 330,1);
INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(393, 224, 45, '2024-07-13', '2024-07-18', 550,1),
(324, 440, 88, '2024-11-03', '2024-11-05', 240,1),
(38, 293, 59, '2024-02-19', '2024-02-26', 700,1),
(333, 390, 78, '2026-06-02', '2026-06-09', 840,1),
(10, 436, 88, '2024-07-11', '2024-07-12', 75,1),
(286, 191, 39, '2025-05-17', '2025-05-19', 200,1),
(94, 407, 82, '2025-06-05', '2025-06-07', 170,1),
(407, 341, 69, '2025-11-01', '2025-11-08', 560,1),
(103, 244, 49, '2025-03-08', '2025-03-15', 770,1),
(332, 268, 54, '2026-09-04', '2026-09-06', 200,1);
INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(65, 358, 72, '2024-12-22', '2024-12-29', 630,1),
(86, 135, 27, '2024-01-04', '2024-01-07', 450,1),
(41, 269, 54, '2025-02-12', '2025-02-13', 120,1),
(321, 378, 76, '2026-05-01', '2026-05-08', 630,1),
(17, 251, 51, '2025-10-05', '2025-10-06', 90,1),
(148, 176, 36, '2024-07-15', '2024-07-17', 200,1),
(342, 456, 92, '2025-09-01', '2025-09-04', 225,1),
(406, 494, 99, '2026-05-13', '2026-05-17', 400,1),
(351, 79, 16, '2024-05-13', '2024-05-16', 450,1),
(39, 385, 77, '2024-12-08', '2024-12-09', 110,1);


INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(217, 317, 64, '2026-03-08', '2026-03-11', 255,1),
(201, 6, 2, '2026-03-20', '2026-03-26', 600,1),
(217, 143, 29, '2025-10-08', '2025-10-10', 200,1),
(77, 307, 62, '2026-08-03', '2026-08-08', 425,1),
(384, 300, 60, '2024-07-24', '2024-07-26', 260,1),
(117, 137, 28, '2026-01-08', '2026-01-15', 700,1),
(131, 197, 40, '2026-06-04', '2026-06-10', 600,1),
(238, 400, 80, '2025-06-08', '2025-06-12', 480,1),
(39, 290, 58, '2026-06-08', '2026-06-10', 260,1),
(165, 152, 31, '2025-03-30', '2025-04-02', 300,1);
INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(280, 473, 95, '2025-01-11', '2025-01-15', 360,1),
(393, 82, 17, '2024-09-09', '2024-09-14', 500,1),
(55, 46, 10, '2024-06-14', '2024-06-20', 600,1),
(236, 302, 61, '2026-09-05', '2026-09-08', 255,1),
(359, 445, 89, '2025-09-08', '2025-09-12', 440,1),
(309, 74, 15, '2024-09-17', '2024-09-23', 900,1),
(394, 276, 56, '2025-10-06', '2025-10-08', 170,1),
(129, 427, 86, '2025-08-31', '2025-09-06', 510,1),
(165, 36, 8, '2024-04-18', '2024-04-25', 700,1),
(389, 254, 51, '2026-06-13', '2026-06-17', 440,1);


INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(324, 459, 92, '2025-01-23', '2025-01-30', 770,1),
(44, 474, 95, '2024-02-15', '2024-02-19', 400,1),
(286, 45, 9, '2024-10-14', '2024-10-16', 300,1),
(272, 467, 94, '2025-05-17', '2025-05-22', 425,1),
(221, 479, 96, '2024-04-18', '2024-04-23', 550,1),
(63, 508, 102, '2024-10-26', '2024-10-27', 90,1),
(314, 477, 96, '2025-01-12', '2025-01-14', 170,1),
(324, 157, 32, '2026-04-09', '2026-04-11', 200,1),
(407, 425, 85, '2026-04-16', '2026-04-22', 660,1),
(295, 196, 40, '2026-09-13', '2026-09-17', 400,1);
INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(332, 126, 26, '2026-01-18', '2026-01-23', 500,1),
(265, 483, 97, '2025-01-03', '2025-01-08', 450,1),
(389, 373, 75, '2025-03-27', '2025-03-28', 90,1),
(288, 176, 36, '2025-05-22', '2025-05-24', 200,1),
(34, 255, 51, '2025-11-17', '2025-11-20', 360,1),
(174, 247, 50, '2026-08-26', '2026-08-29', 285,1),
(336, 244, 49, '2025-10-16', '2025-10-21', 550,1),
(153, 326, 66, '2024-12-31', '2025-01-02', 150,1),
(179, 142, 29, '2025-03-21', '2025-03-28', 700,1),
(254, 230, 46, '2024-03-06', '2024-03-11', 650,1);


INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(29, 196, 40, '2025-01-11', '2025-01-18', 700,1),
(385, 108, 22, '2025-07-01', '2025-07-04', 300,1),
(70, 427, 86, '2024-01-02', '2024-01-03', 85,1),
(111, 316, 64, '2024-10-01', '2024-10-04', 225,1),
(36, 136, 28, '2025-04-03', '2025-04-05', 200,1),
(389, 183, 37, '2026-05-26', '2026-06-02', 700,1),
(141, 93, 19, '2024-03-28', '2024-04-02', 500,1),
(63, 368, 74, '2024-03-22', '2024-03-25', 270,1),
(222, 117, 24, '2024-12-13', '2024-12-18', 500,1),
(199, 90, 18, '2025-09-29', '2025-10-01', 300,1);
INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(23, 27, 6, '2026-06-04', '2026-06-11', 700,1),
(266, 450, 90, '2026-05-16', '2026-05-23', 840,1),
(383, 388, 78, '2024-09-30', '2024-10-03', 270,1),
(49, 85, 17, '2025-10-08', '2025-10-09', 150,1),
(157, 453, 91, '2026-01-05', '2026-01-09', 360,1),
(409, 302, 61, '2024-08-08', '2024-08-14', 510,1),
(330, 481, 97, '2026-07-07', '2026-07-12', 400,1),
(35, 40, 8, '2025-02-23', '2025-03-02', 1050,1),
(195, 264, 53, '2025-02-12', '2025-02-19', 770,1),
(73, 47, 10, '2025-12-25', '2025-12-27', 200,1);
INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(206, 210, 42, '2024-06-28', '2024-06-30', 260,1),
(218, 94, 19, '2024-10-19', '2024-10-22', 450,1),
(52, 469, 94, '2024-01-22', '2024-01-23', 110,1),
(248, 506, 102, '2024-10-16', '2024-10-17', 75,1),
(294, 151, 31, '2026-04-29', '2026-05-01', 200,1),
(25, 155, 31, '2025-08-13', '2025-08-18', 750,1),
(156, 398, 80, '2026-05-07', '2026-05-12', 450,1),
(33, 102, 21, '2024-04-17', '2024-04-23', 600,1),
(82, 339, 68, '2024-04-29', '2024-04-30', 110,1),
(260, 163, 33, '2025-10-06', '2025-10-09', 300,1);


INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(408, 27, 6, '2025-03-17', '2025-03-22', 500,1),
(247, 400, 80, '2024-05-18', '2024-05-19', 120,1),
(325, 418, 84, '2024-08-23', '2024-08-26', 270,1),
(231, 35, 7, '2024-04-18', '2024-04-25', 1050,1),
(84, 424, 85, '2024-05-11', '2024-05-13', 200,1),
(182, 65, 13, '2025-07-18', '2025-07-24', 900,1),
(367, 441, 89, '2025-05-11', '2025-05-13', 160,1),
(369, 209, 42, '2024-03-12', '2024-03-16', 480,1),
(134, 500, 100, '2024-07-25', '2024-07-29', 480,1),
(177, 201, 41, '2025-04-24', '2025-04-29', 450,1);
INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(333, 502, 101, '2025-09-30', '2025-10-04', 340,1),
(287, 427, 86, '2026-06-25', '2026-06-28', 255,1),
(252, 277, 56, '2026-03-05', '2026-03-10', 475,1),
(223, 389, 78, '2024-08-12', '2024-08-18', 660,1),
(92, 274, 55, '2024-10-18', '2024-10-24', 660,1),
(92, 38, 8, '2024-06-04', '2024-06-05', 100,1),
(386, 113, 23, '2024-04-12', '2024-04-15', 300,1),
(371, 468, 94, '2024-12-03', '2024-12-09', 540,1),
(219, 458, 92, '2024-10-20', '2024-10-27', 630,1),
(212, 277, 56, '2025-01-24', '2025-01-30', 570,1);
INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(134, 177, 36, '2026-06-29', '2026-07-03', 400,1),
(293, 501, 101, '2025-05-27', '2025-05-30', 240,1),
(92, 13, 3, '2025-12-31', '2026-01-03', 300,1),
(356, 447, 90, '2024-12-23', '2024-12-25', 170,1),
(288, 73, 15, '2026-04-26', '2026-05-02', 600,1),
(384, 339, 68, '2025-03-05', '2025-03-09', 440,1),
(367, 227, 46, '2026-07-06', '2026-07-09', 285,1),
(130, 181, 37, '2026-02-22', '2026-03-01', 700,1),
(230, 348, 70, '2025-12-28', '2025-12-30', 180,1),
(142, 47, 10, '2025-03-17', '2025-03-24', 700,1);

INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(223, 68, 14, '2026-07-02', '2026-07-04', 200,1),
(162, 467, 94, '2025-02-16', '2025-02-17', 85,1),
(375, 459, 92, '2025-07-19', '2025-07-23', 440,1),
(327, 60, 12, '2024-08-21', '2024-08-26', 750,1),
(50, 247, 50, '2026-05-19', '2026-05-25', 570,1),
(238, 482, 97, '2025-07-08', '2025-07-12', 340,1),
(284, 338, 68, '2026-04-01', '2026-04-07', 540,1),
(100, 28, 6, '2024-02-28', '2024-02-29', 100,1),
(399, 254, 51, '2024-10-09', '2024-10-13', 440,1),
(31, 347, 70, '2026-01-20', '2026-01-21', 85,1);
INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(295, 192, 39, '2025-03-18', '2025-03-24', 600,1),
(289, 29, 6, '2024-04-03', '2024-04-09', 900,1),
(394, 224, 45, '2024-11-20', '2024-11-23', 330,1),
(58, 434, 87, '2025-12-05', '2025-12-07', 200,1),
(190, 3, 1, '2025-05-05', '2025-05-09', 400,1),
(363, 507, 102, '2025-10-22', '2025-10-29', 595,1),
(256, 276, 56, '2025-10-20', '2025-10-27', 595,1),
(118, 109, 22, '2026-04-23', '2026-04-30', 1050,1),
(397, 322, 65, '2025-05-10', '2025-05-17', 595,1),
(217, 345, 69, '2024-04-14', '2024-04-19', 550,1);
INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(340, 86, 18, '2025-11-04', '2025-11-09', 500,1),
(117, 275, 55, '2026-07-17', '2026-07-23', 720,1),
(37, 292, 59, '2025-02-14', '2025-02-19', 475,1),
(58, 46, 10, '2025-10-30', '2025-11-01', 200,1),
(303, 459, 92, '2024-02-19', '2024-02-21', 220,1),
(121, 325, 65, '2025-12-19', '2025-12-26', 770,1),
(350, 191, 39, '2025-06-22', '2025-06-25', 300,1),
(32, 222, 45, '2024-03-17', '2024-03-21', 380,1),
(227, 6, 2, '2025-10-01', '2025-10-06', 500,1),
(408, 325, 65, '2026-09-11', '2026-09-18', 770,1);




INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(253, 418, 84, '2026-07-06', '2026-07-07', 90,1),
(302, 137, 28, '2025-02-21', '2025-02-26', 500,1),
(10, 355, 71, '2024-01-11', '2024-01-17', 660,1),
(208, 423, 85, '2024-04-19', '2024-04-25', 540,1),
(86, 294, 59, '2026-02-28', '2026-03-04', 440,1),
(146, 218, 44, '2024-07-06', '2024-07-10', 400,1),
(110, 42, 9, '2025-10-12', '2025-10-16', 400,1),
(375, 469, 94, '2026-05-01', '2026-05-06', 550,1),
(331, 153, 31, '2024-05-10', '2024-05-11', 100,1),
(83, 225, 45, '2025-08-10', '2025-08-17', 840,1);
INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(10, 110, 22, '2025-07-05', '2025-07-06', 150,1),
(47, 199, 40, '2024-04-24', '2024-05-01', 1050,1),
(63, 199, 40, '2026-03-05', '2026-03-07', 300,1),
(24, 493, 99, '2026-01-20', '2026-01-22', 180,1),
(140, 296, 60, '2024-06-02', '2024-06-05', 255,1),
(288, 58, 12, '2025-06-17', '2025-06-22', 500,1),
(226, 51, 11, '2025-01-06', '2025-01-13', 700,1),
(392, 34, 7, '2025-06-02', '2025-06-05', 450,1),
(390, 400, 80, '2025-04-12', '2025-04-16', 480,1),
(234, 449, 90, '2026-08-04', '2026-08-05', 110,1);
INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(91, 124, 25, '2024-03-26', '2024-04-02', 1050,1),
(266, 440, 88, '2025-06-24', '2025-06-28', 480,1),
(379, 24, 5, '2026-09-11', '2026-09-15', 600,1),
(339, 380, 76, '2025-10-01', '2025-10-03', 240,1),
(90, 122, 25, '2025-03-07', '2025-03-10', 300,1),
(51, 311, 63, '2024-05-06', '2024-05-08', 160,1),
(55, 51, 11, '2026-01-14', '2026-01-15', 100,1),
(82, 181, 37, '2024-09-18', '2024-09-24', 600,1),
(14, 53, 11, '2025-03-26', '2025-03-31', 500,1),
(164, 216, 44, '2025-04-02', '2025-04-06', 340,1);

INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(301, 446, 90, '2024-08-22', '2024-08-23', 75,1),
(319, 79, 16, '2026-08-24', '2026-08-26', 300,1),
(3, 168, 34, '2025-06-30', '2025-07-06', 600,1),
(313, 334, 67, '2026-05-02', '2026-05-06', 400,1),
(255, 47, 10, '2026-05-04', '2026-05-11', 700,1),
(187, 333, 67, '2024-05-21', '2024-05-28', 630,1),
(211, 423, 85, '2024-03-26', '2024-03-28', 180,1),
(102, 89, 18, '2025-06-19', '2025-06-23', 600,1),
(330, 261, 53, '2024-07-23', '2024-07-25', 180,1),
(47, 496, 100, '2024-01-17', '2024-01-20', 225,1);
INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(145, 236, 48, '2025-03-18', '2025-03-20', 170,1),
(3, 144, 29, '2026-03-22', '2026-03-29', 1050,1),
(112, 502, 101, '2025-12-28', '2025-12-30', 170,1),
(371, 213, 43, '2024-10-19', '2024-10-24', 500,1),
(208, 336, 68, '2025-01-26', '2025-02-01', 450,1),
(209, 218, 44, '2024-11-01', '2024-11-04', 300,1),
(176, 100, 20, '2026-03-07', '2026-03-11', 600,1),
(171, 164, 33, '2024-03-01', '2024-03-07', 900,1),
(93, 278, 56, '2025-05-23', '2025-05-30', 700,1),
(87, 158, 32, '2024-08-26', '2024-08-27', 100,1);




INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(304, 288, 58, '2025-06-25', '2025-06-30', 500,1),
(261, 334, 67, '2025-07-16', '2025-07-23', 700,1),
(376, 439, 88, '2026-05-27', '2026-06-03', 770,1),
(140, 275, 55, '2025-05-27', '2025-06-02', 720,1),
(388, 246, 50, '2024-06-27', '2024-06-29', 170,1),
(360, 502, 101, '2026-05-29', '2026-06-01', 255,1),
(127, 494, 99, '2026-01-05', '2026-01-10', 500,1),
(224, 127, 26, '2024-05-09', '2024-05-12', 300,1),
(53, 373, 75, '2024-12-04', '2024-12-10', 540,1),
(166, 455, 91, '2025-08-07', '2025-08-08', 110,1);










INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(401, 500, 100, '2024-06-18', '2024-06-19', 120,1),
(232, 260, 52, '2024-04-10', '2024-04-16', 780,1),
(160, 343, 69, '2024-05-25', '2024-05-31', 540,1),
(10, 424, 85, '2025-04-02', '2025-04-09', 700,1),
(366, 272, 55, '2026-02-08', '2026-02-13', 475,1),
(193, 121, 25, '2025-10-08', '2025-10-14', 600,1),
(272, 23, 5, '2026-06-17', '2026-06-23', 600,1),
(337, 509, 102, '2024-03-22', '2024-03-25', 330,1),
(136, 460, 92, '2024-03-28', '2024-03-31', 360,1),
(70, 209, 42, '2024-02-09', '2024-02-10', 120,1);
INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(64, 326, 66, '2025-07-26', '2025-07-29', 225,1),
(113, 377, 76, '2025-03-19', '2025-03-23', 340,1),
(95, 93, 19, '2024-10-06', '2024-10-09', 300,1),
(136, 427, 86, '2024-08-18', '2024-08-24', 510,1),
(64, 430, 86, '2026-06-29', '2026-07-02', 360,1),
(96, 191, 39, '2024-01-17', '2024-01-20', 300,1),
(5, 245, 49, '2025-07-02', '2025-07-07', 600,1),
(67, 285, 57, '2024-04-17', '2024-04-21', 480,1),
(102, 432, 87, '2025-08-23', '2025-08-24', 85,1),
(275, 241, 49, '2024-03-25', '2024-03-29', 360,1);


INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(298, 174, 35, '2024-08-25', '2024-09-01', 1050,1),
(89, 371, 75, '2024-04-19', '2024-04-23', 320,1),
(301, 483, 97, '2026-09-10', '2026-09-12', 180,1),
(380, 96, 20, '2024-09-24', '2024-09-25', 100,1),
(61, 45, 9, '2026-03-21', '2026-03-25', 600,1),
(187, 277, 56, '2025-01-02', '2025-01-09', 665,1),
(357, 36, 8, '2024-11-13', '2024-11-14', 100,1),
(373, 62, 13, '2025-12-01', '2025-12-05', 400,1),
(98, 369, 74, '2024-01-12', '2024-01-15', 330,1),
(267, 397, 80, '2026-05-03', '2026-05-07', 340,1);
INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(293, 46, 10, '2025-04-03', '2025-04-04', 100,1),
(373, 235, 47, '2025-11-04', '2025-11-10', 720,1),
(115, 163, 33, '2025-08-23', '2025-08-30', 700,1),
(351, 250, 50, '2024-10-14', '2024-10-17', 390,1),
(123, 233, 47, '2025-10-20', '2025-10-21', 100,1),
(47, 305, 61, '2024-09-14', '2024-09-20', 660,1),
(391, 400, 80, '2025-04-24', '2025-04-25', 120,1),
(364, 391, 79, '2024-01-05', '2024-01-06', 80,1),
(377, 267, 54, '2026-01-24', '2026-01-26', 190,1),
(131, 501, 101, '2024-01-14', '2024-01-15', 80,1);

INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(199, 14, 3, '2026-05-11', '2026-05-17', 900,1),
(212, 363, 73, '2025-01-31', '2025-02-05', 450,1),
(195, 118, 24, '2025-10-24', '2025-10-30', 600,1),
(82, 264, 53, '2025-01-20', '2025-01-25', 550,1),
(117, 231, 47, '2025-08-04', '2025-08-06', 180,1),
(301, 67, 14, '2024-03-29', '2024-03-31', 200,1),
(91, 365, 73, '2024-02-14', '2024-02-18', 440,1),
(258, 243, 49, '2026-01-11', '2026-01-14', 300,1),
(336, 288, 58, '2025-09-16', '2025-09-17', 100,1),
(344, 171, 35, '2024-07-19', '2024-07-24', 500,1);

INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(97, 494, 99, '2026-08-30', '2026-09-01', 200,1),
(399, 195, 39, '2025-05-15', '2025-05-18', 450,1),
(139, 451, 91, '2024-07-08', '2024-07-10', 160,1),
(62, 95, 19, '2025-09-06', '2025-09-09', 450,1),
(199, 147, 30, '2025-02-07', '2025-02-12', 500,1),
(16, 48, 10, '2024-01-23', '2024-01-25', 200,1),
(117, 316, 64, '2024-09-18', '2024-09-19', 75,1),
(173, 241, 49, '2024-10-20', '2024-10-22', 180,1),
(129, 3, 1, '2026-07-29', '2026-07-30', 100,1),
(137, 510, 102, '2025-06-12', '2025-06-18', 720,1);


INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(141, 21, 5, '2026-06-28', '2026-07-02', 400,1),
(43, 192, 39, '2024-04-02', '2024-04-07', 500,1),
(281, 223, 45, '2025-06-14', '2025-06-20', 600,1),
(14, 61, 13, '2025-09-09', '2025-09-10', 100,1),
(250, 371, 75, '2024-05-27', '2024-05-28', 80,1),
(133, 457, 92, '2026-02-21', '2026-02-23', 170,1),
(68, 413, 83, '2026-07-06', '2026-07-11', 450,1),
(8, 46, 10, '2025-12-26', '2026-01-02', 700,1),
(253, 136, 28, '2025-09-14', '2025-09-19', 500,1),
(29, 226, 46, '2025-10-13', '2025-10-20', 595,1);
INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(403, 82, 17, '2025-10-20', '2025-10-27', 700,1),
(292, 195, 39, '2025-02-01', '2025-02-02', 150,1),
(338, 243, 49, '2024-04-06', '2024-04-12', 600,1),
(88, 137, 28, '2024-07-23', '2024-07-29', 600,1),
(141, 169, 34, '2026-06-02', '2026-06-08', 900,1),
(274, 383, 77, '2025-07-30', '2025-08-04', 450,1),
(204, 150, 30, '2025-06-18', '2025-06-23', 750,1),
(12, 248, 50, '2026-08-01', '2026-08-06', 500,1),
(196, 34, 7, '2025-11-28', '2025-12-02', 600,1),
(244, 108, 22, '2025-08-09', '2025-08-15', 600,1);
INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(396, 448, 90, '2024-12-17', '2024-12-19', 180,1),
(217, 415, 83, '2024-10-25', '2024-10-29', 440,1),
(249, 138, 28, '2025-11-28', '2025-12-04', 600,1),
(223, 188, 38, '2024-05-20', '2024-05-23', 300,1),
(111, 172, 35, '2025-07-24', '2025-07-26', 200,1),
(96, 279, 56, '2025-11-06', '2025-11-07', 120,1),
(313, 19, 4, '2025-03-25', '2025-03-30', 750,1),
(180, 248, 50, '2024-05-04', '2024-05-05', 100,1),
(205, 201, 41, '2025-04-04', '2025-04-07', 270,1),
(191, 113, 23, '2024-01-05', '2024-01-10', 500,1);
INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(41, 239, 48, '2025-04-27', '2025-04-29', 240,1),
(216, 191, 39, '2025-05-11', '2025-05-15', 400,1),
(170, 340, 68, '2024-05-30', '2024-05-31', 120,1),
(40, 420, 84, '2025-02-17', '2025-02-24', 840,1),
(250, 33, 7, '2024-04-27', '2024-05-04', 700,1),
(306, 116, 24, '2024-01-23', '2024-01-27', 400,1),
(235, 169, 34, '2026-08-30', '2026-09-04', 750,1),
(251, 463, 93, '2024-03-22', '2024-03-26', 360,1),
(372, 365, 73, '2025-01-02', '2025-01-04', 220,1),
(259, 31, 7, '2025-02-23', '2025-03-02', 700,1);
INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(398, 485, 97, '2025-07-10', '2025-07-16', 660,1),
(311, 324, 65, '2024-12-24', '2024-12-26', 200,1),
(255, 339, 68, '2024-04-04', '2024-04-10', 660,1),
(243, 177, 36, '2025-03-05', '2025-03-08', 300,1),
(268, 365, 73, '2025-09-22', '2025-09-25', 330,1),
(252, 227, 46, '2025-10-31', '2025-11-04', 380,1),
(315, 188, 38, '2024-06-17', '2024-06-22', 500,1),
(377, 212, 43, '2026-09-02', '2026-09-05', 285,1),
(74, 505, 101, '2026-04-18', '2026-04-19', 110,1),
(412, 87, 18, '2024-05-24', '2024-05-27', 300,1);
INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(134, 211, 43, '2025-12-30', '2026-01-05', 540,1),
(111, 147, 30, '2026-09-15', '2026-09-16', 100,1),
(149, 10, 2, '2026-02-03', '2026-02-06', 450,1),
(123, 329, 66, '2024-12-09', '2024-12-10', 110,1),
(126, 383, 77, '2025-10-25', '2025-10-30', 450,1),
(343, 243, 49, '2025-05-25', '2025-05-31', 600,1),
(189, 469, 94, '2026-06-16', '2026-06-20', 440,1),
(228, 34, 7, '2024-09-02', '2024-09-03', 150,1),
(22, 379, 76, '2025-11-21', '2025-11-24', 330,1),
(185, 291, 59, '2024-03-04', '2024-03-08', 360,1);
INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(193, 136, 28, '2025-05-24', '2025-05-25', 100,1),
(257, 235, 47, '2024-03-15', '2024-03-22', 840,1),
(215, 452, 91, '2024-06-27', '2024-06-29', 170,1),
(357, 25, 5, '2026-05-29', '2026-06-04', 900,1),
(229, 219, 44, '2024-07-10', '2024-07-11', 120,1),
(388, 416, 84, '2026-08-31', '2026-09-06', 450,1),
(244, 373, 75, '2026-01-07', '2026-01-12', 450,1),
(220, 457, 92, '2025-08-17', '2025-08-18', 85,1),
(361, 132, 27, '2025-01-14', '2025-01-16', 200,1),
(334, 160, 32, '2026-06-08', '2026-06-11', 450,1);

INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(87, 489, 98, '2025-01-08', '2025-01-14', 660,1),
(70, 6, 2, '2025-02-02', '2025-02-08', 600,1),
(271, 379, 76, '2025-03-27', '2025-03-28', 110,1),
(175, 338, 68, '2025-08-13', '2025-08-19', 540,1),
(276, 302, 61, '2024-08-19', '2024-08-25', 510,1),
(173, 22, 5, '2026-01-04', '2026-01-06', 200,1),
(227, 466, 94, '2024-10-30', '2024-11-01', 150,1),
(107, 98, 20, '2025-06-03', '2025-06-04', 100,1),
(246, 405, 81, '2026-01-26', '2026-01-29', 330,1),
(359, 202, 41, '2024-08-02', '2024-08-04', 190,1);
INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(246, 195, 39, '2024-08-17', '2024-08-21', 600,1),
(385, 275, 55, '2025-09-29', '2025-09-30', 120,1),
(242, 10, 2, '2025-01-31', '2025-02-06', 900,1),
(304, 446, 90, '2026-07-09', '2026-07-15', 450,1),
(305, 476, 96, '2024-10-20', '2024-10-24', 300,1),
(102, 275, 55, '2024-12-01', '2024-12-05', 480,1),
(374, 383, 77, '2026-01-23', '2026-01-29', 540,1),
(192, 235, 47, '2024-05-21', '2024-05-25', 480,1),
(394, 367, 74, '2026-02-02', '2026-02-03', 85,1),
(390, 358, 72, '2024-04-29', '2024-05-06', 630,1);
INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(388, 335, 67, '2024-08-15', '2024-08-18', 330,1),
(223, 10, 2, '2024-07-23', '2024-07-27', 600,1),
(48, 43, 9, '2025-04-04', '2025-04-08', 400,1),
(51, 164, 33, '2025-08-01', '2025-08-03', 300,1),
(22, 427, 86, '2025-10-03', '2025-10-10', 595,1),
(278, 506, 102, '2025-08-11', '2025-08-14', 225,1),
(407, 442, 89, '2025-07-23', '2025-07-29', 510,1),
(303, 90, 18, '2025-06-24', '2025-06-27', 450,1),
(143, 4, 1, '2026-09-13', '2026-09-20', 1050,1),
(65, 30, 6, '2026-08-08', '2026-08-14', 900,1);


INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(364, 309, 62, '2026-07-11', '2026-07-18', 770,1),
(373, 454, 91, '2024-03-19', '2024-03-25', 600,1),
(228, 209, 42, '2025-05-29', '2025-06-04', 720,1),
(29, 194, 39, '2025-03-16', '2025-03-21', 750,1),
(56, 380, 76, '2024-05-25', '2024-05-31', 720,1),
(324, 71, 15, '2026-02-09', '2026-02-15', 600,1),
(338, 443, 89, '2026-04-07', '2026-04-11', 360,1),
(27, 428, 86, '2025-12-11', '2025-12-13', 180,1),
(387, 502, 101, '2024-08-25', '2024-08-26', 85,1),
(19, 274, 55, '2024-02-03', '2024-02-05', 220,1);
INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(222, 460, 92, '2025-09-18', '2025-09-23', 600,1),
(193, 111, 23, '2025-06-30', '2025-07-06', 600,1),
(320, 348, 70, '2026-07-20', '2026-07-23', 270,1),
(79, 404, 81, '2024-12-05', '2024-12-08', 300,1),
(249, 365, 73, '2024-10-16', '2024-10-20', 440,1),
(35, 233, 47, '2024-09-07', '2024-09-10', 300,1),
(102, 173, 35, '2025-09-03', '2025-09-10', 700,1),
(286, 216, 44, '2026-01-31', '2026-02-01', 85,1),
(287, 298, 60, '2026-01-16', '2026-01-18', 200,1),
(326, 374, 75, '2025-01-14', '2025-01-16', 200,1);
INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(334, 390, 78, '2024-08-27', '2024-08-31', 480,1),
(179, 143, 29, '2025-11-13', '2025-11-14', 100,1),
(279, 401, 81, '2024-09-20', '2024-09-26', 480,1),
(190, 9, 2, '2024-02-12', '2024-02-14', 300,1),
(139, 120, 24, '2025-07-11', '2025-07-14', 450,1),
(193, 498, 100, '2026-07-09', '2026-07-16', 630,1),
(236, 454, 91, '2024-04-28', '2024-04-29', 100,1),
(98, 342, 69, '2025-10-18', '2025-10-24', 510,1),
(124, 368, 74, '2026-06-03', '2026-06-06', 270,1),
(186, 460, 92, '2024-11-21', '2024-11-26', 600,1);
INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(159, 471, 95, '2024-08-30', '2024-09-02', 240,1),
(173, 251, 51, '2024-08-04', '2024-08-05', 90,1),
(6, 426, 86, '2026-05-27', '2026-05-28', 75,1),
(379, 330, 66, '2025-06-30', '2025-07-02', 240,1),
(244, 20, 4, '2024-04-20', '2024-04-27', 1050,1),
(89, 263, 53, '2025-03-08', '2025-03-11', 300,1),
(255, 3, 1, '2024-11-13', '2024-11-17', 400,1),
(272, 6, 2, '2025-03-15', '2025-03-22', 700,1),
(184, 247, 50, '2025-04-23', '2025-04-24', 95,1),
(13, 160, 32, '2025-10-11', '2025-10-12', 150,1);
INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(40, 196, 40, '2025-06-22', '2025-06-24', 200,1),
(249, 181, 37, '2024-08-27', '2024-09-03', 700,1),
(398, 46, 10, '2024-04-07', '2024-04-09', 200,1),
(183, 195, 39, '2026-01-12', '2026-01-15', 450,1),
(242, 251, 51, '2025-12-24', '2025-12-29', 450,1),
(108, 377, 76, '2024-02-24', '2024-02-25', 85,1),
(272, 68, 14, '2024-12-30', '2025-01-05', 600,1),
(171, 43, 9, '2025-09-02', '2025-09-06', 400,1),
(149, 204, 41, '2026-02-09', '2026-02-12', 330,1),
(247, 204, 41, '2024-11-03', '2024-11-05', 220,1);
INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(71, 358, 72, '2025-10-16', '2025-10-17', 90,1),
(79, 53, 11, '2024-06-06', '2024-06-10', 400,1),
(65, 377, 76, '2025-05-06', '2025-05-07', 85,1),
(282, 342, 69, '2025-04-03', '2025-04-04', 85,1),
(294, 13, 3, '2025-01-27', '2025-02-03', 700,1),
(216, 178, 36, '2024-03-11', '2024-03-17', 600,1),
(207, 163, 33, '2025-12-08', '2025-12-13', 500,1),
(57, 67, 14, '2025-04-15', '2025-04-19', 400,1),
(110, 484, 97, '2025-02-19', '2025-02-20', 100,1),
(260, 60, 12, '2024-02-07', '2024-02-11', 600,1);


INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(241, 503, 101, '2025-06-02', '2025-06-05', 270,1),
(52, 208, 42, '2025-08-18', '2025-08-21', 300,1),
(337, 422, 85, '2024-08-09', '2024-08-16', 595,1),
(223, 252, 51, '2026-05-23', '2026-05-28', 475,1),
(390, 193, 39, '2026-05-29', '2026-06-04', 600,1),
(369, 13, 3, '2024-03-17', '2024-03-18', 100,1),
(314, 294, 59, '2024-04-23', '2024-04-30', 770,1),
(78, 48, 10, '2024-08-21', '2024-08-27', 600,1),
(53, 329, 66, '2025-02-11', '2025-02-12', 110,1),
(360, 191, 39, '2026-08-07', '2026-08-09', 200,1);









INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(284, 341, 69, '2024-10-04', '2024-10-06', 160,1),
(410, 380, 76, '2025-12-31', '2026-01-05', 600,1),
(379, 329, 66, '2025-06-03', '2025-06-10', 770,1),
(170, 19, 4, '2025-02-04', '2025-02-07', 450,1),
(146, 228, 46, '2026-01-08', '2026-01-10', 200,1),
(350, 342, 69, '2026-06-28', '2026-07-05', 595,1),
(256, 145, 29, '2024-02-01', '2024-02-05', 600,1),
(16, 206, 42, '2024-11-05', '2024-11-11', 510,1),
(213, 158, 32, '2025-08-12', '2025-08-13', 100,1),
(93, 137, 28, '2025-12-30', '2026-01-02', 300,1);

INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(374, 189, 38, '2026-06-27', '2026-07-04', 1050,1),
(176, 415, 83, '2025-02-06', '2025-02-11', 550,1),
(388, 494, 99, '2025-06-05', '2025-06-09', 400,1),
(186, 223, 45, '2026-06-14', '2026-06-19', 500,1),
(112, 41, 9, '2026-07-07', '2026-07-14', 700,1),
(387, 410, 82, '2024-01-11', '2024-01-17', 720,1),
(359, 76, 16, '2026-07-22', '2026-07-25', 300,1),
(6, 17, 4, '2025-07-24', '2025-07-31', 700,1),
(151, 83, 17, '2026-06-28', '2026-07-02', 400,1),
(237, 116, 24, '2024-08-11', '2024-08-14', 300,1);



INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(375, 364, 73, '2026-02-15', '2026-02-19', 400,1),
(15, 68, 14, '2026-08-06', '2026-08-10', 400,1),
(34, 275, 55, '2026-08-03', '2026-08-06', 360,1),
(226, 73, 15, '2026-01-04', '2026-01-07', 300,1),
(174, 454, 91, '2024-04-10', '2024-04-13', 300,1),
(154, 271, 55, '2025-11-25', '2025-11-27', 180,1),
(245, 447, 90, '2024-06-15', '2024-06-18', 255,1),
(12, 73, 15, '2025-02-26', '2025-02-27', 100,1),
(105, 249, 50, '2025-12-30', '2026-01-03', 480,1),
(254, 413, 83, '2025-08-09', '2025-08-15', 540,1);
INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(145, 217, 44, '2024-02-15', '2024-02-19', 380,1),
(298, 198, 40, '2025-06-09', '2025-06-11', 200,1),
(188, 303, 61, '2024-03-30', '2024-03-31', 90,1),
(392, 192, 39, '2025-07-22', '2025-07-26', 400,1),
(342, 319, 64, '2025-08-29', '2025-09-03', 550,1),
(227, 168, 34, '2024-04-25', '2024-04-30', 500,1),
(177, 102, 21, '2026-09-04', '2026-09-09', 500,1),
(25, 149, 30, '2024-12-26', '2024-12-27', 150,1),
(102, 403, 81, '2025-03-12', '2025-03-15', 270,1),
(41, 16, 4, '2026-01-30', '2026-02-06', 700,1);
INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(405, 88, 18, '2025-01-30', '2025-02-01', 200,1),
(357, 191, 39, '2025-07-30', '2025-08-04', 500,1),
(201, 6, 2, '2024-07-08', '2024-07-09', 100,1),
(87, 44, 9, '2025-04-10', '2025-04-13', 450,1),
(329, 435, 87, '2025-01-29', '2025-01-30', 110,1),
(200, 389, 78, '2024-09-16', '2024-09-19', 330,1),
(73, 321, 65, '2025-05-09', '2025-05-13', 320,1),
(307, 39, 8, '2025-09-04', '2025-09-06', 300,1),
(372, 42, 9, '2025-06-07', '2025-06-13', 600,1),
(386, 44, 9, '2025-07-31', '2025-08-07', 1050,1);






INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(405, 13, 3, '2024-09-09', '2024-09-15', 600,1),
(230, 37, 8, '2025-09-24', '2025-09-29', 500,1),
(269, 477, 96, '2026-03-14', '2026-03-20', 510,1),
(217, 20, 4, '2024-12-20', '2024-12-26', 900,1),
(260, 12, 3, '2026-02-18', '2026-02-19', 100,1),
(286, 444, 89, '2026-08-04', '2026-08-09', 500,1),
(104, 147, 30, '2026-02-28', '2026-03-06', 600,1),
(315, 69, 14, '2026-01-07', '2026-01-14', 1050,1),
(322, 66, 14, '2024-07-11', '2024-07-15', 400,1),
(121, 38, 8, '2024-07-21', '2024-07-27', 600,1);
INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(349, 268, 54, '2025-04-22', '2025-04-27', 500,1),
(266, 448, 90, '2025-12-26', '2025-12-27', 90,1),
(307, 107, 22, '2024-03-07', '2024-03-14', 700,1),
(192, 238, 48, '2025-07-14', '2025-07-16', 200,1),
(311, 30, 6, '2026-04-04', '2026-04-09', 750,1),
(404, 321, 65, '2026-05-05', '2026-05-07', 160,1),
(332, 403, 81, '2024-07-21', '2024-07-22', 90,1),
(44, 458, 92, '2026-04-10', '2026-04-14', 360,1),
(55, 305, 61, '2024-07-11', '2024-07-14', 330,1),
(83, 69, 14, '2024-03-29', '2024-03-30', 150,1);
INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(296, 338, 68, '2024-06-12', '2024-06-14', 180,1),
(193, 69, 14, '2025-08-24', '2025-08-26', 300,1),
(96, 284, 57, '2026-06-24', '2026-06-28', 440,1),
(278, 109, 22, '2026-03-30', '2026-04-05', 900,1),
(152, 469, 94, '2026-05-17', '2026-05-19', 220,1),
(295, 400, 80, '2026-01-07', '2026-01-09', 240,1),
(270, 113, 23, '2026-06-02', '2026-06-09', 700,1),
(231, 439, 88, '2024-03-18', '2024-03-24', 660,1),
(65, 478, 96, '2025-04-22', '2025-04-25', 270,1),
(365, 10, 2, '2025-03-20', '2025-03-27', 1050,1);


INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(387, 459, 92, '2024-06-29', '2024-07-01', 220,1),
(384, 452, 91, '2024-03-29', '2024-04-04', 510,1),
(275, 389, 78, '2024-06-19', '2024-06-21', 220,1),
(174, 210, 42, '2024-06-11', '2024-06-15', 520,1),
(210, 36, 8, '2024-10-20', '2024-10-27', 700,1),
(27, 38, 8, '2026-03-05', '2026-03-11', 600,1),
(245, 36, 8, '2025-08-05', '2025-08-12', 700,1),
(39, 431, 87, '2026-09-15', '2026-09-20', 400,1),
(249, 338, 68, '2024-01-15', '2024-01-21', 540,1),
(189, 488, 98, '2026-03-01', '2026-03-04', 270,1);
INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(336, 257, 52, '2024-09-12', '2024-09-19', 665,1),
(313, 461, 93, '2026-09-14', '2026-09-21', 560,1),
(102, 28, 6, '2026-08-16', '2026-08-20', 400,1),
(244, 470, 94, '2024-11-28', '2024-12-03', 600,1),
(200, 332, 67, '2024-05-08', '2024-05-12', 340,1),
(150, 228, 46, '2025-12-18', '2025-12-23', 500,1),
(345, 73, 15, '2024-08-07', '2024-08-12', 500,1),
(373, 455, 91, '2024-01-12', '2024-01-13', 110,1),
(32, 7, 2, '2024-03-17', '2024-03-22', 500,1),
(209, 504, 101, '2024-03-09', '2024-03-14', 500,1);
INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(58, 366, 74, '2024-04-15', '2024-04-18', 225,1),
(87, 230, 46, '2026-01-02', '2026-01-08', 780,1),
(187, 51, 11, '2025-10-25', '2025-10-27', 200,1),
(134, 227, 46, '2026-02-04', '2026-02-10', 570,1),
(121, 430, 86, '2025-05-29', '2025-06-01', 360,1),
(231, 441, 89, '2026-03-12', '2026-03-19', 560,1),
(409, 49, 10, '2024-04-12', '2024-04-13', 150,1),
(57, 233, 47, '2024-01-13', '2024-01-20', 700,1),
(98, 101, 21, '2026-03-12', '2026-03-13', 100,1),
(302, 363, 73, '2025-11-10', '2025-11-15', 450,1);
INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(350, 433, 87, '2026-01-16', '2026-01-17', 90,1),
(371, 19, 4, '2025-06-03', '2025-06-07', 600,1),
(355, 326, 66, '2024-03-01', '2024-03-07', 450,1),
(204, 84, 17, '2026-02-05', '2026-02-09', 600,1),
(152, 172, 35, '2024-09-25', '2024-09-28', 300,1),
(53, 234, 47, '2025-08-05', '2025-08-06', 110,1),
(306, 454, 91, '2025-02-03', '2025-02-05', 200,1),
(278, 475, 95, '2026-08-15', '2026-08-22', 770,1),
(99, 141, 29, '2026-04-05', '2026-04-11', 600,1),
(334, 366, 74, '2025-10-26', '2025-11-02', 525,1);


INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(138, 101, 21, '2025-12-08', '2025-12-10', 200,1),
(161, 332, 67, '2025-03-21', '2025-03-26', 425,1),
(89, 131, 27, '2024-02-10', '2024-02-15', 500,1),
(190, 330, 66, '2024-07-28', '2024-08-02', 600,1),
(86, 169, 34, '2026-05-24', '2026-05-30', 900,1),
(6, 393, 79, '2024-04-02', '2024-04-03', 90,1),
(97, 429, 86, '2025-06-24', '2025-06-28', 440,1),
(262, 437, 88, '2025-10-07', '2025-10-13', 510,1),
(396, 424, 85, '2024-08-12', '2024-08-19', 700,1),
(114, 183, 37, '2025-10-11', '2025-10-12', 100,1);
INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(116, 55, 11, '2025-09-23', '2025-09-28', 750,1),
(225, 440, 88, '2024-11-07', '2024-11-10', 360,1),
(10, 375, 75, '2024-11-09', '2024-11-13', 440,1),
(197, 491, 99, '2026-01-07', '2026-01-13', 480,1),
(404, 421, 85, '2024-05-03', '2024-05-09', 480,1),
(304, 395, 79, '2026-04-12', '2026-04-18', 660,1),
(345, 118, 24, '2024-05-27', '2024-05-30', 300,1),
(31, 388, 78, '2024-02-26', '2024-03-04', 630,1),
(114, 220, 44, '2025-09-01', '2025-09-08', 910,1),
(46, 510, 102, '2025-10-24', '2025-10-30', 720,1);
INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(379, 338, 68, '2026-02-23', '2026-03-01', 540,1),
(58, 284, 57, '2025-03-24', '2025-03-28', 440,1),
(105, 399, 80, '2024-03-21', '2024-03-24', 330,1),
(394, 298, 60, '2024-07-17', '2024-07-24', 700,1),
(272, 243, 49, '2024-11-30', '2024-12-05', 500,1),
(183, 124, 25, '2024-02-05', '2024-02-07', 300,1),
(157, 478, 96, '2024-08-19', '2024-08-22', 270,1),
(304, 506, 102, '2026-08-06', '2026-08-09', 225,1),
(228, 52, 11, '2024-02-05', '2024-02-12', 700,1),
(152, 510, 102, '2025-05-03', '2025-05-07', 480,1);


INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(238, 458, 92, '2024-12-01', '2024-12-06', 450,1),
(121, 11, 3, '2025-05-31', '2025-06-01', 100,1),
(190, 104, 21, '2026-08-02', '2026-08-03', 150,1),
(399, 333, 67, '2024-07-26', '2024-07-28', 180,1),
(397, 222, 45, '2025-04-21', '2025-04-28', 665,1),
(67, 116, 24, '2026-02-27', '2026-03-01', 200,1),
(214, 191, 39, '2026-06-08', '2026-06-11', 300,1),
(98, 163, 33, '2025-03-20', '2025-03-23', 300,1),
(142, 257, 52, '2024-10-21', '2024-10-23', 190,1),
(28, 242, 49, '2024-09-06', '2024-09-09', 285,1);

INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(75, 442, 89, '2025-02-21', '2025-02-24', 255,1),
(212, 93, 19, '2024-03-05', '2024-03-11', 600,1),
(254, 335, 67, '2025-05-31', '2025-06-04', 440,1),
(109, 122, 25, '2024-08-10', '2024-08-13', 300,1),
(181, 9, 2, '2025-08-01', '2025-08-07', 900,1),
(77, 122, 25, '2026-02-15', '2026-02-16', 100,1),
(82, 377, 76, '2026-05-22', '2026-05-23', 85,1),
(324, 96, 20, '2025-12-25', '2025-12-30', 500,1),
(96, 145, 29, '2026-06-22', '2026-06-24', 300,1),
(410, 49, 10, '2024-05-17', '2024-05-21', 600,1);



INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(156, 207, 42, '2026-04-02', '2026-04-08', 570,1),
(283, 500, 100, '2025-04-10', '2025-04-12', 240,1),
(37, 510, 102, '2026-06-14', '2026-06-20', 720,1),
(82, 208, 42, '2025-07-31', '2025-08-05', 500,1),
(142, 317, 64, '2024-06-18', '2024-06-23', 425,1),
(219, 496, 100, '2025-06-06', '2025-06-12', 450,1),
(219, 506, 102, '2026-07-12', '2026-07-17', 375,1),
(306, 267, 54, '2024-09-04', '2024-09-08', 380,1),
(359, 315, 63, '2026-01-20', '2026-01-23', 330,1),
(49, 11, 3, '2024-07-12', '2024-07-16', 400,1);
INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(209, 40, 8, '2025-04-08', '2025-04-09', 150,1),
(88, 332, 67, '2024-03-04', '2024-03-10', 510,1),
(327, 110, 22, '2025-02-11', '2025-02-18', 1050,1),
(177, 44, 9, '2024-08-12', '2024-08-19', 1050,1),
(122, 202, 41, '2025-11-28', '2025-12-05', 665,1),
(222, 187, 38, '2025-06-10', '2025-06-16', 600,1),
(355, 190, 38, '2026-05-06', '2026-05-09', 450,1),
(95, 175, 35, '2026-06-17', '2026-06-21', 600,1),
(290, 154, 31, '2024-06-06', '2024-06-09', 450,1),
(165, 340, 68, '2026-03-01', '2026-03-07', 720,1);



INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(263, 251, 51, '2024-04-25', '2024-05-02', 630,1),
(150, 428, 86, '2026-05-11', '2026-05-14', 270,1),
(251, 452, 91, '2026-08-05', '2026-08-08', 255,1),
(3, 12, 3, '2024-03-05', '2024-03-12', 700,1),
(305, 424, 85, '2026-02-18', '2026-02-21', 300,1),
(285, 9, 2, '2024-01-28', '2024-02-02', 750,1),
(349, 276, 56, '2024-04-04', '2024-04-05', 85,1),
(53, 465, 93, '2024-03-24', '2024-03-31', 770,1),
(117, 73, 15, '2025-04-10', '2025-04-11', 100,1),
(349, 241, 49, '2025-03-13', '2025-03-17', 360,1);
INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(71, 66, 14, '2024-08-15', '2024-08-18', 300,1),
(404, 250, 50, '2024-01-01', '2024-01-05', 520,1),
(263, 186, 38, '2025-12-22', '2025-12-29', 700,1),
(58, 61, 13, '2025-02-24', '2025-02-26', 200,1),
(345, 241, 49, '2024-11-20', '2024-11-21', 90,1),
(157, 483, 97, '2024-05-26', '2024-05-28', 180,1),
(57, 477, 96, '2024-10-11', '2024-10-18', 595,1),
(322, 9, 2, '2024-11-24', '2024-11-27', 450,1),
(124, 241, 49, '2024-09-27', '2024-10-02', 450,1),
(91, 249, 50, '2025-01-12', '2025-01-15', 360,1);


INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(73, 125, 25, '2024-03-31', '2024-04-06', 900,1),
(177, 75, 15, '2024-07-10', '2024-07-13', 450,1),
(246, 426, 86, '2025-10-24', '2025-10-27', 225,1),
(69, 120, 24, '2024-01-26', '2024-02-01', 900,1),
(142, 432, 87, '2025-09-24', '2025-10-01', 595,1),
(89, 447, 90, '2025-10-15', '2025-10-19', 340,1),
(157, 130, 26, '2025-06-01', '2025-06-04', 450,1),
(231, 166, 34, '2024-04-22', '2024-04-25', 300,1),
(95, 357, 72, '2024-05-28', '2024-06-03', 510,1),
(37, 272, 55, '2025-09-17', '2025-09-23', 570,1);

INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(149, 73, 15, '2025-03-27', '2025-03-28', 100,1),
(233, 71, 15, '2024-06-17', '2024-06-19', 200,1),
(394, 254, 51, '2026-03-04', '2026-03-06', 220,1),
(143, 116, 24, '2025-03-17', '2025-03-19', 200,1),
(47, 338, 68, '2024-07-12', '2024-07-18', 540,1),
(204, 387, 78, '2024-06-14', '2024-06-16', 170,1),
(38, 138, 28, '2024-03-19', '2024-03-24', 500,1),
(97, 418, 84, '2026-06-21', '2026-06-22', 90,1),
(156, 142, 29, '2026-08-17', '2026-08-24', 700,1),
(273, 183, 37, '2024-02-27', '2024-02-28', 100,1);
INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(31, 118, 24, '2026-06-28', '2026-07-04', 600,1),
(84, 311, 63, '2025-09-21', '2025-09-23', 160,1),
(355, 304, 61, '2026-05-06', '2026-05-07', 100,1),
(108, 138, 28, '2026-07-12', '2026-07-13', 100,1),
(61, 95, 19, '2024-12-07', '2024-12-10', 450,1),
(143, 438, 88, '2026-06-18', '2026-06-21', 270,1),
(364, 22, 5, '2025-03-24', '2025-03-31', 700,1),
(385, 378, 76, '2025-05-18', '2025-05-22', 360,1),
(345, 449, 90, '2025-12-15', '2025-12-16', 110,1),
(27, 278, 56, '2024-03-21', '2024-03-25', 400,1);


INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(250, 232, 47, '2026-07-03', '2026-07-04', 95,1),
(192, 387, 78, '2024-08-20', '2024-08-23', 255,1),
(411, 394, 79, '2026-04-12', '2026-04-13', 100,1),
(292, 181, 37, '2024-04-19', '2024-04-25', 600,1),
(201, 313, 63, '2026-01-12', '2026-01-19', 630,1),
(393, 364, 73, '2025-09-07', '2025-09-13', 600,1),
(408, 182, 37, '2024-02-04', '2024-02-10', 600,1),
(144, 194, 39, '2026-01-01', '2026-01-07', 900,1),
(285, 88, 18, '2025-11-13', '2025-11-15', 200,1),
(104, 403, 81, '2025-01-31', '2025-02-05', 450,1),
-- INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(111, 177, 36, '2024-07-22', '2024-07-24', 200,1),
(62, 251, 51, '2024-09-08', '2024-09-10', 180,1),
(278, 419, 84, '2024-11-10', '2024-11-16', 660,1),
(274, 430, 86, '2026-08-30', '2026-09-04', 600,1),
(280, 349, 70, '2025-08-28', '2025-09-01', 440,1),
(174, 243, 49, '2025-03-25', '2025-03-27', 200,1),
(77, 377, 76, '2025-07-28', '2025-08-04', 595,1),
(333, 442, 89, '2025-05-21', '2025-05-28', 595,1),
(119, 93, 19, '2026-05-05', '2026-05-08', 300,1),
(57, 323, 65, '2024-12-26', '2024-12-31', 450,1);
INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(260, 274, 55, '2026-09-06', '2026-09-09', 330,1),
(310, 388, 78, '2025-01-23', '2025-01-28', 450,1),
(333, 486, 98, '2026-02-03', '2026-02-06', 225,1),
(232, 25, 5, '2024-10-08', '2024-10-15', 1050,1),
(263, 355, 71, '2026-07-23', '2026-07-30', 770,1),
(300, 383, 77, '2025-07-16', '2025-07-19', 270,1),
(15, 91, 19, '2026-02-10', '2026-02-13', 300,1),
(405, 129, 26, '2024-02-05', '2024-02-08', 450,1),
(160, 135, 27, '2025-06-17', '2025-06-19', 300,1),
(334, 479, 96, '2024-03-04', '2024-03-09', 550,1);
INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(61, 143, 29, '2024-07-17', '2024-07-20', 300,1),
(4, 226, 46, '2024-02-12', '2024-02-19', 595,1),
(110, 1, 1, '2026-08-14', '2026-08-17', 300,1),
(322, 69, 14, '2025-05-23', '2025-05-25', 300,1),
(28, 235, 47, '2024-07-14', '2024-07-21', 840,1),
(369, 336, 68, '2025-11-05', '2025-11-12', 525,1),
(55, 6, 2, '2024-06-24', '2024-06-29', 500,1),
(334, 423, 85, '2024-11-19', '2024-11-20', 90,1),
(139, 199, 40, '2024-11-20', '2024-11-27', 1050,1),
(187, 304, 61, '2024-11-24', '2024-11-29', 500,1);
INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(291, 70, 14, '2026-03-24', '2026-03-28', 600,1),
(280, 340, 68, '2025-02-05', '2025-02-10', 600,1),
(303, 28, 6, '2026-04-06', '2026-04-11', 500,1),
(389, 298, 60, '2025-11-10', '2025-11-13', 300,1),
(301, 405, 81, '2025-07-09', '2025-07-16', 770,1),
(298, 169, 34, '2024-09-16', '2024-09-20', 600,1),
(228, 171, 35, '2024-05-09', '2024-05-13', 400,1),
(266, 341, 69, '2025-01-03', '2025-01-08', 400,1),
(5, 205, 41, '2024-03-31', '2024-04-01', 120,1),
(186, 98, 20, '2026-06-14', '2026-06-19', 500,1);
INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(210, 185, 37, '2025-02-11', '2025-02-16', 750,1),
(120, 152, 31, '2026-04-10', '2026-04-17', 700,1),
(246, 17, 4, '2024-10-30', '2024-10-31', 100,1),
(343, 287, 58, '2024-05-14', '2024-05-17', 285,1),
(59, 456, 92, '2026-07-12', '2026-07-13', 75,1),
(105, 152, 31, '2024-05-18', '2024-05-20', 200,1),
(386, 453, 91, '2025-03-31', '2025-04-01', 90,1),
(58, 150, 30, '2025-11-02', '2025-11-07', 750,1),
(336, 346, 70, '2024-04-15', '2024-04-22', 525,1),
(292, 25, 5, '2024-09-02', '2024-09-09', 1050,1);
INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(374, 15, 3, '2024-01-27', '2024-01-31', 600,1),
(386, 353, 71, '2024-03-17', '2024-03-20', 270,1),
(251, 46, 10, '2024-07-20', '2024-07-26', 600,1),
(151, 214, 43, '2025-03-09', '2025-03-16', 770,1),
(58, 12, 3, '2024-12-22', '2024-12-26', 400,1),
(342, 210, 42, '2026-02-13', '2026-02-16', 390,1),
(106, 483, 97, '2026-02-20', '2026-02-24', 360,1),
(205, 374, 75, '2025-07-19', '2025-07-22', 300,1),
(255, 399, 80, '2024-02-28', '2024-03-05', 660,1),
(245, 66, 14, '2024-06-10', '2024-06-16', 600,1);
INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(163, 390, 78, '2026-08-18', '2026-08-23', 600,1),
(24, 461, 93, '2025-07-05', '2025-07-12', 560,1),
(294, 344, 69, '2025-01-22', '2025-01-23', 100,1),
(50, 155, 31, '2024-06-17', '2024-06-20', 450,1),
(332, 417, 84, '2025-01-12', '2025-01-14', 170,1),
(65, 209, 42, '2025-05-01', '2025-05-02', 120,1),
(100, 394, 79, '2025-12-07', '2025-12-11', 400,1),
(234, 401, 81, '2025-06-14', '2025-06-17', 240,1),
(191, 50, 10, '2026-08-15', '2026-08-18', 450,1),
(337, 379, 76, '2025-06-01', '2025-06-07', 660,1);
INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(62, 239, 48, '2025-08-10', '2025-08-13', 360,1),
(196, 171, 35, '2026-07-20', '2026-07-27', 700,1),
(57, 361, 73, '2025-12-03', '2025-12-07', 320,1),
(384, 316, 64, '2025-03-05', '2025-03-11', 450,1),
(307, 401, 81, '2025-07-23', '2025-07-30', 560,1),
(223, 25, 5, '2024-02-28', '2024-03-06', 1050,1),
(67, 153, 31, '2024-09-08', '2024-09-14', 600,1),
(229, 28, 6, '2025-10-29', '2025-10-30', 100,1),
(11, 197, 40, '2026-03-17', '2026-03-22', 500,1),
(46, 396, 80, '2026-05-12', '2026-05-16', 300,1);
INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(252, 190, 38, '2024-08-23', '2024-08-30', 1050,1),
(218, 310, 62, '2024-03-24', '2024-03-30', 720,1),
(4, 302, 61, '2026-07-08', '2026-07-14', 510,1),
(30, 443, 89, '2025-09-21', '2025-09-24', 270,1),
(134, 351, 71, '2026-03-26', '2026-04-02', 560,1),
(119, 343, 69, '2026-03-19', '2026-03-23', 360,1),
(376, 419, 84, '2025-01-27', '2025-01-30', 330,1),
(179, 187, 38, '2025-02-08', '2025-02-13', 500,1),
(340, 66, 14, '2025-09-06', '2025-09-12', 600,1),
(391, 488, 98, '2026-03-15', '2026-03-20', 450,1);





INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(28, 202, 41, '2024-02-28', '2024-03-06', 665,1),
(345, 239, 48, '2025-08-02', '2025-08-05', 360,1),
(62, 462, 93, '2025-08-21', '2025-08-26', 425,1),
(277, 395, 79, '2024-06-26', '2024-06-30', 440,1),
(266, 186, 38, '2025-11-24', '2025-12-01', 700,1),
(257, 227, 46, '2024-10-15', '2024-10-19', 380,1),
(70, 374, 75, '2024-08-02', '2024-08-09', 700,1),
(8, 408, 82, '2024-04-02', '2024-04-03', 90,1),
(95, 165, 33, '2025-03-01', '2025-03-05', 600,1),
(143, 126, 26, '2024-03-02', '2024-03-08', 600,1);
INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(136, 155, 31, '2025-04-17', '2025-04-19', 300,1),
(92, 299, 60, '2026-05-28', '2026-06-04', 840,1),
(58, 209, 42, '2024-06-07', '2024-06-10', 360,1),
(403, 18, 4, '2025-02-14', '2025-02-18', 400,1),
(101, 453, 91, '2026-02-05', '2026-02-07', 180,1),
(186, 510, 102, '2024-05-10', '2024-05-14', 480,1),
(325, 343, 69, '2024-06-14', '2024-06-15', 90,1),
(28, 153, 31, '2026-05-09', '2026-05-11', 200,1),
(32, 91, 19, '2026-09-05', '2026-09-06', 100,1),
(388, 372, 75, '2025-01-28', '2025-02-02', 425,1);



INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(155, 27, 6, '2025-08-24', '2025-08-31', 700,1),
(21, 337, 68, '2024-04-11', '2024-04-15', 340,1),
(357, 2, 1, '2025-03-14', '2025-03-17', 300,1),
(274, 57, 12, '2025-09-17', '2025-09-19', 200,1),
(395, 342, 69, '2026-01-12', '2026-01-17', 425,1),
(3, 473, 95, '2024-08-22', '2024-08-24', 180,1),
(4, 484, 97, '2024-02-26', '2024-02-27', 100,1),
(12, 384, 77, '2024-07-20', '2024-07-25', 500,1),
(412, 171, 35, '2026-07-11', '2026-07-12', 100,1),
(44, 485, 97, '2026-08-22', '2026-08-23', 110,1);
INSERT INTO Booking (Cust_ID, Room_ID ,  Hotel_ID,     Checkin_Date,     Checkout_Date , Booking_amount, current_active ) VALUES
(127, 38, 8, '2026-02-01', '2026-02-05', 400,1),
(229, 225, 45, '2025-10-17', '2025-10-19', 240,1),
(27, 315, 63, '2025-12-23', '2025-12-25', 220,1),
(54, 325, 65, '2025-04-20', '2025-04-25', 550,1),
(13, 449, 90, '2025-01-04', '2025-01-10', 660,1),
(302, 294, 59, '2026-07-14', '2026-07-15', 110,1);

Select * from booking
-- update booking procedure 
DELIMITER //

CREATE PROCEDURE UpdateBooking(
    IN p_BookingID INT,
    IN p_CheckinDate DATE,
    IN p_CheckoutDate DATE,
    IN p_BookingAmount DECIMAL(10, 2),
    IN p_CurrentActive BOOLEAN
)
BEGIN
    UPDATE Booking
    SET Checkin_Date = p_CheckinDate,
        Checkout_Date = p_CheckoutDate,
        Booking_amount = p_BookingAmount,
        Current_Active = p_CurrentActive,
        Updated_At = CURRENT_TIMESTAMP
    WHERE Booking_ID = p_BookingID;
END //

DELIMITER ;


-- procedure for booking details 

DELIMITER //

CREATE PROCEDURE RetrieveBookingDetails(
    IN p_BookingID INT
)
BEGIN
    SELECT *
    FROM Booking
    WHERE Booking_ID = p_BookingID;
END //

DELIMITER ;

-- function to check rooms booked for a hotel on a particular date 
DELIMITER //

CREATE FUNCTION GetTotalRoomsBooked(
    p_HotelID INT,
    p_Date DATE
)
RETURNS INT
READS SQL DATA
BEGIN
    DECLARE totalRoomsBooked INT;
    
    SELECT COUNT(*) INTO totalRoomsBooked
    FROM RoomAvailability
    WHERE Hotel_ID = p_HotelID
    AND Date = p_Date
    AND Available = 0;

    RETURN totalRoomsBooked;
END //

DELIMITER ;

 -- Procedure to check rooms booked for a hotel on a particular period. 
 
 DELIMITER //

CREATE PROCEDURE GetBookedDaysForHotel(
    IN p_HotelID INT,
    IN p_StartDate DATE,
    IN p_EndDate DATE,
    OUT p_TotalBookedDays INT
)
BEGIN
    DECLARE totalBookedDays INT;
    
    SELECT COUNT(DISTINCT Date) INTO totalBookedDays
    FROM RoomAvailability
    WHERE Hotel_ID = p_HotelID
    AND Date BETWEEN p_StartDate AND p_EndDate
    AND Available = 0;

    SET p_TotalBookedDays = totalBookedDays;
END //

DELIMITER ;

-- a function that calculates the number of bookings made by a customer within a specified time period 
 
 
 DELIMITER //

CREATE PROCEDURE GetCustomerBookingDetails(
    IN p_CustID INT,
    IN p_StartDate DATE,
    IN p_EndDate DATE,
    OUT p_TotalBookings INT,
    OUT p_TotalAmount DECIMAL(10, 2)
)
BEGIN
    SELECT COUNT(Booking_ID), SUM(Booking_amount)
    INTO p_TotalBookings, p_TotalAmount
    FROM Booking
    WHERE Cust_ID = p_CustID
    AND Checkin_Date BETWEEN p_StartDate AND p_EndDate;
END //

DELIMITER ;


-- here's the updated procedure to update employee details 
DELIMITER //

CREATE PROCEDURE UpdateEmployeeDetails(
    IN p_EmpID INT,
    IN p_NewPhoneNumber VARCHAR(20),
    IN p_NewAddress VARCHAR(100)
)
BEGIN
    UPDATE Employee_Info
    SET Emp_Phone_Number = p_NewPhoneNumber,
        Employee_Address = p_NewAddress
    WHERE Emp_ID = p_EmpID;
END //

DELIMITER ;
-- Procedure to Update Customer's Email Address:
DELIMITER //

CREATE PROCEDURE UpdateCustomerEmail(
    IN p_CustomerID INT,
    IN p_NewEmail VARCHAR(100)
)
BEGIN
    UPDATE Customer
    SET Cust_Email_Id = p_NewEmail
    WHERE Cust_ID = p_CustomerID;
END //

DELIMITER ;



 
 
 -- Procedure to Update Customer's Phone Number:
 
 DELIMITER //

CREATE PROCEDURE UpdateCustomerPhoneNumber(
    IN p_CustomerID INT,
    IN p_NewPhoneNumber VARCHAR(20)
)
BEGIN
    UPDATE Customer
    SET Cust_Phone_No = p_NewPhoneNumber
    WHERE Cust_ID = p_CustomerID;
END //

DELIMITER ;
 
 
--  Function to Calculate Total Amount Spent by a Customer:
 
 DELIMITER //

CREATE FUNCTION GetTotalAmountSpentByCustomer(
    p_CustomerID INT
)
RETURNS DECIMAL(10, 2)
READS SQL DATA
BEGIN
    DECLARE totalAmount DECIMAL(10, 2);
    
    SELECT SUM(Booking_amount) INTO totalAmount
    FROM Booking
    WHERE Cust_ID = p_CustomerID;
    
    RETURN totalAmount;
END //

DELIMITER ;
-- a function to mark the current_active column to zero when an employee leaves the job, you can use a stored procedure. Here's how you can do it:
DELIMITER //

CREATE PROCEDURE MarkEmployeeInactive(
    IN p_EmpID INT
)
BEGIN
    UPDATE Employee_Info
    SET current_active = 0
    WHERE Emp_ID = p_EmpID;
END //

DELIMITER ;

-- Function to Retrieve Employee's Position:
DELIMITER //

CREATE FUNCTION GetEmployeePosition(
    p_EmployeeID INT
)
RETURNS VARCHAR(50)
READS SQL DATA
BEGIN
    DECLARE employeePosition VARCHAR(50);
    
    SELECT Emp_Position INTO employeePosition
    FROM Employee_Info
    WHERE Emp_ID = p_EmployeeID;
    
    RETURN employeePosition;
END //

DELIMITER ;


-- Function to Calculate Total Occupancy Percentage of a Hotel:

 
   DELIMITER //

CREATE FUNCTION GetHotelOccupancyPercentage(
    p_HotelID INT
)
RETURNS DECIMAL(5, 2)
READS SQL DATA
BEGIN
    DECLARE totalRooms INT;
    DECLARE occupiedRooms INT;
    DECLARE occupancyPercentage DECIMAL(5, 2);
    
    SELECT COUNT(*) INTO totalRooms
    FROM Room
    WHERE Hotel_ID = p_HotelID;
    
    SELECT COUNT(*) INTO occupiedRooms
    FROM RoomAvailability
    WHERE Hotel_ID = p_HotelID
    AND Available = 0;
    
    IF totalRooms = 0 THEN
        SET occupancyPercentage = 0;
    ELSE
        SET occupancyPercentage = (occupiedRooms / totalRooms) * 100;
    END IF;
    
    RETURN occupancyPercentage;
END //

DELIMITER ;


-- Function to Calculate Average Room Price in a Hotel:

DELIMITER //

CREATE FUNCTION GetAverageRoomPriceInHotel(
    p_HotelID INT
)
RETURNS DECIMAL(10, 2)
READS SQL DATA
BEGIN
    DECLARE avgRoomPrice DECIMAL(10, 2);
    
    SELECT AVG(Room_Price) INTO avgRoomPrice
    FROM Room
    WHERE Hotel_ID = p_HotelID;
    
    RETURN avgRoomPrice;
END //

DELIMITER ;



-- QUERIES
-- the number of BOOKED rooms in each hotel for each date between May 1, 2024, and May 10, 2024, you can modify the query to group by date and hotel, and count the available rooms.
SELECT ra.Date, h.Hotel_ID, h.Hotel_Name, COUNT(ra.Room_ID) AS BOOKED_ROOM 
FROM Hotel h
INNER JOIN Room r ON h.Hotel_ID = r.Hotel_ID
LEFT JOIN RoomAvailability ra ON r.Room_ID = ra.Room_ID
WHERE ra.Date BETWEEN '2024-05-01' AND '2024-05-10'
AND ra.Available = 0
GROUP BY ra.Date, h.Hotel_ID, h.Hotel_Name
ORDER BY ra.Date, h.Hotel_ID;

-- to check is room is overbooked 
/*
Explanation:

We're joining the Booking table with itself (aliased as b1 and b2) to compare different bookings.
We're ensuring that b1's Booking_ID is less than b2's Booking_ID to avoid duplicate combinations.
The WHERE clause checks if the check-in date or check-out date of b1 falls within the check-in and check-out dates of b2, or vice versa. If so, it means there are overlapping bookings for the same room on the same date.
This query will return pairs of bookings (Booking1_ID and Booking2_ID) that overlap for the same room on the same date.

*/


SELECT DISTINCT b1.Booking_ID AS Booking1_ID, b2.Booking_ID AS Booking2_ID, 
       b1.Room_ID, b1.Checkin_Date AS Booking1_Checkin, b1.Checkout_Date AS Booking1_Checkout, 
       b2.Checkin_Date AS Booking2_Checkin, b2.Checkout_Date AS Booking2_Checkout
FROM Booking b1
JOIN Booking b2 ON b1.Room_ID = b2.Room_ID AND b1.Booking_ID < b2.Booking_ID
WHERE b1.Checkin_Date BETWEEN b2.Checkin_Date AND b2.Checkout_Date
   OR b1.Checkout_Date BETWEEN b2.Checkin_Date AND b2.Checkout_Date;
   
   -- booking date wise revenue 
   
Select DATE_FORMAT(b.created_at, '%Y-%m') as booking_month,   sum(b.booking_amount - pp.Amount) as profit , sum(b.booking_amount) as revenue, 
sum(case when pp.type = "payable" then  pp.Amount end ) as hotel_payouts,
sum(case when pp.type = "royality payable" then  pp.Amount end ) as royality_payable_cost

 from booking  b 
 left join Payment_Payable pp on pp.booking_id = b.booking_id
 group by DATE_FORMAT(b.created_at, '%Y-%m');


-- hotel wise revenue and payout montly based on actual accrual 

Select Date_format(b.checkin_date, '%Y-%m') as accrual_month, h.Hotel_Name, 
 sum(b.booking_amount - pp.Amount) as profit , sum(b.booking_amount) as revenue, 
sum(case when pp.type = "payable" then  pp.Amount end ) as hotel_payouts,
sum(case when pp.type = "royality payable" then  pp.Amount end ) as royality_payable_cost

 from booking  b 
 left join hotel h on b.Hotel_ID = h.Hotel_ID
 left join Payment_Payable pp on pp.booking_id = b.booking_id
 group by DATE_FORMAT(b.checkin_date, '%Y-%m'), h.Hotel_Name;
 
 -- customer wise montly revenue 
 
 Select Date_format(b.checkin_date, '%Y-%m') as accrual_month, h.Cust_ID, h.Cust_Name, 
 sum(b.booking_amount - pp.Amount) as profit , sum(b.booking_amount) as revenue, 
sum(case when pp.type = "payable" then  pp.Amount end ) as hotel_payouts,
sum(case when pp.type = "royality payable" then  pp.Amount end ) as royality_payable_cost

 from booking  b 
 left join Customer h on b.Cust_ID = h.Cust_ID
 left join Payment_Payable pp on pp.booking_id = b.booking_id
 group by DATE_FORMAT(b.checkin_date, '%Y-%m'), h.Cust_ID, h.Cust_Name;
 


-- booking water fall month-over-month, we can use this as repeat-rate as well, if we have decent no. of unique customer

select sd1.check_month, count(sd1.Cust_ID), sum( sd1.no_of_booking) as no_of_booking,
 sum(case when sd1.lead_1 > 0 then 1 else 0 end) as person_n_1,
sum(case when sd1.lead_2 > 0 then 1 else 0 end) as person_n_2,
sum(case when sd1.lead_3 > 0 then 1 else 0 end) as person_n_3,
sum(case when sd1.lead_4 > 0 then 1 else 0 end) as person_n_4,
 sum(case when sd1.lead_5 > 0 then 1 else 0 end)as person_n_5,
 sum(case when sd1.lead_6 > 0 then 1 else 0 end)as person_n_6
from 
(
select sd.check_month,sd.Cust_ID,sd.Cust_Name,sd.no_of_booking, 
 lag(sd.no_of_booking, 1, 0) OVER(PARTITION BY sd.Cust_ID ORDER BY sd.check_month) as lead_1, 
 lag(sd.no_of_booking, 2, 0) OVER(PARTITION BY sd.Cust_ID ORDER BY sd.check_month) as lead_2, 
 lag(sd.no_of_booking, 3, 0) OVER(PARTITION BY sd.Cust_ID ORDER BY sd.check_month) as lead_3, 
 lag(sd.no_of_booking, 4, 0) OVER(PARTITION BY sd.Cust_ID ORDER BY sd.check_month) as lead_4, 
 lag(sd.no_of_booking, 5, 0) OVER(PARTITION BY sd.Cust_ID ORDER BY sd.check_month) as lead_5, 
 lag(sd.no_of_booking, 6, 0) OVER(PARTITION BY sd.Cust_ID ORDER BY sd.check_month) as lead_6
 
 
from 
(
Select DATE_FORMAT(b.checkin_date, '%Y-%m') as check_month, b.Cust_ID,c.Cust_Name,  count(Distinct b.Booking_ID) as no_of_booking
from booking as b 
left join customer as c on c.Cust_ID = b.Cust_ID

group by DATE_FORMAT(b.checkin_date, '%Y-%m') , b.Cust_ID,c.Cust_Name

 )sd
 ) sd1
 group by sd1.check_month;
 
 -- average order value and average booking days 
 Select DATE_FORMAT(b.checkin_date, '%Y-%m') as check_month,  
       count(Distinct b.Booking_ID) as no_of_booking, 
	avg(b.booking_amount) as avg_booking_amount,
 avg(datediff(b.Checkout_Date,b.Checkin_Date)) as avg_stay_no_of_days
from booking as b 
group by DATE_FORMAT(b.checkin_date, '%Y-%m');

-- hotelwise average order and booking days
Select DATE_FORMAT(b.checkin_date, '%Y-%m') as check_month,  h.Hotel_Name,
       count(Distinct b.Booking_ID) as no_of_booking, 
	avg(b.booking_amount) as avg_booking_amount,
 avg(datediff(b.Checkout_Date,b.Checkin_Date)) as avg_stay_no_of_days
from booking as b 
left join hotel as h on h.Hotel_ID = b.Hotel_ID
group by DATE_FORMAT(b.checkin_date, '%Y-%m'), h.Hotel_Name;



-- to find changes booking
SELECT
    b.Booking_ID,
    b.Cust_ID,
    b.Room_ID,
    b.Hotel_ID,
    b.Checkin_Date,
    b.Checkout_Date
FROM
    Booking b
JOIN
    State_Transition st ON b.Booking_ID = st.Booking_ID
WHERE
    st.Status IN ('Cancelled', 'Date Change'); 

    -- to check salary amount monthly 
    SELECT 
    ei.Emp_ID,
    ei.Emp_First_Name,
    ei.Emp_Last_Name,
    es.Joining_date,
    DATE_FORMAT(es.Joining_date, '%Y-%m') AS Start_Month,
    es.Salary / 12 AS Monthly_Salary,
    DATE_FORMAT(es.Joining_date, '%Y-%m') AS Salary_Month,
    SUM(es.Salary / 12) OVER (ORDER BY es.Joining_date ASC) AS Cumulative_Salary
FROM 
    Employee_Info ei
JOIN 
    Employees_Salary es ON ei.Emp_ID = es.Emp_ID;