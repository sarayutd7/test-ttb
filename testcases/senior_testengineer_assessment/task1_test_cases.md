# Task 1: Design Test Cases - Money Transfer Feature

## Title: Money Transfer Feature in a Mobile Banking Application Workflow

## Test Cases

### Test Case 1: Transfer to Own Account - Valid Transaction
**Test Case ID:** TC_MB_001  
**Test Case Name:** Transfer to Own Account - Valid Transaction Data  
**Priority:** High  
**Precondition:** 
- User is logged into the mobile banking application
- User has at least two accounts
- User has sufficient balance in the source account

**Test Steps:**
1. Navigate to Home Screen
2. Tap on "Transfer" option
3. Select "Transfer to Own Account"
4. Select "From" account from dropdown
5. Select "To" account from dropdown
6. Enter valid amount (less than available balance)
7. Tap "Continue" or "Next" button
8. Review transaction details
9. Tap "Confirm" button

**Expected Result:**
- Transaction is completed successfully
- Success message is displayed
- Transaction is reflected in account balance
- Transaction history is updated

---

### Test Case 2: Transfer to Own Account - Invalid Amount (Exceeds Balance)
**Test Case ID:** TC_MB_002  
**Test Case Name:** Transfer to Own Account - Amount Exceeds Available Balance  
**Priority:** High  
**Precondition:** 
- User is logged into the mobile banking application
- User has at least two accounts
- User has limited balance in the source account

**Test Steps:**
1. Navigate to Home Screen
2. Tap on "Transfer" option
3. Select "Transfer to Own Account"
4. Select "From" account from dropdown
5. Select "To" account from dropdown
6. Enter amount greater than available balance
7. Tap "Continue" or "Next" button

**Expected Result:**
- Inline error message is displayed: "Insufficient balance" or similar
- User cannot proceed to confirmation screen
- Error message is displayed near the amount field

---

### Test Case 3: Transfer to Own Account - Missing Required Fields
**Test Case ID:** TC_MB_003  
**Test Case Name:** Transfer to Own Account - Missing Required Fields  
**Priority:** Medium  
**Precondition:** 
- User is logged into the mobile banking application
- User has at least two accounts

**Test Steps:**
1. Navigate to Home Screen
2. Tap on "Transfer" option
3. Select "Transfer to Own Account"
4. Leave "From" account empty or leave "To" account empty or leave amount empty
5. Tap "Continue" or "Next" button

**Expected Result:**
- Inline error message is displayed for each missing field
- Error messages indicate which fields are required
- User cannot proceed to confirmation screen

---

### Test Case 4: Transfer to Other Account - Valid Transaction
**Test Case ID:** TC_MB_004  
**Test Case Name:** Transfer to Other Account - Valid Transaction Data  
**Priority:** High  
**Precondition:** 
- User is logged into the mobile banking application
- User has sufficient balance in the source account
- User knows valid Citizen ID of recipient

**Test Steps:**
1. Navigate to Home Screen
2. Tap on "Transfer" option
3. Select "Transfer to Other Account"
4. Enter valid Citizen ID
5. Enter valid amount (less than available balance)
6. Tap "Continue" or "Next" button
7. Review transaction details
8. Tap "Confirm" button

**Expected Result:**
- Transaction is completed successfully
- Success message is displayed
- Transaction is reflected in account balance
- Transaction history is updated

---

### Test Case 5: Transfer to Other Account - Invalid Citizen ID
**Test Case ID:** TC_MB_005  
**Test Case Name:** Transfer to Other Account - Invalid Citizen ID Format  
**Priority:** High  
**Precondition:** 
- User is logged into the mobile banking application
- User has sufficient balance in the source account

**Test Steps:**
1. Navigate to Home Screen
2. Tap on "Transfer" option
3. Select "Transfer to Other Account"
4. Enter invalid Citizen ID (wrong format or non-existent)
5. Enter valid amount
6. Tap "Continue" or "Next" button

**Expected Result:**
- Inline error message is displayed: "Invalid Citizen ID" or similar
- User cannot proceed to confirmation screen
- Error message is displayed near the Citizen ID field

---

### Test Case 6: Transfer to Other Account - Invalid Amount Validation
**Test Case ID:** TC_MB_006  
**Test Case Name:** Transfer to Other Account - Amount Validation Error  
**Priority:** High  
**Precondition:** 
- User is logged into the mobile banking application
- User has limited balance in the source account

