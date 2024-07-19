# Problem Statement: Designing a Database for E-Commerce Customer Management

## Solution

1. **Customer Information**
    
    ```
    CREATE TABLE Customers (
        CustomerID INT PRIMARY KEY AUTO_INCREMENT,
        FirstName VARCHAR(50),
        MiddleName VARCHAR(50),
        LastName VARCHAR(50)
    );

    CREATE TABLE Roles (
        RoleID INT PRIMARY KEY AUTO_INCREMENT,
        RoleName VARCHAR(50)
    );

    CREATE TABLE CustomerRoles (
        CustomerID INT,
        RoleID INT,
        PRIMARY KEY (CustomerID, RoleID),
        FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
        FOREIGN KEY (RoleID) REFERENCES Roles(RoleID)
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
        FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
    );
    ```

3. **Address Information**
    
    ```
    CREATE TABLE Addresses (
        AddressID INT PRIMARY KEY AUTO_INCREMENT,
        CustomerID INT,
        StreetAddress VARCHAR(100),
        City VARCHAR(50),
        StateProvince VARCHAR(50),
        PostalCode VARCHAR(20),
        Country VARCHAR(50),
        Purpose VARCHAR(50), -- e.g., 'Billing', 'Shipping', 'General'
        FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
    );

    ```

4. **User Logins**

    ```
    -- Creating UserLogin Table

        CREATE TABLE UserLogins (
        LoginID INT PRIMARY KEY AUTO_INCREMENT,
        CustomerID INT,
        Username VARCHAR(50) UNIQUE,
        PasswordHash VARCHAR(100), -- Storing a hashed version of the password
        FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
    );

    CREATE TABLE SecurityGroups (
        GroupID INT PRIMARY KEY AUTO_INCREMENT,
        GroupName VARCHAR(50)
    );

    CREATE TABLE UserLoginSecurityGroups (
        LoginID INT,
        GroupID INT,
        PRIMARY KEY (LoginID, GroupID),
        FOREIGN KEY (LoginID) REFERENCES UserLogins(LoginID),
        FOREIGN KEY (GroupID) REFERENCES SecurityGroups(GroupID)
    );

    ```

5. **Payment Information**

    ```
    -- Creating Payment Table

    CREATE TABLE PaymentMethods (
        PaymentID INT PRIMARY KEY AUTO_INCREMENT,
        CustomerID INT,
        PaymentType VARCHAR(50), -- e.g., 'Credit Card'
        CardNumber VARCHAR(20),
        ExpirationDate DATE,
        BillingAddressID INT,
        FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
        FOREIGN KEY (BillingAddressID) REFERENCES Addresses(AddressID)
    );
    ```

## Deliverables

 **ER Diagram**
  
![](/dbms/ER%20DIAGRAM.png)
