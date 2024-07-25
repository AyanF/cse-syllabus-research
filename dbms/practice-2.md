# E-Commerce Customer Management

## Objective
You are tasked with managing customer profiles for an e-commerce platform. Your tasks include creating, updating, and deleting records related to customer information, contact details, and user logins.

## Activity - 1: Managing Customer Profile for Mark Tailor

### Scenario
Mark Tailor is a new customer on your e-commerce platform. You need to create his profile and update it with various details.

### Tasks
1. **Create Customer Profile**
   CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    role VARCHAR(50) NOT NULL
);
    INSERT INTO customers (customer_name, role) #autoincrement customerid 
    VALUES ('Mark Tailor', 'Customer');


3. **Update Customer Name**
UPDATE customers
SET customer_name = 'Mark K Tailor'
WHERE customer_name = 'Mark Tailor';


4. **Add Contact Information**
    CREATE TABLE contact_information (
    contact_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    email VARCHAR(100),
    billing_phone VARCHAR(20),
    shipping_phone VARCHAR(20),
    billing_address_id VARCHAR(255),
    shipping_address_id VARCHAR(255),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
CREATE TABLE addresses (
    address_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    address_type VARCHAR(50) NOT NULL,
    address_details VARCHAR(255) NOT NULL,
    purpose VARCHAR(100),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
INSERT INTO contact_information (customer_id, email, billing_phone, shipping_phone, billing_address_id, shipping_address_id)
VALUES (@mark_customer_id, 'mark@example.com', '1234567890', '9876543210', 1, 2
);
INSERT INTO addresses (customer_id, address_type, address_details, purpose)
VALUES (@mark_customer_id, 'Billing', '123 Billing St, City, Country', 'General correspondence');
INSERT INTO addresses (customer_id, address_type, address_details, purpose)
VALUES (@mark_customer_id, 'Shipping', '456 Shipping Ave, City, Country', 'Shipping address'
);

6. **Modify Contact Information**
    - Delete the current email address and add a new one.
      UPDATE contact_information
     SET email = 'mark.k@example.com'
     WHERE customer_id = @mark_customer_id;

    - Delete the current billing address and add a new one.
      DELETE FROM addresses
    WHERE customer_id = @mark_customer_id AND address_type = 'Billing';
    INSERT INTO addresses (customer_id, address_type, address_details, purpose)
    VALUES (@mark_customer_id, 'Billing', '789 New Billing Rd, City, Country', 'General correspondence');
    - Delete the current shipping address and add a new one.
      DELETE FROM addresses
    WHERE customer_id = @mark_customer_id AND address_type = 'Shipping';

    INSERT INTO addresses (customer_id, address_type, address_details, purpose)
    VALUES (@mark_customer_id, 'Shipping', '012 New Shipping Blvd, City, Country', 'Shipping address');

## Activity - 2: Advanced Customer Management for John Hays

### Scenario
John Hays is an existing customer who requires more advanced management, including credit card information and system access.

### Tasks
1. **Create Customer Profile**
    INSERT INTO customers (customer_name, role)
    VALUES ('John Hays', 'Customer');
    SET @john_customer_id = LAST_INSERT_ID();

3. **Update Customer Name**
    UPDATE customers
    SET customer_name = 'John B Hays'
    WHERE customer_id = @john_customer_id;

4. **Add Contact Information**
   INSERT INTO contact_information (customer_id, email, billing_phone, shipping_phone)
   VALUES (@john_customer_id, 'john.hays@example.com', '1234567890', '9876543210');

   INSERT INTO addresses (customer_id, address_type, address_details, purpose)
   VALUES (@john_customer_id, 'Billing', '123 Billing St, City, Country', 'General correspondence');
   
    INSERT INTO addresses (customer_id, address_type, address_details, purpose)
    VALUES (@john_customer_id, 'Shipping', '456 Shipping Ave, City, Country', 'Shipping address');

    UPDATE addresses
    SET address_details = '456 Shipping Ave, City, Country'
    WHERE customer_id = @john_customer_id AND address_type = 'Billing';

6. **Add Payment Information**
    CREATE TABLE credit_cards (
    card_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    card_number VARCHAR(20) NOT NULL,
    expiration_date DATE NOT NULL,
    security_code VARCHAR(4) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
    INSERT INTO credit_cards (customer_id, card_number, expiration_date, security_code)
    VALUES (@john_customer_id, '1234567890123456', '2025-12-31', '123');

7. **Manage System Access**
    INSERT INTO user_logins (customer_id, username, password)
    VALUES (@john_customer_id, 'john_hays', 'password123');

    INSERT INTO customer_security_groups (customer_id, group_id)
    VALUES (@john_customer_id, 1);

8. **Modify Contact Information**
    - Delete the current email address and add a new one.
    UPDATE contact_information
    SET email = 'john.b.hays@example.com'
    WHERE customer_id = @john_customer_id;

    - Delete the current billing address and add a new one.
    DELETE FROM addresses
    WHERE customer_id = @john_customer_id AND address_type = 'Billing';

    INSERT INTO addresses (customer_id, address_type, address_details, purpose)
    VALUES (@john_customer_id, 'Billing', '789 New Billing Rd, City, Country', 'General correspondence');

    - Delete the current shipping address and add a new one.
    DELETE FROM addresses
    WHERE customer_id = @john_customer_id AND address_type = 'Shipping';

    INSERT INTO addresses (customer_id, address_type, address_details, purpose)
    VALUES (@john_customer_id, 'Shipping', '012 New Shipping Blvd, City, Country', 'Shipping address'); 

## Activity - 3: Comprehensive Customer Management for David Zeneski

### Scenario
David Zeneski is a new customer who requires a comprehensive setup, including multiple user logins and access to different parts of the e-commerce system.

### Tasks
1. **Create Customer Profile**
    INSERT INTO customers (customer_name, role)
    VALUES ('David Zeneski', 'Customer');
    SET @david_customer_id = LAST_INSERT_ID();

3. **Update Customer Name**
    UPDATE customers
    SET customer_name = 'David R Zeneski'
    WHERE customer_id = @david_customer_id;

4. **Add Contact Information**
    INSERT INTO contact_information (customer_id, email, billing_phone, shipping_phone)
    VALUES (@david_customer_id, 'david.zeneski@example.com', '1234567890', '9876543210');

    INSERT INTO addresses (customer_id, address_type, address_details, purpose)
    VALUES (@david_customer_id, 'Billing', '123 Billing St, City, Country', 'General correspondence');

    INSERT INTO addresses (customer_id, address_type, address_details, purpose)
    VALUES (@david_customer_id, 'Shipping', '456 Shipping Ave, City, Country', 'Shipping address');

    UPDATE addresses
    SET address_details = '456 Shipping Ave, City, Country'
    WHERE customer_id = @david_customer_id AND address_type = 'Billing';
   
6. **Add Payment Information**
    CREATE TABLE IF NOT EXISTS credit_cards (
    card_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    card_number VARCHAR(20) NOT NULL,
    expiration_date DATE NOT NULL,
    security_code VARCHAR(4) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
    INSERT INTO credit_cards (customer_id, card_number, expiration_date, security_code)
    VALUES (@david_customer_id, '1234567890123456', '2025-12-31', '123');    
        
7. **Manage System Access**
    INSERT INTO user_logins (customer_id, username, password)
    VALUES (@david_customer_id, 'dzeneski_order', 'orderpassword123'),
           (@david_customer_id, 'dzeneski_customer', 'customerpassword456');
   
    INSERT INTO application_access (login_id, application_name)
    SELECT login_id, application_name
    FROM user_logins
    WHERE customer_id = @david_customer_id;
   
    UPDATE application_access
    SET application_name = CASE 
    WHEN login_id IN (SELECT login_id FROM user_logins WHERE customer_id = @david_customer_id      AND username = 'dzeneski_order') THEN 'Order Management'
    WHEN login_id IN (SELECT login_id FROM user_logins WHERE customer_id = @david_customer_id      AND username = 'dzeneski_customer') THEN 'Customer Management'
    ELSE application_name
    END;

9. **Modify Contact Information**
    - Delete the current email address and add a new one.
      UPDATE contact_information
    SET email = 'david.r.zeneski@example.com'
    WHERE customer_id = @david_customer_id;

    - Delete the current billing address and add a new one.
      DELETE FROM addresses
    WHERE customer_id = @david_customer_id AND address_type = 'Billing';

    INSERT INTO addresses (customer_id, address_type, address_details, purpose)
    VALUES (@david_customer_id, 'Billing', '789 New Billing Rd, City, Country', 'General correspondence');
   
    - Delete the current shipping address and add a new one.
      DELETE FROM addresses
      WHERE customer_id = @david_customer_id AND address_type = 'Shipping';

      INSERT INTO addresses (customer_id, address_type, address_details, purpose)
      VALUES (@david_customer_id, 'Shipping', '012 New Shipping Blvd, City, Country', 'Shipping address');
