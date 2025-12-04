# Task 2: Design Defect Template

## Defect Report

### Defect ID
**DEF-2024-001**

### Defect Title
Application Login Failure - Cannot Login with Correct Credentials

### Severity
**High**

### Priority
**High**

### Status
**New / Open**

### Environment
- **Application Name:** Mobile Banking Application
- **Application Version:** 2.1.0
- **Platform:** Android / iOS
- **OS Version:** Android 12 / iOS 15.0
- **Device:** [Device Model]
- **Build Number:** Build_2024_01_15

### Reported By
**Name:** [Tester Name]  
**Date:** [Date of Discovery]  
**Time:** [Time of Discovery]

### Description
The application cannot login to the system even though entering username and password are correct.

### Steps to Reproduce
1. Launch the mobile banking application
2. Navigate to the login screen
3. Enter a valid username in the username field
4. Enter the corresponding valid password in the password field
5. Tap on the "Login" button
6. Observe the application behavior

### Actual Result
The application cannot login to the system even though entering username and password are correct. The user remains on the login screen or receives an error message indicating login failure, despite providing valid credentials.

**Error Message (if any):** [Error message displayed, e.g., "Invalid credentials" or "Login failed"]

**Additional Observations:**
- Login button may be disabled after first attempt
- No error message is displayed in some cases
- Application may freeze or become unresponsive
- Network request may fail or timeout

### Expected Result
The application should successfully authenticate the user with valid credentials and navigate to the home screen or main dashboard of the application.

**Expected Behavior:**
- User should be logged in successfully
- User should be redirected to the home screen/main dashboard
- User session should be established
- User profile information should be loaded

### Attachments
- **Screenshot 1:** Login screen with entered credentials
- **Screenshot 2:** Error message displayed (if any)
- **Screenshot 3:** Application state after failed login attempt
- **Video:** Screen recording of the login attempt
- **Log Files:** Application logs and network logs (if available)

### Impact
**High Impact:**
- Users cannot access the application
- Core functionality is blocked
- Affects all users attempting to login
- Business critical feature is non-functional

### Workaround
**Temporary Workaround (if available):**
- Clear application cache and data, then retry login
- Uninstall and reinstall the application
- Use alternative login method (if available, e.g., biometric login)
- Access via web application (if available)

**Note:** Workaround may not be available or may not resolve the issue.

### Additional Information

#### Test Data Used:
- **Username:** [Test username used]
- **Password:** [Test password used]
- **Account Type:** [e.g., Personal/Savings/Current]

#### Network Conditions:
- **Connection Type:** WiFi / Mobile Data / Both
- **Network Status:** Connected / Intermittent / Offline

#### Frequency:
- **Reproducibility:** 100% / Intermittent / Rare
- **Occurrence:** Every time / Sometimes / Once

#### Affected Users:
- All users / Specific user groups / Specific devices

#### Related Issues:
- **Related Defect ID:** [If related to other defects]
- **Related Feature:** Authentication / Login Module

### Developer Notes
[To be filled by developer]

### QA Notes
[Additional notes from QA team]

### Resolution Details
[To be filled when defect is resolved]

---

## Defect Lifecycle

### Status History:
- **New:** [Date] - Defect reported
- **Assigned:** [Date] - Assigned to developer
- **In Progress:** [Date] - Developer working on fix
- **Fixed:** [Date] - Fix implemented
- **Retest:** [Date] - QA retesting
- **Closed:** [Date] - Defect verified and closed

### Assignee
**Developer:** [Developer Name]  
**QA Lead:** [QA Lead Name]

### Resolution
[To be filled when resolved]

---

## Additional Defect Template Fields (Optional)

### Defect Category
- **Type:** Functional / UI/UX / Performance / Security / Compatibility
- **Module:** Authentication / Login / User Management
- **Component:** Login Screen / Authentication Service / API Integration

### Test Case Reference
- **Test Case ID:** TC_AUTH_001
- **Test Case Name:** Verify Login with Valid Credentials

### Regression
- **Is Regression:** Yes / No
- **Previously Working Version:** [Version number]

### Root Cause Analysis
[To be filled during investigation]

### Fix Details
[To be filled when fix is implemented]

### Verification Steps
[To be filled for retesting]

---

## Notes

1. **Severity Levels:**
   - **Critical:** System crash, data loss, security breach
   - **High:** Major functionality blocked, cannot proceed
   - **Medium:** Functionality impaired but workaround available
   - **Low:** Minor issue, cosmetic problem

2. **Priority Levels:**
   - **High:** Must be fixed immediately
   - **Medium:** Should be fixed in current release
   - **Low:** Can be fixed in future release

3. **This defect template follows standard defect reporting practices and can be adapted to your organization's defect tracking system (Jira, Bugzilla, Azure DevOps, etc.)**

