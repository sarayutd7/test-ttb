# Task 4-5: API Testing - Petstore Swagger API

## Overview
This folder contains API testing automation for Petstore Swagger API (https://petstore.swagger.io/)

## Task 4: Postman Collection
- **File**: `sarayut_postman_collection.json`
- **Description**: Postman Collection containing the three required APIs:
  - `GET /pet/{petId}`
  - `GET /store/order/{orderId}`
  - `POST /user`

### How to Use Postman Collection:
1. Open Postman
2. Click "Import" button
3. Select `sarayut_postman_collection.json`
4. Collection will be imported with all three APIs
5. Collection name in Postman: "Sarayut_Postman_Collection"

## Task 5: API Test Automation
- **File**: `task4_task5_api_test.robot`
- **Description**: Robot Framework test automation for API testing

### Test Cases:

#### Positive Test Cases:
- **TC01**: GET Pet By ID - Valid Pet ID Should Return 200
- **TC03**: GET Store Order By ID - Valid Order ID Should Return 200
- **TC05**: POST User - Create User Should Return 200

#### Negative Test Cases:
- **TC02**: GET Pet By ID - Invalid Pet ID Should Return 404
- **TC04**: GET Store Order By ID - Invalid Order ID Should Return 404
- **TC06**: POST User - Invalid Data Should Return 400 or 500

#### Multiple Scenarios:
- **TC07**: GET Pet By ID - Test Multiple Pet IDs
- **TC08**: GET Store Order By ID - Test Multiple Order IDs
- **TC09**: POST User - Test Different User Scenarios
- **TC10**: Verify All APIs Return Expected Response Codes

## Prerequisites

### Install Required Libraries:
```bash
pip install robotframework
pip install robotframework-requests
```

## Running Tests

### Run All Tests:
```bash
robot testcases/senior_testengineer_assessment/task4_task5_api_test.robot
```

### Run Specific Test:
```bash
robot -t "TC01*" testcases/senior_testengineer_assessment/task4_task5_api_test.robot
```

### Run by Tags:
```bash
# Run only positive tests
robot --include positive testcases/senior_testengineer_assessment/task4_task5_api_test.robot

# Run only negative tests
robot --include negative testcases/senior_testengineer_assessment/task4_task5_api_test.robot

# Run only task4 tests
robot --include task4 testcases/senior_testengineer_assessment/task4_task5_api_test.robot

# Run only task5 tests
robot --include task5 testcases/senior_testengineer_assessment/task4_task5_api_test.robot
```

## API Endpoints Tested

### 1. GET /pet/{petId}
- **Base URL**: https://petstore.swagger.io/v2
- **Purpose**: Find pet by ID
- **Test Scenarios**:
  - Valid pet ID → 200 OK
  - Invalid/Non-existent pet ID → 404 Not Found

### 2. GET /store/order/{orderId}
- **Base URL**: https://petstore.swagger.io/v2
- **Purpose**: Find purchase order by ID
- **Test Scenarios**:
  - Valid order ID → 200 OK
  - Invalid/Non-existent order ID → 404 Not Found

### 3. POST /user
- **Base URL**: https://petstore.swagger.io/v2
- **Purpose**: Create user
- **Test Scenarios**:
  - Valid user data → 200 OK
  - Invalid user data → 400/500 Error

## Response Codes Tested

- **200**: Success (GET requests with valid IDs, POST with valid data)
- **201**: Created (POST requests - if applicable)
- **400**: Bad Request (Invalid data)
- **404**: Not Found (Invalid/Non-existent IDs)
- **500**: Internal Server Error (Server-side errors)

## Test Data

Test data is defined in:
- `../../resources/testdata/petstore_api_variables.robot`

You can modify test data values in that file to test different scenarios.

## Notes

1. **API Availability**: Tests require internet connection to access Petstore Swagger API
2. **Response Codes**: Actual response codes may vary based on API implementation
3. **Test Data**: Some test data (like valid IDs) may need adjustment based on actual API data
4. **Postman Collection**: The JSON file can be imported directly into Postman for manual testing

## Troubleshooting

### Common Issues:

1. **Connection Error**
   - Check internet connection
   - Verify API endpoint is accessible: https://petstore.swagger.io/

2. **404 Errors for Valid IDs**
   - Valid IDs may not exist in the test environment
   - Try different IDs or create test data first

3. **Import Postman Collection Failed**
   - Verify JSON file is valid
   - Check Postman version compatibility

