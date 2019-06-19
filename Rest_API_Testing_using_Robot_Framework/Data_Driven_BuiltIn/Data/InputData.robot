
*** Variables ***
# Configuration
${BROWSER} =  gc
${ENVIRONMENT} =  prod
&{BASE_URL}  dev=https://dev.cars.com/  qa=https://qa.cars.com/  prod=https://www.cars.com/
${LOGIN_URL} =  profile/secure/login

# Input Data
&{UNREGISTERED_USER}  Email=demo@demo.com  Password=TestPassword!  ExpectedErrorMessage=You haven't signed up yet.
&{INVALID_PASSWORD_USER}  Email=demo@demo.com  Password=a  ExpectedErrorMessage=Please double check your password.
&{BLANK_CREDENTIALS_USER}  Email=#BLANK  Password=#BLANK  ExpectedErrorMessage=Please enter your email address and password.