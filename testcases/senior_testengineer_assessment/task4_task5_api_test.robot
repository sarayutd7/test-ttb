*** Settings ***
Documentation    Task 4-5: API Testing - Petstore Swagger API Test Automation
Library    RequestsLibrary
Resource    ../../resources/testdata/petstore_api_variables.robot
Suite Setup    Suppress SSL Warnings

*** Keywords ***
Suppress SSL Warnings
    [Documentation]    Suppress InsecureRequestWarning for unverified HTTPS requests
    Evaluate    import urllib3; urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)    modules=urllib3

*** Test Cases ***
TC01 - GET Pet By ID - Valid Pet ID Should Return 200
    [Documentation]    Verify GET /pet/{petId} returns 200 for valid pet ID
    [Tags]    task4    task5    api    positive    get_pet
    
    # Create session
    Create Session    petstore    ${PETSTORE_BASE_URL}    verify=${False}
    
    # Send GET request
    ${response}=    GET On Session    petstore    /pet/${VALID_PET_ID}
    
    # Verify response status code is 200
    Status Should Be    ${STATUS_200}    ${response}
    Should Be Equal As Strings    ${response.status_code}    ${STATUS_200}
    
    # Verify response body contains pet data
    ${response_body}=    Set Variable    ${response.json()}
    Dictionary Should Contain Key    ${response_body}    id
    Dictionary Should Contain Key    ${response_body}    name
    
    Log    Pet Data: ${response_body}    level=INFO

TC02 - GET Pet By ID - Invalid Pet ID Should Return 404
    [Documentation]    Verify GET /pet/{petId} returns 404 for non-existent pet ID
    [Tags]    task4    task5    api    negative    get_pet
    
    # Create session
    Create Session    petstore    ${PETSTORE_BASE_URL}    verify=${False}
    
    # Send GET request with invalid pet ID
    ${response}=    GET On Session    petstore    /pet/${NON_EXISTENT_PET_ID}    expected_status=404
    
    # Verify response status code is 404
    Status Should Be    ${STATUS_404}    ${response}
    Should Be Equal As Strings    ${response.status_code}    ${STATUS_404}
    
    Log    Response for invalid pet ID: ${response.status_code}    level=INFO

TC03 - GET Store Order By ID - Valid Order ID Should Return 200
    [Documentation]    Verify GET /store/order/{orderId} returns 200 for valid order ID
    [Tags]    task4    task5    api    positive    get_order
    
    # Create session
    Create Session    petstore    ${PETSTORE_BASE_URL}    verify=${False}
    
    # Send GET request
    ${response}=    GET On Session    petstore    /store/order/${VALID_ORDER_ID}
    
    # Verify response status code is 200
    Status Should Be    ${STATUS_200}    ${response}
    Should Be Equal As Strings    ${response.status_code}    ${STATUS_200}
    
    # Verify response body contains order data
    ${response_body}=    Set Variable    ${response.json()}
    Dictionary Should Contain Key    ${response_body}    id
    
    Log    Order Data: ${response_body}    level=INFO

TC04 - GET Store Order By ID - Invalid Order ID Should Return 404
    [Documentation]    Verify GET /store/order/{orderId} returns 404 for non-existent order ID
    [Tags]    task4    task5    api    negative    get_order
    
    # Create session
    Create Session    petstore    ${PETSTORE_BASE_URL}    verify=${False}
    
    # Send GET request with invalid order ID
    ${response}=    GET On Session    petstore    /store/order/${NON_EXISTENT_ORDER_ID}    expected_status=404
    
    # Verify response status code is 404
    Status Should Be    ${STATUS_404}    ${response}
    Should Be Equal As Strings    ${response.status_code}    ${STATUS_404}
    
    Log    Response for invalid order ID: ${response.status_code}    level=INFO

TC05 - POST User - Create User Should Return 200
    [Documentation]    Verify POST /user creates user and returns 200
    [Tags]    task4    task5    api    positive    post_user
    
    # Create session
    Create Session    petstore    ${PETSTORE_BASE_URL}    verify=${False}
    
    # Prepare user data
    ${user_data}=    Create Dictionary
    ...    id=${TEST_USER_ID}
    ...    username=${TEST_USERNAME}
    ...    firstName=${TEST_FIRST_NAME}
    ...    lastName=${TEST_LAST_NAME}
    ...    email=${TEST_EMAIL}
    ...    password=${TEST_PASSWORD}
    ...    phone=${TEST_PHONE}
    ...    userStatus=${TEST_USER_STATUS}
    
    # Send POST request
    ${response}=    POST On Session    petstore    /user    json=${user_data}
    
    # Verify response status code is 200
    Status Should Be    ${STATUS_200}    ${response}
    Should Be Equal As Strings    ${response.status_code}    ${STATUS_200}
    
    Log    User created successfully: ${response.text}    level=INFO

TC06 - POST User - Invalid Data Should Return 400 or 500
    [Documentation]    Verify POST /user with invalid data returns error status code
    [Tags]    task4    task5    api    negative    post_user
    
    # Create session
    Create Session    petstore    ${PETSTORE_BASE_URL}    verify=${False}
    
    # Prepare invalid user data (missing required fields)
    ${invalid_user_data}=    Create Dictionary
    ...    id=invalid_id
    ...    username=
    
    # Send POST request
    ${response}=    POST On Session    petstore    /user    json=${invalid_user_data}    expected_status=any
    
    # Verify response status code is not 200
    Should Not Be Equal As Strings    ${response.status_code}    ${STATUS_200}
    
    Log    Response status for invalid data: ${response.status_code}    level=INFO

