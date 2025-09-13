CREATE TABLE Person (
    driver_id INT PRIMARY KEY,
    name VARCHAR(255),
    address VARCHAR(255)
);

CREATE TABLE CAR (
    regno VARCHAR(255) PRIMARY KEY,
    model VARCHAR(255),
    year INTEGER
);

CREATE TABLE Accident (
    reportno INT PRIMARY KEY,
    accident_date DATE,
    location VARCHAR(255)
);

CREATE TABLE Owns (
    driver_id INT,
    regno VARCHAR(255),
    PRIMARY KEY (driver_id, regno),
    FOREIGN KEY (driver_id) REFERENCES Person(driver_id),
    FOREIGN KEY (regno) REFERENCES Car(regno)
);

CREATE TABLE Participated (
    driver_id INT,
    regno VARCHAR(255),
    reportno INT,
    damage_amt INT,
    PRIMARY KEY (driver_id, regno, reportno),
    FOREIGN KEY (driver_id) REFERENCES Person(driver_id),
    FOREIGN KEY (regno) REFERENCES Car(regno),
    FOREIGN KEY (reportno) REFERENCES Accident(reportno)
);


INSERT INTO Person (driver_id, name, address) VALUES
(0, 'Jenson Button', 'University St'),
(1, 'Ruben Barricello', '1st Ave'),
(2, 'Michael Vettel', '1st Ave'),
(3, 'Mark Webber', '1st Ave'),
(4, 'Lewis Hamilton', '1st Ave'),
(5, 'Felipe Massa', 'University St');



INSERT INTO Car (regno, model, year) VALUES
('SZM813', 'Honda', 2009),
('SZM814', 'Toyota', 2009),
('SZM815', 'BMW', 2009),
('SZM816', 'Honda', 2009),
('SZM817', 'Honda', 2008),
('SZM818', 'BMW', 2008),
('SZM819', 'BMW', 2008),
('SZM820', 'Toyota', 2008);

 
INSERT INTO Accident (reportno, accident_date, location) VALUES
(1, '2008-04-13', 'Monza'),
(2, '2008-07-22', 'Indianapolis'),
(3, '2008-07-22', 'Indianapolis'),
(4, '2008-07-22', 'New York'),
(5, '2008-07-22', 'New York'),
(6, '2009-01-27', 'Highland Heights'),
(7, '2009-02-15', 'Highland Heights');



INSERT INTO Owns (driver_id, regno) VALUES
(0, 'SZM813'),
(1, 'SZM815'),
(2, 'SZM816'),
(3, 'SZM814'),
(4, 'SZM817'),
(5, 'SZM818'),
(0, 'SZM819'),
(4, 'SZM820');



INSERT INTO Participated (reportno, regno, driver_id, damage_amt) VALUES
(1, 'SZM813', 0, 4000),
(2, 'SZM814', 1, 6000),
(3, 'SZM815', 4, 6000),
(4, 'SZM814', 1, 1000),
(5, 'SZM817', 4, 6000),
(6, 'SZM818', 5, 5000),
(7, 'SZM819', 0, 5000),
(4, 'SZM817', 4, 3000),
(5, 'SZM813', 0, 4000),
(6, 'SZM814', 3, 2000),
(7, 'SZM814', 1, 1000),
(7, 'SZM820', 4, 6000),
(7, 'SZM813', 3, 4000);



select * from Person;
select * from car;
select * from owns;
select * from accident;
select * from Participated;



