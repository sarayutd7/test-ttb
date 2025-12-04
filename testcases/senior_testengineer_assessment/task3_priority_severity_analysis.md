# Task 3: Priority and Severity Analysis

## Question: What is level of priority and severity for this case and why you choose it?

## Defect Information

### Process Title
**Transfer to other bank process**

### Steps to Reproduce
1. Select other bank to transfer
2. Enter ref1 and amount > click 'Next'
3. Review screen > click 'Next'
4. Enter PIN

### Actual Result
- After enter PIN, customer get error message for incorrect PIN while he/her make sure PIN is correct.
- After attempt 3 times, still not able pass this process and PIN is locked

### Expected Result
The system should be able to transfer successful.

---

## Priority and Severity Analysis

### Severity: **HIGH**

#### Reason for High Severity:

1. **Core Functionality Blocked**
   - The transfer to other bank process is a critical business function in banking applications
   - Users cannot complete a fundamental banking transaction
   - This directly impacts the primary purpose of the application

2. **User Account Locked**
   - After 3 failed attempts, the PIN is locked
   - This prevents the user from accessing their account or performing any PIN-required transactions
   - User cannot use the application until PIN is unlocked (may require branch visit or customer service)

3. **Financial Impact**
   - Users cannot transfer money to other banks
   - This may cause delays in important financial transactions
   - Could result in missed payments, late fees, or other financial consequences for users

4. **User Experience Impact**
   - Users lose trust in the application when correct credentials are rejected
   - Frustration due to inability to complete a transaction they know should work
   - Negative impact on customer satisfaction and retention

5. **Security Concern**
   - If PIN validation is failing for correct PINs, there may be underlying security or data integrity issues
   - Could indicate problems with encryption, PIN storage, or validation logic

6. **Reproducibility**
   - The issue occurs consistently (3 attempts all fail)
   - Affects users who are certain their PIN is correct
   - Not a one-time occurrence but a systematic problem

---

### Priority: **HIGH**

#### Reason for High Priority:

1. **Business Critical Feature**
   - Transfer to other bank is a core banking feature
   - This is a revenue-generating and frequently used feature
   - Business operations depend on this functionality working correctly

2. **Immediate User Impact**
   - Users are currently blocked from completing transactions
   - Every day the issue remains unfixed, more users are affected
   - Customer complaints and support tickets will increase

3. **Regulatory and Compliance Risk**
   - Banking applications must function correctly for financial transactions
   - Failure to process valid transactions may have regulatory implications
   - Could violate service level agreements or banking regulations

4. **Reputation Risk**
   - Banking applications require high reliability and trust
   - This type of issue can damage the bank's reputation
   - Users may switch to competitors if core features don't work

5. **Escalation Risk**
   - PIN lockout requires customer service intervention
   - Increases support costs and workload
   - May require branch visits, which is costly for both bank and customers

6. **Data Integrity Concern**
   - If PIN validation is incorrect, there may be data corruption or synchronization issues
   - Could indicate broader system problems that need immediate attention

---

## Detailed Justification

### Why Not Medium Severity?

**Medium Severity** would be appropriate if:
- The issue had a workaround (e.g., users could use alternative method)
- Only affected non-critical features
- Did not block core functionality
- Had minimal user impact

**However, this case is HIGH because:**
- No workaround available (PIN is required)
- Blocks core banking functionality
- Results in account lockout
- High user impact and frustration

### Why Not Low Severity?

**Low Severity** would be appropriate if:
- Cosmetic issue
- Minor inconvenience
- Workaround readily available
- Affects very few users

**This is clearly not LOW because:**
- Functional issue blocking transactions
- No workaround
- Affects all users attempting this transfer
- Results in account lockout

### Why Not Critical Severity?

**Critical Severity** would be appropriate if:
- System crash or data loss
- Security breach
- Complete application failure
- Affects all users immediately

**This is HIGH (not Critical) because:**
- Application still functions for other features
- No data loss or security breach
- Affects specific transaction type, not entire system
- Users can still access other features (until PIN is locked)

---

## Impact Assessment

### User Impact: **HIGH**
- Users cannot complete bank transfers
- PIN gets locked after 3 attempts
- Requires customer service intervention to unlock
- Loss of trust and confidence in the application

### Business Impact: **HIGH**
- Revenue loss from failed transactions
- Increased customer service costs
- Potential customer churn
- Reputation damage

### Technical Impact: **HIGH**
- Indicates potential issues with:
  - PIN validation logic
  - PIN encryption/decryption
  - Data synchronization
  - Authentication service

---

## Recommended Actions

### Immediate Actions (High Priority):
1. **Investigate Root Cause**
   - Check PIN validation logic
   - Verify PIN encryption/decryption process
   - Review authentication service logs
   - Check for data synchronization issues

2. **Implement Temporary Fix (if possible)**
   - Increase PIN attempt limit temporarily
   - Add bypass mechanism for affected users
   - Provide customer service with unlock tools

3. **Communication**
   - Notify affected users
   - Provide alternative transfer methods
   - Update customer service team

### Long-term Actions:
1. **Fix Root Cause**
   - Correct PIN validation logic
   - Fix any encryption/decryption issues
   - Ensure data synchronization

2. **Prevention**
   - Add comprehensive testing for PIN validation
   - Implement better error handling
   - Add monitoring and alerting

3. **Testing**
   - Regression testing for all PIN-related features
   - Integration testing for transfer processes
   - User acceptance testing

---

## Summary

| Aspect | Level | Justification |
|--------|-------|--------------|
| **Severity** | **HIGH** | Blocks core functionality, causes account lockout, high user impact, potential security concern |
| **Priority** | **HIGH** | Business critical feature, immediate user impact, regulatory risk, reputation risk, escalation risk |
| **User Impact** | **HIGH** | Cannot complete transactions, PIN locked, requires support intervention |
| **Business Impact** | **HIGH** | Revenue loss, increased support costs, customer churn risk |
| **Technical Impact** | **HIGH** | Indicates potential system-level issues with authentication |

### Conclusion

This defect should be classified as **HIGH Severity** and **HIGH Priority** because it:
- Blocks a core banking functionality
- Results in user account lockout
- Has significant business and user impact
- Indicates potential technical issues requiring immediate investigation
- Requires urgent resolution to restore user trust and business operations

The issue should be escalated to the development team immediately and fixed in the next release or hotfix, depending on the release schedule and fix complexity.

