*** Settings ***
Documentation    Task 1: Check duplicate items from list A and list B and append to a new list
Library    Collections
Resource    ../resources/testdata/test_variables.robot

*** Test Cases ***
Find Duplicate Items From List A And List B
    [Documentation]    Check duplicate items from list A and list B and append to a new list
    [Tags]    task1
    
    # Log the input lists
    Log    List A: @{LIST_A}    level=INFO
    Log    List B: @{LIST_B}    level=INFO
    
    # Method 1: Loop through List A and check if item exists in List B
    # Create a new list to store duplicates
    @{duplicate_list}=    Create List
    
    FOR    ${item}    IN    @{LIST_A}
        ${exists}=    Run Keyword And Return Status    List Should Contain Value    ${LIST_B}    ${item}
        IF    ${exists}
            Append To List    ${duplicate_list}    ${item}
        END
    END
    
    # Log the duplicate items found
    Log    Duplicate items found: @{duplicate_list}    level=INFO
    
    # Verify expected duplicates: [1, 2, 3, 5, 6]
    # Note: The order might be different, so we'll check the length and contents
    ${expected_duplicates}=    Create List    1    2    3    5    6
    ${duplicate_count}=    Get Length    ${duplicate_list}
    ${expected_count}=    Get Length    ${expected_duplicates}
    Should Be Equal As Integers    ${duplicate_count}    ${expected_count}
    
    # Verify each expected item exists in duplicate list
    FOR    ${expected_item}    IN    @{expected_duplicates}
        List Should Contain Value    ${duplicate_list}    ${expected_item}
    END
    
    # Method 2: Using Python set intersection (alternative approach)
    ${list_a_python}=    Evaluate    [1, 2, 3, 5, 6, 8, 9]
    ${list_b_python}=    Evaluate    [3, 2, 1, 5, 6, 0]
    ${duplicate_set}=    Evaluate    set(${list_a_python}) & set(${list_b_python})
    ${duplicate_list_method2_int}=    Evaluate    sorted(list(${duplicate_set}))
    # Convert to string list to match expected_duplicates format
    ${duplicate_list_method2}=    Evaluate    [str(x) for x in ${duplicate_list_method2_int}]
    Log    Duplicate items (method 2 - sorted): ${duplicate_list_method2}    level=INFO
    
    # Verify method 2 results match expected
    ${method2_count}=    Get Length    ${duplicate_list_method2}
    Should Be Equal As Integers    ${method2_count}    ${expected_count}
    
    FOR    ${expected_item}    IN    @{expected_duplicates}
        List Should Contain Value    ${duplicate_list_method2}    ${expected_item}
    END

