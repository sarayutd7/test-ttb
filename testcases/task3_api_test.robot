*** Settings ***
Documentation    Task 3: Create automation script for test REST API GET request
Library    RequestsLibrary
Resource    ../resources/testdata/api_variables.robot

*** Test Cases ***
Get User Profile Success
    [Documentation]    To verify that the user profile API returns correct data when requesting an existing user's profile
    [Tags]    task3    api    positive
    
    # Step 1: Send a GET request to the URL
    ${response}=    GET    ${BASE_URL}${USER_PROFILE_ENDPOINT}/${EXISTING_USER_ID}
    
    # Expected Result 1: Verify the response status code should be '200'
    Status Should Be    ${STATUS_200}    ${response}
    Should Be Equal As Strings    ${response.status_code}    ${STATUS_200}
    
    # Expected Result 2: Compare the response body with expected JSON data
    ${response_body}=    Set Variable    ${response.json()}
    ${user_data}=    Set Variable    ${response_body['data']}
    
    # Verify ID
    Should Be Equal As Integers    ${user_data['id']}    ${EXPECTED_USER_ID}
    
    # Verify Email
    Should Be Equal As Strings    ${user_data['email']}    ${EXPECTED_EMAIL}
    
    # Verify First Name
    Should Be Equal As Strings    ${user_data['first_name']}    ${EXPECTED_FIRST_NAME}
    
    # Verify Last Name
    Should Be Equal As Strings    ${user_data['last_name']}    ${EXPECTED_LAST_NAME}
    
    # Verify Avatar
    Should Be Equal As Strings    ${user_data['avatar']}    ${EXPECTED_AVATAR}
    
    Log    User Profile Data: ${user_data}    level=INFO

Get User Profile But User Not Found
    [Documentation]    To verify that the user profile API returns a '404 not found' status when requesting a non-existent user's profile
    [Tags]    task3    api    negative
    
    # Step 1: Send a GET request to the URL
    ${response}=    GET    ${BASE_URL}${USER_PROFILE_ENDPOINT}/${NON_EXISTING_USER_ID}
    
    # Expected Result 1: Verify the response status code should be '404'
    Status Should Be    ${STATUS_404}    ${response}
    Should Be Equal As Strings    ${response.status_code}    ${STATUS_404}
    
    # Expected Result 2: The response body should be an empty JSON object: {}
    ${response_body}=    Set Variable    ${response.json()}
    ${empty_dict}=    Evaluate    {}
    Should Be Equal    ${response_body}    ${empty_dict}
    
    Log    Response Body: ${response_body}    level=INFO

