CREATE DATABASE db_ecommerce;
USE db_ecommerce;

-- Creating Clients table
CREATE TABLE Clients (
  ClientID INT PRIMARY KEY AUTO_INCREMENT,
  FName VARCHAR(50),
  MName VARCHAR(50),
  LName VARCHAR(50)
);

-- This table defines Positions with a unique PositionID and PositionName (e.g., "Support Specialist," "Admin").
CREATE TABLE Positions (
  PositionID INT PRIMARY KEY AUTO_INCREMENT,
  PositionName VARCHAR(50)
);

-- Creating ClientPosition table to store various positions for clients
CREATE TABLE ClientPosition (
  ClientPositionID INT PRIMARY KEY AUTO_INCREMENT,
  ClientID INT,
  PositionID INT,
  FOREIGN KEY (ClientID) REFERENCES Clients(ClientID),
  FOREIGN KEY (PositionID) REFERENCES Positions(PositionID)
);

-- Creating ContactInfo Table
CREATE TABLE ContactInfo (
    ContactID INT PRIMARY KEY,
    ClientID INT,
    EmailAddress VARCHAR(100),
    PhoneNumber VARCHAR(20),
    ContactPurpose VARCHAR(50),
    FOREIGN KEY (ClientID) REFERENCES Clients(ClientID)
);

-- Creating Location table
CREATE TABLE Location (
    LocationID INT PRIMARY KEY,
    ClientID INT,
    Street VARCHAR(100),
    CityName VARCHAR(50),
    Province VARCHAR(50),
    ZipCode VARCHAR(20),
    Nation VARCHAR(50),
    LocationPurpose VARCHAR(50),
    FOREIGN KEY (ClientID) REFERENCES Clients(ClientID)
);

-- Creating AccountLogins Table
CREATE TABLE AccountLogins (
    LoginID INT PRIMARY KEY AUTO_INCREMENT,
    ClientID INT,
    UserAlias VARCHAR(50) UNIQUE,
    PasswordHash VARCHAR(100), -- Storing a hashed version of the password
    FOREIGN KEY (ClientID) REFERENCES Clients(ClientID)
);

-- Creating AccessGroups Table
CREATE TABLE AccessGroups (
    GroupID INT PRIMARY KEY AUTO_INCREMENT,
    GroupName VARCHAR(50)
);

-- Creating AccountLoginAccessGroups Table
CREATE TABLE AccountLoginAccessGroups (
    LoginID INT,
    GroupID INT,
    PRIMARY KEY (LoginID, GroupID),
    FOREIGN KEY (LoginID) REFERENCES AccountLogins(LoginID),
    FOREIGN KEY (GroupID) REFERENCES AccessGroups(GroupID)
);

-- Creating Transactions Table
CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY,
    ClientID INT,
    CardNumber VARCHAR(20),
    CardExpiry DATE,
    BillingAddr VARCHAR(100),
    FOREIGN KEY (ClientID) REFERENCES Clients(ClientID)
);
