*** Settings ***
Library    RequestsLibrary    
Library    JSONLibrary    
Library    Collections    
Resource    ../Resources/Common_variables.robot
Resource    ../Resources/Common_keywords.robot
Test Setup    Create connection


*** Test Cases ***
Validate get request with parameters
    &{parameters}    Create Dictionary    value=2
    ${response}    Get Request    session    /api/users    ${parameters}
    Log    ${response.content}
    ${json_response}    To Json    ${response.content}    
    @{name_list}    Get Value From Json    ${json_response}    $.data[0].first_name     
    ${name}    Get From List    ${name_list}    0
    Should Be Equal    ${name}    George    