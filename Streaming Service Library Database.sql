--////DATABASE DESIGN (DDL)////
--///TASK 1: DATABASE///
--Creating the StreamingServiceLibrary database.
CREATE DATABASE StreamingServiceLibrary;

--------------------------------------------------------------------------------------------------------------------
--//TABLES//
--Creating the Role table.
CREATE TABLE Role (
    RoleID INT,
	Name VARCHAR(50),
	Role VARCHAR(50),
	Username VARCHAR(50),
	Login VARCHAR(50),
	Password VARCHAR(50)
);


--------------------------------------------------------------------------------------------------------------------
--Creating the Platform table.
CREATE TABLE Platform (
    PlatformKey INT,
	PlatformName VARCHAR(50),
	Website VARCHAR(50)
);


--------------------------------------------------------------------------------------------------------------------
--Creating the Movie table.
CREATE TABLE Movie (
    MovieID INT,
	PlatformKey INT,
	Title VARCHAR(150),
	Director VARCHAR(50),
	Cast VARCHAR(300),
	Country VARCHAR(300),
	ReleaseYear INT,
	Rating VARCHAR(10),
	Duration_in_minutes INT
);


--------------------------------------------------------------------------------------------------------------------
--Creating the TvSeries table.
CREATE TABLE TvSeries (
    SeriesID INT,
	PlatformKey INT,
	Title VARCHAR(150),
	Creator VARCHAR(50),
	Cast VARCHAR(800),
	Country VARCHAR(300),
	ReleaseYear INT,
	Rating VARCHAR(10),
	Season INT
);


--------------------------------------------------------------------------------------------------------------------
--Creating AmazonPrimeVideo table.
CREATE TABLE AmazonPrimeVideo (
    AmazonID INT,
	PlatformKey INT,
	DateAdded DATE,
	Genre VARCHAR(100),
	Description VARCHAR(1000)
);


--------------------------------------------------------------------------------------------------------------------
--Creating DisneyPlus table.
CREATE TABLE DisneyPlus (
    DisneyID INT,
	PlatformKey INT,
	DateAdded DATE,
	Genre VARCHAR(100),
	Description VARCHAR(1000)
);


--------------------------------------------------------------------------------------------------------------------
--Creating Hulu table.
CREATE TABLE Hulu (
    HuluID INT,
	PlatformKey INT,
	DateAdded DATE,
	Genre VARCHAR(100),
	Description VARCHAR(1200)
);


--------------------------------------------------------------------------------------------------------------------
--Creating Netflix table.
CREATE TABLE Netflix (
    NetflixID INT,
	PlatformKey INT,
	DateAdded DATE,
	Genre VARCHAR(100),
	Description VARCHAR(1000)
);


--------------------------------------------------------------------------------------------------------------------
--///SCHEMA///
--Create a SCHEMA.
CREATE SCHEMA admin;
CREATE SCHEMA content;
CREATE SCHEMA service;

--Modify the dbo SCHEMA into content for Role.
ALTER SCHEMA admin TRANSFER dbo.Role;

--Modify the dbo SCHEMA into content for Movie.
ALTER SCHEMA service TRANSFER dbo.Platform;

--Modify the dbo SCHEMA into content for Movie.
ALTER SCHEMA content TRANSFER dbo.Movie;

--Modify the dbo SCHEMA into service for TvSeries.
ALTER SCHEMA content TRANSFER dbo.TvSeries;

--Modify the dbo SCHEMA into service for AmazonPrimeVideo.
ALTER SCHEMA service TRANSFER dbo.AmazonPrimeVideo;

--Modify the dbo SCHEMA into service for DisneyPlus.
ALTER SCHEMA service TRANSFER dbo.DisneyPlus;

--Modify the dbo SCHEMA into sservice for Hulu.
ALTER SCHEMA service TRANSFER dbo.Hulu;

--Modify the dbo SCHEMA into service for Netflix.
ALTER SCHEMA service TRANSFER dbo.Netflix;


--------------------------------------------------------------------------------------------------------------------
--///TASK 2: SPECIFY KEYS AND CONSTRAINTS///
--//Role Table//
--Modify column to disallow NULL values.
ALTER TABLE admin.Role
ALTER COLUMN RoleID INT NOT NULL;

ALTER TABLE admin.Role
ALTER COLUMN Name VARCHAR(50) NOT NULL;

