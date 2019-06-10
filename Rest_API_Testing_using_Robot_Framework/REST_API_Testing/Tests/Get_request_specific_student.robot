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


*** Test Cases ***
Get request for specific student
    Create Session    session    ${BASE_URL} 
    ${response}    Get Request    session    ${GET_USERS_URI}
    Log    ${response.status_code}
    Log    ${response.content}
    ${json_response}    To Json    ${response.content}    
    @{first_name_list}    Get Value From Json    ${json_response}    $.data[0].first_name
    ${first_name}    Get From List    ${first_name_list}    0
    Should Be Equal    ${first_name}    ${expected_first_name}
    @{lastname_list}    Get Value From Json    ${json_response}    $.data[0].last_name
    ${lastname}    Get From List    ${lastname_list}    0   
    Should Be Equal    ${lastname}    ${expectes_last_name}                            
