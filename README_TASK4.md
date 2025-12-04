# Task 4: Mobile Application Test Automation

## Overview
This project contains automated test scripts for the Minimal Todo mobile application using Robot Framework and Appium.

**Source Code Repository:** https://github.com/avjinder/Minimal-Todo

## Prerequisites

### 1. Install Python
- Python 3.7 or higher

### 2. Install Required Packages
```bash
pip install robotframework
pip install robotframework-appiumlibrary
pip install Appium-Python-Client
```

### 3. Install Appium Server
```bash
npm install -g appium
```

Or download Appium Desktop from: https://github.com/appium/appium-desktop/releases

### 4. Install Android SDK
- Download and install Android Studio
- Set up Android SDK
- Set ANDROID_HOME environment variable
- Add platform-tools to PATH

### 5. Setup Android Emulator or Physical Device
- Create Android Virtual Device (AVD) or connect physical device
- Enable USB Debugging on physical device

## Project Structure

```
test/
├── resources/
│   ├── testdata/
│   │   └── mobile_variables.robot    # Appium configuration and test data
│   └── keywords/
│       └── common/
│           └── mobile_keywords.robot  # Reusable keywords
├── testcases/
│   └── task4_mobile_test.robot       # Test cases
└── apps/
    └── MinimalTodo.apk                # APK file (place here)
```

## Configuration

### Update mobile_variables.robot
Before running tests, update the following variables in `resources/testdata/mobile_variables.robot`:

- `${PLATFORM_VERSION}` - Your Android version (e.g., 11.0, 12.0)
- `${DEVICE_NAME}` - Your device/emulator name
- `${APP_PATH}` - Path to MinimalTodo.apk file

### Appium Server
Start Appium server before running tests:
```bash
appium
```

Or use Appium Desktop GUI.

## Test Cases

### Positive Test Cases
1. **TC01 - Add New Todo Item Success**
   - Verifies adding a single todo item

2. **TC02 - Add Multiple Todo Items**
   - Verifies adding multiple todo items

3. **TC03 - Edit Todo Item Success**
   - Verifies editing an existing todo item

4. **TC04 - Delete Todo Item Success**
   - Verifies deleting a todo item

5. **TC05 - Mark Todo As Complete**
   - Verifies marking todo as complete

6. **TC07 - Verify App Launch**
   - Verifies app launches successfully

7. **TC08 - Verify Todo List Persistence**
   - Verifies todo items persist after app restart

### Negative Test Cases
1. **TC06 - Add Empty Todo Item**
   - Verifies validation for empty todo items

## Running Tests

### Run All Tests
```bash
robot testcases/task4_mobile_test.robot
```

### Run Specific Test Case
```bash
robot -t "TC01 - Add New Todo Item Success" testcases/task4_mobile_test.robot
```

### Run Tests by Tag
```bash
robot --include positive testcases/task4_mobile_test.robot
robot --include negative testcases/task4_mobile_test.robot
robot --include add testcases/task4_mobile_test.robot
```

### Generate Reports
```bash
robot -d results testcases/task4_mobile_test.robot
```

## Notes

1. **Locators**: The locators in this project are based on common Android app patterns. You may need to adjust them based on the actual app implementation.

2. **APK Path**: Make sure to place the MinimalTodo.apk file in the `apps/` directory or update the `${APP_PATH}` variable.

3. **Device Configuration**: Ensure your device/emulator is running and connected before executing tests.

4. **Appium Server**: Always start Appium server before running tests.

## Troubleshooting

### Common Issues

1. **Appium Connection Error**
   - Ensure Appium server is running on port 4723
   - Check if device/emulator is connected: `adb devices`

2. **Element Not Found**
   - Use Appium Inspector to verify locators
   - Check if app package name and activity are correct

3. **APK Installation Failed**
   - Verify APK path is correct
   - Check if device has enough storage
   - Ensure device allows installation from unknown sources

## Commit to GitHub/Bitbucket

After completing the test scripts, commit them to your repository:

```bash
git add .
git commit -m "Add mobile app test automation scripts for Minimal Todo app"
git push origin main
```

