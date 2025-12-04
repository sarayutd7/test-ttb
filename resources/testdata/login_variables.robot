*** Variables ***
# URL
${LOGIN_URL}    http://the-internet.herokuapp.com/login

# Credentials
${VALID_USERNAME}    tomsmith
${VALID_PASSWORD}    SuperSecretPassword!
${INVALID_PASSWORD}    Password!
${INVALID_USERNAME}    tomholland

# Locators
${USERNAME_INPUT}    id:username
${PASSWORD_INPUT}    id:password
${LOGIN_BUTTON}    css:button[type='submit']
${LOGOUT_BUTTON}    css:a.button.secondary
${FLASH_MESSAGE}    id:flash

# Expected Messages
${SUCCESS_MESSAGE}    You logged into a secure area!
${LOGOUT_MESSAGE}    You logged out of a secure area!
${INVALID_PASSWORD_MESSAGE}    Your password is invalid!
${INVALID_USERNAME_MESSAGE}    Your username is invalid!