ALTER TABLE admin.Role
ALTER COLUMN Username VARCHAR(50) NOT NULL;

ALTER TABLE admin.Role
ALTER COLUMN Login VARCHAR(50) NOT NULL;

ALTER TABLE admin.Role
ALTER COLUMN Password VARCHAR(50) NOT NULL;

--Adding PRIMARY KEY CONSTRAINT.
ALTER TABLE admin.Role
ADD CONSTRAINT PK_Role_RoleID PRIMARY KEY (RoleID);

--Adding UNIQUE CONSTRAINTS.
ALTER TABLE admin.Role
ADD CONSTRAINT UC_RoleID UNIQUE (RoleID);


--------------------------------------------------------------------------------------------------------------------
--//Platform Table//
--Modify column to disallow NULL values.
ALTER TABLE service.Platform
ALTER COLUMN PlatformKey INT NOT NULL;

ALTER TABLE service.Platform
ALTER COLUMN PlatformName VARCHAR(50) NOT NULL;

--Adding PRIMARY KEY CONSTRAINT.
ALTER TABLE service.Platform
ADD CONSTRAINT PK_Platform_PlatformKey PRIMARY KEY (PlatformKey);

--Adding UNIQUE CONSTRAINTS.
ALTER TABLE service.Platform
ADD CONSTRAINT UC_PlatformKey UNIQUE (PlatformKey);


--------------------------------------------------------------------------------------------------------------------
--//Movie Table//
--Modify column to disallow NULL values.
ALTER TABLE content.Movie
ALTER COLUMN MovieID INT NOT NULL;

ALTER TABLE content.Movie
ALTER COLUMN Title VARCHAR(150) NOT NULL;

ALTER TABLE content.Movie
ALTER COLUMN PlatformKey INT NOT NULL;

--Adding PRIMARY KEY CONSTRAINT.
ALTER TABLE content.Movie
ADD CONSTRAINT PK_Movie_MovieID PRIMARY KEY (MovieID);

--Adding FOREIGN KEY CONSTRAINT.
ALTER TABLE content.Movie
ADD CONSTRAINT FK_Movie_Platform FOREIGN KEY (PlatformKey) 
REFERENCES service.Platform(PlatformKey);

--Adding UNIQUE CONSTRAINTS.
ALTER TABLE content.Movie
ADD CONSTRAINT UC_Movie_MovieID UNIQUE (MovieID);

ALTER Table content.Movie
ADD CONSTRAINT UC_Movie_PlatformKey UNIQUE (PlatformKey);


--------------------------------------------------------------------------------------------------------------------
--//TvSeries Table//
--Modify column to disallow NULL values.
ALTER TABLE content.TvSeries
ALTER COLUMN SeriesID INT NOT NULL;

ALTER TABLE content.TvSeries
ALTER COLUMN Title VARCHAR(150) NOT NULL;

ALTER TABLE content.TvSeries
ALTER COLUMN PlatformKey INT NOT NULL;

--Adding PRIMARY KEY CONSTRAINT.
ALTER TABLE content.TvSeries
ADD CONSTRAINT PK_TvSeries_SeriesID PRIMARY KEY (SeriesID);

--Adding FOREIGN KEY CONSTRAINT.
ALTER TABLE content.TvSeries
ADD CONSTRAINT FK_TvSeries_Platform FOREIGN KEY (PlatformKey) 
REFERENCES service.Platform(PlatformKey);

--Adding UNIQUE CONSTRAINTS.
ALTER TABLE content.TvSeries
ADD CONSTRAINT UC_TvSeries_SeriesID UNIQUE (SeriesID);

ALTER Table content.TvSeries
ADD CONSTRAINT UC_TvSeries_PlatformKey UNIQUE (PlatformKey);


--------------------------------------------------------------------------------------------------------------------
--//AmazonPrimeVideo Table//
--Modify AmazonID to disallow NULL values.
ALTER TABLE service.AmazonPrimeVideo
ALTER COLUMN AmazonID INT NOT NULL;

ALTER TABLE service.AmazonPrimeVideo
ALTER COLUMN Platformkey INT NOT NULL;

ALTER TABLE service.AmazonPrimeVideo
ALTER COLUMN DateAdded DATE NOT NULL;

--Adding PRIMARY KEY CONSTRAINT.
ALTER TABLE service.AmazonPrimeVideo
ADD CONSTRAINT PK_AmazonPrimeVideo_AmazonID PRIMARY KEY (AmazonID);

