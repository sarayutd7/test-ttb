# Task 6-8: SQL Test

## Overview
This folder contains SQL queries and test automation for database testing tasks.

## Files

### 1. SQL Queries File
- **File**: `task6_sql_queries.sql`
- **Description**: Contains SQL queries for all three tasks:
  - **Task 6**: Display all product names from Products table
  - **Task 7**: Display id, name and citizen with registered date in 2022
  - **Task 8**: Display product and customer information for specific customer_id

### 2. Robot Framework Test File
- **File**: `task6_sql_test.robot`
- **Description**: Automated test cases for SQL queries validation

## SQL Queries

### Task 6: Display All Product Names
```sql
SELECT product_name
FROM Products;
```

**Description**: Simple SELECT query to retrieve all product names from the Products table.

### Task 7: Display Records with Registered Date in 2022
```sql
SELECT 
    id,
    name,
    citizen
FROM 
    [table_name]
WHERE 
    YEAR(registered_date) = 2022;
```

**Description**: Query to filter records based on registered date in year 2022.

**Note**: Replace `[table_name]` with the actual table name (e.g., Customers, Users, etc.)

### Task 8: Display Product and Customer Information
```sql
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
```

**Description**: Complex query using JOINs to retrieve product and customer information for a specific customer.

**Note**: Adjust table names and JOIN conditions based on actual database schema.

## Prerequisites

### Install Required Libraries:
```bash
pip install robotframework
pip install robotframework-databaselibrary
pip install pymysql  # For MySQL
# OR
pip install psycopg2  # For PostgreSQL
# OR
pip install pyodbc  # For SQL Server
```

## Database Setup

### Update Database Connection
Edit `../../resources/testdata/sql_variables.robot` to configure your database connection:

```robot
${DB_API_MODULE_NAME}    pymysql  # or psycopg2, pyodbc
${DB_HOST}    localhost
${DB_PORT}    3306
${DB_NAME}    your_database_name
${DB_USERNAME}    your_username
${DB_PASSWORD}    your_password
```

## Running SQL Queries

### Option 1: Execute SQL File Directly
Use your preferred SQL client (MySQL Workbench, pgAdmin, SQL Server Management Studio, etc.):
1. Open `task6_sql_queries.sql`
2. Execute queries one by one
3. Review results

### Option 2: Run Robot Framework Tests
```bash
# Run all SQL tests
robot testcases/senior_testengineer_assessment/task6_sql_test.robot

# Run specific task
robot -t "TC01*" testcases/senior_testengineer_assessment/task6_sql_test.robot
robot -t "TC02*" testcases/senior_testengineer_assessment/task6_sql_test.robot
robot -t "TC03*" testcases/senior_testengineer_assessment/task6_sql_test.robot

# Run by tags
robot --include task6 testcases/senior_testengineer_assessment/task6_sql_test.robot
robot --include task7 testcases/senior_testengineer_assessment/task6_sql_test.robot
robot --include task8 testcases/senior_testengineer_assessment/task6_sql_test.robot
```

## Test Cases

### TC01 - Task 6: Display All Product Names
- Executes SELECT query on Products table
- Verifies results are returned
- Logs all product names

### TC02 - Task 7: Display Records with Date Filter
- Executes SELECT query with WHERE clause for year 2022
- Verifies results are returned
- Logs id, name, and citizen for each record

### TC03 - Task 8: Display Product and Customer Info
- Executes complex JOIN query
- Verifies results for customer_id = '001110001'
- Logs product and customer information

### TC04-TC06: Query Structure Validation
- Validates SQL query syntax without executing
- Checks for required keywords and structure

## Database Schema Assumptions

The queries assume the following table structure (adjust as needed):

### Products Table
- `product_id` (Primary Key)
- `product_name`
- Other columns...

### Customers Table
- `customer_id` (Primary Key)
- `first_name`
- `last_name`
- `citizen`
- `registered_date`
- Other columns...

### Orders Table (if needed for Task 8)
- `order_id` (Primary Key)
- `product_id` (Foreign Key)
- `customer_id` (Foreign Key)
- Other columns...

## Notes

1. **Table Names**: Update table names in queries based on your actual database schema
2. **Column Names**: Adjust column names if they differ from the examples
3. **Date Format**: The date filter in Task 7 uses `YEAR()` function - adjust based on your database system
4. **JOIN Conditions**: Task 8 assumes relationships between Products, Orders, and Customers tables - adjust JOINs based on your schema
5. **Customer Full Name**: Task 8 uses `CONCAT()` - some databases may use `||` or `+` for string concatenation

## Database-Specific Adjustments

### MySQL
- Uses `YEAR()` function for date filtering
- Uses `CONCAT()` for string concatenation

### PostgreSQL
- Can use `EXTRACT(YEAR FROM registered_date) = 2022`
- Can use `||` for string concatenation: `c.first_name || ' ' || c.last_name`

### SQL Server
- Can use `YEAR()` function
- Can use `+` for string concatenation: `c.first_name + ' ' + c.last_name`

## Troubleshooting

### Common Issues:

1. **Connection Error**
   - Verify database credentials in `sql_variables.robot`
   - Check database server is running
   - Verify network connectivity

2. **Table Not Found**
   - Update table names in queries
   - Verify database schema

3. **Column Not Found**
   - Check column names match actual database schema
   - Verify column names are case-sensitive if needed

4. **JOIN Error**
   - Verify relationships between tables
   - Check foreign key constraints
   - Adjust JOIN conditions based on actual schema

