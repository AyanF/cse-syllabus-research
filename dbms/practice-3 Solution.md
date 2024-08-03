# Advanced SQL Queries for E-Commerce Customer Management

## Query 1: Retrieve Full Customer Profile
Write a query to retrieve the full profile of a customer, including their contact mechanisms and addresses.

```
SELECT 
    c.CustomerID, 
    c.FirstName, 
    c.MiddleName, 
    c.LastName, 
    co.ContactID,
    co.Email, 
    co.Phone, 
    co.Purpose AS ContactPurpose,
    a.AddressID, 
    a.StreetAddress, 
    a.City, 
    a.StateProvince, 
    a.PostalCode, 
    a.Country, 
    a.Purpose AS AddressPurpose
FROM 
    Customer c
LEFT JOIN 
    Contact co ON c.CustomerID = co.CustomerID
LEFT JOIN 
    Address a ON c.CustomerID = a.CustomerID;
```

## Query 2: Find Customers with Multiple Roles
Write a query to find customers who have more than one role.
```
SELECT 
    c.CustomerID, 
    c.FirstName, 
    c.MiddleName, 
    c.LastName, 
    COUNT(cr.RoleID) AS RoleCount
FROM 
    Customer c
JOIN 
    CustomerRole cr ON c.CustomerID = cr.CustomerID
GROUP BY 
    c.CustomerID, c.FirstName, c.MiddleName, c.LastName
HAVING 
    COUNT(cr.RoleID) > 1;


```

## Query 3: List Customers and Their Most Recent Email Address
Write a query to list each customer and their most recent email address.
```
SELECT 
    c.CustomerID, 
    c.FirstName, 
    c.MiddleName, 
    c.LastName, 
    co.Email, 
    co.ContactID
FROM 
    Customer c
JOIN 
    Contact co ON c.CustomerID = co.CustomerID
WHERE 
    co.Email IS NOT NULL
ORDER BY 
    co.ContactID DESC;
```

## Query 4: Customers Without Addresses
Write a query to find customers who do not have any addresses associated with their profiles.
```
SELECT 
    c.CustomerID, 
    c.FirstName, 
    c.MiddleName, 
    c.LastName
FROM 
    Customer c
LEFT JOIN 
    Address a ON c.CustomerID = a.CustomerID
WHERE 
    a.CustomerID IS NULL;
```

## Query 5: User Login Access
Write a query to find user logins and the applications they have access to based on their security groups.
```
SELECT 
    ul.LoginID, 
    ul.CustomerID, 
    c.FirstName, 
    c.MiddleName, 
    c.LastName, 
    ul.Username, 
    ul.SecurityGroup
FROM 
    UserLogin ul
JOIN 
    Customer c ON ul.CustomerID = c.CustomerID;
```


## Query 6: Customers with Both Billing and Shipping Addresses
Write a query to find customers who have both a billing address and a shipping address.
```
SELECT 
    c.CustomerID, 
    c.FirstName, 
    c.MiddleName, 
    c.LastName
FROM 
    Customer c
JOIN 
    Address a1 ON c.CustomerID = a1.CustomerID AND a1.Purpose = 'Billing'
JOIN 
    Address a2 ON c.CustomerID = a2.CustomerID AND a2.Purpose = 'Shipping';
```

## Query 7: Total Number of Customers per City
Write a query to find the total number of customers per city.
```
SELECT 
    a.City, 
    COUNT(DISTINCT c.CustomerID) AS CustomerCount
FROM 
    Customer c
JOIN 
    Address a ON c.CustomerID = a.CustomerID
GROUP BY 
    a.City;
```

## Query 8: Find Customers with Expired Contact Mechanisms
Write a query to find customers who have contact mechanisms marked as expired.
```
SELECT 
    c.CustomerID, 
    c.FirstName, 
    c.MiddleName, 
    c.LastName, 
    co.ContactID, 
    co.Email, 
    co.Phone, 
    co.Purpose
FROM 
    Customer c
JOIN 
    Contact co ON c.CustomerID = co.CustomerID
WHERE 
    co.Purpose = 'Expired';
```

## Query 9: Payment Methods and Billing Addresses
Write a query to find all payment methods along with their associated billing addresses.
```
SELECT 
    p.PaymentID, 
    p.CustomerID, 
    c.FirstName, 
    c.MiddleName, 
    c.LastName, 
    p.CreditCardNumber, 
    p.ExpirationDate, 
    p.BillingAddress
FROM 
    Payment p
JOIN 
    Customer c ON p.CustomerID = c.CustomerID;
```

## Query 10: Customer Login and Role Information
Write a query to find customers along with their user login information and roles.
```
SELECT 
    c.CustomerID, 
    c.FirstName, 
    c.MiddleName, 
    c.LastName, 
    ul.Username, 
    ul.SecurityGroup, 
    r.RoleName
FROM 
    Customer c
LEFT JOIN 
    UserLogin ul ON c.CustomerID = ul.CustomerID
LEFT JOIN 
    CustomerRole cr ON c.CustomerID = cr.CustomerID
LEFT JOIN 
    Role r ON cr.RoleID = r.RoleID;
```