# Problem Statement: Designing a Database for E-Commerce Customer Management

## Objective
To Design a database to manage customer profiles, contact details, addresses, and user logins for an e-commerce platform.

## Solution

1. **Customer Information**
    - Each customer has a unique identifier.
    - A customer can have a first name, middle name, and last name.
    - A customer can have multiple roles (e.g., Customer).
    ```
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
     ```

2. **Contact Information**
    - A customer can have multiple contact mechanisms, including email addresses and phone numbers.
    - Contact mechanisms should store information like email addresses and phone numbers with associated purposes (e.g., billing, shipping).
    ```
    -- Creating Contact Table
    CREATE TABLE Contact (
        ContactID INT PRIMARY KEY,
        CustomerID INT,
        Email VARCHAR(100),
        Phone VARCHAR(20),
        Purpose VARCHAR(50),
        FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
    );
    ```

3. **Address Information**
    - A customer can have multiple addresses.
    - Addresses should include details such as street address, city, state/province, postal code, and country.
    - Addresses can have different purposes (e.g., billing, shipping, general correspondence).
    ```
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
    ```

4. **User Logins**
    - Each customer can have one or more user logins.
    - User logins should include a username and password.
    - Each user login can be associated with one or more security groups that determine access rights to different parts of the system.
    ```
    -- Creating UserLogin Table

    CREATE TABLE UserLogin (
        LoginID INT PRIMARY KEY,
        CustomerID INT,
        Username VARCHAR(50),
        Password VARCHAR(50),
        SecurityGroup VARCHAR(50),
        FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
    );
    ```

5. **Payment Information**
    - A customer can have multiple payment methods, including credit cards.
    - Payment information should include details such as credit card number, expiration date, and billing address.
    ```
    -- Creating Payment Table

    CREATE TABLE Payment (
        PaymentID INT PRIMARY KEY,
        CustomerID INT,
        CreditCardNumber VARCHAR(20),
        ExpirationDate DATE,
        BillingAddress VARCHAR(100),
        FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
    );
    ```

## Deliverables

 **ER Diagram**
    - Created an Entity-Relationship (ER) diagram to represent the tables and relationships.
  
  ![](/TASK%20-%201/ER%20DIAGRAM.png)
