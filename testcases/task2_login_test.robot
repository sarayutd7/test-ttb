*** Settings ***
Documentation    Task 2: Create automation script to test website login
Library    SeleniumLibrary
Resource    ../resources/testdata/login_variables.robot

*** Test Cases ***
Login Success
    [Documentation]    To verify that users can login successfully when input a correct username and password
    [Tags]    task2    login    positive
    
    # Step 1: Open browser and go to login page
    Open Browser    ${LOGIN_URL}    browser=chrome
    Maximize Browser Window
    Page Should Contain    Login Page
    
    # Step 2: Input username and password
    Input Text    ${USERNAME_INPUT}    ${VALID_USERNAME}
    Input Text    ${PASSWORD_INPUT}    ${VALID_PASSWORD}
    Click Button    ${LOGIN_BUTTON}
    
    # Expected Result 2: Login success and message shown
    Wait Until Element Is Visible    ${FLASH_MESSAGE}    timeout=5s
    Element Should Contain    ${FLASH_MESSAGE}    ${SUCCESS_MESSAGE}
    
    # Step 3: Click the Logout button
    Click Element    ${LOGOUT_BUTTON}
    
    # Expected Result 3: Go back to Login page and logout message shown
    Wait Until Element Is Visible    ${FLASH_MESSAGE}    timeout=5s
    Element Should Contain    ${FLASH_MESSAGE}    ${LOGOUT_MESSAGE}
    Page Should Contain    Login Page
    
    [Teardown]    Close Browser

Login Failed - Password Incorrect
    [Documentation]    To verify that users can login unsuccessfully when they input a correct username but wrong password
    [Tags]    task2    login    negative
    
    # Step 1: Open browser and go to login page
    Open Browser    ${LOGIN_URL}    browser=chrome
    Maximize Browser Window
    Page Should Contain    Login Page
    
    # Step 2: Input username and incorrect password
    Input Text    ${USERNAME_INPUT}    ${VALID_USERNAME}
    Input Text    ${PASSWORD_INPUT}    ${INVALID_PASSWORD}
    Click Button    ${LOGIN_BUTTON}
    
    # Expected Result 2: Login failed and invalid password message shown
    Wait Until Element Is Visible    ${FLASH_MESSAGE}    timeout=5s
    Element Should Contain    ${FLASH_MESSAGE}    ${INVALID_PASSWORD_MESSAGE}
    Page Should Contain    Login Page
    
    [Teardown]    Close Browser

Login Failed - Username Not Found
    [Documentation]    To verify that users can login unsuccessfully when they input a username that did not exist
    [Tags]    task2    login    negative
    
    # Step 1: Open browser and go to login page
    Open Browser    ${LOGIN_URL}    browser=chrome
    Maximize Browser Window
    Page Should Contain    Login Page
    
    # Step 2: Input invalid username and password
    Input Text    ${USERNAME_INPUT}    ${INVALID_USERNAME}
    Input Text    ${PASSWORD_INPUT}    ${INVALID_PASSWORD}
    Click Button    ${LOGIN_BUTTON}
    
    # Expected Result 2: Login failed and invalid username message shown
    Wait Until Element Is Visible    ${FLASH_MESSAGE}    timeout=5s
    Element Should Contain    ${FLASH_MESSAGE}    ${INVALID_USERNAME_MESSAGE}
    Page Should Contain    Login Page
    
    [Teardown]    Close Browser

