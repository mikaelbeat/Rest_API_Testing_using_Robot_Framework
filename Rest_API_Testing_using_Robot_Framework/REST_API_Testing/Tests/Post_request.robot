*** Settings ***
Library    RequestsLibrary    
Library    JSONLibrary    
Library    Collections
Library    OperatingSystem        
Resource    ../Resources/Common_variables.robot
Resource    ../Resources/Common_keywords.robot
Test Setup    Create connection


*** Variables ***
${request}    Post_request.json
&{header}    Content-Type=application/json
${response_file}    Post_response.json


*** Keywords ***    
Get and send request
    ${request_body}    Get Binary File    ${REQUESTS_FOLDER}/${request}
    &{header}    Create Dictionary    Content-Type=application/json    #${header}
    ${response}    Post Request    session    ${POST_URI}    ${request_body}
    Set Suite Variable    ${response}    ${response}
    
Validate and log response
    Log    ${response.content}
    Should Be Equal As Strings    ${response.status_code}    201    
    Should Contain    ${response.text}    createdAt  
    Should Contain    ${response.text}    id  
    
Save response to file
    ${pretty_printed_response}    To Json    ${response.text}    true
    Create Binary File    ${RESPONSES_FOLDER}/${response_file}    ${pretty_printed_response} 


*** Test Cases ***
Validate POST request
        Get and send request
        Validate and log response
        Save response to file    