TC07 - GET Pet By ID - Test Multiple Pet IDs
    [Documentation]    Test GET /pet/{petId} with multiple pet IDs to get different response codes
    [Tags]    task5    api    multiple    get_pet
    
    # Create session
    Create Session    petstore    ${PETSTORE_BASE_URL}    verify=${False}
    
    # Test with valid pet ID (should return 200)
    ${response1}=    GET On Session    petstore    /pet/${VALID_PET_ID}
    Status Should Be    ${STATUS_200}    ${response1}
    Log    Valid pet ID ${VALID_PET_ID}: Status ${response1.status_code}    level=INFO
    
    # Test with invalid pet ID (should return 404)
    ${response2}=    GET On Session    petstore    /pet/${NON_EXISTENT_PET_ID}    expected_status=404
    Status Should Be    ${STATUS_404}    ${response2}
    Log    Invalid pet ID ${NON_EXISTENT_PET_ID}: Status ${response2.status_code}    level=INFO

TC08 - GET Store Order By ID - Test Multiple Order IDs
    [Documentation]    Test GET /store/order/{orderId} with multiple order IDs to get different response codes
    [Tags]    task5    api    multiple    get_order
    
    # Create session
    Create Session    petstore    ${PETSTORE_BASE_URL}    verify=${False}
    
    # Test with valid order ID (should return 200)
    ${response1}=    GET On Session    petstore    /store/order/${VALID_ORDER_ID}
    Status Should Be    ${STATUS_200}    ${response1}
    Log    Valid order ID ${VALID_ORDER_ID}: Status ${response1.status_code}    level=INFO
    
    # Test with invalid order ID (should return 404)
    ${response2}=    GET On Session    petstore    /store/order/${NON_EXISTENT_ORDER_ID}    expected_status=404
    Status Should Be    ${STATUS_404}    ${response2}
    Log    Invalid order ID ${NON_EXISTENT_ORDER_ID}: Status ${response2.status_code}    level=INFO

TC09 - POST User - Test Different User Scenarios
    [Documentation]    Test POST /user with different scenarios to get different response codes
    [Tags]    task5    api    multiple    post_user
    
    # Create session
    Create Session    petstore    ${PETSTORE_BASE_URL}    verify=${False}
    
    # Scenario 1: Valid user data (should return 200)
    ${valid_user}=    Create Dictionary
    ...    id=${TEST_USER_ID}
    ...    username=${TEST_USERNAME}
    ...    firstName=${TEST_FIRST_NAME}
    ...    lastName=${TEST_LAST_NAME}
    ...    email=${TEST_EMAIL}
    ...    password=${TEST_PASSWORD}
    ...    phone=${TEST_PHONE}
    ...    userStatus=${TEST_USER_STATUS}
    
    ${response1}=    POST On Session    petstore    /user    json=${valid_user}
    Status Should Be    ${STATUS_200}    ${response1}
    Log    Valid user data: Status ${response1.status_code}    level=INFO
    
    # Scenario 2: Empty user data (might return 400 or 500)
    ${empty_user}=    Create Dictionary
    ${response2}=    POST On Session    petstore    /user    json=${empty_user}    expected_status=any
    Log    Empty user data: Status ${response2.status_code}    level=INFO

TC10 - Verify All APIs Return Expected Response Codes
    [Documentation]    Verify all three APIs return expected response codes (200 or other codes)
    [Tags]    task5    api    comprehensive
    
    # Create session
    Create Session    petstore    ${PETSTORE_BASE_URL}    verify=${False}
    
    # Test GET /pet/{petId} - should return 200 or 404
    ${pet_response}=    GET On Session    petstore    /pet/${VALID_PET_ID}    expected_status=any
    ${pet_status}=    Set Variable    ${pet_response.status_code}
    Should Be True    ${pet_status} in [200, 404]
    Log    GET /pet/{petId}: Status ${pet_status}    level=INFO
    
    # Test GET /store/order/{orderId} - should return 200 or 404
    ${order_response}=    GET On Session    petstore    /store/order/${VALID_ORDER_ID}    expected_status=any
    ${order_status}=    Set Variable    ${order_response.status_code}
    Should Be True    ${order_status} in [200, 404]
    Log    GET /store/order/{orderId}: Status ${order_status}    level=INFO
    
    # Test POST /user - should return 200 or other status
    ${user_data}=    Create Dictionary
    ...    id=${TEST_USER_ID}
    ...    username=${TEST_USERNAME}
    ...    firstName=${TEST_FIRST_NAME}
    ...    lastName=${TEST_LAST_NAME}
    ...    email=${TEST_EMAIL}
    ...    password=${TEST_PASSWORD}
    ...    phone=${TEST_PHONE}
    ...    userStatus=${TEST_USER_STATUS}
    
    ${user_response}=    POST On Session    petstore    /user    json=${user_data}    expected_status=any
    ${user_status}=    Set Variable    ${user_response.status_code}
    Should Be True    ${user_status} in [200, 201, 400, 500]
    Log    POST /user: Status ${user_status}    level=INFO

