DROP DATABASE IF EXISTS traveasy;
CREATE DATABASE IF NOT EXISTS traveasy;
USE traveasy;

-- CREATE TABLE STATEMENTS:
-- Strong Entity
CREATE TABLE IF NOT EXISTS Restaurants (
    Restaurant_ID INT PRIMARY KEY,
    Price VARCHAR(50),
    Name VARCHAR(50),
    Location VARCHAR(200)
);

-- Strong Entity
CREATE TABLE IF NOT EXISTS hotel (
    hotel_id INT PRIMARY KEY AUTO_INCREMENT,
    amentities varchar(1000) NOT NULL,
    street varchar(75) NOT NULL,
    city varchar(75) NOT NULL,
    state varchar(75) NOT NULL,
    zipcode INT NOT NULL,
    duration INT NOT NULL,
    rating float NOT NULL
);

-- Strong Entity
CREATE TABLE IF NOT EXISTS customer (
    CustomerID INT,
    Email VARCHAR(50),
    Name VARCHAR(50),
    Street VARCHAR(100),
    City VARCHAR(50),
    State VARCHAR(50),
    ZipCode INT,
    Restaurant_ID INT,
    Hotel_id INT,
    PRIMARY KEY (CustomerID),
    FOREIGN KEY (Restaurant_ID) REFERENCES Restaurants(Restaurant_ID)
    ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY (Hotel_id) REFERENCES hotel(hotel_id)
    ON UPDATE CASCADE ON DELETE RESTRICT
);

-- Strong Entity
CREATE TABLE IF NOT EXISTS airline (
    airline_name VARCHAR(50),
    contact_info VARCHAR(50),
    PRIMARY KEY (airline_name)
);

-- Strong Entity
CREATE TABLE IF NOT EXISTS flights (
    flight_no          INT,
    seats              INT,
    duration           INT,
    departure_location VARCHAR(100),
    arrival_time       DATETIME,
    arrival_location   VARCHAR(100),
    departure_time     DATETIME,
    airline_name       VARCHAR(50),
    PRIMARY KEY (flight_no),
    FOREIGN KEY (airline_name) REFERENCES airline (airline_name)
    ON UPDATE CASCADE ON DELETE RESTRICT
);

-- Strong Entity
CREATE TABLE IF NOT EXISTS flight_ticket (
    TicketID INT,
    Class VARCHAR(50),
    customerName VARCHAR(50),
    cost FLOAT,
    CustomerID INT,
    flight_no INT,
    PRIMARY KEY (TicketID),
    FOREIGN KEY(CustomerID) REFERENCES customer(CustomerID)
    ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY(flight_no) REFERENCES flights(flight_no)
    ON UPDATE CASCADE ON DELETE RESTRICT
);

-- Strong Entity
CREATE TABLE IF NOT EXISTS payment (
    paymentID INT,
    payment_type VARCHAR(50),
    amount FLOAT,
    transaction_assure BOOLEAN,
    theft_prevention BOOLEAN,
    TicketID INT,
    PRIMARY KEY (paymentID),
    FOREIGN KEY (TicketID) REFERENCES flight_ticket(TicketID)
    ON UPDATE CASCADE ON DELETE RESTRICT
);

-- Strong Entitiy
CREATE TABLE IF NOT EXISTS class (
    class_id INT,
    fare FLOAT,
    flight_no INT,
    class_type VARCHAR(50),
    PRIMARY KEY (class_id),
    FOREIGN KEY (flight_no) REFERENCES flights(flight_no)
    ON UPDATE CASCADE ON DELETE RESTRICT
);

-- Weak Entity
CREATE TABLE IF NOT EXISTS Cuisine_Type (
    Cuisine_ID INT,
    Restaurant_ID INT,
    Description VARCHAR(5000),
    Type VARCHAR(50),
    PRIMARY KEY (Cuisine_ID, Restaurant_ID),
    FOREIGN KEY (Restaurant_ID) REFERENCES Restaurants(Restaurant_ID)
    ON UPDATE CASCADE ON DELETE RESTRICT
);

-- Weak Entity
CREATE TABLE IF NOT EXISTS Restaurants_Booked (
    Booked_ID INT,
    Restaurant_ID INT,
    Participants INT,
    Datetime DATETIME,
    PRIMARY KEY (Booked_ID, Restaurant_ID),
    FOREIGN KEY (Restaurant_ID) REFERENCES Restaurants(Restaurant_ID)
    ON UPDATE CASCADE ON DELETE RESTRICT
);

-- Strong Entity
CREATE TABLE IF NOT EXISTS Navigation (
    Navigation_ID INT PRIMARY KEY,
    Routing VARCHAR(100),
    Estimated_time TIME,
    Fare FLOAT,
    Distance FLOAT,
    Transportation_Method VARCHAR(50),
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES customer(CustomerID)
    ON UPDATE CASCADE ON DELETE RESTRICT
);

-- Weak Entity
CREATE TABLE IF NOT EXISTS activities (
    activities_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(75) NOT NULL,
    cost Float NOT NULL
);

-- Strong Entity
CREATE TABLE IF NOT EXISTS room_type (
    Name VARCHAR(255),
    type_id INT,
    max_guests INT,
    total_room INT,
    description VARCHAR(100) NOT NULL,
    room_price FLOAT NOT NULL,
    hotel_id INT,
    PRIMARY KEY (Name, type_id),
    FOREIGN KEY(hotel_id) REFERENCES hotel(hotel_id)
    ON UPDATE CASCADE ON DELETE RESTRICT
);

-- Bridge Entity
CREATE TABLE IF NOT EXISTS Restaurant_Cuisine (
    Cuisine_ID INT,
    Restaurant_ID INT,
    PRIMARY KEY (Cuisine_ID, Restaurant_ID),
    FOREIGN KEY (Cuisine_ID) REFERENCES Cuisine_Type(Cuisine_ID)
    ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY (Restaurant_ID) REFERENCES Restaurants(Restaurant_ID)
    ON UPDATE CASCADE ON DELETE RESTRICT
);

-- Bridge Entity
CREATE TABLE IF NOT EXISTS Navigation_Transportation_Method (
    Navigation_ID INT,
    Transportation_Method VARCHAR(50),
    PRIMARY KEY (Navigation_ID, Transportation_Method),
    FOREIGN KEY (Navigation_ID) REFERENCES Navigation(Navigation_ID)
    ON UPDATE CASCADE ON DELETE RESTRICT
);

-- Bridge Entity
CREATE TABLE IF NOT EXISTS Attends (
    activities_id INT,
    CustomerID INT,
    PRIMARY KEY (activities_id, CustomerID),
    FOREIGN KEY (activities_id) REFERENCES activities(activities_id)
    ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY (CustomerID) REFERENCES customer(CustomerID)
    ON UPDATE CASCADE ON DELETE RESTRICT
);

-- Weak Entity
CREATE TABLE IF NOT EXISTS Customer_Demographics (
    CustomerID INT,
    Type VARCHAR(500),
    PRIMARY KEY (CustomerID),
    FOREIGN KEY (CustomerID) REFERENCES customer(CustomerID)
);

