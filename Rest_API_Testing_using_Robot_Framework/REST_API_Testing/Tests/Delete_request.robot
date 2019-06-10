*** Settings ***
Library    RequestsLibrary    
Library    JSONLibrary    
Library    Collections
Resource    ../Resources/Common_variables.robot    


*** Test Cases ***
Delete request
    Create Session    session    ${BASE_URL}
    ${response}    Delete Request    session    ${DELETE_URI}
    ${code}    Convert To String    ${response.status_code}
    Should Be Equal    ${code}    204    
    Log    ${response.content}            