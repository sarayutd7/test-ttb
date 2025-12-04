*** Variables ***
# Base URL
${BASE_URL}    https://reqres.in/api

# API Endpoints
${USER_PROFILE_ENDPOINT}    /users

# Test Data - User ID
${EXISTING_USER_ID}    12
${NON_EXISTING_USER_ID}    1234

# Expected Data for User ID 12
${EXPECTED_USER_ID}    12
${EXPECTED_EMAIL}    rachel.howell@reqres.in
${EXPECTED_FIRST_NAME}    Rachel
${EXPECTED_LAST_NAME}    Howell
${EXPECTED_AVATAR}    https://reqres.in/img/faces/12-image.jpg

# Status Codes
${STATUS_200}    200
${STATUS_404}    404

