# Problem - Design a database to manage customer profiles, contact details,addresses, and user logins for an e-commerce platform.

# Solution -

# create command
CREATE DATABASE ecommerce;

use ecommerce;

# Customer table
CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    MiddleName VARCHAR(50),
    LastName VARCHAR(50)
);

# Contact Mechanism table
CREATE TABLE Contactinfo (
    ContactID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    ContactType VARCHAR(50),
    ContactValue VARCHAR(100),
    Purpose VARCHAR(50),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

# Address table
CREATE TABLE Address (
    AddressID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    AddressType VARCHAR(50),
    StreetAddress VARCHAR(255),
    City VARCHAR(100),
    StateProvince VARCHAR(100),
    PostalCode VARCHAR(20),
    Country VARCHAR(100),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

# User Login table
CREATE TABLE UserLogin (
    LoginID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    Username VARCHAR(50),
    PasswordHash VARCHAR(255), 
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

# Security Group table
CREATE TABLE SecurityGroup (
    GroupID INT PRIMARY KEY AUTO_INCREMENT,
    GroupName VARCHAR(50)
);

# Customer_SecurityGroups mapping table
CREATE TABLE Customer_SecurityGroups (
    CustomerID INT,
    GroupID INT,
    PRIMARY KEY (CustomerID, GroupID),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (GroupID) REFERENCES SecurityGroup(GroupID)
);

# Payment Method table
CREATE TABLE PaymentInfo (
    PaymentMethodID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    PaymentType VARCHAR(50),
    CardNumber VARCHAR(50),
    ExpirationDate DATE,
    BillingAddressID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (BillingAddressID) REFERENCES Address(AddressID)
);

# ER DIAGRAM
![ERDiagram](https://github.com/user-attachments/assets/7d82f5b5-9087-4e6a-ba81-b997438b32e4)
