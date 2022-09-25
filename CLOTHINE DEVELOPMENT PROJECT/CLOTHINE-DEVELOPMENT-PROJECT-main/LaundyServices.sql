--create database--
Create database Laundry;

--Customer Entity--
Create Table Customers(
	Cust_ID int identity(1,1) primary key not null,
	Cust_Name varchar(50) not null,
	Cust_Email varchar(max) not null,
	Cust_Cellphone BIGINT not null,
	Cust_passw varchar(max) not null
);

--HouseCall Entity--
create table HouseCall (
	House_ID int identity(1,1) primary key not null,
	Cust_ID int not null
	foreign key references Customers(Cust_ID),
	Yes_option bit null,
	No_option bit null
);
--Bookings Entity--
create table Bookings (
	Book_ID int identity(1,1) primary key not null,
	Cust_ID int not null
	foreign key references Customers(Cust_ID),
	House_ID int not null
	foreign key references HouseCall(House_ID),
	Address1 varchar(200) not null,
	Address2 varchar(200) not null,
	Address3 varchar(200) null,
	City varchar(200) not null,
	Postal_Code int not null
);
--Services Entity--
create table Services (
	Service_ID varchar(50) primary key not null,
	Cust_ID int not null
	foreign key references Customers(Cust_ID),
	Clothes bit,
	Clothes_num int,
	Tekkie bit,
	Tekkie_num int,
	Blankets bit,
	Blankets_num int,
	Curtains bit,
	Curtains_num int,
	Total_Amount int
);
--Delivery Entity--
create table Delivery (
	Delivery_ID int identity(1,1) primary key not null,
	Cust_ID int not null
	foreign key references Customers(Cust_ID),
	Service_ID varchar(50) not null
	foreign key references Services(Service_ID),
	Collect bit null,
	Delivery bit null
);
--Delivery_Address Entity--
create table Delivery_Address (
	Delivery_ID int not null
	Constraint PK_Delivery primary key (Delivery_ID) references Delivery(Delivery_ID),
	Constraint FK_Delivery foreign key (Delivery_ID) references Delivery(Delivery_ID),
	Address1 varchar(200) not null,
	Address2 varchar(200) not null,
	Address3 varchar(200) null,
	City varchar(200) not null,
	Postal_Code int not null,
	Collector_Fname varchar(50),
	Collector_Lname varchar(50),
	Collector_Cellphone BIGINT not null,
	Killometers int not null
);

--Payment Entity--
create table Payment (
	Payment_ID int identity(1,1) primary key not null,
	Cust_ID int not null
	foreign key references Customers(Cust_ID),
	Service_ID varchar(50) not null
	foreign key references Services(Service_ID),
	Delivery_ID int not null,
	Constraint FK_Delivery1 foreign key (Delivery_ID) references Delivery(Delivery_ID),
	Cash_on_Delivery bit null,
	Card_on_Delivery bit null,
);

--Show tables in the database
Select * from information_schema.tables;

--show Attributes data
Select * from information_schema.COLUMNS;

--Show Constraints(Keys) of all columns
select * from INFORMATION_SCHEMA.KEY_COLUMN_USAGE;

--Show Referential Constraints(FK) of all columns
select * from INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS;

--Add attribute to Delivery_Address table-------
ALTER TABLE Delivery_Address 
ADD Amount smallmoney;

------Add attribute to Payment table-----
ALTER TABLE Payment
ADD Amount smallmoney;


----delete row from customer with Customer ID greater than 265753------
delete from Customers where Cust_ID > 265753;

------Add attribute to Bookings table-----
ALTER TABLE Bookings ADD Booking_Date datetime;

------Create Output Table-------
Create Table Output(
	ORDER_ID INT PRIMARY KEY NOT NULL,
	Cust_ID int,
	Constraint Fk_custome foreign key (Cust_ID) References Customers(Cust_ID)
);

-------
ALTER TABLE Merchant_Pending_Functions 
Modify NumberOfLocations NULL;


delete from Bookings where Book_ID > 185228;

------Drop column--------
Alter Table Delivery_Address Drop column Killometers;

----drop table and recreate it again-------
DROP TABLE Delivery_Address;
Create table Delivery_Address(

	Delivery_ID int not null,
	CONSTRAINT PK_ID PRIMARY KEY (Delivery_ID),
	CONSTRAINT FK_ID FOREIGN KEY (Delivery_ID)
    REFERENCES Delivery(Delivery_ID),
	Address1 varchar(100) not null,
	Address2 varchar(100) not null,
	Address3 varchar(100),
	City varchar not null,
	Postal_Code int not null,
	Collector_Fname varchar(50) not null,
	Collector_Lname varchar(50) not null,
	Collector_Cellphone char(10) not null,
	Amount smallmoney not null
);


-----change datatype of column Total_Amount------
ALTER TABLE services
alter column Total_Amount decimal(19,3);


ALTER TABLE Delivery_Address
alter column Amount int;


ALTER TABLE Delivery_Address
Add City varchar(100);