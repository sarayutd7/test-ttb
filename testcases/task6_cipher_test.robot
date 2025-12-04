*** Settings ***
Documentation    Task 6: Simple Cipher - Decryption test automation
Library    Collections
Resource    ../resources/testdata/cipher_variables.robot

*** Keywords ***
Decrypt Cipher
    [Arguments]    ${encrypted}    ${k}
    [Documentation]    Decrypts encrypted string using simple cipher
    ${result}=    Evaluate    __import__('sys').path.insert(0, __import__('os').path.join(__import__('os').path.dirname(__import__('os').path.dirname(__import__('os').path.abspath('${CURDIR}'))), 'resources', 'lib')) or __import__('simple_cipher').simple_cipher('${encrypted}', ${k})
    [Return]    ${result}

*** Test Cases ***
TC01 - Decrypt VTAOG With K=2 Should Return TRYME
    [Documentation]    Verify that decrypting 'VTAOG' with k=2 returns 'TRYME'
    [Tags]    task6    cipher    positive    example
    
    ${result}=    Decrypt Cipher    ${ENCRYPTED_1}    ${K_VALUE_1}
    Should Be Equal    ${result}    ${EXPECTED_DECRYPTED_1}
    Log    Encrypted: ${ENCRYPTED_1}, K: ${K_VALUE_1}, Decrypted: ${result}    level=INFO

TC02 - Decrypt ABC With K=1 Should Return ZAB
    [Documentation]    Verify that decrypting 'ABC' with k=1 returns 'ZAB'
    [Tags]    task6    cipher    positive
    
    ${result}=    Decrypt Cipher    ${ENCRYPTED_2}    ${K_VALUE_2}
    Should Be Equal    ${result}    ${EXPECTED_DECRYPTED_2}
    Log    Encrypted: ${ENCRYPTED_2}, K: ${K_VALUE_2}, Decrypted: ${result}    level=INFO

TC03 - Decrypt XYZ With K=3 Should Return UVW
    [Documentation]    Verify that decrypting 'XYZ' with k=3 returns 'UVW'
    [Tags]    task6    cipher    positive
    
    ${result}=    Decrypt Cipher    ${ENCRYPTED_3}    ${K_VALUE_3}
    Should Be Equal    ${result}    ${EXPECTED_DECRYPTED_3}
    Log    Encrypted: ${ENCRYPTED_3}, K: ${K_VALUE_3}, Decrypted: ${result}    level=INFO

TC04 - Decrypt HELLO With K=5 Should Return CZGGJ
    [Documentation]    Verify that decrypting 'HELLO' with k=5 returns 'CZGGJ'
    [Tags]    task6    cipher    positive
    
    ${result}=    Decrypt Cipher    ${ENCRYPTED_4}    ${K_VALUE_4}
    Should Be Equal    ${result}    ${EXPECTED_DECRYPTED_4}
    Log    Encrypted: ${ENCRYPTED_4}, K: ${K_VALUE_4}, Decrypted: ${result}    level=INFO

TC05 - Decrypt Single Character A With K=26 Should Return A
    [Documentation]    Verify that decrypting 'A' with k=26 (full rotation) returns 'A'
    [Tags]    task6    cipher    positive    edge_case
    
    ${result}=    Decrypt Cipher    ${ENCRYPTED_5}    ${K_VALUE_5}
    Should Be Equal    ${result}    ${EXPECTED_DECRYPTED_5}
    Log    Encrypted: ${ENCRYPTED_5}, K: ${K_VALUE_5}, Decrypted: ${result}    level=INFO

TC06 - Decrypt Z With K=1 Should Return Y
    [Documentation]    Verify that decrypting 'Z' with k=1 returns 'Y'
    [Tags]    task6    cipher    positive    edge_case
    
    ${result}=    Decrypt Cipher    ${ENCRYPTED_6}    ${K_VALUE_6}
    Should Be Equal    ${result}    ${EXPECTED_DECRYPTED_6}
    Log    Encrypted: ${ENCRYPTED_6}, K: ${K_VALUE_6}, Decrypted: ${result}    level=INFO

TC07 - Decrypt Empty String Should Return Empty String
    [Documentation]    Verify that decrypting empty string returns empty string
    [Tags]    task6    cipher    edge_case    empty
    
    ${result}=    Decrypt Cipher    ${EMPTY_STRING}    ${K_VALUE_1}
    Should Be Equal    ${result}    ${EMPTY_STRING}
    Log    Empty string decryption result: '${result}'    level=INFO

TC08 - Decrypt With K=0 Should Return Same String
    [Documentation]    Verify that decrypting with k=0 returns the same string
    [Tags]    task6    cipher    edge_case    zero_shift
    
    ${result}=    Decrypt Cipher    ${ENCRYPTED_1}    ${K_VALUE_ZERO}
    Should Be Equal    ${result}    ${ENCRYPTED_1}
    Log    Encrypted: ${ENCRYPTED_1}, K: ${K_VALUE_ZERO}, Decrypted: ${result}    level=INFO

TC09 - Decrypt With Large K Value Should Handle Wrapping
    [Documentation]    Verify that decrypting with large k value handles wrapping correctly
    [Tags]    task6    cipher    positive    large_k
    
    ${result}=    Decrypt Cipher    ${ENCRYPTED_1}    ${53}
    # k=53 is equivalent to k=1 (53 % 26 = 1)
    ${expected}=    Decrypt Cipher    ${ENCRYPTED_1}    ${1}
    Should Be Equal    ${result}    ${expected}
    Log    Large K value (53) handled correctly: ${result}    level=INFO

TC10 - Decrypt Multiple Characters With Various K Values
    [Documentation]    Verify decryption works correctly for multiple test cases
    [Tags]    task6    cipher    positive    multiple
    
    # Test case 1
    ${result1}=    Decrypt Cipher    VTAOG    ${2}
    Should Be Equal    ${result1}    TRYME
    
    # Test case 2
    ${result2}=    Decrypt Cipher    ABC    ${1}
    Should Be Equal    ${result2}    ZAB
    
    # Test case 3
    ${result3}=    Decrypt Cipher    HELLO    ${5}
    Should Be Equal    ${result3}    CZGGJ
    
    Log    All multiple test cases passed    level=INFO