--Adding FOREIGN KEY CONSTRAINT.
ALTER TABLE service.AmazonPrimeVideo
ADD CONSTRAINT FK_AmazonPrimeVideo_Platform FOREIGN KEY (PlatformKey) 
REFERENCES service.Platform(PlatformKey);

--Adding UNIQUE CONSTRAINTS.
ALTER TABLE service.AmazonPrimeVideo
ADD CONSTRAINT UC_AmazonPrimeVideo_AmazonID UNIQUE (AmazonID);

ALTER Table service.AmazonPrimeVideo
ADD CONSTRAINT UC_AmazonPrimeVideo_PlatformKey UNIQUE (PlatformKey);


--------------------------------------------------------------------------------------------------------------------
--//DisneyPlus Table//
--Modify DisneyID to disallow NULL values.
ALTER TABLE service.DisneyPlus
ALTER COLUMN DisneyID INT NOT NULL;

ALTER TABLE service.DisneyPlus
ALTER COLUMN PlatformKey INT NOT NULL;

ALTER TABLE service.DisneyPlus
ALTER COLUMN DateAdded DATE NOT NULL;

--Adding PRIMARY KEY CONSTRAINT.
ALTER TABLE service.DisneyPlus
ADD CONSTRAINT PK_DisneyPlus_DisneyID PRIMARY KEY (DisneyID);

--Adding FOREIGN KEY CONSTRAINT.
ALTER TABLE service.DisneyPlus
ADD CONSTRAINT FK_DisneyPlus_Platform FOREIGN KEY (PlatformKey) 
REFERENCES service.Platform(PlatformKey);

--Adding UNIQUE CONSTRAINTS.
ALTER TABLE service.DisneyPlus
ADD CONSTRAINT UC_DisneyPlus_DisneyID UNIQUE (DisneyID);

ALTER Table service.DisneyPlus
ADD CONSTRAINT UC_DisneyPlus_PlatformKey UNIQUE (PlatformKey);


--------------------------------------------------------------------------------------------------------------------
--//Hulu Table//
--Modify HuluID to disallow NULL values.
ALTER TABLE service.Hulu
ALTER COLUMN HuluID INT NOT NULL;

ALTER TABLE service.Hulu
ALTER COLUMN PlatformKey INT NOT NULL;

ALTER TABLE service.Hulu
ALTER COLUMN DateAdded DATE NOT NULL;

--Adding PRIMARY KEY CONSTRAINT.
ALTER TABLE service.Hulu
ADD CONSTRAINT PK_Hulu_HuluID PRIMARY KEY (HuluID);

--Adding FOREIGN KEY CONSTRAINT.
ALTER TABLE service.Hulu
ADD CONSTRAINT FK_Hulu_Platform FOREIGN KEY (PlatformKey) 
REFERENCES service.Platform(PlatformKey);

--Adding UNIQUE CONSTRAINTS.
ALTER TABLE service.Hulu
ADD CONSTRAINT UC_Hulu_HuluID UNIQUE (HuluID);

ALTER Table service.Hulu
ADD CONSTRAINT UC_Hulu_PlatformKey UNIQUE (PlatformKey);


--------------------------------------------------------------------------------------------------------------------
--//Netflix Table//
--Modify NetflixID to disallow NULL values.
ALTER TABLE service.Netflix
ALTER COLUMN NetflixID INT NOT NULL;

ALTER TABLE service.Netflix
ALTER COLUMN PlatformKey INT NOT NULL;

ALTER TABLE service.Netflix
ALTER COLUMN DateAdded DATE NOT NULL;

--Adding PRIMARY KEY CONSTRAINT.
ALTER TABLE service.Netflix
ADD CONSTRAINT PK_Netflix_NetflixID PRIMARY KEY (NetflixID);

--Adding FOREIGN KEY CONSTRAINT.
ALTER TABLE service.Netflix
ADD CONSTRAINT FK_Netflix_Platform FOREIGN KEY (PlatformKey) 
REFERENCES service.Platform(PlatformKey);

--Adding UNIQUE CONSTRAINTS.
ALTER TABLE service.Netflix
ADD CONSTRAINT UC_Netflix_NetflixID UNIQUE (NetflixID);

ALTER Table service.Netflix
ADD CONSTRAINT UC_Netflix_PlatformKey UNIQUE (PlatformKey);