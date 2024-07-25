CREATE DATABASE ecommerceDATABASE;
USE ecommerceDATABASE;

-- Creating Customer table 
CREATE TABLE Customer (
  CustomerID INT PRIMARY KEY AUTO_INCREMENT,
  FirstName VARCHAR(50),
  MiddleName VARCHAR(50),
  LastName VARCHAR(50)
);

-- This table defines the Role with a unique RoleID and a RoleName (e.g., "Customer Service Representative," "Administrator").
CREATE TABLE Role (
  RoleID INT PRIMARY KEY AUTO_INCREMENT,
  RoleName VARCHAR(50)
);

--  Creating CustomerRole table to store different roles for customer
CREATE TABLE CustomerRole (
  CustomerRoleID INT PRIMARY KEY AUTO_INCREMENT,
  CustomerID INT,
  RoleID INT,
  FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
  FOREIGN KEY (RoleID) REFERENCES Role(RoleID)
);



-- Creating Contact Table
CREATE TABLE Contact (
    ContactID INT PRIMARY KEY,
    CustomerID INT,
    Email VARCHAR(100),
    Phone VARCHAR(20),
    Purpose VARCHAR(50),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

-- Creating Adress table

CREATE TABLE Address (
    AddressID INT PRIMARY KEY,
    CustomerID INT,
    StreetAddress VARCHAR(100),
    City VARCHAR(50),
    StateProvince VARCHAR(50),
    PostalCode VARCHAR(20),
    Country VARCHAR(50),
    Purpose VARCHAR(50),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

-- Creating UserLogin Table

CREATE TABLE UserLogin (
    LoginID INT PRIMARY KEY,
    CustomerID INT,
    Username VARCHAR(50),
    Password VARCHAR(50),
    SecurityGroup VARCHAR(50),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

-- Creating Payment Table

CREATE TABLE Payment (
    PaymentID INT PRIMARY KEY,
    CustomerID INT,
    CreditCardNumber VARCHAR(20),
    ExpirationDate DATE,
    BillingAddress VARCHAR(100),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

USE ecommerceDATABASE;

-- CREATING A NEW CUSTOMER
INSERT INTO Customer (FirstName, MiddleName, LastName) 
VALUES ('Mark', '', 'Tailor');
 
 
 -- ASSIGNNING ROLE
INSERT INTO CustomerRole (CustomerID, RoleID) 
VALUES ((SELECT CustomerID FROM Customer WHERE FirstName='Mark' AND LastName='Tailor'), 
        (SELECT RoleID FROM Role WHERE RoleName='Customer'));
        
-- UPDATING THE NAME

UPDATE Customer 
SET MiddleName='K' 
WHERE FirstName='Mark' AND LastName='Tailor';

-- ALTERING THE CONTACT TABLE FOR AUTO INCREMENT

ALTER TABLE Contact 
MODIFY ContactID INT AUTO_INCREMENT;


-- ADDING CONTACT INFORMATION

INSERT INTO Contact (CustomerID, Email, Purpose) 
VALUES ((SELECT CustomerID FROM Customer WHERE FirstName='Mark' AND LastName='Tailor'), 
        'mark.tailor@example.com', 'Primary Email');

-- ADDING A BILLING PHONE NUMBER 

INSERT INTO Contact (CustomerID, Phone, Purpose) 
VALUES ((SELECT CustomerID FROM Customer WHERE FirstName='Mark' AND LastName='Tailor'), 
        '123-456-7890', 'Billing Phone');
        
-- ADDING A SHIPPING PHONE NUMBER

INSERT INTO Contact (CustomerID, Phone, Purpose) 
VALUES ((SELECT CustomerID FROM Customer WHERE FirstName='Mark' AND LastName='Tailor'), 
        '098-765-4321', 'Shipping Number');
        
-- ALTERING THE ADRESS TABLE FOR AUTO INCREMENT

ALTER TABLE Address 
MODIFY AddressID INT AUTO_INCREMENT;

        
-- ADDING A SHIPPING ADDRESS

INSERT INTO Address (CustomerID, StreetAddress, City, StateProvince, PostalCode, Country, Purpose) 
VALUES ((SELECT CustomerID FROM Customer WHERE FirstName='Mark' AND LastName='Tailor'), 
        '123 Elm St', 'Springfield', 'IL', '62704', 'USA', 'Shipping');

-- ADDING A BILLING ADDRESS

INSERT INTO Address (CustomerID, StreetAddress, City, StateProvince, PostalCode, Country, Purpose) 
VALUES ((SELECT CustomerID FROM Customer WHERE FirstName='Mark' AND LastName='Tailor'), 
        '123 Elm St', 'Springfield', 'IL', '62704', 'USA', 'Billing');
        
-- CHANGING THE PURPOSE TO General correspondence

UPDATE Address 
SET Purpose='General correspondence' 
WHERE CustomerID=(SELECT CustomerID FROM Customer WHERE FirstName='Mark' AND LastName='Tailor') 
  AND Purpose='Billing';

-- Delete the current email address and add a new one

DELETE FROM Contact 
WHERE CustomerID=(SELECT CustomerID FROM Customer WHERE FirstName='Mark' AND LastName='Tailor') 
  AND Purpose='Primary Email';
  
INSERT INTO Contact (CustomerID, Email, Purpose) 
VALUES ((SELECT CustomerID FROM Customer WHERE FirstName='Mark' AND LastName='Tailor'), 
        'new.email@rediffmail.com', 'Main Email');
        
-- Delete the current billing address and add a new one:

DELETE FROM Address 
WHERE CustomerID=(SELECT CustomerID FROM Customer WHERE FirstName='Mark' AND LastName='Tailor') 
  AND Purpose='General correspondence';
  
INSERT INTO Address (CustomerID, StreetAddress, City, StateProvince, PostalCode, Country, Purpose) 
VALUES ((SELECT CustomerID FROM Customer WHERE FirstName='Mark' AND LastName='Tailor'), 
        '456', 'arizona', 'IL', '62705', 'USA', 'General correspondence');
        
-- Delete the current shipping address and add a new one:

DELETE FROM Address 
WHERE CustomerID=(SELECT CustomerID FROM Customer WHERE FirstName='Mark' AND LastName='Tailor') 
  AND Purpose='Shipping';
  
INSERT INTO Address (CustomerID, StreetAddress, City, StateProvince, PostalCode, Country, Purpose) 
VALUES ((SELECT CustomerID FROM Customer WHERE FirstName='Mark' AND LastName='Tailor'), 
        '456 boulevard st.', '', 'IL', '62706', 'USA', 'Shipping');
        
-- Activity 2 :

-- Create a new customer named John Hays

INSERT INTO Customer (FirstName, MiddleName, LastName) 
VALUES ('John', '', 'Hays');

-- Assign the Customer role to John Hays

INSERT INTO CustomerRole (CustomerID, RoleID) 
VALUES ((SELECT CustomerID FROM Customer WHERE FirstName='John' AND LastName='Hays'), 
        (SELECT RoleID FROM Role WHERE RoleName='Customer'));

-- Change John Hays' name to John B Hays

UPDATE Customer 
SET MiddleName='B' 
WHERE FirstName='John' AND LastName='Hays';

-- Add an email address to John Hays' profile

INSERT INTO Contact (CustomerID, Email, Purpose) 
VALUES ((SELECT CustomerID FROM Customer WHERE FirstName='John' AND LastName='Hays'), 
        'john.hays@example.com', 'Primary Email');
        
-- Add a billing phone number to his profile

INSERT INTO Contact (CustomerID, Phone, Purpose) 
VALUES ((SELECT CustomerID FROM Customer WHERE FirstName='John' AND LastName='Hays'), 
        '321-654-0987', 'Billing Phone');
        
-- Add a shipping phone number to his profile

INSERT INTO Contact (CustomerID, Phone, Purpose) 
VALUES ((SELECT CustomerID FROM Customer WHERE FirstName='John' AND LastName='Hays'), 
        '789-012-3456', 'Shipping Phone');
        
-- Add a shipping address to his profile

INSERT INTO Address (CustomerID, StreetAddress, City, StateProvince, PostalCode, Country, Purpose) 
VALUES ((SELECT CustomerID FROM Customer WHERE FirstName='John' AND LastName='Hays'), 
        '456 Maple St', 'Springfield', 'IL', '62701', 'USA', 'Shipping');
        
-- Add a billing address to his profile and Make the billing and shipping addresses the same

INSERT INTO Address (CustomerID, StreetAddress, City, StateProvince, PostalCode, Country, Purpose) 
VALUES ((SELECT CustomerID FROM Customer WHERE FirstName='John' AND LastName='Hays'), 
        '456 Maple St', 'Springfield', 'IL', '62701', 'USA', 'Billing');
        
-- Change the purpose of the billing address to General correspondence

UPDATE Address 
SET Purpose='General correspondence' 
WHERE CustomerID=(SELECT CustomerID FROM Customer WHERE FirstName='John' AND LastName='Hays') 
  AND Purpose='Billing';
  
-- ALTERING THE ADRESS TABLE FOR AUTO INCREMENT

ALTER TABLE Payment 
MODIFY PaymentID INT AUTO_INCREMENT;

  
-- Create a credit card record for John Hays

INSERT INTO Payment (CustomerID, CreditCardNumber, ExpirationDate, BillingAddress) 
VALUES ((SELECT CustomerID FROM Customer WHERE FirstName='John' AND LastName='Hays'), 
        '4111111111111111', '2025-12-31', '456 Maple St, Springfield, IL, 62701, USA');
        
-- ALTERING THE ADRESS TABLE FOR AUTO INCREMENT

ALTER TABLE UserLogin 
MODIFY LoginID INT AUTO_INCREMENT;


-- Add a user login for John Hays

INSERT INTO UserLogin (CustomerID, Username, Password, SecurityGroup) 
VALUES ((SELECT CustomerID FROM Customer WHERE FirstName='John' AND LastName='Hays'), 
        'john.hays', 'password123', 'Customer Management');
        
-- Verify access for John Hays to the customer management application

SELECT * FROM UserLogin 
WHERE CustomerID=(SELECT CustomerID FROM Customer WHERE FirstName='John' AND LastName='Hays') 
  AND SecurityGroup='Customer Management';
  
-- Delete the current email address and add a new one

DELETE FROM Contact 
WHERE CustomerID=(SELECT CustomerID FROM Customer WHERE FirstName='John' AND LastName='Hays') 
  AND Purpose='Primary Email';
  
INSERT INTO Contact (CustomerID, Email, Purpose) 
VALUES ((SELECT CustomerID FROM Customer WHERE FirstName='John' AND LastName='Hays'), 
        'new.john.hays@example.com', 'Primary Email');
        
-- Delete the current billing address and add a new one

DELETE FROM Address 
WHERE CustomerID=(SELECT CustomerID FROM Customer WHERE FirstName='John' AND LastName='Hays') 
  AND Purpose='General correspondence';
  
INSERT INTO Address (CustomerID, StreetAddress, City, StateProvince, PostalCode, Country, Purpose) 
VALUES ((SELECT CustomerID FROM Customer WHERE FirstName='John' AND LastName='Hays'), 
        '789 Birch St', 'Springfield', 'IL', '62702', 'USA', 'General correspondence');
        
-- Delete the current shipping address and add a new one:

DELETE FROM Address 
WHERE CustomerID=(SELECT CustomerID FROM Customer WHERE FirstName='John' AND LastName='Hays') 
  AND Purpose='Shipping';
  
INSERT INTO Address (CustomerID, StreetAddress, City, StateProvince, PostalCode, Country, Purpose) 
VALUES ((SELECT CustomerID FROM Customer WHERE FirstName='John' AND LastName='Hays'), 
        '1010 Pine St', 'Springfield', 'IL', '62703', 'USA', 'Shipping');
        