**Test Steps:**
1. Navigate to Home Screen
2. Tap on "Transfer" option
3. Select "Transfer to Other Account"
4. Enter valid Citizen ID
5. Enter amount greater than available balance
6. Tap "Continue" or "Next" button

**Expected Result:**
- Inline error message is displayed: "Insufficient balance" or similar
- User cannot proceed to confirmation screen

---

### Test Case 7: Transfer to PromptPay (Citizen ID) - Valid Transaction
**Test Case ID:** TC_MB_007  
**Test Case Name:** Transfer to PromptPay via Citizen ID - Valid Transaction  
**Priority:** High  
**Precondition:** 
- User is logged into the mobile banking application
- User has sufficient balance in the source account
- User knows valid Citizen ID registered with PromptPay

**Test Steps:**
1. Navigate to Home Screen
2. Tap on "Transfer" option
3. Select "Transfer to PromptPay (Citizen ID/ Mobile Phone)"
4. Select "Citizen ID" option
5. Enter valid Citizen ID
6. Enter valid amount (less than available balance)
7. Tap "Continue" or "Next" button
8. Review transaction details
9. Tap "Confirm" button

**Expected Result:**
- Transaction is completed successfully
- Success message is displayed
- Transaction is reflected in account balance
- Transaction history is updated

---

### Test Case 8: Transfer to PromptPay (Mobile Phone) - Valid Transaction
**Test Case ID:** TC_MB_008  
**Test Case Name:** Transfer to PromptPay via Mobile Phone - Valid Transaction  
**Priority:** High  
**Precondition:** 
- User is logged into the mobile banking application
- User has sufficient balance in the source account
- User knows valid mobile phone number registered with PromptPay

**Test Steps:**
1. Navigate to Home Screen
2. Tap on "Transfer" option
3. Select "Transfer to PromptPay (Citizen ID/ Mobile Phone)"
4. Select "Mobile Phone" option
5. Enter valid mobile phone number
6. Enter valid amount (less than available balance)
7. Tap "Continue" or "Next" button
8. Review transaction details
9. Tap "Confirm" button

**Expected Result:**
- Transaction is completed successfully
- Success message is displayed
- Transaction is reflected in account balance
- Transaction history is updated

---

### Test Case 9: Transfer to PromptPay - Invalid Citizen ID
**Test Case ID:** TC_MB_009  
**Test Case Name:** Transfer to PromptPay - Invalid Citizen ID  
**Priority:** Medium  
**Precondition:** 
- User is logged into the mobile banking application
- User has sufficient balance in the source account

**Test Steps:**
1. Navigate to Home Screen
2. Tap on "Transfer" option
3. Select "Transfer to PromptPay (Citizen ID/ Mobile Phone)"
4. Select "Citizen ID" option
5. Enter invalid Citizen ID (wrong format or not registered with PromptPay)
6. Enter valid amount
7. Tap "Continue" or "Next" button

**Expected Result:**
- Inline error message is displayed: "Invalid Citizen ID" or "Citizen ID not registered with PromptPay"
- User cannot proceed to confirmation screen

---

### Test Case 10: Transfer to PromptPay - Invalid Mobile Phone Number
**Test Case ID:** TC_MB_010  
**Test Case Name:** Transfer to PromptPay - Invalid Mobile Phone Number  
**Priority:** Medium  
**Precondition:** 
- User is logged into the mobile banking application
- User has sufficient balance in the source account

**Test Steps:**
1. Navigate to Home Screen
2. Tap on "Transfer" option
3. Select "Transfer to PromptPay (Citizen ID/ Mobile Phone)"
4. Select "Mobile Phone" option
5. Enter invalid mobile phone number (wrong format or not registered with PromptPay)
6. Enter valid amount
7. Tap "Continue" or "Next" button

**Expected Result:**
- Inline error message is displayed: "Invalid mobile phone number" or "Phone number not registered with PromptPay"
- User cannot proceed to confirmation screen

---

### Test Case 11: Transaction Validation - Insufficient Balance at Confirmation
**Test Case ID:** TC_MB_011  
**Test Case Name:** Transaction Validation - Insufficient Balance at Confirmation Screen  
**Priority:** High  
**Precondition:** 
- User is logged into the mobile banking application
- User has sufficient balance initially
- Balance becomes insufficient between entering details and confirmation (e.g., another transaction occurred)

