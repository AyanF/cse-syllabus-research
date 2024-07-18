# Problem Statement: Designing a Database for E-Commerce Customer Management


## Solution

1. **Customer Information**
    
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
   
  
![](/ER%20DIAGRAM.png)