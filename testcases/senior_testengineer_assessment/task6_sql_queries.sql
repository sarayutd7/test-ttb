-- ============================================
-- Task 6-8: SQL Test Queries
-- ============================================

-- Task 6: Display all product names from Products table
-- Query to display all of product name from table : Products
SELECT 
    product_name
FROM 
    Products;

-- Alternative: If you want to see all columns with product names
-- SELECT * FROM Products;

-- Alternative: If you want distinct product names only
-- SELECT DISTINCT product_name FROM Products;


-- ============================================

-- Task 7: Display id, name and citizen who have registered date in 2022
-- Query to display the id, name and citizen who have registered date in 2022
SELECT 
    id,
    name,
    citizen
FROM 
    [table_name]
WHERE 
    YEAR(registered_date) = 2022;

-- Alternative: If using DATE format
-- SELECT 
--     id,
--     name,
--     citizen
-- FROM 
--     [table_name]
-- WHERE 
--     registered_date >= '2022-01-01' 
--     AND registered_date < '2023-01-01';

-- Alternative: If using DATETIME format
-- SELECT 
--     id,
--     name,
--     citizen
-- FROM 
--     [table_name]
-- WHERE 
--     registered_date BETWEEN '2022-01-01 00:00:00' AND '2022-12-31 23:59:59';

-- Note: Replace [table_name] with actual table name (e.g., Customers, Users, etc.)


-- ============================================

-- Task 8: Display product id, product name, customer full name, customer citizen 
--         where customer_id = '001110001'
-- Query to display product id, product name, customer full name, customer citizen 
-- who have customer_id = '001110001'

-- Assuming there are Products and Customers tables, and possibly an Orders table
-- to link them together

-- Option 1: If there's a direct relationship table (e.g., Orders, Purchases)
SELECT 
    p.product_id,
    p.product_name,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_full_name,
    c.citizen AS customer_citizen
FROM 
    Products p
    INNER JOIN Orders o ON p.product_id = o.product_id
    INNER JOIN Customers c ON o.customer_id = c.customer_id
WHERE 
    c.customer_id = '001110001';

-- Option 2: If customer full name is stored in a single column
SELECT 
    p.product_id,
    p.product_name,
    c.full_name AS customer_full_name,
    c.citizen AS customer_citizen
FROM 
    Products p
    INNER JOIN Orders o ON p.product_id = o.product_id
    INNER JOIN Customers c ON o.customer_id = c.customer_id
WHERE 
    c.customer_id = '001110001';

-- Option 3: If there's a direct relationship without Orders table
SELECT 
    p.product_id,
    p.product_name,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_full_name,
    c.citizen AS customer_citizen
FROM 
    Products p
    INNER JOIN Customers c ON p.customer_id = c.customer_id
WHERE 
    c.customer_id = '001110001';

-- Note: Adjust table names and column names based on actual database schema
-- Note: Adjust JOIN conditions based on actual relationships between tables