**Test Steps:**
1. Navigate to Home Screen
2. Tap on "Transfer" option
3. Select any transfer method
4. Enter valid transaction details
5. Tap "Continue" or "Next" button
6. On confirmation screen, tap "Confirm" button
7. (Balance becomes insufficient at this point)

**Expected Result:**
- Bottom sheet error message is displayed: "Insufficient balance" or similar
- Transaction is not completed
- User is returned to transaction details screen or home screen

---

### Test Case 12: Transaction Validation - Account Status Changed
**Test Case ID:** TC_MB_012  
**Test Case Name:** Transaction Validation - Account Status Changed at Confirmation  
**Priority:** Medium  
**Precondition:** 
- User is logged into the mobile banking application
- User has active account
- Account status changes between entering details and confirmation

**Test Steps:**
1. Navigate to Home Screen
2. Tap on "Transfer" option
3. Select any transfer method
4. Enter valid transaction details
5. Tap "Continue" or "Next" button
6. On confirmation screen, tap "Confirm" button
7. (Account status changes to inactive/frozen at this point)

**Expected Result:**
- Bottom sheet error message is displayed: "Account is inactive" or "Transaction cannot be processed" or similar
- Transaction is not completed
- User is informed about the account status

---

### Test Case 13: Transaction Validation - Network Error at Confirmation
**Test Case ID:** TC_MB_013  
**Test Case Name:** Transaction Validation - Network Error During Confirmation  
**Priority:** Medium  
**Precondition:** 
- User is logged into the mobile banking application
- User has valid transaction details entered

**Test Steps:**
1. Navigate to Home Screen
2. Tap on "Transfer" option
3. Select any transfer method
4. Enter valid transaction details
5. Tap "Continue" or "Next" button
6. On confirmation screen, disable network connection
7. Tap "Confirm" button

**Expected Result:**
- Bottom sheet error message is displayed: "Network error" or "Connection failed" or similar
- Transaction is not completed
- User can retry the transaction

---

### Test Case 14: Cancel Transaction from Details Screen
**Test Case ID:** TC_MB_014  
**Test Case Name:** Cancel Transaction from Transaction Details Screen  
**Priority:** Low  
**Precondition:** 
- User is logged into the mobile banking application
- User has entered transaction details

**Test Steps:**
1. Navigate to Home Screen
2. Tap on "Transfer" option
3. Select any transfer method
4. Enter transaction details
5. Tap "Cancel" or "Back" button

**Expected Result:**
- User is returned to Home Screen
- No transaction is processed
- No changes are made to account balance

---

### Test Case 15: Cancel Transaction from Confirmation Screen
**Test Case ID:** TC_MB_015  
**Test Case Name:** Cancel Transaction from Confirmation Screen  
**Priority:** Low  
**Precondition:** 
- User is logged into the mobile banking application
- User has reached confirmation screen

**Test Steps:**
1. Navigate to Home Screen
2. Tap on "Transfer" option
3. Select any transfer method
4. Enter transaction details
5. Tap "Continue" or "Next" button
6. On confirmation screen, tap "Cancel" or "Back" button

**Expected Result:**
- User is returned to transaction details screen or Home Screen
- No transaction is processed
- No changes are made to account balance

---

## Test Coverage Summary

### Transfer Methods Covered:
- ✅ Transfer to Own Account
- ✅ Transfer to Other Account
- ✅ Transfer to PromptPay (Citizen ID)
- ✅ Transfer to PromptPay (Mobile Phone)

### Validation Scenarios Covered:
- ✅ Valid transaction data
- ✅ Invalid amount (exceeds balance)
- ✅ Missing required fields
- ✅ Invalid Citizen ID format
- ✅ Invalid mobile phone number
- ✅ Validation at confirmation screen (insufficient balance)
- ✅ Validation at confirmation screen (account status)
- ✅ Network error handling

### User Actions Covered:
- ✅ Successful transaction completion
- ✅ Error message display (inline)
- ✅ Error message display (bottom sheet)
- ✅ Transaction cancellation

---

## Notes

1. **Test Data**: All test cases assume valid test data is available in the test environment
2. **Account Setup**: Preconditions may require specific account configurations
3. **Error Messages**: Actual error messages may vary based on application implementation
4. **Validation Timing**: Some validations occur at data entry, others at confirmation
5. **Network Conditions**: Some test cases may require network manipulation tools

