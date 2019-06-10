*** Settings ***
Library    RequestsLibrary    
Library    OperatingSystem    
Library    DiffLibrary
Library    JSONLibrary
Library    Collections
Resource    ../Resources/Common_variables.robot    


*** Variables ***
${expected_first_name}    Eve
${expectes_last_name}    Holt


*** Keywords ***
Create connection
    Create Session    session    ${BASE_URL} 
    
Send request and log response
    ${response}    Get Request    session    ${GET_USERS_URI}
    Log    ${response.status_code}
    Log    ${response.content}
    Set Suite Variable    ${response}    ${response}
    
Validate response
    ${json_response}    To Json    ${response.content}    
    @{first_name_list}    Get Value From Json    ${json_response}    $.data[0].first_name
    ${first_name}    Get From List    ${first_name_list}    0
    Should Be Equal    ${first_name}    ${expected_first_name}
    @{lastname_list}    Get Value From Json    ${json_response}    $.data[0].last_name
    ${lastname}    Get From List    ${lastname_list}    0   
    Should Be Equal    ${lastname}    ${expectes_last_name} 



*** Test Cases ***
Validate GET Request for specific person
    Create connection
    Send request and log response
    Validate response

                           
