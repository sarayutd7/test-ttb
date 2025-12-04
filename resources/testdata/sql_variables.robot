*** Variables ***
# Database Connection Settings
${DB_API_MODULE_NAME}    pymysql
${DB_HOST}    localhost
${DB_PORT}    3306
${DB_NAME}    test_database
${DB_USERNAME}    root
${DB_PASSWORD}    password

# Database Connection String
${DB_CONNECT_STRING}    ${DB_API_MODULE_NAME}://${DB_USERNAME}:${DB_PASSWORD}@${DB_HOST}:${DB_PORT}/${DB_NAME}

# Table Names (adjust based on actual database schema)
${TABLE_NAME}    Customers
${PRODUCTS_TABLE}    Products
${CUSTOMERS_TABLE}    Customers
${ORDERS_TABLE}    Orders

# Test Data
${TEST_CUSTOMER_ID}    001110001
${TEST_YEAR}    2022

# SQL Queries
${QUERY_TASK6}    SELECT product_name FROM Products
${QUERY_TASK7}    SELECT id, name, citizen FROM ${TABLE_NAME} WHERE YEAR(registered_date) = ${TEST_YEAR}
${QUERY_TASK8}    SELECT p.product_id, p.product_name, CONCAT(c.first_name, ' ', c.last_name) AS customer_full_name, c.citizen AS customer_citizen FROM Products p INNER JOIN Orders o ON p.product_id = o.product_id INNER JOIN Customers c ON o.customer_id = c.customer_id WHERE c.customer_id = '${TEST_CUSTOMER_ID}'