-- INSERT STATEMENTS USING SAMPLE GENERATION DATA:
-- Strong Entity
INSERT INTO Restaurants (restaurant_Id, name, location, price) VALUES ('895', 'Young-Williams', '419 Connor Inlet
South Justin, ID 28623', 'medium');
INSERT INTO Restaurants (restaurant_Id, name, location, price) VALUES ('577', 'Calderon, Miller and Hogan', '958 Michael Way Suite 112
Michellehaven, SC 51051', 'medium');
INSERT INTO Restaurants (restaurant_Id, name, location, price) VALUES ('593', 'Ballard, Willis and Boyd', '787 Hannah River Apt. 109
Wrightmouth, MH 59722', 'medium');
INSERT INTO Restaurants (restaurant_Id, name, location, price) VALUES ('201', 'Hernandez, Walker and Kane', '93305 Corey Prairie
Port Michaelborough, NY 53718', 'low');
INSERT INTO Restaurants (restaurant_Id, name, location, price) VALUES ('105', 'Silva-Mckenzie', '550 Maldonado Point
Daniellemouth, IL 60344', 'high');
INSERT INTO Restaurants (restaurant_Id, name, location, price) VALUES ('245', 'Juarez LLC', '3433 Lisa Shoals
Montoyashire, TX 47325', 'medium');
INSERT INTO Restaurants (restaurant_Id, name, location, price) VALUES ('180', 'Gordon, Rowland and Gardner', '3739 Randall Locks Suite 707
Christianbury, DC 03151', 'low');
INSERT INTO Restaurants (restaurant_Id, name, location, price) VALUES ('327', 'Lopez, Pearson and Hanson', '3065 Espinoza Meadow
Kristinbury, NJ 76484', 'low');
INSERT INTO Restaurants (restaurant_Id, name, location, price) VALUES ('81', 'Bennett and Sons', '59632 Randall Prairie Suite 870
Martinezfort, AR 00745', 'high');
INSERT INTO Restaurants (restaurant_Id, name, location, price) VALUES ('202', 'Wall, Davis and James', '70403 Matthew Spur
New Neil, NC 15124', 'low');
INSERT INTO Restaurants (restaurant_Id, name, location, price) VALUES ('284', 'Griffin-Phillips', '855 Nicholas Inlet
West Kathychester, DC 37930', 'high');
INSERT INTO Restaurants (restaurant_Id, name, location, price) VALUES ('643', 'Garcia, Mayo and Hines', '72983 Jessica Haven Apt. 872
Tammyport, AL 83191', 'low');
INSERT INTO Restaurants (restaurant_Id, name, location, price) VALUES ('749', 'Mcdonald-Owens', '432 Lam Villages Suite 134
Rachelborough, MP 04823', 'medium');
INSERT INTO Restaurants (restaurant_Id, name, location, price) VALUES ('80', 'Higgins Group', '335 Riley Throughway
Michaelmouth, SC 93931', 'medium');
INSERT INTO Restaurants (restaurant_Id, name, location, price) VALUES ('665', 'Warren-Santiago', '8046 Rice Mall Suite 409
Coopermouth, IL 44718', 'medium');
INSERT INTO Restaurants (restaurant_Id, name, location, price) VALUES ('206', 'Baldwin, Griffin and Diaz', '11576 John River
Bowmanstad, ME 44076', 'low');
INSERT INTO Restaurants (restaurant_Id, name, location, price) VALUES ('627', 'Mason, Ramirez and Holland', '601 Davis Land Suite 635
Fosterchester, WY 25745', 'high');
INSERT INTO Restaurants (restaurant_Id, name, location, price) VALUES ('77', 'Lopez-Yates', '49540 Brenda Throughway Apt. 615
South Jared, MH 23457', 'low');
INSERT INTO Restaurants (restaurant_Id, name, location, price) VALUES ('871', 'Gonzalez-Aguirre', 'PSC 1755, Box 2639
APO AP 51012', 'medium');
INSERT INTO Restaurants (restaurant_Id, name, location, price) VALUES ('731', 'Hall and Sons', 'Unit 0528 Box 1919
DPO AE 55472', 'high');
INSERT INTO Restaurants (restaurant_Id, name, location, price) VALUES ('132', 'Murphy, Juarez and Bennett', 'USCGC Flowers
FPO AA 22965', 'high');
INSERT INTO Restaurants (restaurant_Id, name, location, price) VALUES ('820', 'Oneill Ltd', '6662 Miles Village
East Katie, AS 75758', 'medium');
INSERT INTO Restaurants (restaurant_Id, name, location, price) VALUES ('716', 'Johnson-White', '7325 Tara Passage
Harveyview, IA 74508', 'low');
INSERT INTO Restaurants (restaurant_Id, name, location, price) VALUES ('370', 'Thompson-Davis', '9346 Lawson Plaza
South Steven, MT 42289', 'low');
INSERT INTO Restaurants (restaurant_Id, name, location, price) VALUES ('57', 'Martinez and Sons', '70090 Jeffery Walks
Barnesview, OR 13055', 'medium');
INSERT INTO Restaurants (restaurant_Id, name, location, price) VALUES ('296', 'Johnson-Ramirez', '481 Atkins Fork Apt. 626
East Meghanbury, ND 99320', 'low');
INSERT INTO Restaurants (restaurant_Id, name, location, price) VALUES ('309', 'Hammond Inc', '97209 Frank Creek
Peterbury, NJ 18703', 'low');
INSERT INTO Restaurants (restaurant_Id, name, location, price) VALUES ('141', 'Lewis, Zamora and Martin', '02961 Robinson Fork Apt. 337
Ralphmouth, FL 08293', 'low');
INSERT INTO Restaurants (restaurant_Id, name, location, price) VALUES ('799', 'Garner-Bender', '256 Stanley Plains
New Markmouth, CO 40189', 'medium');
INSERT INTO Restaurants (restaurant_Id, name, location, price) VALUES ('714', 'Smith, Jones and Larson', '21624 Walker Cape Apt. 597
Mcdonaldborough, NY 09590', 'medium');
INSERT INTO Restaurants (restaurant_Id, name, location, price) VALUES ('826', 'Malone Group', '5177 Pratt Heights Apt. 517
Rachelhaven, MT 23193', 'low');
INSERT INTO Restaurants (restaurant_Id, name, location, price) VALUES ('313', 'Leach Group', 'PSC 2998, Box 2511
APO AE 93767', 'high');
INSERT INTO Restaurants (restaurant_Id, name, location, price) VALUES ('840', 'Scott-Jacobs', '783 Austin Vista
New Jonathan, MT 79429', 'high');
INSERT INTO Restaurants (restaurant_Id, name, location, price) VALUES ('98', 'Clayton, Turner and Fitzgerald', '050 Michelle Plains Suite 619
Tinaberg, PR 52796', 'high');
INSERT INTO Restaurants (restaurant_Id, name, location, price) VALUES ('261', 'Friedman-Henderson', 'PSC 1382, Box 1892
APO AP 67692', 'high');
INSERT INTO Restaurants (restaurant_Id, name, location, price) VALUES ('278', 'Lynch Inc', '93474 Moore Squares Suite 022
Jasmineport, NJ 34262', 'medium');
INSERT INTO Restaurants (restaurant_Id, name, location, price) VALUES ('154', 'Martin-Harris', '075 Sherman Key
Wrightborough, CO 60368', 'medium');
INSERT INTO Restaurants (restaurant_Id, name, location, price) VALUES ('22', 'Meyer, Williams and Roberts', '9273 Harrington Forks Suite 788
Gibsonchester, CO 47531', 'low');
INSERT INTO Restaurants (restaurant_Id, name, location, price) VALUES ('561', 'Shaw, Norman and Johnson', '94324 John Spring Suite 067
Williamshaven, NY 70439', 'medium');
INSERT INTO Restaurants (restaurant_Id, name, location, price) VALUES ('819', 'Thompson and Sons', '4564 Rodriguez Manors Suite 333
North Henryside, GU 95505', 'medium');
INSERT INTO Restaurants (restaurant_Id, name, location, price) VALUES ('290', 'Gonzalez, Meyers and Villa', '443 Amy Center
West Laura, AL 71684', 'low');
INSERT INTO Restaurants (restaurant_Id, name, location, price) VALUES ('839', 'Harris, Yang and Thompson', '95149 Angela Common Apt. 995
Benjaminborough, MI 29326', 'high');
INSERT INTO Restaurants (restaurant_Id, name, location, price) VALUES ('149', 'Schwartz, Cook and Perry', '42062 Lisa Rapids Apt. 923
South Robertview, UT 15900', 'medium');
INSERT INTO Restaurants (restaurant_Id, name, location, price) VALUES ('551', 'Fritz, Wright and Nelson', '3673 Park Circles Suite 965
South Carolynhaven, UT 48478', 'medium');
INSERT INTO Restaurants (restaurant_Id, name, location, price) VALUES ('394', 'Johnson, Espinoza and Lee', '3555 Wilson Loaf Apt. 719
South Thomasshire, PW 81626', 'high');
INSERT INTO Restaurants (restaurant_Id, name, location, price) VALUES ('187', 'Beasley-Williams', '6157 Gonzalez Throughway
Nicholasview, OR 43821', 'low');
INSERT INTO Restaurants (restaurant_Id, name, location, price) VALUES ('29', 'Allen, Wilson and Harmon', '365 Anthony Creek Apt. 187
New Leslie, TN 51788', 'low');
INSERT INTO Restaurants (restaurant_Id, name, location, price) VALUES ('484', 'Perez-Mitchell', '06186 Smith Mount Apt. 184
South Matthewview, SD 48946', 'medium');
INSERT INTO Restaurants (restaurant_Id, name, location, price) VALUES ('334', 'Delgado, Boone and Ward', '29055 Villarreal Ways Apt. 449
Deannaton, TX 12641', 'low');
INSERT INTO Restaurants (restaurant_Id, name, location, price) VALUES ('929', 'Copeland-Ball', '82877 Cruz Circle
Davisside, MD 28481', 'high');
INSERT INTO Restaurants (restaurant_Id, name, location, price) VALUES ('210', 'Walker-Lara', '3526 Sandoval Locks
Clarktown, FM 56917', 'medium');
INSERT INTO Restaurants (restaurant_Id, name, location, price) VALUES ('397', 'Smith, Cross and Lamb', '1231 Reeves Ways Suite 180
New Patrickbury, MT 58008', 'low');
INSERT INTO Restaurants (restaurant_Id, name, location, price) VALUES ('198', 'Khan, Jones and Juarez', '1561 Mathews Drives Apt. 931
South Stephanie, NE 39847', 'high');
INSERT INTO Restaurants (restaurant_Id, name, location, price) VALUES ('48', 'Fernandez LLC', '2740 Singh Coves Apt. 846
Owensbury, CT 12688', 'medium');
INSERT INTO Restaurants (restaurant_Id, name, location, price) VALUES ('670', 'Gentry Ltd', '74096 Gillespie Avenue
Terryfort, MT 89230', 'low');
INSERT INTO Restaurants (restaurant_Id, name, location, price) VALUES ('622', 'Henry Ltd', '2678 Oconnor Skyway
Shannonton, RI 76045', 'high');
INSERT INTO Restaurants (restaurant_Id, name, location, price) VALUES ('896', 'Pratt-Powell', '723 Leslie Harbor
Lake Michaelside, PR 06953', 'low');
INSERT INTO Restaurants (restaurant_Id, name, location, price) VALUES ('940', 'Waters-Coleman', '12516 Michael Loop
Brendachester, HI 63751', 'low');
INSERT INTO Restaurants (restaurant_Id, name, location, price) VALUES ('120', 'Walker, Buchanan and King', '0365 Davis Trafficway Suite 624
Georgeburgh, PA 59630', 'high');
INSERT INTO Restaurants (restaurant_Id, name, location, price) VALUES ('356', 'Little and Sons', '532 Aguirre Vista Apt. 874
New Natalietown, AK 53711', 'medium');
INSERT INTO Restaurants (restaurant_Id, name, location, price) VALUES ('499', 'Garcia Group', '989 Tracie Crossing Suite 198
South Audrey, RI 41477', 'medium');
INSERT INTO Restaurants (restaurant_Id, name, location, price) VALUES ('4', 'Douglas, Matthews and Barton', '44892 Sandra Trail Apt. 600
Colemanstad, HI 06468', 'medium');
INSERT INTO Restaurants (restaurant_Id, name, location, price) VALUES ('316', 'Castaneda-Page', '1713 Walker Mountain
Jessicashire, ID 55311', 'low');
INSERT INTO Restaurants (restaurant_Id, name, location, price) VALUES ('718', 'Morgan Ltd', '6922 Murphy Mission Apt. 445
Dustinburgh, IN 63068', 'high');
INSERT INTO Restaurants (restaurant_Id, name, location, price) VALUES ('325', 'Mills Group', '64815 Jones Springs
Austinfurt, WY 48644', 'high');
INSERT INTO Restaurants (restaurant_Id, name, location, price) VALUES ('645', 'Miller and Sons', '7399 Kenneth Mount Suite 962
South Elizabethtown, WY 49198', 'medium');
INSERT INTO Restaurants (restaurant_Id, name, location, price) VALUES ('511', 'Rush, Sullivan and Young', '0913 Chelsea Glens Suite 980
South Anthonyborough, MT 34752', 'low');
INSERT INTO Restaurants (restaurant_Id, name, location, price) VALUES ('324', 'Chase Group', '652 Jennifer Isle
West Kristinmouth, NE 22190', 'medium');
INSERT INTO Restaurants (restaurant_Id, name, location, price) VALUES ('329', 'King-Boyer', 'Unit 2860 Box 5138
DPO AE 62403', 'high');
INSERT INTO Restaurants (restaurant_Id, name, location, price) VALUES ('303', 'Kirby, Smith and Clayton', '9504 Ortiz Point
North Alexis, NM 78916', 'medium');
INSERT INTO Restaurants (restaurant_Id, name, location, price) VALUES ('144', 'Moreno, Byrd and Howard', '311 Chambers Tunnel
New Tiffanychester, WY 67541', 'medium');
INSERT INTO Restaurants (restaurant_Id, name, location, price) VALUES ('631', 'Gillespie-Padilla', '0785 Huff Neck
West Beckyborough, NJ 43928', 'medium');
INSERT INTO Restaurants (restaurant_Id, name, location, price) VALUES ('711', 'Harris-Huffman', 'Unit 7680 Box 1399
DPO AP 32143', 'high');
INSERT INTO Restaurants (restaurant_Id, name, location, price) VALUES ('524', 'Stephens, Rodriguez and Turner', '7524 Tara Causeway
Hurleychester, MN 45255', 'low');
INSERT INTO Restaurants (restaurant_Id, name, location, price) VALUES ('62', 'Campbell, Ball and James', '6427 Freeman Junctions Suite 483
Byrdbury, AK 32822', 'high');

-- Strong Entity
INSERT INTO hotel (hotel_Id, amentities, street, city, state, zipcode, duration, rating) VALUES ('863', 'Bar and Lounge Area, Valet Parking, Bicycle Rental Service', '4688 Ferguson Parks Suite 787', 'West Brendaborough', 'PR', '02830', '66', '2');
INSERT INTO hotel (hotel_Id, amentities, street, city, state, zipcode, duration, rating) VALUES ('505', 'Bar and Lounge Area, Valet Parking, Bicycle Rental Service', '719 Andrew Creek', 'Johnathanhaven', 'MT', '96703', '54', '2');
INSERT INTO hotel (hotel_Id, amentities, street, city, state, zipcode, duration, rating) VALUES ('316', 'Tennis Court, Golf Course Access, Jogging Trails', '387 Sandoval Land', 'Ingramchester', 'DC', '57077', '16', '4');
INSERT INTO hotel (hotel_Id, amentities, street, city, state, zipcode, duration, rating) VALUES ('382', 'Pet-Friendly Accommodations, Meeting and Event Spaces, Airport Shuttle Service', '279 Ann Street Apt. 232', 'Port Tara', 'VT', '02986', '82', '2');
INSERT INTO hotel (hotel_Id, amentities, street, city, state, zipcode, duration, rating) VALUES ('926', 'Bar and Lounge Area, Valet Parking, Bicycle Rental Service', '235 Andrew View', 'West Kimfort', 'FL', '61417', '94', '5');
INSERT INTO hotel (hotel_Id, amentities, street, city, state, zipcode, duration, rating) VALUES ('996', 'Free Wi-Fi, Complimentary Breakfast, Fitness Center', '546 Copeland Passage Apt. 960', 'Lake Williamville', 'WI', '39474', '46', '4');
INSERT INTO hotel (hotel_Id, amentities, street, city, state, zipcode, duration, rating) VALUES ('960', 'Bar and Lounge Area, Valet Parking, Bicycle Rental Service', '327 Adams Village Apt. 441', 'Vincentfort', 'OH', '04702', '73', '5');
INSERT INTO hotel (hotel_Id, amentities, street, city, state, zipcode, duration, rating) VALUES ('160', 'Bar and Lounge Area, Valet Parking, Bicycle Rental Service', '712 Jason Lodge Suite 877', 'Tuckerborough', 'IN', '13338', '15', '4');
INSERT INTO hotel (hotel_Id, amentities, street, city, state, zipcode, duration, rating) VALUES ('574', 'Business Center, Spa and Wellness Facilities, Concierge Service', '62562 Cody Trace', 'Lake Monique', 'MS', '45826', '54', '2');
INSERT INTO hotel (hotel_Id, amentities, street, city, state, zipcode, duration, rating) VALUES ('520', 'Business Center, Spa and Wellness Facilities, Concierge Service', '342 Chang Port', 'Port Christinaview', 'KY', '57527', '57', '1');
INSERT INTO hotel (hotel_Id, amentities, street, city, state, zipcode, duration, rating) VALUES ('96', 'Children Play Area, Picnic Area, BBQ Facilities', '902 David Crossing', 'Ramseystad', 'SD', '54330', '72', '3');
INSERT INTO hotel (hotel_Id, amentities, street, city, state, zipcode, duration, rating) VALUES ('763', 'Luggage Storage, Express Check-In/Check-Out, Currency Exchange', '92613 Gallagher Ridges', 'Millerburgh', 'ME', '75427', '11', '2');
INSERT INTO hotel (hotel_Id, amentities, street, city, state, zipcode, duration, rating) VALUES ('951', 'Game Room, Laundry Service, Gift Shop', '7969 Amy Stravenue', 'East Tracey', 'NH', '62919', '33', '2');
INSERT INTO hotel (hotel_Id, amentities, street, city, state, zipcode, duration, rating) VALUES ('835', 'Tennis Court, Golf Course Access, Jogging Trails', '239 Tara Bridge Suite 618', 'Lake Amanda', 'OR', '62296', '72', '1');
INSERT INTO hotel (hotel_Id, amentities, street, city, state, zipcode, duration, rating) VALUES ('670', 'Library, Fireplace Lounge, Movie Screening Room', '464 Bailey Heights Suite 376', 'Sherriside', 'NE', '14892', '41', '2');
INSERT INTO hotel (hotel_Id, amentities, street, city, state, zipcode, duration, rating) VALUES ('645', 'Outdoor Pool, On-site Restaurant, 24-Hour Room Service', '199 Baker Parks', 'Anthonyberg', 'MN', '97329', '8', '5');
INSERT INTO hotel (hotel_Id, amentities, street, city, state, zipcode, duration, rating) VALUES ('308', 'Children Play Area, Picnic Area, BBQ Facilities', '8054 Zamora Highway Suite 908', 'Wallertown', 'NE', '11205', '16', '1');
INSERT INTO hotel (hotel_Id, amentities, street, city, state, zipcode, duration, rating) VALUES ('136', 'Library, Fireplace Lounge, Movie Screening Room', '951 Erika Glen Apt. 667', 'Port Matthewside', 'TX', '12917', '14', '5');
INSERT INTO hotel (hotel_Id, amentities, street, city, state, zipcode, duration, rating) VALUES ('418', 'Luggage Storage, Express Check-In/Check-Out, Currency Exchange', '38797 Julia Brooks Apt. 667', 'East Kevin', 'NH', '77579', '16', '4');
INSERT INTO hotel (hotel_Id, amentities, street, city, state, zipcode, duration, rating) VALUES ('129', 'Luggage Storage, Express Check-In/Check-Out, Currency Exchange', '891 Mays Loop', 'Michaelmouth', 'OH', '40076', '61', '2');
INSERT INTO hotel (hotel_Id, amentities, street, city, state, zipcode, duration, rating) VALUES ('234', 'Tennis Court, Golf Course Access, Jogging Trails', '032 Lane Dale Suite 885', 'Port Michelle', 'UT', '46650', '40', '4');
INSERT INTO hotel (hotel_Id, amentities, street, city, state, zipcode, duration, rating) VALUES ('417', 'Bar and Lounge Area, Valet Parking, Bicycle Rental Service', '59085 Richard Shoals', 'Prestontown', 'MS', '51594', '22', '5');
INSERT INTO hotel (hotel_Id, amentities, street, city, state, zipcode, duration, rating) VALUES ('706', 'Game Room, Laundry Service, Gift Shop', '8454 Hines Lock', 'Port Melissa', 'GU', '86026', '64', '1');
INSERT INTO hotel (hotel_Id, amentities, street, city, state, zipcode, duration, rating) VALUES ('182', 'Outdoor Pool, On-site Restaurant, 24-Hour Room Service', '73586 Green Mill Suite 341', 'North Gloriamouth', 'OH', '30443', '93', '2');
INSERT INTO hotel (hotel_Id, amentities, street, city, state, zipcode, duration, rating) VALUES ('813', 'Outdoor Pool, On-site Restaurant, 24-Hour Room Service', '6121 Howard Crossing Suite 271', 'Sarahborough', 'NV', '51881', '99', '5');
INSERT INTO hotel (hotel_Id, amentities, street, city, state, zipcode, duration, rating) VALUES ('624', 'Children Play Area, Picnic Area, BBQ Facilities', '3587 Coleman Crest', 'East Robertton', 'MN', '47833', '71', '3');
INSERT INTO hotel (hotel_Id, amentities, street, city, state, zipcode, duration, rating) VALUES ('286', 'Free Wi-Fi, Complimentary Breakfast, Fitness Center', '140 David Underpass', 'Teresaberg', 'FL', '44731', '91', '2');
INSERT INTO hotel (hotel_Id, amentities, street, city, state, zipcode, duration, rating) VALUES ('183', 'Tennis Court, Golf Course Access, Jogging Trails', '359 Deborah Harbors', 'West Felicia', 'CT', '70384', '55', '4');
INSERT INTO hotel (hotel_Id, amentities, street, city, state, zipcode, duration, rating) VALUES ('969', 'Game Room, Laundry Service, Gift Shop', '717 Chen Square Apt. 322', 'Port Edwardside', 'VA', '07491', '76', '5');
INSERT INTO hotel (hotel_Id, amentities, street, city, state, zipcode, duration, rating) VALUES ('85', 'Luggage Storage, Express Check-In/Check-Out, Currency Exchange', '72679 Joseph Plain', 'Grantville', 'DC', '61719', '85', '2');
INSERT INTO hotel (hotel_Id, amentities, street, city, state, zipcode, duration, rating) VALUES ('211', 'Children Play Area, Picnic Area, BBQ Facilities', '838 Tiffany Square Apt. 577', 'Christophershire', 'KS', '81614', '55', '1');
INSERT INTO hotel (hotel_Id, amentities, street, city, state, zipcode, duration, rating) VALUES ('874', 'Pet-Friendly Accommodations, Meeting and Event Spaces, Airport Shuttle Service', '109 Ayala Key Suite 905', 'Ericville', 'NH', '75213', '10', '3');
INSERT INTO hotel (hotel_Id, amentities, street, city, state, zipcode, duration, rating) VALUES ('14', 'Free Wi-Fi, Complimentary Breakfast, Fitness Center', '449 Anderson Manors Apt. 892', 'Zoefurt', 'MT', '76341', '79', '4');
INSERT INTO hotel (hotel_Id, amentities, street, city, state, zipcode, duration, rating) VALUES ('580', 'Game Room, Laundry Service, Gift Shop', '3826 Erin Centers Suite 013', 'Brooksfort', 'HI', '94899', '58', '4');
INSERT INTO hotel (hotel_Id, amentities, street, city, state, zipcode, duration, rating) VALUES ('342', 'Luggage Storage, Express Check-In/Check-Out, Currency Exchange', '206 Jennifer Port Apt. 133', 'Port Natasha', 'WV', '55552', '57', '2');
INSERT INTO hotel (hotel_Id, amentities, street, city, state, zipcode, duration, rating) VALUES ('933', 'Outdoor Pool, On-site Restaurant, 24-Hour Room Service', '0026 Cassandra Valley Apt. 831', 'Sharonfurt', 'RI', '33496', '18', '3');
INSERT INTO hotel (hotel_Id, amentities, street, city, state, zipcode, duration, rating) VALUES ('901', 'Free Wi-Fi, Complimentary Breakfast, Fitness Center', '53165 Shelley Overpass', 'West Billy', 'NC', '68380', '58', '4');
INSERT INTO hotel (hotel_Id, amentities, street, city, state, zipcode, duration, rating) VALUES ('861', 'Pet-Friendly Accommodations, Meeting and Event Spaces, Airport Shuttle Service', '7435 Ritter Streets Apt. 375', 'Port Ericaland', 'PR', '09920', '22', '4');
INSERT INTO hotel (hotel_Id, amentities, street, city, state, zipcode, duration, rating) VALUES ('931', 'Outdoor Pool, On-site Restaurant, 24-Hour Room Service', '92778 Page Circle', 'South Rebeccafurt', 'ID', '93662', '15', '5');
INSERT INTO hotel (hotel_Id, amentities, street, city, state, zipcode, duration, rating) VALUES ('554', 'Luggage Storage, Express Check-In/Check-Out, Currency Exchange', '957 Dale Trace', 'West Johnhaven', 'GA', '06850', '32', '1');
INSERT INTO hotel (hotel_Id, amentities, street, city, state, zipcode, duration, rating) VALUES ('980', 'Children Play Area, Picnic Area, BBQ Facilities', '3792 Tran Rapids Apt. 494', 'North Thomas', 'AR', '57435', '3', '1');
INSERT INTO hotel (hotel_Id, amentities, street, city, state, zipcode, duration, rating) VALUES ('2', 'Outdoor Pool, On-site Restaurant, 24-Hour Room Service', '20204 Kelly Loop', 'Holtberg', 'MP', '98233', '93', '1');
INSERT INTO hotel (hotel_Id, amentities, street, city, state, zipcode, duration, rating) VALUES ('998', 'Children Play Area, Picnic Area, BBQ Facilities', '6700 Virginia Points', 'North Adrienne', 'GA', '65834', '41', '5');
INSERT INTO hotel (hotel_Id, amentities, street, city, state, zipcode, duration, rating) VALUES ('177', 'Luggage Storage, Express Check-In/Check-Out, Currency Exchange', '166 Alyssa Radial Suite 630', 'North Scotttown', 'UT', '52430', '92', '1');
INSERT INTO hotel (hotel_Id, amentities, street, city, state, zipcode, duration, rating) VALUES ('361', 'Pet-Friendly Accommodations, Meeting and Event Spaces, Airport Shuttle Service', '8085 Joseph Freeway', 'Lake Jacquelineview', 'NM', '75338', '90', '1');
INSERT INTO hotel (hotel_Id, amentities, street, city, state, zipcode, duration, rating) VALUES ('116', 'Pet-Friendly Accommodations, Meeting and Event Spaces, Airport Shuttle Service', '1275 Pierce Valleys', 'Vanessaberg', 'CT', '08170', '65', '4');
INSERT INTO hotel (hotel_Id, amentities, street, city, state, zipcode, duration, rating) VALUES ('393', 'Business Center, Spa and Wellness Facilities, Concierge Service', '84366 Cruz Path Suite 011', 'Lake Jasonhaven', 'ME', '86030', '42', '4');
INSERT INTO hotel (hotel_Id, amentities, street, city, state, zipcode, duration, rating) VALUES ('552', 'Bar and Lounge Area, Valet Parking, Bicycle Rental Service', '36546 Jonathan Spring Apt. 458', 'Jamiechester', 'AK', '65889', '41', '2');
INSERT INTO hotel (hotel_Id, amentities, street, city, state, zipcode, duration, rating) VALUES ('493', 'Children Play Area, Picnic Area, BBQ Facilities', '2264 Mcknight Branch Suite 390', 'Port Joeborough', 'PA', '35030', '67', '1');
INSERT INTO hotel (hotel_Id, amentities, street, city, state, zipcode, duration, rating) VALUES ('754', 'Business Center, Spa and Wellness Facilities, Concierge Service', '019 Ward Stream Apt. 400', 'North Erica', 'ND', '98700', '85', '1');
INSERT INTO hotel (hotel_Id, amentities, street, city, state, zipcode, duration, rating) VALUES ('485', 'Game Room, Laundry Service, Gift Shop', '8467 Benjamin Stravenue Suite 704', 'Rodneychester', 'DC', '23305', '60', '5');
INSERT INTO hotel (hotel_Id, amentities, street, city, state, zipcode, duration, rating) VALUES ('668', 'Free Wi-Fi, Complimentary Breakfast, Fitness Center', '972 Salazar Roads', 'Edwardsport', 'NM', '44193', '29', '2');
INSERT INTO hotel (hotel_Id, amentities, street, city, state, zipcode, duration, rating) VALUES ('553', 'Luggage Storage, Express Check-In/Check-Out, Currency Exchange', '70518 Arroyo Rapid Apt. 004', 'West Zacharymouth', 'OK', '24586', '67', '1');
INSERT INTO hotel (hotel_Id, amentities, street, city, state, zipcode, duration, rating) VALUES ('92', 'Outdoor Pool, On-site Restaurant, 24-Hour Room Service', '813 Chloe Manors Apt. 490', 'Sanchezside', 'CT', '26539', '21', '1');
INSERT INTO hotel (hotel_Id, amentities, street, city, state, zipcode, duration, rating) VALUES ('923', 'Tennis Court, Golf Course Access, Jogging Trails', '81687 Stewart Turnpike', 'Lake Eric', 'WI', '72563', '29', '1');
INSERT INTO hotel (hotel_Id, amentities, street, city, state, zipcode, duration, rating) VALUES ('162', 'Free Wi-Fi, Complimentary Breakfast, Fitness Center', '54170 Edward Motorway Apt. 940', 'East Charles', 'NY', '74404', '48', '4');
INSERT INTO hotel (hotel_Id, amentities, street, city, state, zipcode, duration, rating) VALUES ('750', 'Children Play Area, Picnic Area, BBQ Facilities', '0486 Mathew Pike', 'Shelbyport', 'AL', '97785', '11', '3');
INSERT INTO hotel (hotel_Id, amentities, street, city, state, zipcode, duration, rating) VALUES ('227', 'Free Wi-Fi, Complimentary Breakfast, Fitness Center', '4114 Stuart Hollow Apt. 630', 'Leslieville', 'MO', '06718', '73', '5');
INSERT INTO hotel (hotel_Id, amentities, street, city, state, zipcode, duration, rating) VALUES ('792', 'Library, Fireplace Lounge, Movie Screening Room', '824 Ayala Forest', 'Tinafort', 'KY', '35537', '8', '2');
INSERT INTO hotel (hotel_Id, amentities, street, city, state, zipcode, duration, rating) VALUES ('719', 'Business Center, Spa and Wellness Facilities, Concierge Service', '343 Carter Glens', 'Port Maryville', 'NJ', '53419', '96', '5');
INSERT INTO hotel (hotel_Id, amentities, street, city, state, zipcode, duration, rating) VALUES ('906', 'Business Center, Spa and Wellness Facilities, Concierge Service', '9408 Bernard Locks Apt. 301', 'Petershaven', 'ME', '85719', '62', '5');
INSERT INTO hotel (hotel_Id, amentities, street, city, state, zipcode, duration, rating) VALUES ('326', 'Bar and Lounge Area, Valet Parking, Bicycle Rental Service', '61524 Ortiz Streets Suite 877', 'Ricestad', 'UT', '90143', '7', '2');
INSERT INTO hotel (hotel_Id, amentities, street, city, state, zipcode, duration, rating) VALUES ('767', 'Free Wi-Fi, Complimentary Breakfast, Fitness Center', '960 Deanna Ridges', 'Oscarburgh', 'DC', '16163', '6', '4');
INSERT INTO hotel (hotel_Id, amentities, street, city, state, zipcode, duration, rating) VALUES ('253', 'Tennis Court, Golf Course Access, Jogging Trails', '18741 Thomas Falls', 'New Ryantown', 'NM', '33216', '68', '5');
INSERT INTO hotel (hotel_Id, amentities, street, city, state, zipcode, duration, rating) VALUES ('540', 'Children Play Area, Picnic Area, BBQ Facilities', '739 Christopher Ways', 'Juliestad', 'PW', '31286', '13', '1');
INSERT INTO hotel (hotel_Id, amentities, street, city, state, zipcode, duration, rating) VALUES ('537', 'Business Center, Spa and Wellness Facilities, Concierge Service', '04777 Robin Spur', 'Port Elizabeth', 'WI', '66862', '77', '2');
INSERT INTO hotel (hotel_Id, amentities, street, city, state, zipcode, duration, rating) VALUES ('564', 'Luggage Storage, Express Check-In/Check-Out, Currency Exchange', '13231 Gardner Manors', 'Ellisberg', 'KS', '82890', '84', '5');
INSERT INTO hotel (hotel_Id, amentities, street, city, state, zipcode, duration, rating) VALUES ('830', 'Pet-Friendly Accommodations, Meeting and Event Spaces, Airport Shuttle Service', '4566 Scott Heights', 'Kristinaton', 'RI', '63621', '83', '3');
INSERT INTO hotel (hotel_Id, amentities, street, city, state, zipcode, duration, rating) VALUES ('144', 'Luggage Storage, Express Check-In/Check-Out, Currency Exchange', '655 Shaun Crossing', 'West Noahhaven', 'ND', '51325', '97', '3');
INSERT INTO hotel (hotel_Id, amentities, street, city, state, zipcode, duration, rating) VALUES ('460', 'Luggage Storage, Express Check-In/Check-Out, Currency Exchange', '129 Burnett Mall Apt. 903', 'Michaelmouth', 'MA', '65350', '41', '3');
INSERT INTO hotel (hotel_Id, amentities, street, city, state, zipcode, duration, rating) VALUES ('866', 'Library, Fireplace Lounge, Movie Screening Room', '7453 Harris Orchard', 'Harrischester', 'NY', '09327', '25', '1');
INSERT INTO hotel (hotel_Id, amentities, street, city, state, zipcode, duration, rating) VALUES ('39', 'Children Play Area, Picnic Area, BBQ Facilities', '8204 Hawkins Island', 'Cherylland', 'IA', '10756', '29', '4');
INSERT INTO hotel (hotel_Id, amentities, street, city, state, zipcode, duration, rating) VALUES ('771', 'Library, Fireplace Lounge, Movie Screening Room', '7537 Vincent Keys Apt. 578', 'Mccormickport', 'CO', '84354', '98', '3');
INSERT INTO hotel (hotel_Id, amentities, street, city, state, zipcode, duration, rating) VALUES ('878', 'Bar and Lounge Area, Valet Parking, Bicycle Rental Service', '6660 Kathleen Roads', 'West Christineton', 'IL', '61068', '87', '1');
INSERT INTO hotel (hotel_Id, amentities, street, city, state, zipcode, duration, rating) VALUES ('93', 'Luggage Storage, Express Check-In/Check-Out, Currency Exchange', '8519 Brian Village Apt. 224', 'East Reginald', 'CO', '16653', '27', '3');

-- Strong Entity
INSERT INTO customer (customerId, street, city, state, zipcode, email, name, restaurant_Id, hotel_Id) VALUES ('917', '06793 Eric Knolls', 'Carrollville', 'NC', '79955', 'uhuber@example.com', 'Regina Martin', '895', '863');
INSERT INTO customer (customerId, street, city, state, zipcode, email, name, restaurant_Id, hotel_Id) VALUES ('830', '92643 Jessica Plaza', 'Lake Donald', 'MD', '78762', 'sandra57@example.net', 'Kyle Smith', '577', '505');
INSERT INTO customer (customerId, street, city, state, zipcode, email, name, restaurant_Id, hotel_Id) VALUES ('972', '36737 Green Lock Apt. 314', 'Garzaview', 'VT', '15677', 'craigjenny@example.net', 'Shannon Jones', '593', '316');
INSERT INTO customer (customerId, street, city, state, zipcode, email, name, restaurant_Id, hotel_Id) VALUES ('411', '051 Adams Court Apt. 260', 'New Raymondstad', 'OK', '69460', 'rwalton@example.org', 'Sierra Brown', '201', '382');
INSERT INTO customer (customerId, street, city, state, zipcode, email, name, restaurant_Id, hotel_Id) VALUES ('24', '8537 Kiara Drives Suite 746', 'Jasonshire', 'NJ', '13756', 'jason07@example.com', 'Shane Nash', '105', '926');
INSERT INTO customer (customerId, street, city, state, zipcode, email, name, restaurant_Id, hotel_Id) VALUES ('517', '45401 Christina Turnpike', 'South Jennifer', 'CT', '49602', 'hicksjack@example.org', 'Robin Barnes', '245', '996');
INSERT INTO customer (customerId, street, city, state, zipcode, email, name, restaurant_Id, hotel_Id) VALUES ('606', '84083 Louis Way', 'Thomasburgh', 'ME', '02002', 'stephaniemartinez@example.net', 'Kelly Mays', '180', '960');
INSERT INTO customer (customerId, street, city, state, zipcode, email, name, restaurant_Id, hotel_Id) VALUES ('555', '694 Brianna Trail Suite 683', 'Schmittville', 'NV', '80484', 'erikavalencia@example.org', 'Kimberly Thomas', '327', '160');
INSERT INTO customer (customerId, street, city, state, zipcode, email, name, restaurant_Id, hotel_Id) VALUES ('587', '46880 Johnson Lodge Apt. 531', 'East Jacob', 'MT', '62769', 'amber29@example.net', 'Daniel Mitchell', '81', '574');
INSERT INTO customer (customerId, street, city, state, zipcode, email, name, restaurant_Id, hotel_Id) VALUES ('486', '692 Woodard Highway Apt. 450', 'Stephenburgh', 'MD', '68690', 'grahamnicole@example.com', 'Vincent Lin', '202', '520');
INSERT INTO customer (customerId, street, city, state, zipcode, email, name, restaurant_Id, hotel_Id) VALUES ('49', '32986 Kimberly Station', 'Sharonshire', 'WI', '16409', 'grantchristensen@example.net', 'Joshua Webster', '284', '96');
INSERT INTO customer (customerId, street, city, state, zipcode, email, name, restaurant_Id, hotel_Id) VALUES ('197', '8551 Paul Corner', 'New Kimberlytown', 'IA', '22558', 'matthew38@example.org', 'James Patterson', '643', '763');
INSERT INTO customer (customerId, street, city, state, zipcode, email, name, restaurant_Id, hotel_Id) VALUES ('474', '42700 Manning Heights', 'South Paulville', 'UT', '55160', 'jason29@example.com', 'Kayla Andrews', '749', '951');
INSERT INTO customer (customerId, street, city, state, zipcode, email, name, restaurant_Id, hotel_Id) VALUES ('693', '50282 Bailey Overpass', 'West Saraland', 'NH', '64285', 'donna10@example.com', 'Emily Dudley', '80', '835');
INSERT INTO customer (customerId, street, city, state, zipcode, email, name, restaurant_Id, hotel_Id) VALUES ('610', '2431 Roger Loop', 'Port Reneemouth', 'NV', '68617', 'wlong@example.net', 'Christopher Bishop', '665', '670');
INSERT INTO customer (customerId, street, city, state, zipcode, email, name, restaurant_Id, hotel_Id) VALUES ('457', '3530 Aaron Points Apt. 130', 'Lake William', 'MD', '06445', 'jhaney@example.org', 'Monique Lang', '206', '645');
INSERT INTO customer (customerId, street, city, state, zipcode, email, name, restaurant_Id, hotel_Id) VALUES ('175', '2818 Marissa Branch Suite 816', 'Mitchellbury', 'NH', '11334', 'briansmith@example.org', 'Charles Taylor', '627', '308');
INSERT INTO customer (customerId, street, city, state, zipcode, email, name, restaurant_Id, hotel_Id) VALUES ('865', '731 Timothy Shoals', 'Jerrystad', 'FM', '38821', 'ujohnson@example.org', 'Meghan Thomas', '77', '136');
INSERT INTO customer (customerId, street, city, state, zipcode, email, name, restaurant_Id, hotel_Id) VALUES ('527', '106 Jennifer Coves Apt. 770', 'North Saraside', 'KS', '80656', 'robyn77@example.org', 'Mrs. Anna Gonzalez', '871', '418');
INSERT INTO customer (customerId, street, city, state, zipcode, email, name, restaurant_Id, hotel_Id) VALUES ('854', '921 Mcmillan Courts Suite 439', 'North Christopherside', 'GU', '69325', 'rebeccasteele@example.com', 'Cindy Luna', '731', '129');
INSERT INTO customer (customerId, street, city, state, zipcode, email, name, restaurant_Id, hotel_Id) VALUES ('476', '7921 Chavez Avenue', 'Pedrostad', 'FM', '80874', 'jaime68@example.com', 'Sean Hill', '132', '234');
INSERT INTO customer (customerId, street, city, state, zipcode, email, name, restaurant_Id, hotel_Id) VALUES ('116', '78088 Crane Place', 'Timmouth', 'OK', '10789', 'steven33@example.com', 'Darrell Skinner', '820', '417');
INSERT INTO customer (customerId, street, city, state, zipcode, email, name, restaurant_Id, hotel_Id) VALUES ('874', '5843 Campbell Ways', 'Watsonfort', 'VA', '23485', 'sherry07@example.net', 'Deborah Price', '716', '706');
INSERT INTO customer (customerId, street, city, state, zipcode, email, name, restaurant_Id, hotel_Id) VALUES ('998', '105 Diaz Turnpike', 'New Carolland', 'IN', '52615', 'knightkatelyn@example.com', 'Shari Day', '370', '182');
INSERT INTO customer (customerId, street, city, state, zipcode, email, name, restaurant_Id, hotel_Id) VALUES ('961', '714 Sanders Burgs', 'New Matthewmouth', 'MH', '08617', 'davilakevin@example.org', 'Mrs. Courtney Molina', '57', '813');
INSERT INTO customer (customerId, street, city, state, zipcode, email, name, restaurant_Id, hotel_Id) VALUES ('999', '9939 Garcia Cliff Suite 557', 'West Johnshire', 'LA', '46290', 'jonathan01@example.net', 'Gail Rocha', '296', '624');
INSERT INTO customer (customerId, street, city, state, zipcode, email, name, restaurant_Id, hotel_Id) VALUES ('129', '27875 Marquez Rest Suite 455', 'Port Michaelville', 'FM', '52574', 'robinsonjohn@example.org', 'Tony Curtis', '309', '286');
INSERT INTO customer (customerId, street, city, state, zipcode, email, name, restaurant_Id, hotel_Id) VALUES ('433', '95885 Lewis Knoll', 'West Ronaldmouth', 'MP', '65086', 'sraymond@example.com', 'Regina Ramirez', '141', '183');
INSERT INTO customer (customerId, street, city, state, zipcode, email, name, restaurant_Id, hotel_Id) VALUES ('15', '7156 Billy Key', 'South Aprilborough', 'MA', '89590', 'mbullock@example.net', 'Willie Dunn', '799', '969');
INSERT INTO customer (customerId, street, city, state, zipcode, email, name, restaurant_Id, hotel_Id) VALUES ('936', '989 Andrew Keys Apt. 312', 'North Michael', 'MI', '57597', 'cameron70@example.com', 'Mrs. Andrea Quinn', '714', '85');
INSERT INTO customer (customerId, street, city, state, zipcode, email, name, restaurant_Id, hotel_Id) VALUES ('605', '8222 Richards Mission', 'New Barbaraville', 'WA', '69321', 'tanyafields@example.com', 'Andrea Atkinson', '826', '211');
INSERT INTO customer (customerId, street, city, state, zipcode, email, name, restaurant_Id, hotel_Id) VALUES ('879', '5680 Miguel Mission Apt. 644', 'Port Brenda', 'ME', '31867', 'amber68@example.com', 'Victoria Patterson', '313', '874');
INSERT INTO customer (customerId, street, city, state, zipcode, email, name, restaurant_Id, hotel_Id) VALUES ('128', '01565 Silva Drive', 'Hamiltonport', 'NY', '18586', 'jamie66@example.org', 'Charles Hernandez', '840', '14');
INSERT INTO customer (customerId, street, city, state, zipcode, email, name, restaurant_Id, hotel_Id) VALUES ('0', '54334 Williamson Points', 'Owenshaven', 'WA', '27093', 'jonathan21@example.com', 'Kyle Roberts', '98', '580');
INSERT INTO customer (customerId, street, city, state, zipcode, email, name, restaurant_Id, hotel_Id) VALUES ('844', '42135 Margaret Bridge', 'Port Anthonyhaven', 'SD', '08291', 'idelacruz@example.net', 'Jacqueline Krause', '261', '342');
INSERT INTO customer (customerId, street, city, state, zipcode, email, name, restaurant_Id, hotel_Id) VALUES ('703', '6074 Reid Turnpike', 'Lake Amyton', 'AK', '03731', 'xhurley@example.org', 'James Gonzalez', '278', '933');
INSERT INTO customer (customerId, street, city, state, zipcode, email, name, restaurant_Id, hotel_Id) VALUES ('897', '503 Lisa Isle Apt. 143', 'Paceberg', 'MI', '76359', 'pbuck@example.com', 'Michael Guerrero', '154', '901');
INSERT INTO customer (customerId, street, city, state, zipcode, email, name, restaurant_Id, hotel_Id) VALUES ('871', '739 Crystal Orchard Apt. 959', 'Joeland', 'SD', '90898', 'joshuajones@example.net', 'Donald Webb', '22', '861');
INSERT INTO customer (customerId, street, city, state, zipcode, email, name, restaurant_Id, hotel_Id) VALUES ('615', '604 Lauren Groves', 'Perryfort', 'KS', '85378', 'diazholly@example.com', 'Jake Howard', '561', '931');
INSERT INTO customer (customerId, street, city, state, zipcode, email, name, restaurant_Id, hotel_Id) VALUES ('759', '37287 Hardy Dam', 'New Stevenville', 'KY', '46396', 'taylorwilliams@example.org', 'Linda Nguyen', '819', '554');
INSERT INTO customer (customerId, street, city, state, zipcode, email, name, restaurant_Id, hotel_Id) VALUES ('646', '0186 Robinson Field Suite 020', 'Amandachester', 'FM', '06642', 'tdean@example.com', 'Kevin Silva', '290', '980');
INSERT INTO customer (customerId, street, city, state, zipcode, email, name, restaurant_Id, hotel_Id) VALUES ('903', '30772 Robert Road', 'South Jessica', 'ID', '36213', 'perrywatson@example.com', 'Laura Mitchell', '839', '2');
INSERT INTO customer (customerId, street, city, state, zipcode, email, name, restaurant_Id, hotel_Id) VALUES ('315', '04808 Bailey Harbors', 'Wayneberg', 'KS', '85378', 'robertgeorge@example.org', 'Steven Jenkins', '149', '998');
INSERT INTO customer (customerId, street, city, state, zipcode, email, name, restaurant_Id, hotel_Id) VALUES ('682', '234 Sandy Rue Apt. 432', 'North Ricky', 'KS', '30631', 'karenlewis@example.net', 'Mary Leon', '551', '177');
INSERT INTO customer (customerId, street, city, state, zipcode, email, name, restaurant_Id, hotel_Id) VALUES ('37', '8728 Rogers Well Apt. 733', 'Sheliachester', 'AS', '65666', 'julie53@example.org', 'Kristin Gardner', '394', '361');
INSERT INTO customer (customerId, street, city, state, zipcode, email, name, restaurant_Id, hotel_Id) VALUES ('421', '54536 Eaton Highway Apt. 822', 'East Stevenville', 'GA', '17954', 'xmeyer@example.org', 'Robert Andersen', '187', '116');
INSERT INTO customer (customerId, street, city, state, zipcode, email, name, restaurant_Id, hotel_Id) VALUES ('923', '8725 Williams Stravenue Suite 206', 'West Patrick', 'ND', '35452', 'paulaellis@example.org', 'Tracy Galloway', '29', '393');
INSERT INTO customer (customerId, street, city, state, zipcode, email, name, restaurant_Id, hotel_Id) VALUES ('969', '383 Rodriguez Coves', 'Lake Markmouth', 'RI', '90906', 'thompsonashley@example.net', 'Brenda Moore', '484', '552');
INSERT INTO customer (customerId, street, city, state, zipcode, email, name, restaurant_Id, hotel_Id) VALUES ('671', '216 James Ferry', 'Riverahaven', 'WV', '12687', 'fitzgeraldmichael@example.com', 'Samantha Martinez', '334', '493');
INSERT INTO customer (customerId, street, city, state, zipcode, email, name, restaurant_Id, hotel_Id) VALUES ('738', '3424 Jones Trace', 'South Theodoremouth', 'WI', '12922', 'davismikayla@example.org', 'Keith Davidson', '929', '754');
INSERT INTO customer (customerId, street, city, state, zipcode, email, name, restaurant_Id, hotel_Id) VALUES ('498', '54324 Warner Mountains', 'North Shawn', 'NJ', '63550', 'villachad@example.com', 'Patricia Smith', '210', '485');
INSERT INTO customer (customerId, street, city, state, zipcode, email, name, restaurant_Id, hotel_Id) VALUES ('144', '66179 Brooks Canyon', 'North Julie', 'AZ', '48244', 'brian41@example.net', 'Robert Thomas', '397', '668');
INSERT INTO customer (customerId, street, city, state, zipcode, email, name, restaurant_Id, hotel_Id) VALUES ('588', '064 Williams Village', 'North Justin', 'ND', '74225', 'travisodonnell@example.com', 'Stephen Cooper', '198', '553');
INSERT INTO customer (customerId, street, city, state, zipcode, email, name, restaurant_Id, hotel_Id) VALUES ('546', '919 Snyder Skyway Suite 587', 'East Nicolas', 'PA', '33555', 'mclaughlinmarisa@example.com', 'Roger Jefferson', '48', '92');
INSERT INTO customer (customerId, street, city, state, zipcode, email, name, restaurant_Id, hotel_Id) VALUES ('701', '05665 John Springs', 'Staceystad', 'IN', '05529', 'michele20@example.net', 'Zachary Juarez', '670', '923');
INSERT INTO customer (customerId, street, city, state, zipcode, email, name, restaurant_Id, hotel_Id) VALUES ('765', '3119 Steven Groves', 'Morganfort', 'TX', '22514', 'montgomerykaylee@example.com', 'Kelly Buckley', '622', '162');
INSERT INTO customer (customerId, street, city, state, zipcode, email, name, restaurant_Id, hotel_Id) VALUES ('608', '0887 Kristin Ford Suite 098', 'East Daltonshire', 'CT', '08123', 'fernandezmary@example.net', 'Ashley Campbell', '896', '750');
INSERT INTO customer (customerId, street, city, state, zipcode, email, name, restaurant_Id, hotel_Id) VALUES ('30', '046 Martinez Mountain', 'West Latoyaton', 'NH', '38012', 'vcherry@example.org', 'Rhonda Mcfarland', '940', '227');
INSERT INTO customer (customerId, street, city, state, zipcode, email, name, restaurant_Id, hotel_Id) VALUES ('624', '613 Andrea Mountain Suite 951', 'Carloshaven', 'VI', '13154', 'melissahardin@example.com', 'Jonathan Thomas', '120', '792');
INSERT INTO customer (customerId, street, city, state, zipcode, email, name, restaurant_Id, hotel_Id) VALUES ('419', '805 Jacqueline Valley Suite 078', 'Dukebury', 'PR', '74240', 'joshua61@example.com', 'Carrie Martinez', '356', '719');
INSERT INTO customer (customerId, street, city, state, zipcode, email, name, restaurant_Id, hotel_Id) VALUES ('699', '8925 Lewis Radial', 'Port Kevinchester', 'RI', '96698', 'qparker@example.net', 'Richard Roberts', '499', '906');
INSERT INTO customer (customerId, street, city, state, zipcode, email, name, restaurant_Id, hotel_Id) VALUES ('475', '507 Katherine Walk', 'Bellport', 'NY', '82096', 'cheyennemorris@example.net', 'Patricia Cole', '4', '326');
INSERT INTO customer (customerId, street, city, state, zipcode, email, name, restaurant_Id, hotel_Id) VALUES ('392', '183 Cathy Point Suite 105', 'East Maurice', 'LA', '38809', 'jamesrivera@example.org', 'Ricky Obrien', '316', '767');
INSERT INTO customer (customerId, street, city, state, zipcode, email, name, restaurant_Id, hotel_Id) VALUES ('511', '07434 Sherman Streets Apt. 618', 'Lake Daniel', 'MD', '43282', 'rachelcosta@example.com', 'Jenna Bryan', '718', '253');
INSERT INTO customer (customerId, street, city, state, zipcode, email, name, restaurant_Id, hotel_Id) VALUES ('832', '0334 Vincent Crossing', 'New Franciscohaven', 'SC', '53509', 'imiller@example.com', 'Breanna Nguyen', '325', '540');
INSERT INTO customer (customerId, street, city, state, zipcode, email, name, restaurant_Id, hotel_Id) VALUES ('240', '926 John Harbors Apt. 953', 'South Michaelmouth', 'AL', '41329', 'robert41@example.org', 'Mrs. Rhonda Jackson', '645', '537');
INSERT INTO customer (customerId, street, city, state, zipcode, email, name, restaurant_Id, hotel_Id) VALUES ('962', '985 Jennifer Key Suite 981', 'West Kelly', 'RI', '73877', 'teresapayne@example.com', 'Candice Fox MD', '511', '564');
INSERT INTO customer (customerId, street, city, state, zipcode, email, name, restaurant_Id, hotel_Id) VALUES ('275', '33916 Isaiah Court', 'Hernandezhaven', 'VA', '62168', 'owolf@example.com', 'Lisa Jones', '324', '830');
INSERT INTO customer (customerId, street, city, state, zipcode, email, name, restaurant_Id, hotel_Id) VALUES ('11', '10803 Lauren Points', 'South Kaylee', 'MS', '96732', 'dakota18@example.net', 'Katherine Garcia', '329', '144');
INSERT INTO customer (customerId, street, city, state, zipcode, email, name, restaurant_Id, hotel_Id) VALUES ('707', '395 Tiffany Lock', 'Lake Robert', 'MN', '16377', 'monicaflores@example.org', 'David Miller', '303', '460');
INSERT INTO customer (customerId, street, city, state, zipcode, email, name, restaurant_Id, hotel_Id) VALUES ('997', '3086 Jonathon Place Apt. 472', 'East Patrick', 'CA', '13303', 'suttontimothy@example.com', 'Thomas Martin', '144', '866');
INSERT INTO customer (customerId, street, city, state, zipcode, email, name, restaurant_Id, hotel_Id) VALUES ('190', '240 Hardin Terrace', 'Lake Kristinechester', 'TX', '17881', 'robert71@example.com', 'Kurt Stark', '631', '39');
INSERT INTO customer (customerId, street, city, state, zipcode, email, name, restaurant_Id, hotel_Id) VALUES ('412', '033 Frank Forge', 'Port Susanfurt', 'WY', '22419', 'warrenchristopher@example.net', 'Michael Anderson', '711', '771');
INSERT INTO customer (customerId, street, city, state, zipcode, email, name, restaurant_Id, hotel_Id) VALUES ('93', '31280 Tracy Islands', 'South Michaelshire', 'CA', '55490', 'peter16@example.net', 'Sara Fleming', '524', '878');
INSERT INTO customer (customerId, street, city, state, zipcode, email, name, restaurant_Id, hotel_Id) VALUES ('657', '55953 David Isle', 'East Michaelstad', 'WV', '43480', 'rhonda72@example.org', 'Tyler Simmons', '62', '93');

-- Strong Entity
INSERT INTO airline (airline_name, contact_info) VALUES ('Ellis LLC', '975.408.3463');
INSERT INTO airline (airline_name, contact_info) VALUES ('Woodard-Giles', '445.874.5890x831');
INSERT INTO airline (airline_name, contact_info) VALUES ('Stevens, Caldwell and Johnson', '(319)994-9153x393');
INSERT INTO airline (airline_name, contact_info) VALUES ('Lloyd PLC', '(254)797-9184x9974');
INSERT INTO airline (airline_name, contact_info) VALUES ('Navarro and Sons', '665-676-8067x76534');
INSERT INTO airline (airline_name, contact_info) VALUES ('Davenport, Padilla and Gibson', '001-596-517-9768x41470');
INSERT INTO airline (airline_name, contact_info) VALUES ('Jackson, Knight and Johnson', '001-815-706-4177x980');
INSERT INTO airline (airline_name, contact_info) VALUES ('Yu-Burgess', '(333)457-4917x57833');
INSERT INTO airline (airline_name, contact_info) VALUES ('Sandoval, Stevens and Ayala', '542-406-4491');
INSERT INTO airline (airline_name, contact_info) VALUES ('Jackson-Davis', '243-439-3830x4786');
INSERT INTO airline (airline_name, contact_info) VALUES ('Nelson and Sons', '907.751.7904');
INSERT INTO airline (airline_name, contact_info) VALUES ('Johnson PLC', '(371)535-1032');
INSERT INTO airline (airline_name, contact_info) VALUES ('White Group', '+1-938-756-4012');
INSERT INTO airline (airline_name, contact_info) VALUES ('Watson, Fowler and Berg', '+1-635-628-9559');
INSERT INTO airline (airline_name, contact_info) VALUES ('White-Sherman', '501-983-9818x44754');
INSERT INTO airline (airline_name, contact_info) VALUES ('Becker-Shields', '001-255-650-7265x9596');
INSERT INTO airline (airline_name, contact_info) VALUES ('Humphrey and Sons', '674.361.1154x72369');
INSERT INTO airline (airline_name, contact_info) VALUES ('Turner, Eaton and Taylor', '+1-873-754-5219x45114');
INSERT INTO airline (airline_name, contact_info) VALUES ('Lewis, Lang and Stout', '+1-376-933-8196x12489');
INSERT INTO airline (airline_name, contact_info) VALUES ('Hunt-Cox', '(314)794-5479');
INSERT INTO airline (airline_name, contact_info) VALUES ('Petty Ltd', '(865)868-0224');
INSERT INTO airline (airline_name, contact_info) VALUES ('Frye-Thompson', '9963208688');
INSERT INTO airline (airline_name, contact_info) VALUES ('Rios LLC', '209.640.5239x524');
INSERT INTO airline (airline_name, contact_info) VALUES ('Perez, Lucas and Cox', '431-943-5469x81338');
INSERT INTO airline (airline_name, contact_info) VALUES ('Taylor Inc', '912.516.4896x49189');
INSERT INTO airline (airline_name, contact_info) VALUES ('Taylor, Reed and Burns', '(538)775-2129x94195');
INSERT INTO airline (airline_name, contact_info) VALUES ('Johnson, Mcdonald and Gross', '7067775564');
INSERT INTO airline (airline_name, contact_info) VALUES ('Jones PLC', '001-431-494-4668x435');
INSERT INTO airline (airline_name, contact_info) VALUES ('Johnson and Sons', '+1-257-843-7571');
INSERT INTO airline (airline_name, contact_info) VALUES ('Navarro-Carter', '(533)217-2715x6747');
INSERT INTO airline (airline_name, contact_info) VALUES ('Acosta and Sons', '+1-668-915-3227x3886');
INSERT INTO airline (airline_name, contact_info) VALUES ('Kelly-Russo', '2194249379');
INSERT INTO airline (airline_name, contact_info) VALUES ('Townsend-Pena', '(827)408-8561');
INSERT INTO airline (airline_name, contact_info) VALUES ('Ellison, Yang and Carey', '+1-532-676-7938x826');
INSERT INTO airline (airline_name, contact_info) VALUES ('Perez LLC', '(559)956-7981');
INSERT INTO airline (airline_name, contact_info) VALUES ('Ramos-Bowman', '001-901-359-0649x04010');
INSERT INTO airline (airline_name, contact_info) VALUES ('Ramirez-Price', '433.461.5067x973');
INSERT INTO airline (airline_name, contact_info) VALUES ('Douglas-Jordan', '(209)224-4213x316');
INSERT INTO airline (airline_name, contact_info) VALUES ('Reed Inc', '(270)903-5072');
INSERT INTO airline (airline_name, contact_info) VALUES ('Kline, Armstrong and Ramirez', '+1-903-493-6029');
INSERT INTO airline (airline_name, contact_info) VALUES ('Pratt, Snyder and Stuart', '639.937.5873');
INSERT INTO airline (airline_name, contact_info) VALUES ('Parker-Hall', '001-580-265-2970x25629');
INSERT INTO airline (airline_name, contact_info) VALUES ('Scott and Sons', '274.279.4784');
INSERT INTO airline (airline_name, contact_info) VALUES ('Lewis-Hodges', '(384)682-9040');
INSERT INTO airline (airline_name, contact_info) VALUES ('Adams PLC', '261-242-9922');
INSERT INTO airline (airline_name, contact_info) VALUES ('Nguyen Inc', '501-505-1147x20182');
INSERT INTO airline (airline_name, contact_info) VALUES ('Moore, Patterson and Nelson', '840.635.3314x0654');
INSERT INTO airline (airline_name, contact_info) VALUES ('Evans Inc', '001-619-787-7176x468');
INSERT INTO airline (airline_name, contact_info) VALUES ('Payne-Russell', '447.797.4080x6455');
INSERT INTO airline (airline_name, contact_info) VALUES ('Jones LLC', '(944)273-5989');
INSERT INTO airline (airline_name, contact_info) VALUES ('Mcconnell-Sanchez', '976-892-8694x102');
INSERT INTO airline (airline_name, contact_info) VALUES ('Lawrence and Sons', '+1-272-881-1779x0724');
INSERT INTO airline (airline_name, contact_info) VALUES ('Horton Ltd', '459-720-4421');
INSERT INTO airline (airline_name, contact_info) VALUES ('Choi Group', '482.627.7104');
INSERT INTO airline (airline_name, contact_info) VALUES ('Norton and Sons', '+1-355-963-0756x080');
INSERT INTO airline (airline_name, contact_info) VALUES ('Kline, Sullivan and Cruz', '428.928.2907x5053');
INSERT INTO airline (airline_name, contact_info) VALUES ('Moore PLC', '(736)397-2675x55141');
INSERT INTO airline (airline_name, contact_info) VALUES ('Collins, Bradley and Gill', '001-857-475-9792x873');
INSERT INTO airline (airline_name, contact_info) VALUES ('Wang Group', '(983)993-8173x6654');
INSERT INTO airline (airline_name, contact_info) VALUES ('Strong-Fowler', '920-377-4822');
INSERT INTO airline (airline_name, contact_info) VALUES ('Perez-Goodman', '4539377394');
INSERT INTO airline (airline_name, contact_info) VALUES ('Murphy-Sanchez', '696.587.6039x42520');
INSERT INTO airline (airline_name, contact_info) VALUES ('Huffman, Martinez and Chan', '001-303-564-8423');
INSERT INTO airline (airline_name, contact_info) VALUES ('Reilly-Dunlap', '2384914074');
INSERT INTO airline (airline_name, contact_info) VALUES ('Cohen, Nelson and Park', '267-644-9161x66282');
INSERT INTO airline (airline_name, contact_info) VALUES ('Hall-Garner', '+1-807-209-4240x91566');
INSERT INTO airline (airline_name, contact_info) VALUES ('Stewart-Thomas', '(785)665-2210x038');
INSERT INTO airline (airline_name, contact_info) VALUES ('Hampton-Duke', '(655)949-7265x121');
INSERT INTO airline (airline_name, contact_info) VALUES ('Brewer and Sons', '001-768-517-7632x487');
INSERT INTO airline (airline_name, contact_info) VALUES ('King and Sons', '713.306.5381');
INSERT INTO airline (airline_name, contact_info) VALUES ('Garcia Inc', '959.527.4947x59072');
INSERT INTO airline (airline_name, contact_info) VALUES ('Barry, Frank and Hancock', '(710)441-5610x31233');
INSERT INTO airline (airline_name, contact_info) VALUES ('Foley-Garcia', '710-857-5592x26607');
INSERT INTO airline (airline_name, contact_info) VALUES ('King-Johnson', '(344)853-3742x37069');
INSERT INTO airline (airline_name, contact_info) VALUES ('Stanley-Weaver', '762.925.3021x0109');

-- Strong Entity
INSERT INTO flights (flight_no, seats, duration, departure_location, arrival_time, arrival_location, departure_time, airline_name) VALUES ('32984', '99', '84', 'Johnsonborough', '1988-06-13 15:43:42', 'Victoriaton', '1988-06-13 15:43:42', 'Ellis LLC');
INSERT INTO flights (flight_no, seats, duration, departure_location, arrival_time, arrival_location, departure_time, airline_name) VALUES ('73467', '29', '57', 'Reidbury', '2010-02-03 05:59:05', 'Patriciaborough', '2010-02-03 05:59:05', 'Woodard-Giles');
INSERT INTO flights (flight_no, seats, duration, departure_location, arrival_time, arrival_location, departure_time, airline_name) VALUES ('31194', '0', '62', 'Mercerburgh', '2013-05-28 08:15:32', 'New Mark', '2013-05-28 08:15:32', 'Stevens, Caldwell and Johnson');
INSERT INTO flights (flight_no, seats, duration, departure_location, arrival_time, arrival_location, departure_time, airline_name) VALUES ('7965', '74', '58', 'Deannaland', '1984-10-31 20:33:08', 'East Stephanie', '1984-10-31 20:33:08', 'Lloyd PLC');
INSERT INTO flights (flight_no, seats, duration, departure_location, arrival_time, arrival_location, departure_time, airline_name) VALUES ('41532', '28', '61', 'West Aprilborough', '1993-09-17 04:56:37', 'New Stephaniemouth', '1993-09-17 04:56:37', 'Navarro and Sons');
INSERT INTO flights (flight_no, seats, duration, departure_location, arrival_time, arrival_location, departure_time, airline_name) VALUES ('26839', '52', '55', 'Fletchershire', '2012-01-23 10:59:51', 'Reyeschester', '2012-01-23 10:59:51', 'Davenport, Padilla and Gibson');
INSERT INTO flights (flight_no, seats, duration, departure_location, arrival_time, arrival_location, departure_time, airline_name) VALUES ('24165', '98', '6', 'Port Karenchester', '1991-02-12 10:42:23', 'South Timothyport', '1991-02-12 10:42:23', 'Jackson, Knight and Johnson');
INSERT INTO flights (flight_no, seats, duration, departure_location, arrival_time, arrival_location, departure_time, airline_name) VALUES ('49800', '96', '94', 'West Jeremyburgh', '1970-06-01 16:29:17', 'Lake Heather', '1970-06-01 16:29:17', 'Yu-Burgess');
INSERT INTO flights (flight_no, seats, duration, departure_location, arrival_time, arrival_location, departure_time, airline_name) VALUES ('84811', '64', '67', 'Stevensonchester', '2015-05-25 11:56:53', 'Jonchester', '2015-05-25 11:56:53', 'Sandoval, Stevens and Ayala');
INSERT INTO flights (flight_no, seats, duration, departure_location, arrival_time, arrival_location, departure_time, airline_name) VALUES ('78520', '66', '18', 'Colemouth', '1970-07-07 06:10:27', 'New Lauren', '1970-07-07 06:10:27', 'Jackson-Davis');
INSERT INTO flights (flight_no, seats, duration, departure_location, arrival_time, arrival_location, departure_time, airline_name) VALUES ('445', '57', '73', 'North Kristinabury', '1985-05-15 11:44:36', 'East Erika', '1985-05-15 11:44:36', 'Nelson and Sons');
INSERT INTO flights (flight_no, seats, duration, departure_location, arrival_time, arrival_location, departure_time, airline_name) VALUES ('64922', '64', '85', 'Galvanport', '1998-02-23 04:14:45', 'Port Tarastad', '1998-02-23 04:14:45', 'Johnson PLC');
INSERT INTO flights (flight_no, seats, duration, departure_location, arrival_time, arrival_location, departure_time, airline_name) VALUES ('73352', '26', '83', 'East Sabrinachester', '1980-06-07 08:20:08', 'Mezaport', '1980-06-07 08:20:08', 'White Group');
INSERT INTO flights (flight_no, seats, duration, departure_location, arrival_time, arrival_location, departure_time, airline_name) VALUES ('98940', '59', '95', 'Barbarahaven', '1980-10-20 09:27:30', 'Jasmineport', '1980-10-20 09:27:30', 'Watson, Fowler and Berg');
INSERT INTO flights (flight_no, seats, duration, departure_location, arrival_time, arrival_location, departure_time, airline_name) VALUES ('96138', '31', '49', 'South Katrina', '1989-04-29 20:27:33', 'Youngborough', '1989-04-29 20:27:33', 'White-Sherman');
INSERT INTO flights (flight_no, seats, duration, departure_location, arrival_time, arrival_location, departure_time, airline_name) VALUES ('86680', '98', '14', 'Karenton', '2003-04-22 15:54:24', 'North Emilyburgh', '2003-04-22 15:54:24', 'Becker-Shields');
INSERT INTO flights (flight_no, seats, duration, departure_location, arrival_time, arrival_location, departure_time, airline_name) VALUES ('91907', '89', '1', 'Gregoryfurt', '2018-08-27 18:05:00', 'Lake Gregory', '2018-08-27 18:05:00', 'Humphrey and Sons');
INSERT INTO flights (flight_no, seats, duration, departure_location, arrival_time, arrival_location, departure_time, airline_name) VALUES ('57633', '29', '4', 'Lake Brittany', '2022-11-21 09:01:23', 'Port Katherine', '2022-11-21 09:01:23', 'Turner, Eaton and Taylor');
INSERT INTO flights (flight_no, seats, duration, departure_location, arrival_time, arrival_location, departure_time, airline_name) VALUES ('1274', '71', '2', 'Wayneville', '2009-05-08 01:40:47', 'Castromouth', '2009-05-08 01:40:47', 'Lewis, Lang and Stout');
INSERT INTO flights (flight_no, seats, duration, departure_location, arrival_time, arrival_location, departure_time, airline_name) VALUES ('77104', '13', '74', 'New Matthew', '1996-05-18 17:53:59', 'Mooneyburgh', '1996-05-18 17:53:59', 'Hunt-Cox');
INSERT INTO flights (flight_no, seats, duration, departure_location, arrival_time, arrival_location, departure_time, airline_name) VALUES ('83764', '8', '72', 'Donaldchester', '1975-02-12 10:52:40', 'Port Nancy', '1975-02-12 10:52:40', 'Petty Ltd');
INSERT INTO flights (flight_no, seats, duration, departure_location, arrival_time, arrival_location, departure_time, airline_name) VALUES ('78225', '52', '28', 'Adamburgh', '1973-01-24 16:51:31', 'Bellburgh', '1973-01-24 16:51:31', 'Frye-Thompson');
INSERT INTO flights (flight_no, seats, duration, departure_location, arrival_time, arrival_location, departure_time, airline_name) VALUES ('21567', '50', '77', 'South Sherry', '1984-11-03 14:35:53', 'North Marc', '1984-11-03 14:35:53', 'Rios LLC');
INSERT INTO flights (flight_no, seats, duration, departure_location, arrival_time, arrival_location, departure_time, airline_name) VALUES ('10242', '49', '68', 'West Cherylfurt', '1989-04-21 10:41:05', 'Williamsport', '1989-04-21 10:41:05', 'Perez, Lucas and Cox');
INSERT INTO flights (flight_no, seats, duration, departure_location, arrival_time, arrival_location, departure_time, airline_name) VALUES ('64744', '77', '82', 'Walkerfort', '2006-07-06 18:12:05', 'South Scotttown', '2006-07-06 18:12:05', 'Taylor Inc');
INSERT INTO flights (flight_no, seats, duration, departure_location, arrival_time, arrival_location, departure_time, airline_name) VALUES ('94011', '72', '77', 'Samanthaville', '2019-11-25 03:01:40', 'Clarkton', '2019-11-25 03:01:40', 'Taylor, Reed and Burns');
INSERT INTO flights (flight_no, seats, duration, departure_location, arrival_time, arrival_location, departure_time, airline_name) VALUES ('27776', '74', '7', 'West Robert', '2006-11-03 15:16:38', 'Rhondachester', '2006-11-03 15:16:38', 'Johnson, Mcdonald and Gross');
INSERT INTO flights (flight_no, seats, duration, departure_location, arrival_time, arrival_location, departure_time, airline_name) VALUES ('73486', '99', '68', 'Nguyenland', '1991-02-05 07:48:46', 'South John', '1991-02-05 07:48:46', 'Jones PLC');
INSERT INTO flights (flight_no, seats, duration, departure_location, arrival_time, arrival_location, departure_time, airline_name) VALUES ('82264', '82', '29', 'Sheamouth', '2001-03-03 17:59:41', 'Murphyton', '2001-03-03 17:59:41', 'Johnson and Sons');
INSERT INTO flights (flight_no, seats, duration, departure_location, arrival_time, arrival_location, departure_time, airline_name) VALUES ('18313', '94', '98', 'Lake Amanda', '2012-08-21 04:19:51', 'South Anthony', '2012-08-21 04:19:51', 'Navarro-Carter');
INSERT INTO flights (flight_no, seats, duration, departure_location, arrival_time, arrival_location, departure_time, airline_name) VALUES ('17844', '97', '88', 'Sandyborough', '1983-06-09 10:30:32', 'Howardville', '1983-06-09 10:30:32', 'Acosta and Sons');
INSERT INTO flights (flight_no, seats, duration, departure_location, arrival_time, arrival_location, departure_time, airline_name) VALUES ('92375', '82', '72', 'New Markville', '1992-06-27 16:57:46', 'North Belinda', '1992-06-27 16:57:46', 'Kelly-Russo');
INSERT INTO flights (flight_no, seats, duration, departure_location, arrival_time, arrival_location, departure_time, airline_name) VALUES ('13007', '5', '53', 'East Kimberlyport', '1987-01-30 15:41:14', 'Williamston', '1987-01-30 15:41:14', 'Townsend-Pena');
INSERT INTO flights (flight_no, seats, duration, departure_location, arrival_time, arrival_location, departure_time, airline_name) VALUES ('52002', '66', '51', 'Lake Stephen', '2020-03-21 14:02:48', 'East Johnchester', '2020-03-21 14:02:48', 'Ellison, Yang and Carey');
INSERT INTO flights (flight_no, seats, duration, departure_location, arrival_time, arrival_location, departure_time, airline_name) VALUES ('14189', '72', '65', 'Melissamouth', '2011-08-02 04:08:18', 'North Laurafurt', '2011-08-02 04:08:18', 'Perez LLC');
INSERT INTO flights (flight_no, seats, duration, departure_location, arrival_time, arrival_location, departure_time, airline_name) VALUES ('86313', '80', '84', 'Port Josephborough', '2007-11-13 03:33:03', 'Port Rhonda', '2007-11-13 03:33:03', 'Ramos-Bowman');
INSERT INTO flights (flight_no, seats, duration, departure_location, arrival_time, arrival_location, departure_time, airline_name) VALUES ('80142', '30', '6', 'Clarkland', '2018-06-29 12:19:44', 'South Dawn', '2018-06-29 12:19:44', 'Ramirez-Price');
INSERT INTO flights (flight_no, seats, duration, departure_location, arrival_time, arrival_location, departure_time, airline_name) VALUES ('21485', '4', '38', 'Ericburgh', '2017-07-15 16:30:24', 'South Jennifer', '2017-07-15 16:30:24', 'Douglas-Jordan');
INSERT INTO flights (flight_no, seats, duration, departure_location, arrival_time, arrival_location, departure_time, airline_name) VALUES ('80217', '75', '65', 'Andersonshire', '1972-10-08 04:29:08', 'Lauraside', '1972-10-08 04:29:08', 'Reed Inc');
INSERT INTO flights (flight_no, seats, duration, departure_location, arrival_time, arrival_location, departure_time, airline_name) VALUES ('11551', '49', '58', 'West Scott', '2021-05-24 16:44:55', 'Barnesside', '2021-05-24 16:44:55', 'Kline, Armstrong and Ramirez');
INSERT INTO flights (flight_no, seats, duration, departure_location, arrival_time, arrival_location, departure_time, airline_name) VALUES ('88000', '16', '68', 'West Joseph', '1997-08-08 01:12:18', 'Lynchfurt', '1997-08-08 01:12:18', 'Pratt, Snyder and Stuart');
INSERT INTO flights (flight_no, seats, duration, departure_location, arrival_time, arrival_location, departure_time, airline_name) VALUES ('45108', '40', '15', 'Lake Tony', '1989-06-09 22:58:30', 'Port Joanne', '1989-06-09 22:58:30', 'Parker-Hall');
INSERT INTO flights (flight_no, seats, duration, departure_location, arrival_time, arrival_location, departure_time, airline_name) VALUES ('61858', '88', '36', 'Toddfurt', '1996-12-05 13:46:53', 'Jenniferburgh', '1996-12-05 13:46:53', 'Scott and Sons');
INSERT INTO flights (flight_no, seats, duration, departure_location, arrival_time, arrival_location, departure_time, airline_name) VALUES ('6971', '15', '47', 'Jacobfort', '2010-10-26 17:55:44', 'North Dalton', '2010-10-26 17:55:44', 'Lewis-Hodges');
INSERT INTO flights (flight_no, seats, duration, departure_location, arrival_time, arrival_location, departure_time, airline_name) VALUES ('33419', '16', '15', 'Wardview', '1990-11-04 00:24:31', 'Hatfieldfort', '1990-11-04 00:24:31', 'Adams PLC');
INSERT INTO flights (flight_no, seats, duration, departure_location, arrival_time, arrival_location, departure_time, airline_name) VALUES ('86375', '16', '91', 'Quinnmouth', '2016-10-01 00:30:46', 'New Marilynhaven', '2016-10-01 00:30:46', 'Nguyen Inc');
INSERT INTO flights (flight_no, seats, duration, departure_location, arrival_time, arrival_location, departure_time, airline_name) VALUES ('99166', '12', '81', 'New Brian', '1984-08-19 16:38:23', 'Joshuaberg', '1984-08-19 16:38:23', 'Moore, Patterson and Nelson');
INSERT INTO flights (flight_no, seats, duration, departure_location, arrival_time, arrival_location, departure_time, airline_name) VALUES ('34993', '49', '61', 'East Sheilashire', '1972-12-21 11:32:27', 'Gonzalezville', '1972-12-21 11:32:27', 'Evans Inc');
INSERT INTO flights (flight_no, seats, duration, departure_location, arrival_time, arrival_location, departure_time, airline_name) VALUES ('16193', '66', '75', 'Lake Kimberly', '1998-02-16 10:40:16', 'Jonestown', '1998-02-16 10:40:16', 'Payne-Russell');
INSERT INTO flights (flight_no, seats, duration, departure_location, arrival_time, arrival_location, departure_time, airline_name) VALUES ('3927', '82', '62', 'Lake Catherinebury', '1979-12-11 21:15:12', 'Brianland', '1979-12-11 21:15:12', 'Jones LLC');
INSERT INTO flights (flight_no, seats, duration, departure_location, arrival_time, arrival_location, departure_time, airline_name) VALUES ('49366', '70', '81', 'Christinaside', '2019-11-23 16:53:32', 'Goodwinshire', '2019-11-23 16:53:32', 'Mcconnell-Sanchez');
INSERT INTO flights (flight_no, seats, duration, departure_location, arrival_time, arrival_location, departure_time, airline_name) VALUES ('5203', '90', '77', 'West Lisa', '2022-04-02 06:54:41', 'Hernandezfort', '2022-04-02 06:54:41', 'Lawrence and Sons');
INSERT INTO flights (flight_no, seats, duration, departure_location, arrival_time, arrival_location, departure_time, airline_name) VALUES ('37755', '42', '20', 'New Sara', '1987-10-29 05:28:18', 'Lake Destinyfort', '1987-10-29 05:28:18', 'Horton Ltd');
INSERT INTO flights (flight_no, seats, duration, departure_location, arrival_time, arrival_location, departure_time, airline_name) VALUES ('63529', '17', '75', 'Parsonsmouth', '1992-06-23 14:15:17', 'Lake Michelleland', '1992-06-23 14:15:17', 'Choi Group');
INSERT INTO flights (flight_no, seats, duration, departure_location, arrival_time, arrival_location, departure_time, airline_name) VALUES ('95621', '92', '58', 'Port Jessicatown', '2008-02-07 22:44:19', 'New Brittany', '2008-02-07 22:44:19', 'Norton and Sons');
INSERT INTO flights (flight_no, seats, duration, departure_location, arrival_time, arrival_location, departure_time, airline_name) VALUES ('57447', '66', '71', 'Lake Eric', '2023-04-22 23:38:24', 'South Josemouth', '2023-04-22 23:38:24', 'Kline, Sullivan and Cruz');
INSERT INTO flights (flight_no, seats, duration, departure_location, arrival_time, arrival_location, departure_time, airline_name) VALUES ('62888', '89', '17', 'Montoyaland', '2011-12-20 11:27:33', 'Meadowsland', '2011-12-20 11:27:33', 'Moore PLC');
INSERT INTO flights (flight_no, seats, duration, departure_location, arrival_time, arrival_location, departure_time, airline_name) VALUES ('9789', '48', '74', 'Charlesburgh', '2004-05-16 20:36:18', 'Kathrynside', '2004-05-16 20:36:18', 'Collins, Bradley and Gill');
INSERT INTO flights (flight_no, seats, duration, departure_location, arrival_time, arrival_location, departure_time, airline_name) VALUES ('35475', '80', '55', 'Theresamouth', '2020-02-08 17:57:42', 'Taylorville', '2020-02-08 17:57:42', 'Wang Group');
INSERT INTO flights (flight_no, seats, duration, departure_location, arrival_time, arrival_location, departure_time, airline_name) VALUES ('65542', '32', '54', 'Donnaview', '1979-07-16 14:53:29', 'Port Kelseyhaven', '1979-07-16 14:53:29', 'Strong-Fowler');
INSERT INTO flights (flight_no, seats, duration, departure_location, arrival_time, arrival_location, departure_time, airline_name) VALUES ('14817', '73', '56', 'Port Amy', '2007-03-21 12:05:23', 'West Joe', '2007-03-21 12:05:23', 'Perez-Goodman');
INSERT INTO flights (flight_no, seats, duration, departure_location, arrival_time, arrival_location, departure_time, airline_name) VALUES ('40346', '57', '24', 'Erinberg', '1985-06-26 04:09:02', 'East Patriciaside', '1985-06-26 04:09:02', 'Murphy-Sanchez');
INSERT INTO flights (flight_no, seats, duration, departure_location, arrival_time, arrival_location, departure_time, airline_name) VALUES ('31280', '50', '15', 'Rodriguezton', '1976-04-17 04:58:36', 'Lake Toddtown', '1976-04-17 04:58:36', 'Huffman, Martinez and Chan');
INSERT INTO flights (flight_no, seats, duration, departure_location, arrival_time, arrival_location, departure_time, airline_name) VALUES ('11300', '22', '58', 'Michaelstad', '2024-03-29 18:18:53', 'Morrisfurt', '2024-03-29 18:18:53', 'Reilly-Dunlap');
INSERT INTO flights (flight_no, seats, duration, departure_location, arrival_time, arrival_location, departure_time, airline_name) VALUES ('44632', '4', '14', 'Andersonstad', '2023-09-30 19:19:07', 'New Judyton', '2023-09-30 19:19:07', 'Cohen, Nelson and Park');
INSERT INTO flights (flight_no, seats, duration, departure_location, arrival_time, arrival_location, departure_time, airline_name) VALUES ('27374', '34', '84', 'New Veronicashire', '2012-12-16 00:56:52', 'Sydneybury', '2012-12-16 00:56:52', 'Hall-Garner');
INSERT INTO flights (flight_no, seats, duration, departure_location, arrival_time, arrival_location, departure_time, airline_name) VALUES ('72117', '12', '52', 'Johnsontown', '1994-12-04 09:38:40', 'New Meganborough', '1994-12-04 09:38:40', 'Stewart-Thomas');
INSERT INTO flights (flight_no, seats, duration, departure_location, arrival_time, arrival_location, departure_time, airline_name) VALUES ('36851', '83', '73', 'Reyesland', '1971-07-21 16:23:39', 'Williamsfurt', '1971-07-21 16:23:39', 'Hampton-Duke');
INSERT INTO flights (flight_no, seats, duration, departure_location, arrival_time, arrival_location, departure_time, airline_name) VALUES ('72212', '86', '40', 'New Markland', '1978-11-27 02:04:31', 'West Davidberg', '1978-11-27 02:04:31', 'Brewer and Sons');
INSERT INTO flights (flight_no, seats, duration, departure_location, arrival_time, arrival_location, departure_time, airline_name) VALUES ('38105', '49', '86', 'North Haleyport', '2002-12-31 07:12:26', 'East Sara', '2002-12-31 07:12:26', 'King and Sons');
INSERT INTO flights (flight_no, seats, duration, departure_location, arrival_time, arrival_location, departure_time, airline_name) VALUES ('48028', '91', '13', 'Vanessafurt', '1998-06-08 06:42:46', 'Josephside', '1998-06-08 06:42:46', 'Garcia Inc');
INSERT INTO flights (flight_no, seats, duration, departure_location, arrival_time, arrival_location, departure_time, airline_name) VALUES ('67881', '58', '92', 'Walkerborough', '1977-05-05 15:43:09', 'East Christopher', '1977-05-05 15:43:09', 'Barry, Frank and Hancock');
INSERT INTO flights (flight_no, seats, duration, departure_location, arrival_time, arrival_location, departure_time, airline_name) VALUES ('53864', '12', '66', 'East Arthur', '1981-07-19 18:31:44', 'Port Albert', '1981-07-19 18:31:44', 'Foley-Garcia');
INSERT INTO flights (flight_no, seats, duration, departure_location, arrival_time, arrival_location, departure_time, airline_name) VALUES ('32046', '22', '79', 'Lake Ashleyfort', '2011-09-08 00:54:40', 'Watkinsfurt', '2011-09-08 00:54:40', 'King-Johnson');
INSERT INTO flights (flight_no, seats, duration, departure_location, arrival_time, arrival_location, departure_time, airline_name) VALUES ('82823', '24', '18', 'Davistown', '2023-10-28 15:10:04', 'Port Jasonburgh', '2023-10-28 15:10:04', 'Stanley-Weaver');

-- Strong Entity
INSERT INTO flight_ticket (ticketID, Class, customerName, cost, flight_no, customerId) VALUES ('741', 'First Class', 'David Frazier', '400', '32984', '917');
INSERT INTO flight_ticket (ticketID, Class, customerName, cost, flight_no, customerId) VALUES ('551', 'Basic Economy', 'Anthony Bright', '702', '73467', '830');
INSERT INTO flight_ticket (ticketID, Class, customerName, cost, flight_no, customerId) VALUES ('212', 'Basic Economy', 'Julie Carpenter', '400', '31194', '972');
INSERT INTO flight_ticket (ticketID, Class, customerName, cost, flight_no, customerId) VALUES ('937', 'Basic Economy', 'Cody Roth', '303', '7965', '411');
INSERT INTO flight_ticket (ticketID, Class, customerName, cost, flight_no, customerId) VALUES ('882', 'Economy Class', 'Scott Park', '383', '41532', '24');
INSERT INTO flight_ticket (ticketID, Class, customerName, cost, flight_no, customerId) VALUES ('696', 'Premium Economy', 'Casey Ray', '700', '26839', '517');
INSERT INTO flight_ticket (ticketID, Class, customerName, cost, flight_no, customerId) VALUES ('907', 'Comfort Class', 'Daniel Rogers', '94', '24165', '606');
INSERT INTO flight_ticket (ticketID, Class, customerName, cost, flight_no, customerId) VALUES ('377', 'Economy Class', 'Daniel Miller', '905', '49800', '555');
INSERT INTO flight_ticket (ticketID, Class, customerName, cost, flight_no, customerId) VALUES ('106', 'Premium Business', 'Dr. Holly Williams', '889', '84811', '587');
INSERT INTO flight_ticket (ticketID, Class, customerName, cost, flight_no, customerId) VALUES ('838', 'Economy Plus', 'Rita Davis', '322', '78520', '486');
INSERT INTO flight_ticket (ticketID, Class, customerName, cost, flight_no, customerId) VALUES ('127', 'Basic Economy', 'Maria Gomez', '243', '445', '49');
INSERT INTO flight_ticket (ticketID, Class, customerName, cost, flight_no, customerId) VALUES ('158', 'Economy Flex', 'Carlos Conrad', '656', '64922', '197');
INSERT INTO flight_ticket (ticketID, Class, customerName, cost, flight_no, customerId) VALUES ('508', 'Business Class', 'Dr. Kelsey Davis MD', '178', '73352', '474');
INSERT INTO flight_ticket (ticketID, Class, customerName, cost, flight_no, customerId) VALUES ('705', 'Economy Plus', 'Jeffrey Carrillo', '376', '98940', '693');
INSERT INTO flight_ticket (ticketID, Class, customerName, cost, flight_no, customerId) VALUES ('204', 'Economy Flex', 'Alex Larson', '901', '96138', '610');
INSERT INTO flight_ticket (ticketID, Class, customerName, cost, flight_no, customerId) VALUES ('257', 'Basic Economy', 'Brooke Gilbert', '817', '86680', '457');
INSERT INTO flight_ticket (ticketID, Class, customerName, cost, flight_no, customerId) VALUES ('636', 'Business Class', 'Linda Ramos', '12', '91907', '175');
INSERT INTO flight_ticket (ticketID, Class, customerName, cost, flight_no, customerId) VALUES ('664', 'Comfort Class', 'Jay Santana', '210', '57633', '865');
INSERT INTO flight_ticket (ticketID, Class, customerName, cost, flight_no, customerId) VALUES ('284', 'Main Cabin Extra', 'Jason Padilla', '614', '1274', '527');
INSERT INTO flight_ticket (ticketID, Class, customerName, cost, flight_no, customerId) VALUES ('499', 'Premium Economy', 'George Richardson', '510', '77104', '854');
INSERT INTO flight_ticket (ticketID, Class, customerName, cost, flight_no, customerId) VALUES ('965', 'Comfort Class', 'Joshua Larson', '483', '83764', '476');
INSERT INTO flight_ticket (ticketID, Class, customerName, cost, flight_no, customerId) VALUES ('69', 'Basic Economy', 'Renee Snyder', '239', '78225', '116');
INSERT INTO flight_ticket (ticketID, Class, customerName, cost, flight_no, customerId) VALUES ('495', 'Main Cabin Extra', 'Brandon Smith', '622', '21567', '874');
INSERT INTO flight_ticket (ticketID, Class, customerName, cost, flight_no, customerId) VALUES ('520', 'Premium Business', 'Bryan Williams', '347', '10242', '998');
INSERT INTO flight_ticket (ticketID, Class, customerName, cost, flight_no, customerId) VALUES ('521', 'Economy Class', 'Victoria Terry', '867', '64744', '961');
INSERT INTO flight_ticket (ticketID, Class, customerName, cost, flight_no, customerId) VALUES ('726', 'Premium Business', 'Jennifer Ortiz', '151', '94011', '999');
INSERT INTO flight_ticket (ticketID, Class, customerName, cost, flight_no, customerId) VALUES ('380', 'Premium Business', 'Kristen Huber', '899', '27776', '129');
INSERT INTO flight_ticket (ticketID, Class, customerName, cost, flight_no, customerId) VALUES ('262', 'Main Cabin Extra', 'Jennifer Wilkerson', '758', '73486', '433');
INSERT INTO flight_ticket (ticketID, Class, customerName, cost, flight_no, customerId) VALUES ('53', 'Economy Plus', 'Ryan Aguirre', '925', '82264', '15');
INSERT INTO flight_ticket (ticketID, Class, customerName, cost, flight_no, customerId) VALUES ('915', 'Business Class', 'Adam Wright', '188', '18313', '936');
INSERT INTO flight_ticket (ticketID, Class, customerName, cost, flight_no, customerId) VALUES ('227', 'Main Cabin Extra', 'John Smith', '729', '17844', '605');
INSERT INTO flight_ticket (ticketID, Class, customerName, cost, flight_no, customerId) VALUES ('243', 'Comfort Class', 'Frank Roberts', '54', '92375', '879');
INSERT INTO flight_ticket (ticketID, Class, customerName, cost, flight_no, customerId) VALUES ('26', 'Basic Economy', 'Allison Cole', '235', '13007', '128');
INSERT INTO flight_ticket (ticketID, Class, customerName, cost, flight_no, customerId) VALUES ('369', 'Economy Plus', 'Dana Spencer', '663', '52002', '0');
INSERT INTO flight_ticket (ticketID, Class, customerName, cost, flight_no, customerId) VALUES ('32', 'Business Class', 'Robert Hall', '582', '14189', '844');
INSERT INTO flight_ticket (ticketID, Class, customerName, cost, flight_no, customerId) VALUES ('992', 'Premium Economy', 'Jesse Nunez', '681', '86313', '703');
INSERT INTO flight_ticket (ticketID, Class, customerName, cost, flight_no, customerId) VALUES ('671', 'Basic Economy', 'Pamela Kramer', '576', '80142', '897');
INSERT INTO flight_ticket (ticketID, Class, customerName, cost, flight_no, customerId) VALUES ('773', 'Economy Plus', 'Kerry Davis II', '788', '21485', '871');
INSERT INTO flight_ticket (ticketID, Class, customerName, cost, flight_no, customerId) VALUES ('524', 'Economy Plus', 'Joshua Valenzuela', '773', '80217', '615');
INSERT INTO flight_ticket (ticketID, Class, customerName, cost, flight_no, customerId) VALUES ('285', 'Economy Flex', 'Troy Carlson', '85', '11551', '759');
INSERT INTO flight_ticket (ticketID, Class, customerName, cost, flight_no, customerId) VALUES ('792', 'Business Class', 'David Jones', '301', '88000', '646');
INSERT INTO flight_ticket (ticketID, Class, customerName, cost, flight_no, customerId) VALUES ('467', 'Economy Plus', 'Shelly Miranda', '910', '45108', '903');
INSERT INTO flight_ticket (ticketID, Class, customerName, cost, flight_no, customerId) VALUES ('781', 'Comfort Class', 'Russell Boyd', '246', '61858', '315');
INSERT INTO flight_ticket (ticketID, Class, customerName, cost, flight_no, customerId) VALUES ('998', 'Economy Class', 'Justin Chapman', '441', '6971', '682');
INSERT INTO flight_ticket (ticketID, Class, customerName, cost, flight_no, customerId) VALUES ('877', 'Economy Class', 'Scott Sosa', '778', '33419', '37');
INSERT INTO flight_ticket (ticketID, Class, customerName, cost, flight_no, customerId) VALUES ('72', 'Economy Class', 'Stephanie Clark', '880', '86375', '421');
INSERT INTO flight_ticket (ticketID, Class, customerName, cost, flight_no, customerId) VALUES ('296', 'Economy Flex', 'Justin Blake', '112', '99166', '923');
INSERT INTO flight_ticket (ticketID, Class, customerName, cost, flight_no, customerId) VALUES ('951', 'First Class', 'Danielle Crawford', '195', '34993', '969');
INSERT INTO flight_ticket (ticketID, Class, customerName, cost, flight_no, customerId) VALUES ('801', 'Business Class', 'Chad Bishop', '654', '16193', '671');
INSERT INTO flight_ticket (ticketID, Class, customerName, cost, flight_no, customerId) VALUES ('161', 'First Class', 'Meghan Anderson', '703', '3927', '738');
INSERT INTO flight_ticket (ticketID, Class, customerName, cost, flight_no, customerId) VALUES ('190', 'Basic Economy', 'Maria Smith', '18', '49366', '498');
INSERT INTO flight_ticket (ticketID, Class, customerName, cost, flight_no, customerId) VALUES ('299', 'Business Class', 'Dr. Lori Ponce', '185', '5203', '144');
INSERT INTO flight_ticket (ticketID, Class, customerName, cost, flight_no, customerId) VALUES ('170', 'Premium Business', 'Steven Sullivan', '729', '37755', '588');
INSERT INTO flight_ticket (ticketID, Class, customerName, cost, flight_no, customerId) VALUES ('803', 'Main Cabin Extra', 'Mary Martin', '472', '63529', '546');
INSERT INTO flight_ticket (ticketID, Class, customerName, cost, flight_no, customerId) VALUES ('426', 'Comfort Class', 'Kimberly Nelson', '631', '95621', '701');
INSERT INTO flight_ticket (ticketID, Class, customerName, cost, flight_no, customerId) VALUES ('335', 'Business Class', 'Ricardo Clark', '69', '57447', '765');
INSERT INTO flight_ticket (ticketID, Class, customerName, cost, flight_no, customerId) VALUES ('978', 'Business Class', 'April Torres', '353', '62888', '608');
INSERT INTO flight_ticket (ticketID, Class, customerName, cost, flight_no, customerId) VALUES ('415', 'Premium Business', 'Susan Lamb', '790', '9789', '30');
INSERT INTO flight_ticket (ticketID, Class, customerName, cost, flight_no, customerId) VALUES ('479', 'Premium Economy', 'Laura Snyder', '817', '35475', '624');
INSERT INTO flight_ticket (ticketID, Class, customerName, cost, flight_no, customerId) VALUES ('712', 'Premium Economy', 'Ariel Vasquez', '645', '65542', '419');
INSERT INTO flight_ticket (ticketID, Class, customerName, cost, flight_no, customerId) VALUES ('42', 'Premium Economy', 'Robert Deleon', '834', '14817', '699');
INSERT INTO flight_ticket (ticketID, Class, customerName, cost, flight_no, customerId) VALUES ('429', 'Main Cabin Extra', 'Hannah James', '806', '40346', '475');
INSERT INTO flight_ticket (ticketID, Class, customerName, cost, flight_no, customerId) VALUES ('964', 'Basic Economy', 'Mary Randall', '271', '31280', '392');
INSERT INTO flight_ticket (ticketID, Class, customerName, cost, flight_no, customerId) VALUES ('490', 'Premium Business', 'Susan Krause', '41', '11300', '511');
INSERT INTO flight_ticket (ticketID, Class, customerName, cost, flight_no, customerId) VALUES ('153', 'Premium Economy', 'Amy Schaefer', '585', '44632', '832');
INSERT INTO flight_ticket (ticketID, Class, customerName, cost, flight_no, customerId) VALUES ('80', 'Comfort Class', 'Alex Clark', '234', '27374', '240');
INSERT INTO flight_ticket (ticketID, Class, customerName, cost, flight_no, customerId) VALUES ('503', 'Economy Class', 'Micheal Thomas', '926', '72117', '962');
INSERT INTO flight_ticket (ticketID, Class, customerName, cost, flight_no, customerId) VALUES ('519', 'Basic Economy', 'Jane Mcconnell DDS', '398', '36851', '275');
INSERT INTO flight_ticket (ticketID, Class, customerName, cost, flight_no, customerId) VALUES ('826', 'Premium Economy', 'Stephanie Brewer', '78', '72212', '11');
INSERT INTO flight_ticket (ticketID, Class, customerName, cost, flight_no, customerId) VALUES ('582', 'Comfort Class', 'Sarah Hammond', '379', '38105', '707');
INSERT INTO flight_ticket (ticketID, Class, customerName, cost, flight_no, customerId) VALUES ('995', 'Basic Economy', 'Kendra Webb', '969', '48028', '997');
INSERT INTO flight_ticket (ticketID, Class, customerName, cost, flight_no, customerId) VALUES ('586', 'Premium Business', 'Traci Harris', '444', '67881', '190');
INSERT INTO flight_ticket (ticketID, Class, customerName, cost, flight_no, customerId) VALUES ('682', 'Economy Class', 'Mr. Maurice Harris DDS', '477', '53864', '412');
INSERT INTO flight_ticket (ticketID, Class, customerName, cost, flight_no, customerId) VALUES ('259', 'First Class', 'Jessica Wood', '819', '32046', '93');
INSERT INTO flight_ticket (ticketID, Class, customerName, cost, flight_no, customerId) VALUES ('189', 'Basic Economy', 'Harry Watson', '410', '82823', '657');

-- Strong Entity
INSERT INTO payment (paymentId, amount, payment_type, transaction_assure, theft_prevention, ticketID) VALUES ('900', '3801', 'Mobile Payment', '0', '1', '741');
INSERT INTO payment (paymentId, amount, payment_type, transaction_assure, theft_prevention, ticketID) VALUES ('499', '2006', 'Credit Card', '1', '0', '551');
INSERT INTO payment (paymentId, amount, payment_type, transaction_assure, theft_prevention, ticketID) VALUES ('485', '8324', 'Cash', '1', '0', '212');
INSERT INTO payment (paymentId, amount, payment_type, transaction_assure, theft_prevention, ticketID) VALUES ('974', '1897', 'Bank Transfer', '1', '0', '937');
INSERT INTO payment (paymentId, amount, payment_type, transaction_assure, theft_prevention, ticketID) VALUES ('681', '4423', 'Debit Card', '1', '0', '882');
INSERT INTO payment (paymentId, amount, payment_type, transaction_assure, theft_prevention, ticketID) VALUES ('416', '9414', 'Bank Transfer', '0', '0', '696');
INSERT INTO payment (paymentId, amount, payment_type, transaction_assure, theft_prevention, ticketID) VALUES ('673', '7553', 'Credit Card', '1', '0', '907');
INSERT INTO payment (paymentId, amount, payment_type, transaction_assure, theft_prevention, ticketID) VALUES ('514', '7212', 'Mobile Payment', '0', '1', '377');
INSERT INTO payment (paymentId, amount, payment_type, transaction_assure, theft_prevention, ticketID) VALUES ('532', '6444', 'Mobile Payment', '1', '1', '106');
INSERT INTO payment (paymentId, amount, payment_type, transaction_assure, theft_prevention, ticketID) VALUES ('827', '9600', 'Cash', '0', '1', '838');
INSERT INTO payment (paymentId, amount, payment_type, transaction_assure, theft_prevention, ticketID) VALUES ('493', '7894', 'Debit Card', '1', '0', '127');
INSERT INTO payment (paymentId, amount, payment_type, transaction_assure, theft_prevention, ticketID) VALUES ('295', '8985', 'Bank Transfer', '0', '0', '158');
INSERT INTO payment (paymentId, amount, payment_type, transaction_assure, theft_prevention, ticketID) VALUES ('109', '4872', 'Cash', '0', '1', '508');
INSERT INTO payment (paymentId, amount, payment_type, transaction_assure, theft_prevention, ticketID) VALUES ('362', '7633', 'Mobile Payment', '1', '1', '705');
INSERT INTO payment (paymentId, amount, payment_type, transaction_assure, theft_prevention, ticketID) VALUES ('815', '5988', 'Cash', '0', '1', '204');
INSERT INTO payment (paymentId, amount, payment_type, transaction_assure, theft_prevention, ticketID) VALUES ('167', '9849', 'Cash', '0', '1', '257');
INSERT INTO payment (paymentId, amount, payment_type, transaction_assure, theft_prevention, ticketID) VALUES ('621', '1940', 'Credit Card', '1', '0', '636');
INSERT INTO payment (paymentId, amount, payment_type, transaction_assure, theft_prevention, ticketID) VALUES ('46', '6525', 'Credit Card', '1', '1', '664');
INSERT INTO payment (paymentId, amount, payment_type, transaction_assure, theft_prevention, ticketID) VALUES ('841', '4278', 'Debit Card', '1', '1', '284');
INSERT INTO payment (paymentId, amount, payment_type, transaction_assure, theft_prevention, ticketID) VALUES ('325', '4117', 'Cash', '0', '0', '499');
INSERT INTO payment (paymentId, amount, payment_type, transaction_assure, theft_prevention, ticketID) VALUES ('69', '2711', 'Bank Transfer', '0', '0', '965');
INSERT INTO payment (paymentId, amount, payment_type, transaction_assure, theft_prevention, ticketID) VALUES ('133', '9918', 'Cash', '1', '1', '69');
INSERT INTO payment (paymentId, amount, payment_type, transaction_assure, theft_prevention, ticketID) VALUES ('788', '4', 'Mobile Payment', '1', '0', '495');
INSERT INTO payment (paymentId, amount, payment_type, transaction_assure, theft_prevention, ticketID) VALUES ('95', '5195', 'Mobile Payment', '1', '1', '520');
INSERT INTO payment (paymentId, amount, payment_type, transaction_assure, theft_prevention, ticketID) VALUES ('492', '8957', 'Credit Card', '1', '1', '521');
INSERT INTO payment (paymentId, amount, payment_type, transaction_assure, theft_prevention, ticketID) VALUES ('391', '9719', 'Mobile Payment', '1', '0', '726');
INSERT INTO payment (paymentId, amount, payment_type, transaction_assure, theft_prevention, ticketID) VALUES ('223', '82', 'Bank Transfer', '0', '0', '380');
INSERT INTO payment (paymentId, amount, payment_type, transaction_assure, theft_prevention, ticketID) VALUES ('388', '2194', 'Credit Card', '0', '0', '262');
INSERT INTO payment (paymentId, amount, payment_type, transaction_assure, theft_prevention, ticketID) VALUES ('394', '6125', 'Cash', '0', '1', '53');
INSERT INTO payment (paymentId, amount, payment_type, transaction_assure, theft_prevention, ticketID) VALUES ('898', '6432', 'Cash', '1', '1', '915');
INSERT INTO payment (paymentId, amount, payment_type, transaction_assure, theft_prevention, ticketID) VALUES ('632', '802', 'Bank Transfer', '1', '1', '227');
INSERT INTO payment (paymentId, amount, payment_type, transaction_assure, theft_prevention, ticketID) VALUES ('451', '9135', 'Cash', '0', '0', '243');
INSERT INTO payment (paymentId, amount, payment_type, transaction_assure, theft_prevention, ticketID) VALUES ('441', '5174', 'Mobile Payment', '1', '0', '26');
INSERT INTO payment (paymentId, amount, payment_type, transaction_assure, theft_prevention, ticketID) VALUES ('786', '5143', 'Mobile Payment', '1', '1', '369');
INSERT INTO payment (paymentId, amount, payment_type, transaction_assure, theft_prevention, ticketID) VALUES ('164', '2371', 'Credit Card', '0', '1', '32');
INSERT INTO payment (paymentId, amount, payment_type, transaction_assure, theft_prevention, ticketID) VALUES ('764', '9289', 'Mobile Payment', '0', '0', '992');
INSERT INTO payment (paymentId, amount, payment_type, transaction_assure, theft_prevention, ticketID) VALUES ('888', '1785', 'Credit Card', '0', '1', '671');
INSERT INTO payment (paymentId, amount, payment_type, transaction_assure, theft_prevention, ticketID) VALUES ('868', '9117', 'Bank Transfer', '1', '0', '773');
INSERT INTO payment (paymentId, amount, payment_type, transaction_assure, theft_prevention, ticketID) VALUES ('230', '2704', 'Bank Transfer', '0', '1', '524');
INSERT INTO payment (paymentId, amount, payment_type, transaction_assure, theft_prevention, ticketID) VALUES ('299', '2631', 'Cash', '1', '1', '285');
INSERT INTO payment (paymentId, amount, payment_type, transaction_assure, theft_prevention, ticketID) VALUES ('464', '3531', 'Mobile Payment', '1', '1', '792');
INSERT INTO payment (paymentId, amount, payment_type, transaction_assure, theft_prevention, ticketID) VALUES ('542', '362', 'Mobile Payment', '1', '0', '467');
INSERT INTO payment (paymentId, amount, payment_type, transaction_assure, theft_prevention, ticketID) VALUES ('360', '6196', 'Mobile Payment', '1', '1', '781');
INSERT INTO payment (paymentId, amount, payment_type, transaction_assure, theft_prevention, ticketID) VALUES ('522', '9194', 'Debit Card', '1', '0', '998');
INSERT INTO payment (paymentId, amount, payment_type, transaction_assure, theft_prevention, ticketID) VALUES ('594', '8869', 'Cash', '0', '1', '877');
INSERT INTO payment (paymentId, amount, payment_type, transaction_assure, theft_prevention, ticketID) VALUES ('271', '2902', 'Credit Card', '0', '1', '72');
INSERT INTO payment (paymentId, amount, payment_type, transaction_assure, theft_prevention, ticketID) VALUES ('958', '9383', 'Bank Transfer', '1', '1', '296');
INSERT INTO payment (paymentId, amount, payment_type, transaction_assure, theft_prevention, ticketID) VALUES ('292', '3483', 'Debit Card', '0', '1', '951');
INSERT INTO payment (paymentId, amount, payment_type, transaction_assure, theft_prevention, ticketID) VALUES ('809', '2160', 'Mobile Payment', '1', '0', '801');
INSERT INTO payment (paymentId, amount, payment_type, transaction_assure, theft_prevention, ticketID) VALUES ('585', '880', 'Credit Card', '0', '1', '161');
INSERT INTO payment (paymentId, amount, payment_type, transaction_assure, theft_prevention, ticketID) VALUES ('948', '2930', 'Mobile Payment', '0', '0', '190');
INSERT INTO payment (paymentId, amount, payment_type, transaction_assure, theft_prevention, ticketID) VALUES ('624', '9894', 'Mobile Payment', '0', '0', '299');
INSERT INTO payment (paymentId, amount, payment_type, transaction_assure, theft_prevention, ticketID) VALUES ('19', '3338', 'Cash', '1', '1', '170');
INSERT INTO payment (paymentId, amount, payment_type, transaction_assure, theft_prevention, ticketID) VALUES ('582', '4887', 'Bank Transfer', '0', '0', '803');
INSERT INTO payment (paymentId, amount, payment_type, transaction_assure, theft_prevention, ticketID) VALUES ('258', '8367', 'Mobile Payment', '1', '0', '426');
INSERT INTO payment (paymentId, amount, payment_type, transaction_assure, theft_prevention, ticketID) VALUES ('128', '1925', 'Debit Card', '0', '1', '335');
INSERT INTO payment (paymentId, amount, payment_type, transaction_assure, theft_prevention, ticketID) VALUES ('690', '2890', 'Mobile Payment', '0', '0', '978');
INSERT INTO payment (paymentId, amount, payment_type, transaction_assure, theft_prevention, ticketID) VALUES ('417', '6671', 'Mobile Payment', '1', '0', '415');
INSERT INTO payment (paymentId, amount, payment_type, transaction_assure, theft_prevention, ticketID) VALUES ('297', '88', 'Credit Card', '1', '1', '479');
INSERT INTO payment (paymentId, amount, payment_type, transaction_assure, theft_prevention, ticketID) VALUES ('269', '1635', 'Cash', '0', '0', '712');
INSERT INTO payment (paymentId, amount, payment_type, transaction_assure, theft_prevention, ticketID) VALUES ('156', '310', 'Mobile Payment', '1', '0', '42');
INSERT INTO payment (paymentId, amount, payment_type, transaction_assure, theft_prevention, ticketID) VALUES ('882', '5362', 'Bank Transfer', '1', '1', '429');
INSERT INTO payment (paymentId, amount, payment_type, transaction_assure, theft_prevention, ticketID) VALUES ('937', '9706', 'Mobile Payment', '1', '0', '964');
INSERT INTO payment (paymentId, amount, payment_type, transaction_assure, theft_prevention, ticketID) VALUES ('118', '3503', 'Bank Transfer', '1', '0', '490');
INSERT INTO payment (paymentId, amount, payment_type, transaction_assure, theft_prevention, ticketID) VALUES ('113', '8240', 'Credit Card', '1', '1', '153');
INSERT INTO payment (paymentId, amount, payment_type, transaction_assure, theft_prevention, ticketID) VALUES ('131', '523', 'Bank Transfer', '0', '1', '80');
INSERT INTO payment (paymentId, amount, payment_type, transaction_assure, theft_prevention, ticketID) VALUES ('395', '7892', 'Mobile Payment', '0', '1', '503');
INSERT INTO payment (paymentId, amount, payment_type, transaction_assure, theft_prevention, ticketID) VALUES ('741', '3903', 'Credit Card', '0', '0', '519');
INSERT INTO payment (paymentId, amount, payment_type, transaction_assure, theft_prevention, ticketID) VALUES ('410', '1103', 'Mobile Payment', '1', '0', '826');
INSERT INTO payment (paymentId, amount, payment_type, transaction_assure, theft_prevention, ticketID) VALUES ('152', '4264', 'Mobile Payment', '1', '1', '582');
INSERT INTO payment (paymentId, amount, payment_type, transaction_assure, theft_prevention, ticketID) VALUES ('910', '1875', 'Credit Card', '0', '0', '995');
INSERT INTO payment (paymentId, amount, payment_type, transaction_assure, theft_prevention, ticketID) VALUES ('651', '3001', 'Mobile Payment', '0', '0', '586');
INSERT INTO payment (paymentId, amount, payment_type, transaction_assure, theft_prevention, ticketID) VALUES ('874', '1164', 'Credit Card', '1', '0', '682');
INSERT INTO payment (paymentId, amount, payment_type, transaction_assure, theft_prevention, ticketID) VALUES ('710', '3407', 'Mobile Payment', '1', '0', '259');
INSERT INTO payment (paymentId, amount, payment_type, transaction_assure, theft_prevention, ticketID) VALUES ('859', '117', 'Mobile Payment', '1', '0', '189');

-- Strong Entity
INSERT INTO class (class_id, fare, class_type) VALUES ('325', '754', '32984');
INSERT INTO class (class_id, fare, class_type) VALUES ('351', '844', '73467');
INSERT INTO class (class_id, fare, class_type) VALUES ('319', '145', '31194');
INSERT INTO class (class_id, fare, class_type) VALUES ('643', '497', '7965');
INSERT INTO class (class_id, fare, class_type) VALUES ('287', '427', '41532');
INSERT INTO class (class_id, fare, class_type) VALUES ('708', '435', '26839');
INSERT INTO class (class_id, fare, class_type) VALUES ('297', '922', '24165');
INSERT INTO class (class_id, fare, class_type) VALUES ('570', '377', '49800');
INSERT INTO class (class_id, fare, class_type) VALUES ('97', '69', '84811');
INSERT INTO class (class_id, fare, class_type) VALUES ('656', '420', '78520');
INSERT INTO class (class_id, fare, class_type) VALUES ('264', '390', '445');
INSERT INTO class (class_id, fare, class_type) VALUES ('170', '854', '64922');
INSERT INTO class (class_id, fare, class_type) VALUES ('393', '257', '73352');
INSERT INTO class (class_id, fare, class_type) VALUES ('874', '816', '98940');
INSERT INTO class (class_id, fare, class_type) VALUES ('734', '732', '96138');
INSERT INTO class (class_id, fare, class_type) VALUES ('699', '137', '86680');
INSERT INTO class (class_id, fare, class_type) VALUES ('964', '788', '91907');
INSERT INTO class (class_id, fare, class_type) VALUES ('331', '358', '57633');
INSERT INTO class (class_id, fare, class_type) VALUES ('687', '514', '1274');
INSERT INTO class (class_id, fare, class_type) VALUES ('732', '689', '77104');
INSERT INTO class (class_id, fare, class_type) VALUES ('920', '715', '83764');
INSERT INTO class (class_id, fare, class_type) VALUES ('759', '62', '78225');
INSERT INTO class (class_id, fare, class_type) VALUES ('418', '603', '21567');
INSERT INTO class (class_id, fare, class_type) VALUES ('510', '809', '10242');
INSERT INTO class (class_id, fare, class_type) VALUES ('237', '605', '64744');
INSERT INTO class (class_id, fare, class_type) VALUES ('909', '382', '94011');
INSERT INTO class (class_id, fare, class_type) VALUES ('399', '235', '27776');
INSERT INTO class (class_id, fare, class_type) VALUES ('634', '56', '73486');
INSERT INTO class (class_id, fare, class_type) VALUES ('857', '456', '82264');
INSERT INTO class (class_id, fare, class_type) VALUES ('472', '654', '18313');
INSERT INTO class (class_id, fare, class_type) VALUES ('206', '904', '17844');
INSERT INTO class (class_id, fare, class_type) VALUES ('475', '83', '92375');
INSERT INTO class (class_id, fare, class_type) VALUES ('95', '839', '13007');
INSERT INTO class (class_id, fare, class_type) VALUES ('54', '634', '52002');
INSERT INTO class (class_id, fare, class_type) VALUES ('147', '206', '14189');
INSERT INTO class (class_id, fare, class_type) VALUES ('440', '303', '86313');
INSERT INTO class (class_id, fare, class_type) VALUES ('254', '750', '80142');
INSERT INTO class (class_id, fare, class_type) VALUES ('256', '97', '21485');
INSERT INTO class (class_id, fare, class_type) VALUES ('712', '403', '80217');
INSERT INTO class (class_id, fare, class_type) VALUES ('208', '702', '11551');
INSERT INTO class (class_id, fare, class_type) VALUES ('668', '692', '88000');
INSERT INTO class (class_id, fare, class_type) VALUES ('577', '321', '45108');
INSERT INTO class (class_id, fare, class_type) VALUES ('389', '686', '61858');
INSERT INTO class (class_id, fare, class_type) VALUES ('986', '169', '6971');
INSERT INTO class (class_id, fare, class_type) VALUES ('959', '595', '33419');
INSERT INTO class (class_id, fare, class_type) VALUES ('299', '839', '86375');
INSERT INTO class (class_id, fare, class_type) VALUES ('541', '928', '99166');
INSERT INTO class (class_id, fare, class_type) VALUES ('152', '111', '34993');
INSERT INTO class (class_id, fare, class_type) VALUES ('11', '388', '16193');
INSERT INTO class (class_id, fare, class_type) VALUES ('517', '762', '3927');
INSERT INTO class (class_id, fare, class_type) VALUES ('274', '797', '49366');
INSERT INTO class (class_id, fare, class_type) VALUES ('433', '352', '5203');
INSERT INTO class (class_id, fare, class_type) VALUES ('819', '769', '37755');
INSERT INTO class (class_id, fare, class_type) VALUES ('0', '716', '63529');
INSERT INTO class (class_id, fare, class_type) VALUES ('681', '673', '95621');
INSERT INTO class (class_id, fare, class_type) VALUES ('902', '579', '57447');
INSERT INTO class (class_id, fare, class_type) VALUES ('275', '223', '62888');
INSERT INTO class (class_id, fare, class_type) VALUES ('363', '806', '9789');
INSERT INTO class (class_id, fare, class_type) VALUES ('437', '545', '35475');
INSERT INTO class (class_id, fare, class_type) VALUES ('306', '588', '65542');
INSERT INTO class (class_id, fare, class_type) VALUES ('869', '800', '14817');
INSERT INTO class (class_id, fare, class_type) VALUES ('364', '691', '40346');
INSERT INTO class (class_id, fare, class_type) VALUES ('772', '74', '31280');
INSERT INTO class (class_id, fare, class_type) VALUES ('59', '536', '11300');
INSERT INTO class (class_id, fare, class_type) VALUES ('408', '169', '44632');
INSERT INTO class (class_id, fare, class_type) VALUES ('922', '314', '27374');
INSERT INTO class (class_id, fare, class_type) VALUES ('812', '579', '72117');
INSERT INTO class (class_id, fare, class_type) VALUES ('629', '5', '36851');
INSERT INTO class (class_id, fare, class_type) VALUES ('126', '703', '72212');
INSERT INTO class (class_id, fare, class_type) VALUES ('867', '419', '38105');
INSERT INTO class (class_id, fare, class_type) VALUES ('665', '9', '48028');
INSERT INTO class (class_id, fare, class_type) VALUES ('817', '567', '67881');
INSERT INTO class (class_id, fare, class_type) VALUES ('672', '64', '53864');
INSERT INTO class (class_id, fare, class_type) VALUES ('526', '432', '32046');
INSERT INTO class (class_id, fare, class_type) VALUES ('908', '679', '82823');

-- Weak Entity
INSERT INTO Cuisine_Type (cuisine_ID, description, type, restaurant_Id) VALUES ('526', 'Vibrant and spicy Mexican dishes with chili peppers and cilantro', 'Mediterranean', '895');
INSERT INTO Cuisine_Type (cuisine_ID, description, type, restaurant_Id) VALUES ('979', 'Flavorful Brazilian dishes influenced by indigenous, African, and Portuguese cultures', 'Fusion', '577');
INSERT INTO Cuisine_Type (cuisine_ID, description, type, restaurant_Id) VALUES ('712', 'Flavorful Brazilian dishes influenced by indigenous, African, and Portuguese cultures', 'Mediterranean', '593');
INSERT INTO Cuisine_Type (cuisine_ID, description, type, restaurant_Id) VALUES ('19', 'Bold and aromatic Thai cuisine with lemongrass and coconut milk', 'Italian', '201');
INSERT INTO Cuisine_Type (cuisine_ID, description, type, restaurant_Id) VALUES ('196', 'Diverse Chinese specialties from Sichuan to Cantonese dim sum', 'Korean', '105');
INSERT INTO Cuisine_Type (cuisine_ID, description, type, restaurant_Id) VALUES ('275', 'Flavorful Brazilian dishes influenced by indigenous, African, and Portuguese cultures', 'Fusion', '245');
INSERT INTO Cuisine_Type (cuisine_ID, description, type, restaurant_Id) VALUES ('464', 'Aromatic and diverse Indian spices in curries and tandoori', 'American', '180');
INSERT INTO Cuisine_Type (cuisine_ID, description, type, restaurant_Id) VALUES ('94', 'Elegant French dishes like coq au vin and bouillabaisse', 'Chinese', '327');
INSERT INTO Cuisine_Type (cuisine_ID, description, type, restaurant_Id) VALUES ('339', 'Delicate balance of Japanese seafood, rice, and traditional sauces', 'Mediterranean', '81');
INSERT INTO Cuisine_Type (cuisine_ID, description, type, restaurant_Id) VALUES ('787', 'Diverse Chinese specialties from Sichuan to Cantonese dim sum', 'American', '202');
INSERT INTO Cuisine_Type (cuisine_ID, description, type, restaurant_Id) VALUES ('353', 'Vibrant and spicy Mexican dishes with chili peppers and cilantro', 'Korean', '284');
INSERT INTO Cuisine_Type (cuisine_ID, description, type, restaurant_Id) VALUES ('351', 'Fresh Greek flavors with olive oil, herbs, and feta cheese', 'Korean', '643');
INSERT INTO Cuisine_Type (cuisine_ID, description, type, restaurant_Id) VALUES ('111', 'Vibrant and spicy Mexican dishes with chili peppers and cilantro', 'Mediterranean', '749');
INSERT INTO Cuisine_Type (cuisine_ID, description, type, restaurant_Id) VALUES ('222', 'Diverse Chinese specialties from Sichuan to Cantonese dim sum', 'Mediterranean', '80');
INSERT INTO Cuisine_Type (cuisine_ID, description, type, restaurant_Id) VALUES ('873', 'Diverse Chinese specialties from Sichuan to Cantonese dim sum', 'Chinese', '665');
INSERT INTO Cuisine_Type (cuisine_ID, description, type, restaurant_Id) VALUES ('971', 'Vibrant and spicy Mexican dishes with chili peppers and cilantro', 'Mexican', '206');
INSERT INTO Cuisine_Type (cuisine_ID, description, type, restaurant_Id) VALUES ('684', 'Bold and hearty Spanish dishes like paella and tapas', 'Italian', '627');
INSERT INTO Cuisine_Type (cuisine_ID, description, type, restaurant_Id) VALUES ('639', 'Delicate balance of Japanese seafood, rice, and traditional sauces', 'Fusion', '77');
INSERT INTO Cuisine_Type (cuisine_ID, description, type, restaurant_Id) VALUES ('645', 'Flavorful Brazilian dishes influenced by indigenous, African, and Portuguese cultures', 'Fusion', '871');
INSERT INTO Cuisine_Type (cuisine_ID, description, type, restaurant_Id) VALUES ('392', 'Diverse Chinese specialties from Sichuan to Cantonese dim sum', 'French', '731');
INSERT INTO Cuisine_Type (cuisine_ID, description, type, restaurant_Id) VALUES ('136', 'Delicate balance of Japanese seafood, rice, and traditional sauces', 'Mediterranean', '132');
INSERT INTO Cuisine_Type (cuisine_ID, description, type, restaurant_Id) VALUES ('476', 'Diverse Chinese specialties from Sichuan to Cantonese dim sum', 'Mexican', '820');
INSERT INTO Cuisine_Type (cuisine_ID, description, type, restaurant_Id) VALUES ('709', 'Bold and aromatic Thai cuisine with lemongrass and coconut milk', 'Italian', '716');
INSERT INTO Cuisine_Type (cuisine_ID, description, type, restaurant_Id) VALUES ('672', 'Delicate balance of Japanese seafood, rice, and traditional sauces', 'Korean', '370');
INSERT INTO Cuisine_Type (cuisine_ID, description, type, restaurant_Id) VALUES ('384', 'Flavorful Brazilian dishes influenced by indigenous, African, and Portuguese cultures', 'Mexican', '57');
INSERT INTO Cuisine_Type (cuisine_ID, description, type, restaurant_Id) VALUES ('238', 'Elegant French dishes like coq au vin and bouillabaisse', 'Mexican', '296');
INSERT INTO Cuisine_Type (cuisine_ID, description, type, restaurant_Id) VALUES ('572', 'Diverse Chinese specialties from Sichuan to Cantonese dim sum', 'French', '309');
INSERT INTO Cuisine_Type (cuisine_ID, description, type, restaurant_Id) VALUES ('264', 'Aromatic and diverse Indian spices in curries and tandoori', 'Mediterranean', '141');
INSERT INTO Cuisine_Type (cuisine_ID, description, type, restaurant_Id) VALUES ('487', 'Italian-inspired flavors of tomatoes, garlic, and olive oil', 'Chinese', '799');
INSERT INTO Cuisine_Type (cuisine_ID, description, type, restaurant_Id) VALUES ('999', 'Bold and hearty Spanish dishes like paella and tapas', 'Mediterranean', '714');
INSERT INTO Cuisine_Type (cuisine_ID, description, type, restaurant_Id) VALUES ('951', 'Bold and hearty Spanish dishes like paella and tapas', 'American', '826');
INSERT INTO Cuisine_Type (cuisine_ID, description, type, restaurant_Id) VALUES ('802', 'Aromatic and diverse Indian spices in curries and tandoori', 'Italian', '313');
INSERT INTO Cuisine_Type (cuisine_ID, description, type, restaurant_Id) VALUES ('574', 'Aromatic and diverse Indian spices in curries and tandoori', 'French', '840');
INSERT INTO Cuisine_Type (cuisine_ID, description, type, restaurant_Id) VALUES ('774', 'Flavorful Brazilian dishes influenced by indigenous, African, and Portuguese cultures', 'Italian', '98');
INSERT INTO Cuisine_Type (cuisine_ID, description, type, restaurant_Id) VALUES ('135', 'Elegant French dishes like coq au vin and bouillabaisse', 'Fusion', '261');
INSERT INTO Cuisine_Type (cuisine_ID, description, type, restaurant_Id) VALUES ('155', 'Vibrant and spicy Mexican dishes with chili peppers and cilantro', 'French', '278');
INSERT INTO Cuisine_Type (cuisine_ID, description, type, restaurant_Id) VALUES ('523', 'Fresh Greek flavors with olive oil, herbs, and feta cheese', 'Mediterranean', '154');
INSERT INTO Cuisine_Type (cuisine_ID, description, type, restaurant_Id) VALUES ('179', 'Elegant French dishes like coq au vin and bouillabaisse', 'Mexican', '22');
INSERT INTO Cuisine_Type (cuisine_ID, description, type, restaurant_Id) VALUES ('124', 'Elegant French dishes like coq au vin and bouillabaisse', 'American', '561');
INSERT INTO Cuisine_Type (cuisine_ID, description, type, restaurant_Id) VALUES ('447', 'Bold and aromatic Thai cuisine with lemongrass and coconut milk', 'Chinese', '819');
INSERT INTO Cuisine_Type (cuisine_ID, description, type, restaurant_Id) VALUES ('336', 'Flavorful Brazilian dishes influenced by indigenous, African, and Portuguese cultures', 'American', '290');
INSERT INTO Cuisine_Type (cuisine_ID, description, type, restaurant_Id) VALUES ('431', 'Aromatic and diverse Indian spices in curries and tandoori', 'American', '839');
INSERT INTO Cuisine_Type (cuisine_ID, description, type, restaurant_Id) VALUES ('757', 'Italian-inspired flavors of tomatoes, garlic, and olive oil', 'Korean', '149');
INSERT INTO Cuisine_Type (cuisine_ID, description, type, restaurant_Id) VALUES ('86', 'Fresh Greek flavors with olive oil, herbs, and feta cheese', 'Mexican', '551');
INSERT INTO Cuisine_Type (cuisine_ID, description, type, restaurant_Id) VALUES ('297', 'Aromatic and diverse Indian spices in curries and tandoori', 'French', '394');
INSERT INTO Cuisine_Type (cuisine_ID, description, type, restaurant_Id) VALUES ('24', 'Diverse Chinese specialties from Sichuan to Cantonese dim sum', 'Mediterranean', '187');
INSERT INTO Cuisine_Type (cuisine_ID, description, type, restaurant_Id) VALUES ('492', 'Aromatic and diverse Indian spices in curries and tandoori', 'Chinese', '29');
INSERT INTO Cuisine_Type (cuisine_ID, description, type, restaurant_Id) VALUES ('33', 'Bold and aromatic Thai cuisine with lemongrass and coconut milk', 'Fusion', '484');
INSERT INTO Cuisine_Type (cuisine_ID, description, type, restaurant_Id) VALUES ('218', 'Bold and aromatic Thai cuisine with lemongrass and coconut milk', 'French', '334');
INSERT INTO Cuisine_Type (cuisine_ID, description, type, restaurant_Id) VALUES ('829', 'Aromatic and diverse Indian spices in curries and tandoori', 'Fusion', '929');
INSERT INTO Cuisine_Type (cuisine_ID, description, type, restaurant_Id) VALUES ('152', 'Diverse Chinese specialties from Sichuan to Cantonese dim sum', 'Korean', '210');
INSERT INTO Cuisine_Type (cuisine_ID, description, type, restaurant_Id) VALUES ('607', 'Italian-inspired flavors of tomatoes, garlic, and olive oil', 'American', '397');
INSERT INTO Cuisine_Type (cuisine_ID, description, type, restaurant_Id) VALUES ('773', 'Flavorful Brazilian dishes influenced by indigenous, African, and Portuguese cultures', 'Greek', '198');
INSERT INTO Cuisine_Type (cuisine_ID, description, type, restaurant_Id) VALUES ('785', 'Italian-inspired flavors of tomatoes, garlic, and olive oil', 'Mexican', '48');
INSERT INTO Cuisine_Type (cuisine_ID, description, type, restaurant_Id) VALUES ('756', 'Flavorful Brazilian dishes influenced by indigenous, African, and Portuguese cultures', 'American', '670');
INSERT INTO Cuisine_Type (cuisine_ID, description, type, restaurant_Id) VALUES ('821', 'Elegant French dishes like coq au vin and bouillabaisse', 'Korean', '622');
INSERT INTO Cuisine_Type (cuisine_ID, description, type, restaurant_Id) VALUES ('417', 'Elegant French dishes like coq au vin and bouillabaisse', 'Chinese', '896');
INSERT INTO Cuisine_Type (cuisine_ID, description, type, restaurant_Id) VALUES ('252', 'Flavorful Brazilian dishes influenced by indigenous, African, and Portuguese cultures', 'Mediterranean', '940');
INSERT INTO Cuisine_Type (cuisine_ID, description, type, restaurant_Id) VALUES ('644', 'Aromatic and diverse Indian spices in curries and tandoori', 'Mediterranean', '120');
INSERT INTO Cuisine_Type (cuisine_ID, description, type, restaurant_Id) VALUES ('838', 'Italian-inspired flavors of tomatoes, garlic, and olive oil', 'Fusion', '356');
INSERT INTO Cuisine_Type (cuisine_ID, description, type, restaurant_Id) VALUES ('263', 'Aromatic and diverse Indian spices in curries and tandoori', 'French', '499');
INSERT INTO Cuisine_Type (cuisine_ID, description, type, restaurant_Id) VALUES ('858', 'Fresh Greek flavors with olive oil, herbs, and feta cheese', 'Mediterranean', '4');
INSERT INTO Cuisine_Type (cuisine_ID, description, type, restaurant_Id) VALUES ('271', 'Vibrant and spicy Mexican dishes with chili peppers and cilantro', 'Chinese', '316');
INSERT INTO Cuisine_Type (cuisine_ID, description, type, restaurant_Id) VALUES ('127', 'Flavorful Brazilian dishes influenced by indigenous, African, and Portuguese cultures', 'Fusion', '718');
INSERT INTO Cuisine_Type (cuisine_ID, description, type, restaurant_Id) VALUES ('299', 'Aromatic and diverse Indian spices in curries and tandoori', 'Korean', '325');
INSERT INTO Cuisine_Type (cuisine_ID, description, type, restaurant_Id) VALUES ('474', 'Diverse Chinese specialties from Sichuan to Cantonese dim sum', 'French', '645');
INSERT INTO Cuisine_Type (cuisine_ID, description, type, restaurant_Id) VALUES ('181', 'Fresh Greek flavors with olive oil, herbs, and feta cheese', 'Greek', '511');
INSERT INTO Cuisine_Type (cuisine_ID, description, type, restaurant_Id) VALUES ('505', 'Flavorful Brazilian dishes influenced by indigenous, African, and Portuguese cultures', 'American', '324');
INSERT INTO Cuisine_Type (cuisine_ID, description, type, restaurant_Id) VALUES ('517', 'Flavorful Brazilian dishes influenced by indigenous, African, and Portuguese cultures', 'Mediterranean', '329');
INSERT INTO Cuisine_Type (cuisine_ID, description, type, restaurant_Id) VALUES ('389', 'Vibrant and spicy Mexican dishes with chili peppers and cilantro', 'Fusion', '303');
INSERT INTO Cuisine_Type (cuisine_ID, description, type, restaurant_Id) VALUES ('648', 'Flavorful Brazilian dishes influenced by indigenous, African, and Portuguese cultures', 'French', '144');
INSERT INTO Cuisine_Type (cuisine_ID, description, type, restaurant_Id) VALUES ('276', 'Aromatic and diverse Indian spices in curries and tandoori', 'Chinese', '631');
INSERT INTO Cuisine_Type (cuisine_ID, description, type, restaurant_Id) VALUES ('646', 'Vibrant and spicy Mexican dishes with chili peppers and cilantro', 'Fusion', '711');
INSERT INTO Cuisine_Type (cuisine_ID, description, type, restaurant_Id) VALUES ('8', 'Aromatic and diverse Indian spices in curries and tandoori', 'Fusion', '524');
INSERT INTO Cuisine_Type (cuisine_ID, description, type, restaurant_Id) VALUES ('99', 'Aromatic and diverse Indian spices in curries and tandoori', 'French', '62');

-- Weak Entity
INSERT INTO Restaurants_Booked (booked_ID, restaurant_ID, participants, datetime) VALUES ('241', '895', '94', '1988-06-13 15:43:42');
INSERT INTO Restaurants_Booked (booked_ID, restaurant_ID, participants, datetime) VALUES ('887', '577', '81', '2010-02-03 05:59:05');
INSERT INTO Restaurants_Booked (booked_ID, restaurant_ID, participants, datetime) VALUES ('34', '593', '4', '2013-05-28 08:15:32');
INSERT INTO Restaurants_Booked (booked_ID, restaurant_ID, participants, datetime) VALUES ('594', '201', '2', '1984-10-31 20:33:08');
INSERT INTO Restaurants_Booked (booked_ID, restaurant_ID, participants, datetime) VALUES ('363', '105', '75', '1993-09-17 04:56:37');
INSERT INTO Restaurants_Booked (booked_ID, restaurant_ID, participants, datetime) VALUES ('283', '245', '21', '2012-01-23 10:59:51');
INSERT INTO Restaurants_Booked (booked_ID, restaurant_ID, participants, datetime) VALUES ('601', '180', '38', '1991-02-12 10:42:23');
INSERT INTO Restaurants_Booked (booked_ID, restaurant_ID, participants, datetime) VALUES ('167', '327', '37', '1970-06-01 16:29:17');
INSERT INTO Restaurants_Booked (booked_ID, restaurant_ID, participants, datetime) VALUES ('774', '81', '77', '2015-05-25 11:56:53');
INSERT INTO Restaurants_Booked (booked_ID, restaurant_ID, participants, datetime) VALUES ('792', '202', '67', '1970-07-07 06:10:27');
INSERT INTO Restaurants_Booked (booked_ID, restaurant_ID, participants, datetime) VALUES ('299', '284', '64', '1985-05-15 11:44:36');
INSERT INTO Restaurants_Booked (booked_ID, restaurant_ID, participants, datetime) VALUES ('296', '643', '31', '1998-02-23 04:14:45');
INSERT INTO Restaurants_Booked (booked_ID, restaurant_ID, participants, datetime) VALUES ('574', '749', '59', '1980-06-07 08:20:08');
INSERT INTO Restaurants_Booked (booked_ID, restaurant_ID, participants, datetime) VALUES ('99', '80', '99', '1980-10-20 09:27:30');
INSERT INTO Restaurants_Booked (booked_ID, restaurant_ID, participants, datetime) VALUES ('613', '665', '12', '1989-04-29 20:27:33');
INSERT INTO Restaurants_Booked (booked_ID, restaurant_ID, participants, datetime) VALUES ('772', '206', '11', '2003-04-22 15:54:24');
INSERT INTO Restaurants_Booked (booked_ID, restaurant_ID, participants, datetime) VALUES ('343', '627', '23', '2018-08-27 18:05:00');
INSERT INTO Restaurants_Booked (booked_ID, restaurant_ID, participants, datetime) VALUES ('692', '77', '95', '2022-11-21 09:01:23');
INSERT INTO Restaurants_Booked (booked_ID, restaurant_ID, participants, datetime) VALUES ('368', '871', '78', '2009-05-08 01:40:47');
INSERT INTO Restaurants_Booked (booked_ID, restaurant_ID, participants, datetime) VALUES ('381', '731', '97', '1996-05-18 17:53:59');
INSERT INTO Restaurants_Booked (booked_ID, restaurant_ID, participants, datetime) VALUES ('190', '132', '58', '1975-02-12 10:52:40');
INSERT INTO Restaurants_Booked (booked_ID, restaurant_ID, participants, datetime) VALUES ('149', '820', '41', '1973-01-24 16:51:31');
INSERT INTO Restaurants_Booked (booked_ID, restaurant_ID, participants, datetime) VALUES ('298', '716', '42', '1984-11-03 14:35:53');
INSERT INTO Restaurants_Booked (booked_ID, restaurant_ID, participants, datetime) VALUES ('664', '370', '17', '1989-04-21 10:41:05');
INSERT INTO Restaurants_Booked (booked_ID, restaurant_ID, participants, datetime) VALUES ('414', '57', '55', '2006-07-06 18:12:05');
INSERT INTO Restaurants_Booked (booked_ID, restaurant_ID, participants, datetime) VALUES ('191', '296', '47', '2019-11-25 03:01:40');
INSERT INTO Restaurants_Booked (booked_ID, restaurant_ID, participants, datetime) VALUES ('893', '309', '24', '2006-11-03 15:16:38');
INSERT INTO Restaurants_Booked (booked_ID, restaurant_ID, participants, datetime) VALUES ('514', '141', '51', '1991-02-05 07:48:46');
INSERT INTO Restaurants_Booked (booked_ID, restaurant_ID, participants, datetime) VALUES ('36', '799', '36', '2001-03-03 17:59:41');
INSERT INTO Restaurants_Booked (booked_ID, restaurant_ID, participants, datetime) VALUES ('750', '714', '67', '2012-08-21 04:19:51');
INSERT INTO Restaurants_Booked (booked_ID, restaurant_ID, participants, datetime) VALUES ('319', '826', '1', '1983-06-09 10:30:32');
INSERT INTO Restaurants_Booked (booked_ID, restaurant_ID, participants, datetime) VALUES ('370', '313', '8', '1992-06-27 16:57:46');
INSERT INTO Restaurants_Booked (booked_ID, restaurant_ID, participants, datetime) VALUES ('907', '840', '66', '1987-01-30 15:41:14');
INSERT INTO Restaurants_Booked (booked_ID, restaurant_ID, participants, datetime) VALUES ('535', '98', '89', '2020-03-21 14:02:48');
INSERT INTO Restaurants_Booked (booked_ID, restaurant_ID, participants, datetime) VALUES ('421', '261', '30', '2011-08-02 04:08:18');
INSERT INTO Restaurants_Booked (booked_ID, restaurant_ID, participants, datetime) VALUES ('852', '278', '40', '2007-11-13 03:33:03');
INSERT INTO Restaurants_Booked (booked_ID, restaurant_ID, participants, datetime) VALUES ('927', '154', '41', '2018-06-29 12:19:44');
INSERT INTO Restaurants_Booked (booked_ID, restaurant_ID, participants, datetime) VALUES ('921', '22', '93', '2017-07-15 16:30:24');
INSERT INTO Restaurants_Booked (booked_ID, restaurant_ID, participants, datetime) VALUES ('143', '561', '22', '1972-10-08 04:29:08');
INSERT INTO Restaurants_Booked (booked_ID, restaurant_ID, participants, datetime) VALUES ('990', '819', '23', '2021-05-24 16:44:55');
INSERT INTO Restaurants_Booked (booked_ID, restaurant_ID, participants, datetime) VALUES ('483', '290', '46', '1997-08-08 01:12:18');
INSERT INTO Restaurants_Booked (booked_ID, restaurant_ID, participants, datetime) VALUES ('389', '839', '59', '1989-06-09 22:58:30');
INSERT INTO Restaurants_Booked (booked_ID, restaurant_ID, participants, datetime) VALUES ('846', '149', '12', '1996-12-05 13:46:53');
INSERT INTO Restaurants_Booked (booked_ID, restaurant_ID, participants, datetime) VALUES ('944', '551', '92', '2010-10-26 17:55:44');
INSERT INTO Restaurants_Booked (booked_ID, restaurant_ID, participants, datetime) VALUES ('45', '394', '40', '1990-11-04 00:24:31');
INSERT INTO Restaurants_Booked (booked_ID, restaurant_ID, participants, datetime) VALUES ('488', '187', '11', '2016-10-01 00:30:46');
INSERT INTO Restaurants_Booked (booked_ID, restaurant_ID, participants, datetime) VALUES ('72', '29', '44', '1984-08-19 16:38:23');
INSERT INTO Restaurants_Booked (booked_ID, restaurant_ID, participants, datetime) VALUES ('201', '484', '45', '1972-12-21 11:32:27');
INSERT INTO Restaurants_Booked (booked_ID, restaurant_ID, participants, datetime) VALUES ('226', '334', '14', '1998-02-16 10:40:16');
INSERT INTO Restaurants_Booked (booked_ID, restaurant_ID, participants, datetime) VALUES ('548', '929', '10', '1979-12-11 21:15:12');
INSERT INTO Restaurants_Booked (booked_ID, restaurant_ID, participants, datetime) VALUES ('533', '210', '23', '2019-11-23 16:53:32');
INSERT INTO Restaurants_Booked (booked_ID, restaurant_ID, participants, datetime) VALUES ('859', '397', '62', '2022-04-02 06:54:41');
INSERT INTO Restaurants_Booked (booked_ID, restaurant_ID, participants, datetime) VALUES ('604', '198', '72', '1987-10-29 05:28:18');
INSERT INTO Restaurants_Booked (booked_ID, restaurant_ID, participants, datetime) VALUES ('14', '48', '46', '1992-06-23 14:15:17');
INSERT INTO Restaurants_Booked (booked_ID, restaurant_ID, participants, datetime) VALUES ('833', '670', '46', '2008-02-07 22:44:19');
INSERT INTO Restaurants_Booked (booked_ID, restaurant_ID, participants, datetime) VALUES ('689', '622', '55', '2023-04-22 23:38:24');
INSERT INTO Restaurants_Booked (booked_ID, restaurant_ID, participants, datetime) VALUES ('641', '896', '77', '2011-12-20 11:27:33');
INSERT INTO Restaurants_Booked (booked_ID, restaurant_ID, participants, datetime) VALUES ('799', '940', '62', '2004-05-16 20:36:18');
INSERT INTO Restaurants_Booked (booked_ID, restaurant_ID, participants, datetime) VALUES ('309', '120', '84', '2020-02-08 17:57:42');
INSERT INTO Restaurants_Booked (booked_ID, restaurant_ID, participants, datetime) VALUES ('943', '356', '97', '1979-07-16 14:53:29');
INSERT INTO Restaurants_Booked (booked_ID, restaurant_ID, participants, datetime) VALUES ('993', '499', '85', '2007-03-21 12:05:23');
INSERT INTO Restaurants_Booked (booked_ID, restaurant_ID, participants, datetime) VALUES ('560', '4', '12', '1985-06-26 04:09:02');
INSERT INTO Restaurants_Booked (booked_ID, restaurant_ID, participants, datetime) VALUES ('631', '316', '20', '1976-04-17 04:58:36');
INSERT INTO Restaurants_Booked (booked_ID, restaurant_ID, participants, datetime) VALUES ('842', '718', '68', '2024-03-29 18:18:53');
INSERT INTO Restaurants_Booked (booked_ID, restaurant_ID, participants, datetime) VALUES ('879', '325', '2', '2023-09-30 19:19:07');
INSERT INTO Restaurants_Booked (booked_ID, restaurant_ID, participants, datetime) VALUES ('315', '645', '24', '2012-12-16 00:56:52');
INSERT INTO Restaurants_Booked (booked_ID, restaurant_ID, participants, datetime) VALUES ('874', '511', '28', '1994-12-04 09:38:40');
INSERT INTO Restaurants_Booked (booked_ID, restaurant_ID, participants, datetime) VALUES ('185', '324', '43', '1971-07-21 16:23:39');
INSERT INTO Restaurants_Booked (booked_ID, restaurant_ID, participants, datetime) VALUES ('151', '329', '63', '1978-11-27 02:04:31');
INSERT INTO Restaurants_Booked (booked_ID, restaurant_ID, participants, datetime) VALUES ('727', '303', '76', '2002-12-31 07:12:26');
INSERT INTO Restaurants_Booked (booked_ID, restaurant_ID, participants, datetime) VALUES ('512', '144', '90', '1998-06-08 06:42:46');
INSERT INTO Restaurants_Booked (booked_ID, restaurant_ID, participants, datetime) VALUES ('398', '631', '60', '1977-05-05 15:43:09');
INSERT INTO Restaurants_Booked (booked_ID, restaurant_ID, participants, datetime) VALUES ('679', '711', '30', '1981-07-19 18:31:44');
INSERT INTO Restaurants_Booked (booked_ID, restaurant_ID, participants, datetime) VALUES ('272', '524', '60', '2011-09-08 00:54:40');
INSERT INTO Restaurants_Booked (booked_ID, restaurant_ID, participants, datetime) VALUES ('793', '62', '11', '2023-10-28 15:10:04');

-- Strong Entity
INSERT INTO Navigation (Navigation_ID, Distance, Fare, Estimated_time, Transportation_Method, routing, customerID) VALUES ('333', '96', '46', '09:01:08', 'walking', 'Start from your home and head towards the nearest park', '917');
INSERT INTO Navigation (Navigation_ID, Distance, Fare, Estimated_time, Transportation_Method, routing, customerID) VALUES ('576', '95', '54', '06:31:38', 'car', 'Afterward, head back home via a different route', '830');
INSERT INTO Navigation (Navigation_ID, Distance, Fare, Estimated_time, Transportation_Method, routing, customerID) VALUES ('216', '93', '84', '21:52:52', 'car', 'Explore the town square and its surroundings', '972');
INSERT INTO Navigation (Navigation_ID, Distance, Fare, Estimated_time, Transportation_Method, routing, customerID) VALUES ('430', '14', '46', '12:30:18', 'bus', 'Continue walking until you find the famous fountain', '411');
INSERT INTO Navigation (Navigation_ID, Distance, Fare, Estimated_time, Transportation_Method, routing, customerID) VALUES ('604', '84', '65', '17:18:56', 'car', 'From the park, take a left turn and walk straight until you reach the library', '24');
INSERT INTO Navigation (Navigation_ID, Distance, Fare, Estimated_time, Transportation_Method, routing, customerID) VALUES ('525', '84', '0', '22:41:43', 'train', 'Cross the bridge and turn right onto Main Street', '517');
INSERT INTO Navigation (Navigation_ID, Distance, Fare, Estimated_time, Transportation_Method, routing, customerID) VALUES ('292', '10', '96', '23:39:45', 'walking', 'Cross the bridge and turn right onto Main Street', '606');
INSERT INTO Navigation (Navigation_ID, Distance, Fare, Estimated_time, Transportation_Method, routing, customerID) VALUES ('179', '1', '96', '00:42:38', 'walking', 'Visit the museum on the corner of Market and Elm Street', '555');
INSERT INTO Navigation (Navigation_ID, Distance, Fare, Estimated_time, Transportation_Method, routing, customerID) VALUES ('478', '12', '61', '07:56:17', 'bike', 'Cross the bridge and turn right onto Main Street', '587');
INSERT INTO Navigation (Navigation_ID, Distance, Fare, Estimated_time, Transportation_Method, routing, customerID) VALUES ('261', '32', '13', '21:19:37', 'walking', 'Take a detour through the old alleyways', '486');
INSERT INTO Navigation (Navigation_ID, Distance, Fare, Estimated_time, Transportation_Method, routing, customerID) VALUES ('175', '32', '43', '08:42:53', 'walking', 'Explore the town square and its surroundings', '49');
INSERT INTO Navigation (Navigation_ID, Distance, Fare, Estimated_time, Transportation_Method, routing, customerID) VALUES ('171', '23', '39', '06:56:11', 'bike', 'Continue walking until you find the famous fountain', '197');
INSERT INTO Navigation (Navigation_ID, Distance, Fare, Estimated_time, Transportation_Method, routing, customerID) VALUES ('276', '94', '95', '22:37:30', 'boat', 'Exit the library and turn right, continue walking until you see a coffee shop on your left', '474');
INSERT INTO Navigation (Navigation_ID, Distance, Fare, Estimated_time, Transportation_Method, routing, customerID) VALUES ('805', '42', '56', '11:40:41', 'walking', 'Walk along the riverbank until you reach the bridge', '693');
INSERT INTO Navigation (Navigation_ID, Distance, Fare, Estimated_time, Transportation_Method, routing, customerID) VALUES ('591', '40', '11', '04:40:43', 'train', 'Discover the hidden garden behind the old church', '610');
INSERT INTO Navigation (Navigation_ID, Distance, Fare, Estimated_time, Transportation_Method, routing, customerID) VALUES ('991', '10', '14', '09:16:47', 'bus', 'Start from your home and head towards the nearest park', '457');
INSERT INTO Navigation (Navigation_ID, Distance, Fare, Estimated_time, Transportation_Method, routing, customerID) VALUES ('635', '73', '50', '21:58:27', 'car', 'Explore the town square and its surroundings', '175');
INSERT INTO Navigation (Navigation_ID, Distance, Fare, Estimated_time, Transportation_Method, routing, customerID) VALUES ('759', '73', '13', '21:27:04', 'walking', 'Afterward, head back home via a different route', '865');
INSERT INTO Navigation (Navigation_ID, Distance, Fare, Estimated_time, Transportation_Method, routing, customerID) VALUES ('334', '26', '65', '10:33:04', 'train', 'Discover the hidden garden behind the old church', '527');
INSERT INTO Navigation (Navigation_ID, Distance, Fare, Estimated_time, Transportation_Method, routing, customerID) VALUES ('170', '87', '69', '05:38:12', 'train', 'Take a break at the coffee shop, then continue straight until you reach the town square', '854');
INSERT INTO Navigation (Navigation_ID, Distance, Fare, Estimated_time, Transportation_Method, routing, customerID) VALUES ('141', '4', '77', '10:01:16', 'train', 'Pause for a moment of reflection at the church', '476');
INSERT INTO Navigation (Navigation_ID, Distance, Fare, Estimated_time, Transportation_Method, routing, customerID) VALUES ('115', '79', '2', '19:49:35', 'car', 'Take a detour through the old alleyways', '116');
INSERT INTO Navigation (Navigation_ID, Distance, Fare, Estimated_time, Transportation_Method, routing, customerID) VALUES ('840', '40', '36', '02:20:10', 'bus', 'Explore the town square and its surroundings', '874');
INSERT INTO Navigation (Navigation_ID, Distance, Fare, Estimated_time, Transportation_Method, routing, customerID) VALUES ('906', '23', '41', '08:21:30', 'train', 'Discover the hidden garden behind the old church', '998');
INSERT INTO Navigation (Navigation_ID, Distance, Fare, Estimated_time, Transportation_Method, routing, customerID) VALUES ('443', '88', '49', '08:33:43', 'walking', 'Afterward, head back home via a different route', '961');
INSERT INTO Navigation (Navigation_ID, Distance, Fare, Estimated_time, Transportation_Method, routing, customerID) VALUES ('891', '89', '48', '11:30:52', 'bus', 'Cross the bridge and turn right onto Main Street', '999');
INSERT INTO Navigation (Navigation_ID, Distance, Fare, Estimated_time, Transportation_Method, routing, customerID) VALUES ('679', '96', '16', '10:04:41', 'bike', 'Exit the library and turn right, continue walking until you see a coffee shop on your left', '129');
INSERT INTO Navigation (Navigation_ID, Distance, Fare, Estimated_time, Transportation_Method, routing, customerID) VALUES ('117', '93', '47', '21:26:48', 'walking', 'Continue straight until you reach the market square', '433');
INSERT INTO Navigation (Navigation_ID, Distance, Fare, Estimated_time, Transportation_Method, routing, customerID) VALUES ('142', '2', '14', '02:45:51', 'train', 'From the park, take a left turn and walk straight until you reach the library', '15');
INSERT INTO Navigation (Navigation_ID, Distance, Fare, Estimated_time, Transportation_Method, routing, customerID) VALUES ('79', '85', '85', '23:54:53', 'boat', 'Enjoy the journey!', '936');
INSERT INTO Navigation (Navigation_ID, Distance, Fare, Estimated_time, Transportation_Method, routing, customerID) VALUES ('894', '22', '67', '03:54:05', 'boat', 'Explore the town square and its surroundings', '605');
INSERT INTO Navigation (Navigation_ID, Distance, Fare, Estimated_time, Transportation_Method, routing, customerID) VALUES ('672', '63', '72', '11:56:32', 'bike', 'Start from your home and head towards the nearest park', '879');
INSERT INTO Navigation (Navigation_ID, Distance, Fare, Estimated_time, Transportation_Method, routing, customerID) VALUES ('765', '45', '18', '07:05:05', 'boat', 'Pause for a moment of reflection at the church', '128');
INSERT INTO Navigation (Navigation_ID, Distance, Fare, Estimated_time, Transportation_Method, routing, customerID) VALUES ('839', '62', '90', '20:10:15', 'train', 'Discover the hidden garden behind the old church', '0');
INSERT INTO Navigation (Navigation_ID, Distance, Fare, Estimated_time, Transportation_Method, routing, customerID) VALUES ('561', '85', '36', '06:46:28', 'car', 'From the park, take a left turn and walk straight until you reach the library', '844');
INSERT INTO Navigation (Navigation_ID, Distance, Fare, Estimated_time, Transportation_Method, routing, customerID) VALUES ('916', '16', '93', '21:24:19', 'bike', 'Take a detour through the old alleyways', '703');
INSERT INTO Navigation (Navigation_ID, Distance, Fare, Estimated_time, Transportation_Method, routing, customerID) VALUES ('867', '14', '41', '11:31:35', 'train', 'Start from your home and head towards the nearest park', '897');
INSERT INTO Navigation (Navigation_ID, Distance, Fare, Estimated_time, Transportation_Method, routing, customerID) VALUES ('741', '51', '71', '19:55:23', 'boat', 'Continue straight until you reach the market square', '871');
INSERT INTO Navigation (Navigation_ID, Distance, Fare, Estimated_time, Transportation_Method, routing, customerID) VALUES ('324', '65', '11', '03:34:11', 'walking', 'Exit the library and turn right, continue walking until you see a coffee shop on your left', '615');
INSERT INTO Navigation (Navigation_ID, Distance, Fare, Estimated_time, Transportation_Method, routing, customerID) VALUES ('514', '96', '77', '13:59:35', 'train', 'Continue walking until you find the famous fountain', '759');
INSERT INTO Navigation (Navigation_ID, Distance, Fare, Estimated_time, Transportation_Method, routing, customerID) VALUES ('133', '1', '71', '22:20:40', 'bus', 'Enjoy the journey!', '646');
INSERT INTO Navigation (Navigation_ID, Distance, Fare, Estimated_time, Transportation_Method, routing, customerID) VALUES ('300', '81', '57', '01:18:05', 'bus', 'Enjoy the journey!', '903');
INSERT INTO Navigation (Navigation_ID, Distance, Fare, Estimated_time, Transportation_Method, routing, customerID) VALUES ('696', '23', '14', '07:16:38', 'walking', 'Enjoy the journey!', '315');
INSERT INTO Navigation (Navigation_ID, Distance, Fare, Estimated_time, Transportation_Method, routing, customerID) VALUES ('986', '6', '71', '09:41:06', 'boat', 'Pause for a moment of reflection at the church', '682');
INSERT INTO Navigation (Navigation_ID, Distance, Fare, Estimated_time, Transportation_Method, routing, customerID) VALUES ('306', '14', '0', '12:11:49', 'walking', 'Continue straight until you reach the market square', '37');
INSERT INTO Navigation (Navigation_ID, Distance, Fare, Estimated_time, Transportation_Method, routing, customerID) VALUES ('434', '87', '27', '21:49:07', 'car', 'Pause for a moment of reflection at the church', '421');
INSERT INTO Navigation (Navigation_ID, Distance, Fare, Estimated_time, Transportation_Method, routing, customerID) VALUES ('575', '24', '99', '16:36:31', 'walking', 'Explore the town square and its surroundings', '923');
INSERT INTO Navigation (Navigation_ID, Distance, Fare, Estimated_time, Transportation_Method, routing, customerID) VALUES ('985', '48', '15', '00:35:45', 'bus', 'Walk along the riverbank until you reach the bridge', '969');
INSERT INTO Navigation (Navigation_ID, Distance, Fare, Estimated_time, Transportation_Method, routing, customerID) VALUES ('347', '28', '91', '09:44:08', 'boat', 'Enjoy the journey!', '671');
INSERT INTO Navigation (Navigation_ID, Distance, Fare, Estimated_time, Transportation_Method, routing, customerID) VALUES ('337', '8', '99', '22:23:34', 'bike', 'Start from your home and head towards the nearest park', '738');
INSERT INTO Navigation (Navigation_ID, Distance, Fare, Estimated_time, Transportation_Method, routing, customerID) VALUES ('757', '38', '84', '16:55:08', 'bike', 'Continue straight until you reach the market square', '498');
INSERT INTO Navigation (Navigation_ID, Distance, Fare, Estimated_time, Transportation_Method, routing, customerID) VALUES ('65', '99', '61', '16:39:42', 'bike', 'Afterward, head back home via a different route', '144');
INSERT INTO Navigation (Navigation_ID, Distance, Fare, Estimated_time, Transportation_Method, routing, customerID) VALUES ('688', '96', '19', '03:19:56', 'bus', 'Enjoy the journey!', '588');
INSERT INTO Navigation (Navigation_ID, Distance, Fare, Estimated_time, Transportation_Method, routing, customerID) VALUES ('549', '16', '68', '20:19:01', 'walking', 'From the park, take a left turn and walk straight until you reach the library', '546');
INSERT INTO Navigation (Navigation_ID, Distance, Fare, Estimated_time, Transportation_Method, routing, customerID) VALUES ('286', '61', '57', '06:29:16', 'bike', 'Start from your home and head towards the nearest park', '701');
INSERT INTO Navigation (Navigation_ID, Distance, Fare, Estimated_time, Transportation_Method, routing, customerID) VALUES ('818', '18', '41', '12:24:49', 'train', 'Continue walking until you find the famous fountain', '765');
INSERT INTO Navigation (Navigation_ID, Distance, Fare, Estimated_time, Transportation_Method, routing, customerID) VALUES ('866', '21', '70', '13:31:53', 'train', 'Discover the hidden garden behind the old church', '608');
INSERT INTO Navigation (Navigation_ID, Distance, Fare, Estimated_time, Transportation_Method, routing, customerID) VALUES ('628', '92', '24', '18:39:32', 'bus', 'Take a break at the coffee shop, then continue straight until you reach the town square', '30');
INSERT INTO Navigation (Navigation_ID, Distance, Fare, Estimated_time, Transportation_Method, routing, customerID) VALUES ('535', '50', '61', '16:11:31', 'boat', 'Visit the museum on the corner of Market and Elm Street', '624');
INSERT INTO Navigation (Navigation_ID, Distance, Fare, Estimated_time, Transportation_Method, routing, customerID) VALUES ('254', '51', '8', '15:55:06', 'car', 'Walk along the riverbank until you reach the bridge', '419');
INSERT INTO Navigation (Navigation_ID, Distance, Fare, Estimated_time, Transportation_Method, routing, customerID) VALUES ('500', '26', '53', '15:03:53', 'bike', 'Afterward, head back home via a different route', '699');
INSERT INTO Navigation (Navigation_ID, Distance, Fare, Estimated_time, Transportation_Method, routing, customerID) VALUES ('437', '52', '36', '18:51:20', 'walking', 'Visit the museum on the corner of Market and Elm Street', '475');
INSERT INTO Navigation (Navigation_ID, Distance, Fare, Estimated_time, Transportation_Method, routing, customerID) VALUES ('618', '63', '59', '11:19:54', 'boat', 'Exit the library and turn right, continue walking until you see a coffee shop on your left', '392');
INSERT INTO Navigation (Navigation_ID, Distance, Fare, Estimated_time, Transportation_Method, routing, customerID) VALUES ('823', '95', '35', '17:00:55', 'bus', 'Visit the museum on the corner of Market and Elm Street', '511');
INSERT INTO Navigation (Navigation_ID, Distance, Fare, Estimated_time, Transportation_Method, routing, customerID) VALUES ('246', '29', '48', '01:54:20', 'car', 'Pause for a moment of reflection at the church', '832');
INSERT INTO Navigation (Navigation_ID, Distance, Fare, Estimated_time, Transportation_Method, routing, customerID) VALUES ('428', '65', '29', '00:10:45', 'car', 'Take a detour through the old alleyways', '240');
INSERT INTO Navigation (Navigation_ID, Distance, Fare, Estimated_time, Transportation_Method, routing, customerID) VALUES ('124', '53', '13', '12:59:32', 'car', 'Discover the hidden garden behind the old church', '962');
INSERT INTO Navigation (Navigation_ID, Distance, Fare, Estimated_time, Transportation_Method, routing, customerID) VALUES ('913', '44', '98', '06:13:00', 'train', 'Continue straight until you reach the market square', '275');
INSERT INTO Navigation (Navigation_ID, Distance, Fare, Estimated_time, Transportation_Method, routing, customerID) VALUES ('98', '82', '20', '19:50:44', 'boat', 'Walk along the riverbank until you reach the bridge', '11');
INSERT INTO Navigation (Navigation_ID, Distance, Fare, Estimated_time, Transportation_Method, routing, customerID) VALUES ('17', '20', '8', '10:21:32', 'bus', 'Discover the hidden garden behind the old church', '707');
INSERT INTO Navigation (Navigation_ID, Distance, Fare, Estimated_time, Transportation_Method, routing, customerID) VALUES ('97', '38', '45', '14:37:17', 'bus', 'Take a detour through the old alleyways', '997');
INSERT INTO Navigation (Navigation_ID, Distance, Fare, Estimated_time, Transportation_Method, routing, customerID) VALUES ('168', '24', '64', '02:36:49', 'boat', 'Exit the library and turn right, continue walking until you see a coffee shop on your left', '190');
INSERT INTO Navigation (Navigation_ID, Distance, Fare, Estimated_time, Transportation_Method, routing, customerID) VALUES ('4', '2', '43', '11:23:51', 'bus', 'Afterward, head back home via a different route', '412');
INSERT INTO Navigation (Navigation_ID, Distance, Fare, Estimated_time, Transportation_Method, routing, customerID) VALUES ('489', '20', '59', '17:49:52', 'boat', 'Continue straight until you reach the market square', '93');
INSERT INTO Navigation (Navigation_ID, Distance, Fare, Estimated_time, Transportation_Method, routing, customerID) VALUES ('723', '48', '6', '21:36:43', 'walking', 'From the park, take a left turn and walk straight until you reach the library', '657');

-- Weak Entity
INSERT INTO activities (activities_ID, name, cost) VALUES ('222', 'sky diving', '52');
INSERT INTO activities (activities_ID, name, cost) VALUES ('524', 'scuba diving', '83');
INSERT INTO activities (activities_ID, name, cost) VALUES ('81', 'taste testing', '60');
INSERT INTO activities (activities_ID, name, cost) VALUES ('194', 'camping', '55');
INSERT INTO activities (activities_ID, name, cost) VALUES ('502', 'safari tours', '20');
INSERT INTO activities (activities_ID, name, cost) VALUES ('901', 'scuba diving', '38');
INSERT INTO activities (activities_ID, name, cost) VALUES ('636', 'museums', '75');
INSERT INTO activities (activities_ID, name, cost) VALUES ('430', 'taste testing', '19');
INSERT INTO activities (activities_ID, name, cost) VALUES ('234', 'scuba diving', '75');
INSERT INTO activities (activities_ID, name, cost) VALUES ('756', 'camping', '40');
INSERT INTO activities (activities_ID, name, cost) VALUES ('235', 'taste testing', '36');
INSERT INTO activities (activities_ID, name, cost) VALUES ('663', 'museums', '97');
INSERT INTO activities (activities_ID, name, cost) VALUES ('675', 'art gallaries', '72');
INSERT INTO activities (activities_ID, name, cost) VALUES ('980', 'safari tours', '93');
INSERT INTO activities (activities_ID, name, cost) VALUES ('647', 'camping', '16');
INSERT INTO activities (activities_ID, name, cost) VALUES ('565', 'scuba diving', '92');
INSERT INTO activities (activities_ID, name, cost) VALUES ('406', 'scuba diving', '33');
INSERT INTO activities (activities_ID, name, cost) VALUES ('800', 'hiking', '27');
INSERT INTO activities (activities_ID, name, cost) VALUES ('472', 'safari tours', '10');
INSERT INTO activities (activities_ID, name, cost) VALUES ('284', 'taste testing', '18');
INSERT INTO activities (activities_ID, name, cost) VALUES ('439', 'art gallaries', '33');
INSERT INTO activities (activities_ID, name, cost) VALUES ('13', 'skating', '6');
INSERT INTO activities (activities_ID, name, cost) VALUES ('920', 'safari tours', '25');
INSERT INTO activities (activities_ID, name, cost) VALUES ('778', 'safari tours', '43');
INSERT INTO activities (activities_ID, name, cost) VALUES ('764', 'sky diving', '64');
INSERT INTO activities (activities_ID, name, cost) VALUES ('787', 'sky diving', '51');
INSERT INTO activities (activities_ID, name, cost) VALUES ('313', 'skating', '70');
INSERT INTO activities (activities_ID, name, cost) VALUES ('323', 'museums', '68');
INSERT INTO activities (activities_ID, name, cost) VALUES ('193', 'safari tours', '34');
INSERT INTO activities (activities_ID, name, cost) VALUES ('554', 'museums', '95');
INSERT INTO activities (activities_ID, name, cost) VALUES ('101', 'scuba diving', '63');
INSERT INTO activities (activities_ID, name, cost) VALUES ('215', 'sky diving', '97');
INSERT INTO activities (activities_ID, name, cost) VALUES ('509', 'sky diving', '46');
INSERT INTO activities (activities_ID, name, cost) VALUES ('181', 'skating', '92');
INSERT INTO activities (activities_ID, name, cost) VALUES ('341', 'art gallaries', '90');
INSERT INTO activities (activities_ID, name, cost) VALUES ('283', 'scuba diving', '86');
INSERT INTO activities (activities_ID, name, cost) VALUES ('145', 'scuba diving', '94');
INSERT INTO activities (activities_ID, name, cost) VALUES ('985', 'camping', '86');
INSERT INTO activities (activities_ID, name, cost) VALUES ('100', 'skating', '9');
INSERT INTO activities (activities_ID, name, cost) VALUES ('130', 'scuba diving', '3');
INSERT INTO activities (activities_ID, name, cost) VALUES ('187', 'camping', '72');
INSERT INTO activities (activities_ID, name, cost) VALUES ('828', 'skating', '36');
INSERT INTO activities (activities_ID, name, cost) VALUES ('760', 'safari tours', '89');
INSERT INTO activities (activities_ID, name, cost) VALUES ('155', 'scuba diving', '27');
INSERT INTO activities (activities_ID, name, cost) VALUES ('733', 'sky diving', '1');
INSERT INTO activities (activities_ID, name, cost) VALUES ('486', 'sky diving', '44');
INSERT INTO activities (activities_ID, name, cost) VALUES ('517', 'taste testing', '98');
INSERT INTO activities (activities_ID, name, cost) VALUES ('896', 'camping', '95');
INSERT INTO activities (activities_ID, name, cost) VALUES ('139', 'hiking', '84');
INSERT INTO activities (activities_ID, name, cost) VALUES ('415', 'art gallaries', '4');
INSERT INTO activities (activities_ID, name, cost) VALUES ('23', 'museums', '64');
INSERT INTO activities (activities_ID, name, cost) VALUES ('734', 'art gallaries', '26');
INSERT INTO activities (activities_ID, name, cost) VALUES ('331', 'safari tours', '3');
INSERT INTO activities (activities_ID, name, cost) VALUES ('340', 'scuba diving', '2');
INSERT INTO activities (activities_ID, name, cost) VALUES ('9', 'taste testing', '92');
INSERT INTO activities (activities_ID, name, cost) VALUES ('757', 'skating', '45');
INSERT INTO activities (activities_ID, name, cost) VALUES ('243', 'art gallaries', '61');
INSERT INTO activities (activities_ID, name, cost) VALUES ('659', 'taste testing', '28');
INSERT INTO activities (activities_ID, name, cost) VALUES ('523', 'sky diving', '29');
INSERT INTO activities (activities_ID, name, cost) VALUES ('538', 'taste testing', '98');
INSERT INTO activities (activities_ID, name, cost) VALUES ('555', 'camping', '97');
INSERT INTO activities (activities_ID, name, cost) VALUES ('433', 'safari tours', '32');
INSERT INTO activities (activities_ID, name, cost) VALUES ('700', 'camping', '79');
INSERT INTO activities (activities_ID, name, cost) VALUES ('135', 'taste testing', '85');
INSERT INTO activities (activities_ID, name, cost) VALUES ('237', 'safari tours', '28');
INSERT INTO activities (activities_ID, name, cost) VALUES ('525', 'art gallaries', '63');
INSERT INTO activities (activities_ID, name, cost) VALUES ('399', 'safari tours', '81');
INSERT INTO activities (activities_ID, name, cost) VALUES ('869', 'museums', '58');
INSERT INTO activities (activities_ID, name, cost) VALUES ('287', 'sky diving', '40');
INSERT INTO activities (activities_ID, name, cost) VALUES ('481', 'scuba diving', '94');
INSERT INTO activities (activities_ID, name, cost) VALUES ('370', 'skating', '62');
INSERT INTO activities (activities_ID, name, cost) VALUES ('355', 'sky diving', '32');
INSERT INTO activities (activities_ID, name, cost) VALUES ('913', 'scuba diving', '10');
INSERT INTO activities (activities_ID, name, cost) VALUES ('904', 'sky diving', '22');
INSERT INTO activities (activities_ID, name, cost) VALUES ('661', 'taste testing', '3');

-- Strong Entity
INSERT INTO room_type (type_Id, name, max_guests, total_room, description, room_price, hotel_id) VALUES ('832', 'Cozy Retreat Room', '25', '443', 'Luxurious Penthouse Loft', '202', '863');
INSERT INTO room_type (type_Id, name, max_guests, total_room, description, room_price, hotel_id) VALUES ('552', 'Garden View Bungalow', '8', '324', 'Seaside Villa Bedroom', '912', '505');
INSERT INTO room_type (type_Id, name, max_guests, total_room, description, room_price, hotel_id) VALUES ('922', 'Urban Loft Studio', '51', '951', 'Artistic Loft Space', '757', '316');
INSERT INTO room_type (type_Id, name, max_guests, total_room, description, room_price, hotel_id) VALUES ('451', 'Executive King Suite', '46', '512', 'Modern Studio Apartment', '214', '382');
INSERT INTO room_type (type_Id, name, max_guests, total_room, description, room_price, hotel_id) VALUES ('101', 'Vintage Victorian Suite', '17', '35', 'Charming Cottage Room', '467', '926');
INSERT INTO room_type (type_Id, name, max_guests, total_room, description, room_price, hotel_id) VALUES ('549', 'Riverside Cabin Suite', '14', '234', 'Cozy Single Bedroom', '100', '996');
INSERT INTO room_type (type_Id, name, max_guests, total_room, description, room_price, hotel_id) VALUES ('907', 'Garden View Bungalow', '8', '573', 'Quaint Guesthouse Bedroom', '158', '960');
INSERT INTO room_type (type_Id, name, max_guests, total_room, description, room_price, hotel_id) VALUES ('314', 'Urban Loft Studio', '97', '62', 'Classic Victorian Chamber', '979', '160');
INSERT INTO room_type (type_Id, name, max_guests, total_room, description, room_price, hotel_id) VALUES ('845', 'Vintage Victorian Suite', '92', '81', 'Spacious Master Suite', '250', '574');
INSERT INTO room_type (type_Id, name, max_guests, total_room, description, room_price, hotel_id) VALUES ('846', 'Family Friendly Suite', '99', '439', 'Quaint Guesthouse Bedroom', '162', '520');
INSERT INTO room_type (type_Id, name, max_guests, total_room, description, room_price, hotel_id) VALUES ('797', 'Executive King Suite', '83', '256', 'Luxurious Penthouse Loft', '413', '96');
INSERT INTO room_type (type_Id, name, max_guests, total_room, description, room_price, hotel_id) VALUES ('687', 'Luxury Spa Room', '40', '477', 'Traditional Country Inn Room', '482', '763');
INSERT INTO room_type (type_Id, name, max_guests, total_room, description, room_price, hotel_id) VALUES ('449', 'Vintage Victorian Suite', '81', '154', 'Contemporary Urban Loft', '718', '951');
INSERT INTO room_type (type_Id, name, max_guests, total_room, description, room_price, hotel_id) VALUES ('506', 'Urban Loft Studio', '76', '565', 'Sleek City View Studio', '760', '835');
INSERT INTO room_type (type_Id, name, max_guests, total_room, description, room_price, hotel_id) VALUES ('809', 'Luxury Spa Room', '43', '407', 'Spacious Master Suite', '805', '670');
INSERT INTO room_type (type_Id, name, max_guests, total_room, description, room_price, hotel_id) VALUES ('212', 'Urban Loft Studio', '85', '861', 'Elegant Executive Suite', '307', '645');
INSERT INTO room_type (type_Id, name, max_guests, total_room, description, room_price, hotel_id) VALUES ('413', 'Mountain Chalet Bedroom', '55', '309', 'Cozy Single Bedroom', '487', '308');
INSERT INTO room_type (type_Id, name, max_guests, total_room, description, room_price, hotel_id) VALUES ('253', 'Family Friendly Suite', '99', '816', 'Sleek City View Studio', '533', '136');
INSERT INTO room_type (type_Id, name, max_guests, total_room, description, room_price, hotel_id) VALUES ('712', 'Mountain Chalet Bedroom', '55', '742', 'Classic Victorian Chamber', '861', '418');
INSERT INTO room_type (type_Id, name, max_guests, total_room, description, room_price, hotel_id) VALUES ('955', 'Garden View Bungalow', '22', '345', 'Tropical Bungalow Bedroom', '964', '129');
INSERT INTO room_type (type_Id, name, max_guests, total_room, description, room_price, hotel_id) VALUES ('276', 'Riverside Cabin Suite', '40', '519', 'Artistic Loft Space', '361', '234');
INSERT INTO room_type (type_Id, name, max_guests, total_room, description, room_price, hotel_id) VALUES ('329', 'Urban Loft Studio', '22', '912', 'Modern Studio Apartment', '348', '417');
INSERT INTO room_type (type_Id, name, max_guests, total_room, description, room_price, hotel_id) VALUES ('502', 'Urban Loft Studio', '75', '778', 'Traditional Country Inn Room', '706', '706');
INSERT INTO room_type (type_Id, name, max_guests, total_room, description, room_price, hotel_id) VALUES ('360', 'Urban Loft Studio', '80', '538', 'Contemporary Urban Loft', '919', '182');
INSERT INTO room_type (type_Id, name, max_guests, total_room, description, room_price, hotel_id) VALUES ('874', 'Vintage Victorian Suite', '65', '45', 'Classic Victorian Chamber', '273', '813');
INSERT INTO room_type (type_Id, name, max_guests, total_room, description, room_price, hotel_id) VALUES ('773', 'Mountain Chalet Bedroom', '50', '947', 'Spacious Master Suite', '762', '624');
INSERT INTO room_type (type_Id, name, max_guests, total_room, description, room_price, hotel_id) VALUES ('749', 'Cozy Retreat Room', '2', '850', 'Rustic Cabin Retreat', '526', '286');
INSERT INTO room_type (type_Id, name, max_guests, total_room, description, room_price, hotel_id) VALUES ('172', 'Executive King Suite', '68', '478', 'Luxurious Penthouse Loft', '374', '183');
INSERT INTO room_type (type_Id, name, max_guests, total_room, description, room_price, hotel_id) VALUES ('772', 'Riverside Cabin Suite', '10', '518', 'Luxurious Penthouse Loft', '99', '969');
INSERT INTO room_type (type_Id, name, max_guests, total_room, description, room_price, hotel_id) VALUES ('126', 'Garden View Bungalow', '20', '756', 'Spacious Master Suite', '858', '85');
INSERT INTO room_type (type_Id, name, max_guests, total_room, description, room_price, hotel_id) VALUES ('295', 'Executive King Suite', '69', '675', 'Modern Studio Apartment', '962', '211');
INSERT INTO room_type (type_Id, name, max_guests, total_room, description, room_price, hotel_id) VALUES ('34', 'Luxury Spa Room', '82', '836', 'Modern Studio Apartment', '664', '874');
INSERT INTO room_type (type_Id, name, max_guests, total_room, description, room_price, hotel_id) VALUES ('857', 'Family Friendly Suite', '59', '795', 'Charming Cottage Room', '772', '14');
INSERT INTO room_type (type_Id, name, max_guests, total_room, description, room_price, hotel_id) VALUES ('236', 'Mountain Chalet Bedroom', '51', '993', 'Rustic Cabin Retreat', '580', '580');
INSERT INTO room_type (type_Id, name, max_guests, total_room, description, room_price, hotel_id) VALUES ('740', 'Urban Loft Studio', '60', '125', 'Seaside Villa Bedroom', '249', '342');
INSERT INTO room_type (type_Id, name, max_guests, total_room, description, room_price, hotel_id) VALUES ('459', 'Mountain Chalet Bedroom', '44', '838', 'Classic Victorian Chamber', '528', '933');
INSERT INTO room_type (type_Id, name, max_guests, total_room, description, room_price, hotel_id) VALUES ('1', 'Urban Loft Studio', '2', '987', 'Charming Cottage Room', '289', '901');
INSERT INTO room_type (type_Id, name, max_guests, total_room, description, room_price, hotel_id) VALUES ('904', 'Riverside Cabin Suite', '67', '393', 'Traditional Country Inn Room', '11', '861');
INSERT INTO room_type (type_Id, name, max_guests, total_room, description, room_price, hotel_id) VALUES ('538', 'Urban Loft Studio', '14', '579', 'Classic Victorian Chamber', '511', '931');
INSERT INTO room_type (type_Id, name, max_guests, total_room, description, room_price, hotel_id) VALUES ('532', 'Executive King Suite', '18', '661', 'Sleek City View Studio', '737', '554');
INSERT INTO room_type (type_Id, name, max_guests, total_room, description, room_price, hotel_id) VALUES ('618', 'Vintage Victorian Suite', '76', '420', 'Artistic Loft Space', '516', '980');
INSERT INTO room_type (type_Id, name, max_guests, total_room, description, room_price, hotel_id) VALUES ('470', 'Family Friendly Suite', '79', '527', 'Traditional Country Inn Room', '557', '2');
INSERT INTO room_type (type_Id, name, max_guests, total_room, description, room_price, hotel_id) VALUES ('52', 'Riverside Cabin Suite', '34', '323', 'Cozy Single Bedroom', '510', '998');
INSERT INTO room_type (type_Id, name, max_guests, total_room, description, room_price, hotel_id) VALUES ('134', 'Executive King Suite', '99', '556', 'Seaside Villa Bedroom', '33', '177');
INSERT INTO room_type (type_Id, name, max_guests, total_room, description, room_price, hotel_id) VALUES ('244', 'Vintage Victorian Suite', '46', '412', 'Classic Victorian Chamber', '963', '361');
INSERT INTO room_type (type_Id, name, max_guests, total_room, description, room_price, hotel_id) VALUES ('971', 'Mountain Chalet Bedroom', '96', '602', 'Tropical Bungalow Bedroom', '336', '116');
INSERT INTO room_type (type_Id, name, max_guests, total_room, description, room_price, hotel_id) VALUES ('673', 'Deluxe Ocean View Room', '47', '851', 'Cozy Single Bedroom', '63', '393');
INSERT INTO room_type (type_Id, name, max_guests, total_room, description, room_price, hotel_id) VALUES ('201', 'Riverside Cabin Suite', '86', '972', 'Tropical Bungalow Bedroom', '309', '552');
INSERT INTO room_type (type_Id, name, max_guests, total_room, description, room_price, hotel_id) VALUES ('248', 'Cozy Retreat Room', '45', '420', 'Luxurious Penthouse Loft', '474', '493');
INSERT INTO room_type (type_Id, name, max_guests, total_room, description, room_price, hotel_id) VALUES ('669', 'Executive King Suite', '39', '104', 'Luxurious Penthouse Loft', '25', '754');
INSERT INTO room_type (type_Id, name, max_guests, total_room, description, room_price, hotel_id) VALUES ('362', 'Vintage Victorian Suite', '68', '292', 'Contemporary Urban Loft', '582', '485');
INSERT INTO room_type (type_Id, name, max_guests, total_room, description, room_price, hotel_id) VALUES ('546', 'Cozy Retreat Room', '66', '831', 'Spacious Master Suite', '742', '668');
INSERT INTO room_type (type_Id, name, max_guests, total_room, description, room_price, hotel_id) VALUES ('423', 'Riverside Cabin Suite', '21', '976', 'Quaint Guesthouse Bedroom', '146', '553');
INSERT INTO room_type (type_Id, name, max_guests, total_room, description, room_price, hotel_id) VALUES ('613', 'Riverside Cabin Suite', '78', '871', 'Charming Cottage Room', '208', '92');
INSERT INTO room_type (type_Id, name, max_guests, total_room, description, room_price, hotel_id) VALUES ('925', 'Cozy Retreat Room', '10', '996', 'Artistic Loft Space', '940', '923');
INSERT INTO room_type (type_Id, name, max_guests, total_room, description, room_price, hotel_id) VALUES ('939', 'Cozy Retreat Room', '6', '455', 'Tropical Bungalow Bedroom', '206', '162');
INSERT INTO room_type (type_Id, name, max_guests, total_room, description, room_price, hotel_id) VALUES ('74', 'Vintage Victorian Suite', '50', '261', 'Sleek City View Studio', '482', '750');
INSERT INTO room_type (type_Id, name, max_guests, total_room, description, room_price, hotel_id) VALUES ('497', 'Vintage Victorian Suite', '64', '758', 'Elegant Executive Suite', '733', '227');
INSERT INTO room_type (type_Id, name, max_guests, total_room, description, room_price, hotel_id) VALUES ('954', 'Cozy Retreat Room', '93', '108', 'Charming Cottage Room', '537', '792');
INSERT INTO room_type (type_Id, name, max_guests, total_room, description, room_price, hotel_id) VALUES ('747', 'Garden View Bungalow', '93', '101', 'Rustic Cabin Retreat', '929', '719');
INSERT INTO room_type (type_Id, name, max_guests, total_room, description, room_price, hotel_id) VALUES ('647', 'Cozy Retreat Room', '51', '425', 'Artistic Loft Space', '441', '906');
INSERT INTO room_type (type_Id, name, max_guests, total_room, description, room_price, hotel_id) VALUES ('420', 'Family Friendly Suite', '55', '871', 'Traditional Country Inn Room', '638', '326');
INSERT INTO room_type (type_Id, name, max_guests, total_room, description, room_price, hotel_id) VALUES ('77', 'Cozy Retreat Room', '4', '272', 'Modern Studio Apartment', '231', '767');
INSERT INTO room_type (type_Id, name, max_guests, total_room, description, room_price, hotel_id) VALUES ('33', 'Deluxe Ocean View Room', '88', '120', 'Rustic Cabin Retreat', '504', '253');
INSERT INTO room_type (type_Id, name, max_guests, total_room, description, room_price, hotel_id) VALUES ('779', 'Cozy Retreat Room', '27', '628', 'Luxurious Penthouse Loft', '797', '540');
INSERT INTO room_type (type_Id, name, max_guests, total_room, description, room_price, hotel_id) VALUES ('205', 'Garden View Bungalow', '13', '95', 'Traditional Country Inn Room', '281', '537');
INSERT INTO room_type (type_Id, name, max_guests, total_room, description, room_price, hotel_id) VALUES ('204', 'Cozy Retreat Room', '46', '868', 'Classic Victorian Chamber', '90', '564');
INSERT INTO room_type (type_Id, name, max_guests, total_room, description, room_price, hotel_id) VALUES ('7', 'Deluxe Ocean View Room', '15', '890', 'Sleek City View Studio', '242', '830');
INSERT INTO room_type (type_Id, name, max_guests, total_room, description, room_price, hotel_id) VALUES ('368', 'Luxury Spa Room', '15', '397', 'Charming Cottage Room', '863', '144');
INSERT INTO room_type (type_Id, name, max_guests, total_room, description, room_price, hotel_id) VALUES ('744', 'Vintage Victorian Suite', '6', '453', 'Artistic Loft Space', '857', '460');
INSERT INTO room_type (type_Id, name, max_guests, total_room, description, room_price, hotel_id) VALUES ('657', 'Riverside Cabin Suite', '48', '924', 'Luxurious Penthouse Loft', '9', '866');
INSERT INTO room_type (type_Id, name, max_guests, total_room, description, room_price, hotel_id) VALUES ('973', 'Urban Loft Studio', '40', '181', 'Elegant Executive Suite', '262', '39');
INSERT INTO room_type (type_Id, name, max_guests, total_room, description, room_price, hotel_id) VALUES ('729', 'Garden View Bungalow', '9', '747', 'Artistic Loft Space', '414', '771');
INSERT INTO room_type (type_Id, name, max_guests, total_room, description, room_price, hotel_id) VALUES ('872', 'Executive King Suite', '94', '354', 'Elegant Executive Suite', '74', '878');
INSERT INTO room_type (type_Id, name, max_guests, total_room, description, room_price, hotel_id) VALUES ('581', 'Deluxe Ocean View Room', '28', '817', 'Cozy Single Bedroom', '835', '93');

-- Bridge Entity
INSERT INTO Restaurant_Cuisine (Cuisine_id, restaurant_id) VALUES ('526', '895');
INSERT INTO Restaurant_Cuisine (Cuisine_id, restaurant_id) VALUES ('979', '577');
INSERT INTO Restaurant_Cuisine (Cuisine_id, restaurant_id) VALUES ('712', '593');
INSERT INTO Restaurant_Cuisine (Cuisine_id, restaurant_id) VALUES ('19', '201');
INSERT INTO Restaurant_Cuisine (Cuisine_id, restaurant_id) VALUES ('196', '105');
INSERT INTO Restaurant_Cuisine (Cuisine_id, restaurant_id) VALUES ('275', '245');
INSERT INTO Restaurant_Cuisine (Cuisine_id, restaurant_id) VALUES ('464', '180');
INSERT INTO Restaurant_Cuisine (Cuisine_id, restaurant_id) VALUES ('94', '327');
INSERT INTO Restaurant_Cuisine (Cuisine_id, restaurant_id) VALUES ('339', '81');
INSERT INTO Restaurant_Cuisine (Cuisine_id, restaurant_id) VALUES ('787', '202');
INSERT INTO Restaurant_Cuisine (Cuisine_id, restaurant_id) VALUES ('353', '284');
INSERT INTO Restaurant_Cuisine (Cuisine_id, restaurant_id) VALUES ('351', '643');
INSERT INTO Restaurant_Cuisine (Cuisine_id, restaurant_id) VALUES ('111', '749');
INSERT INTO Restaurant_Cuisine (Cuisine_id, restaurant_id) VALUES ('222', '80');
INSERT INTO Restaurant_Cuisine (Cuisine_id, restaurant_id) VALUES ('873', '665');
INSERT INTO Restaurant_Cuisine (Cuisine_id, restaurant_id) VALUES ('971', '206');
INSERT INTO Restaurant_Cuisine (Cuisine_id, restaurant_id) VALUES ('684', '627');
INSERT INTO Restaurant_Cuisine (Cuisine_id, restaurant_id) VALUES ('639', '77');
INSERT INTO Restaurant_Cuisine (Cuisine_id, restaurant_id) VALUES ('645', '871');
INSERT INTO Restaurant_Cuisine (Cuisine_id, restaurant_id) VALUES ('392', '731');
INSERT INTO Restaurant_Cuisine (Cuisine_id, restaurant_id) VALUES ('136', '132');
INSERT INTO Restaurant_Cuisine (Cuisine_id, restaurant_id) VALUES ('476', '820');
INSERT INTO Restaurant_Cuisine (Cuisine_id, restaurant_id) VALUES ('709', '716');
INSERT INTO Restaurant_Cuisine (Cuisine_id, restaurant_id) VALUES ('672', '370');
INSERT INTO Restaurant_Cuisine (Cuisine_id, restaurant_id) VALUES ('384', '57');
INSERT INTO Restaurant_Cuisine (Cuisine_id, restaurant_id) VALUES ('238', '296');
INSERT INTO Restaurant_Cuisine (Cuisine_id, restaurant_id) VALUES ('572', '309');
INSERT INTO Restaurant_Cuisine (Cuisine_id, restaurant_id) VALUES ('264', '141');
INSERT INTO Restaurant_Cuisine (Cuisine_id, restaurant_id) VALUES ('487', '799');
INSERT INTO Restaurant_Cuisine (Cuisine_id, restaurant_id) VALUES ('999', '714');
INSERT INTO Restaurant_Cuisine (Cuisine_id, restaurant_id) VALUES ('951', '826');
INSERT INTO Restaurant_Cuisine (Cuisine_id, restaurant_id) VALUES ('802', '313');
INSERT INTO Restaurant_Cuisine (Cuisine_id, restaurant_id) VALUES ('574', '840');
INSERT INTO Restaurant_Cuisine (Cuisine_id, restaurant_id) VALUES ('774', '98');
INSERT INTO Restaurant_Cuisine (Cuisine_id, restaurant_id) VALUES ('135', '261');
INSERT INTO Restaurant_Cuisine (Cuisine_id, restaurant_id) VALUES ('155', '278');
INSERT INTO Restaurant_Cuisine (Cuisine_id, restaurant_id) VALUES ('523', '154');
INSERT INTO Restaurant_Cuisine (Cuisine_id, restaurant_id) VALUES ('179', '22');
INSERT INTO Restaurant_Cuisine (Cuisine_id, restaurant_id) VALUES ('124', '561');
INSERT INTO Restaurant_Cuisine (Cuisine_id, restaurant_id) VALUES ('447', '819');
INSERT INTO Restaurant_Cuisine (Cuisine_id, restaurant_id) VALUES ('336', '290');
INSERT INTO Restaurant_Cuisine (Cuisine_id, restaurant_id) VALUES ('431', '839');
INSERT INTO Restaurant_Cuisine (Cuisine_id, restaurant_id) VALUES ('757', '149');
INSERT INTO Restaurant_Cuisine (Cuisine_id, restaurant_id) VALUES ('86', '551');
INSERT INTO Restaurant_Cuisine (Cuisine_id, restaurant_id) VALUES ('297', '394');
INSERT INTO Restaurant_Cuisine (Cuisine_id, restaurant_id) VALUES ('24', '187');
INSERT INTO Restaurant_Cuisine (Cuisine_id, restaurant_id) VALUES ('492', '29');
INSERT INTO Restaurant_Cuisine (Cuisine_id, restaurant_id) VALUES ('33', '484');
INSERT INTO Restaurant_Cuisine (Cuisine_id, restaurant_id) VALUES ('218', '334');
INSERT INTO Restaurant_Cuisine (Cuisine_id, restaurant_id) VALUES ('829', '929');
INSERT INTO Restaurant_Cuisine (Cuisine_id, restaurant_id) VALUES ('152', '210');
INSERT INTO Restaurant_Cuisine (Cuisine_id, restaurant_id) VALUES ('607', '397');
INSERT INTO Restaurant_Cuisine (Cuisine_id, restaurant_id) VALUES ('773', '198');
INSERT INTO Restaurant_Cuisine (Cuisine_id, restaurant_id) VALUES ('785', '48');
INSERT INTO Restaurant_Cuisine (Cuisine_id, restaurant_id) VALUES ('756', '670');
INSERT INTO Restaurant_Cuisine (Cuisine_id, restaurant_id) VALUES ('821', '622');
INSERT INTO Restaurant_Cuisine (Cuisine_id, restaurant_id) VALUES ('417', '896');
INSERT INTO Restaurant_Cuisine (Cuisine_id, restaurant_id) VALUES ('252', '940');
INSERT INTO Restaurant_Cuisine (Cuisine_id, restaurant_id) VALUES ('644', '120');
INSERT INTO Restaurant_Cuisine (Cuisine_id, restaurant_id) VALUES ('838', '356');
INSERT INTO Restaurant_Cuisine (Cuisine_id, restaurant_id) VALUES ('263', '499');
INSERT INTO Restaurant_Cuisine (Cuisine_id, restaurant_id) VALUES ('858', '4');
INSERT INTO Restaurant_Cuisine (Cuisine_id, restaurant_id) VALUES ('271', '316');
INSERT INTO Restaurant_Cuisine (Cuisine_id, restaurant_id) VALUES ('127', '718');
INSERT INTO Restaurant_Cuisine (Cuisine_id, restaurant_id) VALUES ('299', '325');
INSERT INTO Restaurant_Cuisine (Cuisine_id, restaurant_id) VALUES ('474', '645');
INSERT INTO Restaurant_Cuisine (Cuisine_id, restaurant_id) VALUES ('181', '511');
INSERT INTO Restaurant_Cuisine (Cuisine_id, restaurant_id) VALUES ('505', '324');
INSERT INTO Restaurant_Cuisine (Cuisine_id, restaurant_id) VALUES ('517', '329');
INSERT INTO Restaurant_Cuisine (Cuisine_id, restaurant_id) VALUES ('389', '303');
INSERT INTO Restaurant_Cuisine (Cuisine_id, restaurant_id) VALUES ('648', '144');
INSERT INTO Restaurant_Cuisine (Cuisine_id, restaurant_id) VALUES ('276', '631');
INSERT INTO Restaurant_Cuisine (Cuisine_id, restaurant_id) VALUES ('646', '711');
INSERT INTO Restaurant_Cuisine (Cuisine_id, restaurant_id) VALUES ('8', '524');
INSERT INTO Restaurant_Cuisine (Cuisine_id, restaurant_id) VALUES ('99', '62');

-- Bridge Entity
INSERT INTO Navigation_Transportation_Method (Navigation_id, Transportation_Method) VALUES ('333', 'car');
INSERT INTO Navigation_Transportation_Method (Navigation_id, Transportation_Method) VALUES ('576', 'boat');
INSERT INTO Navigation_Transportation_Method (Navigation_id, Transportation_Method) VALUES ('216', 'train');
INSERT INTO Navigation_Transportation_Method (Navigation_id, Transportation_Method) VALUES ('430', 'train');
INSERT INTO Navigation_Transportation_Method (Navigation_id, Transportation_Method) VALUES ('604', 'walking');
INSERT INTO Navigation_Transportation_Method (Navigation_id, Transportation_Method) VALUES ('525', 'boat');
INSERT INTO Navigation_Transportation_Method (Navigation_id, Transportation_Method) VALUES ('292', 'boat');
INSERT INTO Navigation_Transportation_Method (Navigation_id, Transportation_Method) VALUES ('179', 'train');
INSERT INTO Navigation_Transportation_Method (Navigation_id, Transportation_Method) VALUES ('478', 'bike');
INSERT INTO Navigation_Transportation_Method (Navigation_id, Transportation_Method) VALUES ('261', 'bike');
INSERT INTO Navigation_Transportation_Method (Navigation_id, Transportation_Method) VALUES ('175', 'boat');
INSERT INTO Navigation_Transportation_Method (Navigation_id, Transportation_Method) VALUES ('171', 'bike');
INSERT INTO Navigation_Transportation_Method (Navigation_id, Transportation_Method) VALUES ('276', 'bike');
INSERT INTO Navigation_Transportation_Method (Navigation_id, Transportation_Method) VALUES ('805', 'bus');
INSERT INTO Navigation_Transportation_Method (Navigation_id, Transportation_Method) VALUES ('591', 'bus');
INSERT INTO Navigation_Transportation_Method (Navigation_id, Transportation_Method) VALUES ('991', 'car');
INSERT INTO Navigation_Transportation_Method (Navigation_id, Transportation_Method) VALUES ('635', 'bike');
INSERT INTO Navigation_Transportation_Method (Navigation_id, Transportation_Method) VALUES ('759', 'car');
INSERT INTO Navigation_Transportation_Method (Navigation_id, Transportation_Method) VALUES ('334', 'walking');
INSERT INTO Navigation_Transportation_Method (Navigation_id, Transportation_Method) VALUES ('170', 'walking');
INSERT INTO Navigation_Transportation_Method (Navigation_id, Transportation_Method) VALUES ('141', 'train');
INSERT INTO Navigation_Transportation_Method (Navigation_id, Transportation_Method) VALUES ('115', 'bike');
INSERT INTO Navigation_Transportation_Method (Navigation_id, Transportation_Method) VALUES ('840', 'bus');
INSERT INTO Navigation_Transportation_Method (Navigation_id, Transportation_Method) VALUES ('906', 'car');
INSERT INTO Navigation_Transportation_Method (Navigation_id, Transportation_Method) VALUES ('443', 'walking');
INSERT INTO Navigation_Transportation_Method (Navigation_id, Transportation_Method) VALUES ('891', 'train');
INSERT INTO Navigation_Transportation_Method (Navigation_id, Transportation_Method) VALUES ('679', 'car');
INSERT INTO Navigation_Transportation_Method (Navigation_id, Transportation_Method) VALUES ('117', 'bus');
INSERT INTO Navigation_Transportation_Method (Navigation_id, Transportation_Method) VALUES ('142', 'boat');
INSERT INTO Navigation_Transportation_Method (Navigation_id, Transportation_Method) VALUES ('79', 'bike');
INSERT INTO Navigation_Transportation_Method (Navigation_id, Transportation_Method) VALUES ('894', 'train');
INSERT INTO Navigation_Transportation_Method (Navigation_id, Transportation_Method) VALUES ('672', 'bus');
INSERT INTO Navigation_Transportation_Method (Navigation_id, Transportation_Method) VALUES ('765', 'train');
INSERT INTO Navigation_Transportation_Method (Navigation_id, Transportation_Method) VALUES ('839', 'bike');
INSERT INTO Navigation_Transportation_Method (Navigation_id, Transportation_Method) VALUES ('561', 'car');
INSERT INTO Navigation_Transportation_Method (Navigation_id, Transportation_Method) VALUES ('916', 'walking');
INSERT INTO Navigation_Transportation_Method (Navigation_id, Transportation_Method) VALUES ('867', 'car');
INSERT INTO Navigation_Transportation_Method (Navigation_id, Transportation_Method) VALUES ('741', 'bike');
INSERT INTO Navigation_Transportation_Method (Navigation_id, Transportation_Method) VALUES ('324', 'car');
INSERT INTO Navigation_Transportation_Method (Navigation_id, Transportation_Method) VALUES ('514', 'bus');
INSERT INTO Navigation_Transportation_Method (Navigation_id, Transportation_Method) VALUES ('133', 'train');
INSERT INTO Navigation_Transportation_Method (Navigation_id, Transportation_Method) VALUES ('300', 'bus');
INSERT INTO Navigation_Transportation_Method (Navigation_id, Transportation_Method) VALUES ('696', 'walking');
INSERT INTO Navigation_Transportation_Method (Navigation_id, Transportation_Method) VALUES ('986', 'bike');
INSERT INTO Navigation_Transportation_Method (Navigation_id, Transportation_Method) VALUES ('306', 'bike');
INSERT INTO Navigation_Transportation_Method (Navigation_id, Transportation_Method) VALUES ('434', 'train');
INSERT INTO Navigation_Transportation_Method (Navigation_id, Transportation_Method) VALUES ('575', 'walking');
INSERT INTO Navigation_Transportation_Method (Navigation_id, Transportation_Method) VALUES ('985', 'train');
INSERT INTO Navigation_Transportation_Method (Navigation_id, Transportation_Method) VALUES ('347', 'train');
INSERT INTO Navigation_Transportation_Method (Navigation_id, Transportation_Method) VALUES ('337', 'car');
INSERT INTO Navigation_Transportation_Method (Navigation_id, Transportation_Method) VALUES ('757', 'boat');
INSERT INTO Navigation_Transportation_Method (Navigation_id, Transportation_Method) VALUES ('65', 'car');
INSERT INTO Navigation_Transportation_Method (Navigation_id, Transportation_Method) VALUES ('688', 'car');
INSERT INTO Navigation_Transportation_Method (Navigation_id, Transportation_Method) VALUES ('549', 'bike');
INSERT INTO Navigation_Transportation_Method (Navigation_id, Transportation_Method) VALUES ('286', 'bike');
INSERT INTO Navigation_Transportation_Method (Navigation_id, Transportation_Method) VALUES ('818', 'boat');
INSERT INTO Navigation_Transportation_Method (Navigation_id, Transportation_Method) VALUES ('866', 'boat');
INSERT INTO Navigation_Transportation_Method (Navigation_id, Transportation_Method) VALUES ('628', 'bike');
INSERT INTO Navigation_Transportation_Method (Navigation_id, Transportation_Method) VALUES ('535', 'train');
INSERT INTO Navigation_Transportation_Method (Navigation_id, Transportation_Method) VALUES ('254', 'train');
INSERT INTO Navigation_Transportation_Method (Navigation_id, Transportation_Method) VALUES ('500', 'bus');
INSERT INTO Navigation_Transportation_Method (Navigation_id, Transportation_Method) VALUES ('437', 'train');
INSERT INTO Navigation_Transportation_Method (Navigation_id, Transportation_Method) VALUES ('618', 'boat');
INSERT INTO Navigation_Transportation_Method (Navigation_id, Transportation_Method) VALUES ('823', 'bus');
INSERT INTO Navigation_Transportation_Method (Navigation_id, Transportation_Method) VALUES ('246', 'bike');
INSERT INTO Navigation_Transportation_Method (Navigation_id, Transportation_Method) VALUES ('428', 'walking');
INSERT INTO Navigation_Transportation_Method (Navigation_id, Transportation_Method) VALUES ('124', 'walking');
INSERT INTO Navigation_Transportation_Method (Navigation_id, Transportation_Method) VALUES ('913', 'walking');
INSERT INTO Navigation_Transportation_Method (Navigation_id, Transportation_Method) VALUES ('98', 'train');
INSERT INTO Navigation_Transportation_Method (Navigation_id, Transportation_Method) VALUES ('17', 'train');
INSERT INTO Navigation_Transportation_Method (Navigation_id, Transportation_Method) VALUES ('97', 'bus');
INSERT INTO Navigation_Transportation_Method (Navigation_id, Transportation_Method) VALUES ('168', 'bus');
INSERT INTO Navigation_Transportation_Method (Navigation_id, Transportation_Method) VALUES ('4', 'car');
INSERT INTO Navigation_Transportation_Method (Navigation_id, Transportation_Method) VALUES ('489', 'bus');
INSERT INTO Navigation_Transportation_Method (Navigation_id, Transportation_Method) VALUES ('723', 'train');

-- Bridge Entity
INSERT INTO Attends (activities_id, customerID) VALUES ('222', '917');
INSERT INTO Attends (activities_id, customerID) VALUES ('524', '830');
INSERT INTO Attends (activities_id, customerID) VALUES ('81', '972');
INSERT INTO Attends (activities_id, customerID) VALUES ('194', '411');
INSERT INTO Attends (activities_id, customerID) VALUES ('502', '24');
INSERT INTO Attends (activities_id, customerID) VALUES ('901', '517');
INSERT INTO Attends (activities_id, customerID) VALUES ('636', '606');
INSERT INTO Attends (activities_id, customerID) VALUES ('430', '555');
INSERT INTO Attends (activities_id, customerID) VALUES ('234', '587');
INSERT INTO Attends (activities_id, customerID) VALUES ('756', '486');
INSERT INTO Attends (activities_id, customerID) VALUES ('235', '49');
INSERT INTO Attends (activities_id, customerID) VALUES ('663', '197');
INSERT INTO Attends (activities_id, customerID) VALUES ('675', '474');
INSERT INTO Attends (activities_id, customerID) VALUES ('980', '693');
INSERT INTO Attends (activities_id, customerID) VALUES ('647', '610');
INSERT INTO Attends (activities_id, customerID) VALUES ('565', '457');
INSERT INTO Attends (activities_id, customerID) VALUES ('406', '175');
INSERT INTO Attends (activities_id, customerID) VALUES ('800', '865');
INSERT INTO Attends (activities_id, customerID) VALUES ('472', '527');
INSERT INTO Attends (activities_id, customerID) VALUES ('284', '854');
INSERT INTO Attends (activities_id, customerID) VALUES ('439', '476');
INSERT INTO Attends (activities_id, customerID) VALUES ('13', '116');
INSERT INTO Attends (activities_id, customerID) VALUES ('920', '874');
INSERT INTO Attends (activities_id, customerID) VALUES ('778', '998');
INSERT INTO Attends (activities_id, customerID) VALUES ('764', '961');
INSERT INTO Attends (activities_id, customerID) VALUES ('787', '999');
INSERT INTO Attends (activities_id, customerID) VALUES ('313', '129');
INSERT INTO Attends (activities_id, customerID) VALUES ('323', '433');
INSERT INTO Attends (activities_id, customerID) VALUES ('193', '15');
INSERT INTO Attends (activities_id, customerID) VALUES ('554', '936');
INSERT INTO Attends (activities_id, customerID) VALUES ('101', '605');
INSERT INTO Attends (activities_id, customerID) VALUES ('215', '879');
INSERT INTO Attends (activities_id, customerID) VALUES ('509', '128');
INSERT INTO Attends (activities_id, customerID) VALUES ('181', '0');
INSERT INTO Attends (activities_id, customerID) VALUES ('341', '844');
INSERT INTO Attends (activities_id, customerID) VALUES ('283', '703');
INSERT INTO Attends (activities_id, customerID) VALUES ('145', '897');
INSERT INTO Attends (activities_id, customerID) VALUES ('985', '871');
INSERT INTO Attends (activities_id, customerID) VALUES ('100', '615');
INSERT INTO Attends (activities_id, customerID) VALUES ('130', '759');
INSERT INTO Attends (activities_id, customerID) VALUES ('187', '646');
INSERT INTO Attends (activities_id, customerID) VALUES ('828', '903');
INSERT INTO Attends (activities_id, customerID) VALUES ('760', '315');
INSERT INTO Attends (activities_id, customerID) VALUES ('155', '682');
INSERT INTO Attends (activities_id, customerID) VALUES ('733', '37');
INSERT INTO Attends (activities_id, customerID) VALUES ('486', '421');
INSERT INTO Attends (activities_id, customerID) VALUES ('517', '923');
INSERT INTO Attends (activities_id, customerID) VALUES ('896', '969');
INSERT INTO Attends (activities_id, customerID) VALUES ('139', '671');
INSERT INTO Attends (activities_id, customerID) VALUES ('415', '738');
INSERT INTO Attends (activities_id, customerID) VALUES ('23', '498');
INSERT INTO Attends (activities_id, customerID) VALUES ('734', '144');
INSERT INTO Attends (activities_id, customerID) VALUES ('331', '588');
INSERT INTO Attends (activities_id, customerID) VALUES ('340', '546');
INSERT INTO Attends (activities_id, customerID) VALUES ('9', '701');
INSERT INTO Attends (activities_id, customerID) VALUES ('757', '765');
INSERT INTO Attends (activities_id, customerID) VALUES ('243', '608');
INSERT INTO Attends (activities_id, customerID) VALUES ('659', '30');
INSERT INTO Attends (activities_id, customerID) VALUES ('523', '624');
INSERT INTO Attends (activities_id, customerID) VALUES ('538', '419');
INSERT INTO Attends (activities_id, customerID) VALUES ('555', '699');
INSERT INTO Attends (activities_id, customerID) VALUES ('433', '475');
INSERT INTO Attends (activities_id, customerID) VALUES ('700', '392');
INSERT INTO Attends (activities_id, customerID) VALUES ('135', '511');
INSERT INTO Attends (activities_id, customerID) VALUES ('237', '832');
INSERT INTO Attends (activities_id, customerID) VALUES ('525', '240');
INSERT INTO Attends (activities_id, customerID) VALUES ('399', '962');
INSERT INTO Attends (activities_id, customerID) VALUES ('869', '275');
INSERT INTO Attends (activities_id, customerID) VALUES ('287', '11');
INSERT INTO Attends (activities_id, customerID) VALUES ('481', '707');
INSERT INTO Attends (activities_id, customerID) VALUES ('370', '997');
INSERT INTO Attends (activities_id, customerID) VALUES ('355', '190');
INSERT INTO Attends (activities_id, customerID) VALUES ('913', '412');
INSERT INTO Attends (activities_id, customerID) VALUES ('904', '93');
INSERT INTO Attends (activities_id, customerID) VALUES ('661', '657');

-- Weak Entity
INSERT INTO Customer_Demographics (customerID, type) VALUES ('917', 'Luxury travelers, aged 45 and above, seeking exclusive and personalized services');
INSERT INTO Customer_Demographics (customerID, type) VALUES ('830', 'Food enthusiasts, aged 25-45, interested in culinary experiences and gourmet dining');
INSERT INTO Customer_Demographics (customerID, type) VALUES ('972', 'Single adults aged 30-40, interested in fitness and wellness trends');
INSERT INTO Customer_Demographics (customerID, type) VALUES ('411', 'Cultural explorers, aged 30-55, interested in history, art, and local traditions');
INSERT INTO Customer_Demographics (customerID, type) VALUES ('24', 'Wellness retreat attendees, aged 35-60, seeking relaxation and rejuvenation');
INSERT INTO Customer_Demographics (customerID, type) VALUES ('517', 'Eco-conscious travelers, aged 30-50, seeking sustainable and eco-friendly accommodations');
INSERT INTO Customer_Demographics (customerID, type) VALUES ('606', 'Retirees aged 60 and above, looking for leisurely travel experiences');
INSERT INTO Customer_Demographics (customerID, type) VALUES ('555', 'Families with children, suburban residents seeking convenience and value');
INSERT INTO Customer_Demographics (customerID, type) VALUES ('587', 'Empty nesters, aged 50-65, interested in cultural and educational travel');
INSERT INTO Customer_Demographics (customerID, type) VALUES ('486', 'Retirees aged 60 and above, looking for leisurely travel experiences');
INSERT INTO Customer_Demographics (customerID, type) VALUES ('49', 'Couples in their mid-40s, seeking romantic getaways and fine dining experiences');
INSERT INTO Customer_Demographics (customerID, type) VALUES ('197', 'Couples in their mid-40s, seeking romantic getaways and fine dining experiences');
INSERT INTO Customer_Demographics (customerID, type) VALUES ('474', 'Adventure seekers and thrill enthusiasts, aged 20-30, craving adrenaline-fueled experiences');
INSERT INTO Customer_Demographics (customerID, type) VALUES ('693', 'Couples in their mid-40s, seeking romantic getaways and fine dining experiences');
INSERT INTO Customer_Demographics (customerID, type) VALUES ('610', 'Eco-conscious travelers, aged 30-50, seeking sustainable and eco-friendly accommodations');
INSERT INTO Customer_Demographics (customerID, type) VALUES ('457', 'Young professionals aged 25-35, urban dwellers with disposable income');
INSERT INTO Customer_Demographics (customerID, type) VALUES ('175', 'Business travelers, aged 35-55, seeking comfort and efficiency');
INSERT INTO Customer_Demographics (customerID, type) VALUES ('865', 'Business travelers, aged 35-55, seeking comfort and efficiency');
INSERT INTO Customer_Demographics (customerID, type) VALUES ('527', 'Luxury travelers, aged 45 and above, seeking exclusive and personalized services');
INSERT INTO Customer_Demographics (customerID, type) VALUES ('854', 'Eco-conscious travelers, aged 30-50, seeking sustainable and eco-friendly accommodations');
INSERT INTO Customer_Demographics (customerID, type) VALUES ('476', 'Food enthusiasts, aged 25-45, interested in culinary experiences and gourmet dining');
INSERT INTO Customer_Demographics (customerID, type) VALUES ('116', 'Digital nomads, aged 25-40, interested in remote work and travel experiences');
INSERT INTO Customer_Demographics (customerID, type) VALUES ('874', 'Adventure seekers and thrill enthusiasts, aged 20-30, craving adrenaline-fueled experiences');
INSERT INTO Customer_Demographics (customerID, type) VALUES ('998', 'Young professionals aged 25-35, urban dwellers with disposable income');
INSERT INTO Customer_Demographics (customerID, type) VALUES ('961', 'Cultural explorers, aged 30-55, interested in history, art, and local traditions');
INSERT INTO Customer_Demographics (customerID, type) VALUES ('999', 'Digital nomads, aged 25-40, interested in remote work and travel experiences');
INSERT INTO Customer_Demographics (customerID, type) VALUES ('129', 'Adventure seekers and thrill enthusiasts, aged 20-30, craving adrenaline-fueled experiences');
INSERT INTO Customer_Demographics (customerID, type) VALUES ('433', 'Business travelers, aged 35-55, seeking comfort and efficiency');
INSERT INTO Customer_Demographics (customerID, type) VALUES ('15', 'Digital nomads, aged 25-40, interested in remote work and travel experiences');
INSERT INTO Customer_Demographics (customerID, type) VALUES ('936', 'Eco-conscious travelers, aged 30-50, seeking sustainable and eco-friendly accommodations');
INSERT INTO Customer_Demographics (customerID, type) VALUES ('605', 'Wellness retreat attendees, aged 35-60, seeking relaxation and rejuvenation');
INSERT INTO Customer_Demographics (customerID, type) VALUES ('879', 'Food enthusiasts, aged 25-45, interested in culinary experiences and gourmet dining');
INSERT INTO Customer_Demographics (customerID, type) VALUES ('128', 'Business travelers, aged 35-55, seeking comfort and efficiency');
INSERT INTO Customer_Demographics (customerID, type) VALUES ('0', 'Luxury travelers, aged 45 and above, seeking exclusive and personalized services');
INSERT INTO Customer_Demographics (customerID, type) VALUES ('844', 'Food enthusiasts, aged 25-45, interested in culinary experiences and gourmet dining');
INSERT INTO Customer_Demographics (customerID, type) VALUES ('703', 'Retirees aged 60 and above, looking for leisurely travel experiences');
INSERT INTO Customer_Demographics (customerID, type) VALUES ('897', 'Single adults aged 30-40, interested in fitness and wellness trends');
INSERT INTO Customer_Demographics (customerID, type) VALUES ('871', 'Wellness retreat attendees, aged 35-60, seeking relaxation and rejuvenation');
INSERT INTO Customer_Demographics (customerID, type) VALUES ('615', 'Luxury travelers, aged 45 and above, seeking exclusive and personalized services');
INSERT INTO Customer_Demographics (customerID, type) VALUES ('759', 'Cultural explorers, aged 30-55, interested in history, art, and local traditions');
INSERT INTO Customer_Demographics (customerID, type) VALUES ('646', 'Young professionals aged 25-35, urban dwellers with disposable income');
INSERT INTO Customer_Demographics (customerID, type) VALUES ('903', 'Empty nesters, aged 50-65, interested in cultural and educational travel');
INSERT INTO Customer_Demographics (customerID, type) VALUES ('315', 'Business travelers, aged 35-55, seeking comfort and efficiency');
INSERT INTO Customer_Demographics (customerID, type) VALUES ('682', 'Young professionals aged 25-35, urban dwellers with disposable income');
INSERT INTO Customer_Demographics (customerID, type) VALUES ('37', 'Cultural explorers, aged 30-55, interested in history, art, and local traditions');
INSERT INTO Customer_Demographics (customerID, type) VALUES ('421', 'Couples in their mid-40s, seeking romantic getaways and fine dining experiences');
INSERT INTO Customer_Demographics (customerID, type) VALUES ('923', 'College students and millennials, budget-conscious and tech-savvy');
INSERT INTO Customer_Demographics (customerID, type) VALUES ('969', 'Luxury travelers, aged 45 and above, seeking exclusive and personalized services');
INSERT INTO Customer_Demographics (customerID, type) VALUES ('671', 'Adventure seekers and thrill enthusiasts, aged 20-30, craving adrenaline-fueled experiences');
INSERT INTO Customer_Demographics (customerID, type) VALUES ('738', 'Eco-conscious travelers, aged 30-50, seeking sustainable and eco-friendly accommodations');
INSERT INTO Customer_Demographics (customerID, type) VALUES ('498', 'Luxury travelers, aged 45 and above, seeking exclusive and personalized services');
INSERT INTO Customer_Demographics (customerID, type) VALUES ('144', 'Young professionals aged 25-35, urban dwellers with disposable income');
INSERT INTO Customer_Demographics (customerID, type) VALUES ('588', 'Food enthusiasts, aged 25-45, interested in culinary experiences and gourmet dining');
INSERT INTO Customer_Demographics (customerID, type) VALUES ('546', 'Business travelers, aged 35-55, seeking comfort and efficiency');
INSERT INTO Customer_Demographics (customerID, type) VALUES ('701', 'Couples in their mid-40s, seeking romantic getaways and fine dining experiences');
INSERT INTO Customer_Demographics (customerID, type) VALUES ('765', 'Single adults aged 30-40, interested in fitness and wellness trends');
INSERT INTO Customer_Demographics (customerID, type) VALUES ('608', 'Eco-conscious travelers, aged 30-50, seeking sustainable and eco-friendly accommodations');
INSERT INTO Customer_Demographics (customerID, type) VALUES ('30', 'Digital nomads, aged 25-40, interested in remote work and travel experiences');
INSERT INTO Customer_Demographics (customerID, type) VALUES ('624', 'Empty nesters, aged 50-65, interested in cultural and educational travel');
INSERT INTO Customer_Demographics (customerID, type) VALUES ('419', 'Luxury travelers, aged 45 and above, seeking exclusive and personalized services');
INSERT INTO Customer_Demographics (customerID, type) VALUES ('699', 'College students and millennials, budget-conscious and tech-savvy');
INSERT INTO Customer_Demographics (customerID, type) VALUES ('475', 'Eco-conscious travelers, aged 30-50, seeking sustainable and eco-friendly accommodations');
INSERT INTO Customer_Demographics (customerID, type) VALUES ('392', 'Business travelers, aged 35-55, seeking comfort and efficiency');
INSERT INTO Customer_Demographics (customerID, type) VALUES ('511', 'Retirees aged 60 and above, looking for leisurely travel experiences');
INSERT INTO Customer_Demographics (customerID, type) VALUES ('832', 'Empty nesters, aged 50-65, interested in cultural and educational travel');
INSERT INTO Customer_Demographics (customerID, type) VALUES ('240', 'Retirees aged 60 and above, looking for leisurely travel experiences');
INSERT INTO Customer_Demographics (customerID, type) VALUES ('962', 'Digital nomads, aged 25-40, interested in remote work and travel experiences');
INSERT INTO Customer_Demographics (customerID, type) VALUES ('275', 'Eco-conscious travelers, aged 30-50, seeking sustainable and eco-friendly accommodations');
INSERT INTO Customer_Demographics (customerID, type) VALUES ('11', 'Retirees aged 60 and above, looking for leisurely travel experiences');
INSERT INTO Customer_Demographics (customerID, type) VALUES ('707', 'Young professionals aged 25-35, urban dwellers with disposable income');
INSERT INTO Customer_Demographics (customerID, type) VALUES ('997', 'College students and millennials, budget-conscious and tech-savvy');
INSERT INTO Customer_Demographics (customerID, type) VALUES ('190', 'Wellness retreat attendees, aged 35-60, seeking relaxation and rejuvenation');
INSERT INTO Customer_Demographics (customerID, type) VALUES ('412', 'College students and millennials, budget-conscious and tech-savvy');
INSERT INTO Customer_Demographics (customerID, type) VALUES ('93', 'College students and millennials, budget-conscious and tech-savvy');
INSERT INTO Customer_Demographics (customerID, type) VALUES ('657', 'Retirees aged 60 and above, looking for leisurely travel experiences');

select * from airline