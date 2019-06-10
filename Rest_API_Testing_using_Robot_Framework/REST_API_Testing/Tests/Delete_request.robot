*** Settings ***
Library    RequestsLibrary    
Library    JSONLibrary    
Library    Collections
Resource    ../Resources/Common_variables.robot    


*** Keywords ***
Create connection
  Create Session    session    ${BASE_URL}  

Send request and validate status code
     ${response}    Delete Request    session    ${DELETE_URI}
    ${code}    Convert To String    ${response.status_code}
    Should Be Equal    ${code}    204    
    Log    ${response.content}


*** Test Cases ***
Validate DELETE Request
    Create connection
    Send request and validate status code
               