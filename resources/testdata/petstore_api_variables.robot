*** Variables ***
# Base URL
${PETSTORE_BASE_URL}    https://petstore.swagger.io/v2

# API Endpoints
${GET_PET_BY_ID_ENDPOINT}    /pet/{petId}
${GET_STORE_ORDER_BY_ID_ENDPOINT}    /store/order/{orderId}
${POST_USER_ENDPOINT}    /user

# Test Data - Pet IDs
${VALID_PET_ID}    1
${INVALID_PET_ID}    999999
${NON_EXISTENT_PET_ID}    0

# Test Data - Order IDs
${VALID_ORDER_ID}    1
${INVALID_ORDER_ID}    999999
${NON_EXISTENT_ORDER_ID}    0

# Test Data - User
${TEST_USER_ID}    12345
${TEST_USERNAME}    testuser
${TEST_FIRST_NAME}    Test
${TEST_LAST_NAME}    User
${TEST_EMAIL}    testuser@example.com
${TEST_PASSWORD}    password123
${TEST_PHONE}    +1234567890
${TEST_USER_STATUS}    1

# Status Codes
${STATUS_200}    200
${STATUS_201}    201
${STATUS_400}    400
${STATUS_404}    404

