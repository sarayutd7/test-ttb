*** Settings ***
Library    AppiumLibrary

*** Keywords ***
Open Minimal Todo App
    [Documentation]    Opens the Minimal Todo application
    Open Application    ${APPIUM_SERVER_URL}
    ...    platformName=${PLATFORM_NAME}
    ...    platformVersion=${PLATFORM_VERSION}
    ...    deviceName=${DEVICE_NAME}
    ...    automationName=${AUTOMATION_NAME}
    ...    appPackage=${APP_PACKAGE}
    ...    appActivity=${APP_ACTIVITY}
    ...    noReset=true
    
    Wait Until Page Contains Element    id=com.avjindersinghsekhon.minimaltodo:id/addToDoItemFAB    timeout=${MEDIUM_TIMEOUT}

Close Minimal Todo App
    [Documentation]    Closes the Minimal Todo application
    Close Application

Add New Todo Item
    [Arguments]    ${todo_text}
    [Documentation]    Adds a new todo item with the given text
    Click Element    id=com.avjindersinghsekhon.minimaltodo:id/addToDoItemFAB
    Wait Until Page Contains Element    id=com.avjindersinghsekhon.minimaltodo:id/userToDoEditText    timeout=${SHORT_TIMEOUT}
    Input Text    id=com.avjindersinghsekhon.minimaltodo:id/userToDoEditText    ${todo_text}
    Click Element    id=com.avjindersinghsekhon.minimaltodo:id/makeToDoFloatingActionButton
    Wait Until Page Contains    ${todo_text}    timeout=${SHORT_TIMEOUT}

Edit Todo Item
    [Arguments]    ${old_text}    ${new_text}
    [Documentation]    Edits an existing todo item
    Long Press    xpath=//android.widget.TextView[@text='${old_text}']
    Wait Until Page Contains Element    id=com.avjindersinghsekhon.minimaltodo:id/userToDoEditText    timeout=${SHORT_TIMEOUT}
    Clear Text    id=com.avjindersinghsekhon.minimaltodo:id/userToDoEditText
    Input Text    id=com.avjindersinghsekhon.minimaltodo:id/userToDoEditText    ${new_text}
    Click Element    id=com.avjindersinghsekhon.minimaltodo:id/makeToDoFloatingActionButton
    Wait Until Page Contains    ${new_text}    timeout=${SHORT_TIMEOUT}

Delete Todo Item
    [Arguments]    ${todo_text}
    [Documentation]    Deletes a todo item by swiping
    Swipe    xpath=//android.widget.TextView[@text='${todo_text}']    1000    0    500    0
    Wait Until Page Does Not Contain    ${todo_text}    timeout=${SHORT_TIMEOUT}

Mark Todo As Complete
    [Arguments]    ${todo_text}
    [Documentation]    Marks a todo item as complete
    Click Element    xpath=//android.widget.TextView[@text='${todo_text}']/../android.widget.CheckBox
    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text='${todo_text}' and @checked='true']    timeout=${SHORT_TIMEOUT}

Verify Todo Item Exists
    [Arguments]    ${todo_text}
    [Documentation]    Verifies that a todo item exists on the screen
    Page Should Contain    ${todo_text}

Verify Todo Item Does Not Exist
    [Arguments]    ${todo_text}
    [Documentation]    Verifies that a todo item does not exist on the screen
    Page Should Not Contain    ${todo_text}

Clear All Todos
    [Documentation]    Clears all todo items (if there's a clear all option)
    # This keyword can be customized based on app features
    ${todo_count}=    Get Matching Xpath Count    xpath=//android.widget.TextView[contains(@resource-id,'todo')]
    FOR    ${i}    IN RANGE    ${todo_count}
        Swipe    500    500    1000    0
        Sleep    1s
    END

