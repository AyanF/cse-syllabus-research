# Problem Statement: Designing a Database for E-Commerce Customer Management

## Objective
Design a database to manage customer profiles, contact details, addresses, and user logins for an e-commerce platform.

## Requirements

1. **Customer Information**
    CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    MiddleName VARCHAR(50),
    LastName VARCHAR(50)
);


2. **Contact Information**
    CREATE TABLE Contactinfo (
    ContactID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    ContactType VARCHAR(50),
    ContactValue VARCHAR(100),
    Purpose VARCHAR(50),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);


3. **Address Information**
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

4. **User Logins**
 CREATE TABLE UserLogin (
    LoginID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    Username VARCHAR(50),
    PasswordHash VARCHAR(255), 
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

5. **Insert security group**
   CREATE TABLE SecurityGroup (
    GroupID INT PRIMARY KEY AUTO_INCREMENT,
    GroupName VARCHAR(50)
);

6. **Map customer to security group**
  CREATE TABLE Customer_SecurityGroups (
    CustomerID INT,
    GroupID INT,
    PRIMARY KEY (CustomerID, GroupID),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (GroupID) REFERENCES SecurityGroup(GroupID)
);
   
8. **Payment Information**
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
