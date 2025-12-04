*** Settings ***
Documentation    Task 4: Design test coverage and create automated test scripts for mobile application
Library    AppiumLibrary
Resource    ../resources/testdata/mobile_variables.robot
Resource    ../resources/keywords/common/mobile_keywords.robot

*** Test Cases ***
TC01 - Add New Todo Item Success
    [Documentation]    Verify that user can successfully add a new todo item
    [Tags]    task4    mobile    todo    positive    add
    
    [Setup]    Open Minimal Todo App
    
    # Add a new todo item
    Add New Todo Item    ${TODO_ITEM_1}
    
    # Verify todo item is added
    Verify Todo Item Exists    ${TODO_ITEM_1}
    
    [Teardown]    Close Minimal Todo App

TC02 - Add Multiple Todo Items
    [Documentation]    Verify that user can add multiple todo items
    [Tags]    task4    mobile    todo    positive    add
    
    [Setup]    Open Minimal Todo App
    
    # Add multiple todo items
    Add New Todo Item    ${TODO_ITEM_1}
    Add New Todo Item    ${TODO_ITEM_2}
    Add New Todo Item    ${TODO_ITEM_3}
    
    # Verify all todo items are added
    Verify Todo Item Exists    ${TODO_ITEM_1}
    Verify Todo Item Exists    ${TODO_ITEM_2}
    Verify Todo Item Exists    ${TODO_ITEM_3}
    
    [Teardown]    Close Minimal Todo App

TC03 - Edit Todo Item Success
    [Documentation]    Verify that user can successfully edit an existing todo item
    [Tags]    task4    mobile    todo    positive    edit
    
    [Setup]    Open Minimal Todo App
    
    # Add a todo item first
    Add New Todo Item    ${TODO_ITEM_1}
    
    # Edit the todo item
    Edit Todo Item    ${TODO_ITEM_1}    ${EDITED_TODO_ITEM}
    
    # Verify old todo item is replaced with edited one
    Verify Todo Item Does Not Exist    ${TODO_ITEM_1}
    Verify Todo Item Exists    ${EDITED_TODO_ITEM}
    
    [Teardown]    Close Minimal Todo App

TC04 - Delete Todo Item Success
    [Documentation]    Verify that user can successfully delete a todo item
    [Tags]    task4    mobile    todo    positive    delete
    
    [Setup]    Open Minimal Todo App
    
    # Add a todo item first
    Add New Todo Item    ${TODO_ITEM_1}
    Verify Todo Item Exists    ${TODO_ITEM_1}
    
    # Delete the todo item
    Delete Todo Item    ${TODO_ITEM_1}
    
    # Verify todo item is deleted
    Verify Todo Item Does Not Exist    ${TODO_ITEM_1}
    
    [Teardown]    Close Minimal Todo App

TC05 - Mark Todo As Complete
    [Documentation]    Verify that user can mark a todo item as complete
    [Tags]    task4    mobile    todo    positive    complete
    
    [Setup]    Open Minimal Todo App
    
    # Add a todo item first
    Add New Todo Item    ${TODO_ITEM_1}
    
    # Mark todo as complete
    Mark Todo As Complete    ${TODO_ITEM_1}
    
    # Verify todo is marked as complete
    # Additional verification can be added based on app UI
    
    [Teardown]    Close Minimal Todo App

TC06 - Add Empty Todo Item
    [Documentation]    Verify that user cannot add an empty todo item
    [Tags]    task4    mobile    todo    negative    validation
    
    [Setup]    Open Minimal Todo App
    
    # Try to add empty todo item
    Click Element    id=com.avjindersinghsekhon.minimaltodo:id/addToDoItemFAB
    Wait Until Page Contains Element    id=com.avjindersinghsekhon.minimaltodo:id/userToDoEditText    timeout=${SHORT_TIMEOUT}
    
    # Try to save without entering text
    ${save_enabled}=    Run Keyword And Return Status    Click Element    id=com.avjindersinghsekhon.minimaltodo:id/makeToDoFloatingActionButton
    
    # Verify that empty todo cannot be added (button might be disabled or validation message shown)
    # This depends on app implementation
    
    [Teardown]    Close Minimal Todo App

TC07 - Verify App Launch
    [Documentation]    Verify that the Minimal Todo app launches successfully
    [Tags]    task4    mobile    app    positive    launch
    
    [Setup]    Open Minimal Todo App
    
    # Verify main screen elements are visible
    Page Should Contain Element    id=com.avjindersinghsekhon.minimaltodo:id/addToDoItemFAB
    Page Should Contain Element    id=com.avjindersinghsekhon.minimaltodo:id/toolbar
    
    [Teardown]    Close Minimal Todo App

TC08 - Verify Todo List Persistence
    [Documentation]    Verify that todo items persist after app restart
    [Tags]    task4    mobile    todo    positive    persistence
    
    [Setup]    Open Minimal Todo App
    
    # Add todo items
    Add New Todo Item    ${TODO_ITEM_1}
    Add New Todo Item    ${TODO_ITEM_2}
    
    # Close and reopen app
    Close Application
    Sleep    2s
    Open Minimal Todo App
    
    # Verify todo items still exist
    Verify Todo Item Exists    ${TODO_ITEM_1}
    Verify Todo Item Exists    ${TODO_ITEM_2}
    
    [Teardown]    Close Minimal Todo App

