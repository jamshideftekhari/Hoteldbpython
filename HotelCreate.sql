create database hoteldb;

use hoteldb;

create table Hotel(
 Hotel_No int not null,
 Hotel_Name varchar(50) not null, 
 Hotel_Address varchar(100) not null,
 primary key (Hotel_No) 
);

CREATE TABLE Room(
	 Room_No   int    NOT NULL,
     Hotel_No  int    NOT NULL,
     Types     CHAR(1)   DEFAULT 'S',
     Price     FLOAT,
	CONSTRAINT checkType 
	CHECK (Types IN ('D','F','S') OR Types IS NULL),
	CONSTRAINT checkPrice 
	CHECK (price BETWEEN 0 AND 9999),

	FOREIGN KEY (Hotel_No) REFERENCES Hotel (Hotel_No)
	ON UPDATE CASCADE ON DELETE NO ACTION,
	Primary KEY (Room_No, Hotel_No)
);

CREATE TABLE Guest (
     Guest_No  int  NOT NULL PRIMARY KEY,
     Guest_Name      VARCHAR(30)      NOT NULL,
     Address   VARCHAR(50)   NOT NULL
);

CREATE TABLE Booking(
     Booking_id int NOT NULL auto_increment primary KEY,
	 Hotel_No  int   NOT NULL,
     Guest_No  int   NOT NULL,
     Date_From DATE  NOT NULL,
     Date_To   DATE  NOT NULL,
     Room_No   int   NOT NULL,
     FOREIGN KEY(Guest_No) REFERENCES Guest(Guest_No),
	 FOREIGN KEY(Room_No, Hotel_No) REFERENCES Room(Room_No, Hotel_No)
);

ALTER TABLE Booking 
	ADD CONSTRAINT incorrect_dates
       CHECK ((Date_To > Date_From) AND (Date_From >= '2022-01-01'));

-- INSERT INTO hotels   VALUES (1,'The Pope','Vaticanstreet 1  1111 Bishopcity');
-- INSERT INTO hotels   VALUES (2,'Lucky Star','Lucky Road 12  2222 Hometown');
-- INSERT INTO hotels   VALUES (3,'Discount','Inexpensive Road 7 3333 Cheaptown');


-- drop table hotels;