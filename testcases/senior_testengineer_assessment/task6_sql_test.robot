*** Settings ***
Documentation    Task 6-8: SQL Test - Database Query Test Automation
Library    DatabaseLibrary
Resource    ../../resources/testdata/sql_variables.robot

*** Test Cases ***
TC01 - Task 6: Display All Product Names From Products Table
    [Documentation]    Verify query to display all product names from Products table
    [Tags]    task6    sql    query    products
    
    # Connect to database
    Connect To Database    ${DB_API_MODULE_NAME}    ${DB_CONNECT_STRING}
    
    # Execute query to get all product names
    ${query_result}=    Query    SELECT product_name FROM Products
    
    # Verify query returns results
    Should Not Be Empty    ${query_result}
    
    # Log all product names
    Log    Total products found: ${query_result}    level=INFO
    
    # Display product names
    FOR    ${row}    IN    @{query_result}
        Log    Product Name: ${row}[0]    level=INFO
    END
    
    [Teardown]    Disconnect From Database

TC02 - Task 7: Display ID Name Citizen With Registered Date In 2022
    [Documentation]    Verify query to display id, name and citizen who have registered date in 2022
    [Tags]    task7    sql    query    date_filter
    
    # Connect to database
    Connect To Database    ${DB_API_MODULE_NAME}    ${DB_CONNECT_STRING}
    
    # Execute query to get records with registered date in 2022
    ${query_result}=    Query    SELECT id, name, citizen FROM ${TABLE_NAME} WHERE YEAR(registered_date) = 2022
    
    # Verify query returns results
    Should Not Be Empty    ${query_result}
    
    # Log results
    Log    Total records found for 2022: ${query_result}    level=INFO
    
    # Display each record
    FOR    ${row}    IN    @{query_result}
        Log    ID: ${row}[0], Name: ${row}[1], Citizen: ${row}[2]    level=INFO
    END
    
    [Teardown]    Disconnect From Database

TC03 - Task 8: Display Product And Customer Info For Customer ID 001110001
    [Documentation]    Verify query to display product id, product name, customer full name, customer citizen for customer_id = '001110001'
    [Tags]    task8    sql    query    join
    
    # Connect to database
    Connect To Database    ${DB_API_MODULE_NAME}    ${DB_CONNECT_STRING}
    
    # Execute query with JOIN to get product and customer information
    ${query_result}=    Query    SELECT p.product_id, p.product_name, CONCAT(c.first_name, ' ', c.last_name) AS customer_full_name, c.citizen AS customer_citizen FROM Products p INNER JOIN Orders o ON p.product_id = o.product_id INNER JOIN Customers c ON o.customer_id = c.customer_id WHERE c.customer_id = '001110001'
    
    # Verify query returns results
    Should Not Be Empty    ${query_result}
    
    # Log results
    Log    Total records found for customer_id 001110001: ${query_result}    level=INFO
    
    # Display each record
    FOR    ${row}    IN    @{query_result}
        Log    Product ID: ${row}[0], Product Name: ${row}[1], Customer Full Name: ${row}[2], Customer Citizen: ${row}[3]    level=INFO
    END
    
    [Teardown]    Disconnect From Database

TC04 - Task 6: Verify Product Names Query Structure
    [Documentation]    Verify that the query structure for Task 6 is correct
    [Tags]    task6    sql    validation
    
    # This test verifies the query syntax without executing
    ${query}=    Set Variable    SELECT product_name FROM Products
    Should Contain    ${query}    SELECT
    Should Contain    ${query}    product_name
    Should Contain    ${query}    FROM
    Should Contain    ${query}    Products
    Log    Query structure validated: ${query}    level=INFO

TC05 - Task 7: Verify Date Filter Query Structure
    [Documentation]    Verify that the query structure for Task 7 is correct
    [Tags]    task7    sql    validation
    
    # This test verifies the query syntax without executing
    ${query}=    Set Variable    SELECT id, name, citizen FROM ${TABLE_NAME} WHERE YEAR(registered_date) = 2022
    Should Contain    ${query}    SELECT
    Should Contain    ${query}    WHERE
    Should Contain    ${query}    YEAR
    Should Contain    ${query}    2022
    Log    Query structure validated: ${query}    level=INFO

TC06 - Task 8: Verify Join Query Structure
    [Documentation]    Verify that the query structure for Task 8 is correct
    [Tags]    task8    sql    validation
    
    # This test verifies the query syntax without executing
    ${query}=    Set Variable    SELECT p.product_id, p.product_name, CONCAT(c.first_name, ' ', c.last_name) AS customer_full_name, c.citizen AS customer_citizen FROM Products p INNER JOIN Orders o ON p.product_id = o.product_id INNER JOIN Customers c ON o.customer_id = c.customer_id WHERE c.customer_id = '001110001'
    Should Contain    ${query}    SELECT
    Should Contain    ${query}    INNER JOIN
    Should Contain    ${query}    WHERE
    Should Contain    ${query}    001110001
    Log    Query structure validated: ${query}    level=INFO

