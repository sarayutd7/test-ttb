*** Variables ***
# Test Data - Encrypted Strings
${ENCRYPTED_1}    VTAOG
${K_VALUE_1}      ${2}
${EXPECTED_DECRYPTED_1}    TRYME

${ENCRYPTED_2}    ABC
${K_VALUE_2}      ${1}
${EXPECTED_DECRYPTED_2}    ZAB

${ENCRYPTED_3}    XYZ
${K_VALUE_3}      ${3}
${EXPECTED_DECRYPTED_3}    UVW

${ENCRYPTED_4}    HELLO
${K_VALUE_4}      ${5}
${EXPECTED_DECRYPTED_4}    CZGGJ

${ENCRYPTED_5}    A
${K_VALUE_5}      ${26}
${EXPECTED_DECRYPTED_5}    A

${ENCRYPTED_6}    Z
${K_VALUE_6}      ${1}
${EXPECTED_DECRYPTED_6}    Y

# Edge Cases
${EMPTY_STRING}    ${EMPTY}
${K_VALUE_ZERO}    ${0}

