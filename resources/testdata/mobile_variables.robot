*** Variables ***
# Appium Server Configuration
${APPIUM_SERVER_URL}    http://localhost:4723
${PLATFORM_NAME}        Android
${PLATFORM_VERSION}     11.0
${DEVICE_NAME}          Android Emulator
${AUTOMATION_NAME}      UiAutomator2
${APP_PACKAGE}          com.avjindersinghsekhon.minimaltodo
${APP_ACTIVITY}         com.avjindersinghsekhon.minimaltodo.MainActivity

# App Path (adjust based on your APK location)
${APP_PATH}             ${CURDIR}${/}..${/}..${/}apps${/}MinimalTodo.apk

# Test Data
${TODO_ITEM_1}           Test Todo Item 1
${TODO_ITEM_2}           Test Todo Item 2
${TODO_ITEM_3}           Test Todo Item 3
${EDITED_TODO_ITEM}      Edited Todo Item

# Timeouts
${SHORT_TIMEOUT}         5s
${MEDIUM_TIMEOUT}        10s
${LONG_TIMEOUT}          20s

