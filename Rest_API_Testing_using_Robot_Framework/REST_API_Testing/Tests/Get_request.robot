*** Settings ***
Library    RequestsLibrary    
Library    OperatingSystem    
Library    DiffLibrary
Resource    ../Resources/Common_variables.robot


*** Variables ***
${response_file}    get_response.json    
${expected_file}    expected_response.json


*** Keywords ***
Create connection
    Create Session    session    ${BASE_URL} 
    
Send request and validate status code
    ${response}    Get Request    session    ${GET_USERS_URI}
    Log    ${response.status_code}
    Log    ${response.content}
    Should Be Equal As Strings    ${response.status_code}    200
    Set Suite Variable    ${response}    ${response}    
    
Save response to file
    ${pretty_printed_response}    To Json    ${response.text}    true  
    Create Binary File    ${RESPONSES_FOLDER}/${response_file}     ${pretty_printed_response} 
    
Validate response
    ${response}    Get File    ${RESPONSES_FOLDER}/${response_file}    encoding=UTF-8    
    ${expected}    Get File    ${EXPECTED_FOLDER}/${expected_file}    encoding=UTF-8     
    Diff Outputs    ${response}    ${expected} 


*** Test Cases ***
Validate GET Request
    Create connection
    Send request and validate status code
    Save response to file
    Validate response