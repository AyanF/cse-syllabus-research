# Advanced SQL Queries for E-Commerce Customer Management

## Query 1: Retrieve Full Customer Profile
SELECT
    c.customer_id,
    c.customer_name,
    c.role,
    ci.email,
    ci.billing_phone,
    ci.shipping_phone,
    a.address_type AS billing_address_type,
    a.address_details AS billing_address_details,
    a1.address_type AS shipping_address_type,
    a1.address_details AS shipping_address_details
FROM
    customers c
LEFT JOIN
    contact_information ci ON c.customer_id = ci.customer_id
LEFT JOIN
    addresses a ON c.customer_id = a.customer_id AND a.address_type = 'Billing'
LEFT JOIN
    addresses a1 ON c.customer_id = a1.customer_id AND a1.address_type = 'Shipping'
WHERE
    c.customer_name = 'David Zeneski';

## Query 2: Find Customers with Multiple Roles
SELECT
    customer_id,
    customer_name,
    COUNT(DISTINCT role) AS num_roles
FROM
    customers
GROUP BY
    customer_id, customer_name
HAVING
    COUNT(DISTINCT role) > 1;

## Query 3: List Customers and Their Most Recent Email Address
SELECT
    c.customer_id,
    c.customer_name,
    ci.email AS most_recent_email
FROM
    customers c
LEFT JOIN
    contact_information ci ON c.customer_id = ci.customer_id
WHERE
    ci.contact_id = (
        SELECT
            ci_inner.contact_id
        FROM
            contact_information ci_inner
        WHERE
            ci_inner.customer_id = c.customer_id
        ORDER BY
            ci_inner.contact_id DESC
        LIMIT 1
    );

## Query 4: Customers Without Addresses
SELECT
    c.customer_id,
    c.customer_name
FROM
    customers c
LEFT JOIN
    addresses a ON c.customer_id = a.customer_id
WHERE
    a.address_id IS NULL;

## Query 5: User Login Access
SELECT
    ul.username AS user_login,
    a.application_name AS application_access
FROM
    user_logins ul
JOIN
    security_groups sg ON ul.security_group_id = sg.security_group_id
JOIN
    application_access aa ON sg.security_group_id = aa.security_group_id
JOIN
    applications a ON aa.application_id = a.application_id;

## Query 6: Customers with Both Billing and Shipping Addresses
SELECT
    c.customer_id,
    c.customer_name
FROM
    customers c
WHERE
    EXISTS (
        SELECT 1
        FROM addresses a
        WHERE a.customer_id = c.customer_id
          AND a.address_type = 'Billing'
    )
    AND EXISTS (
        SELECT 1
        FROM addresses a
        WHERE a.customer_id = c.customer_id
          AND a.address_type = 'Shipping'
    );

## Query 7: Total Number of Customers per City
SELECT
    city,
    COUNT(customer_id) AS total_customers
FROM
    customers
GROUP BY
    city
ORDER BY
    total_customers DESC;

## Query 8: Find Customers with Expired Contact Mechanisms
SELECT
    c.customer_id,
    c.customer_name,
    ci.contact_type,
    ci.contact_value,
    ci.expiration_date
FROM
    customers c
JOIN
    contact_information ci ON c.customer_id = ci.customer_id
WHERE
    ci.expiration_date < CURDATE();

## Query 9: Payment Methods and Billing Addresses
SELECT
    pm.payment_method_id,
    pm.payment_method_name,
    ba.address_type AS billing_address_type,
    ba.address_details AS billing_address_details
FROM
    payment_methods pm
LEFT JOIN
    billing_addresses ba ON pm.customer_id = ba.customer_id
ORDER BY
    pm.payment_method_id;

## Query 10: Customer Login and Role Information
SELECT
    c.customer_id,
    c.customer_name,
    ul.username AS login_username,
    r.role_name
FROM
    customers c
JOIN
    user_logins ul ON c.customer_id = ul.customer_id
JOIN
    roles r ON ul.role_id = r.role_id;
