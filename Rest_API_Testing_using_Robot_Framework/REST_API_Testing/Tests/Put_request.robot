*** Settings ***
Library    RequestsLibrary    
Library    JSONLibrary    
Library    Collections
Library    OperatingSystem        
Resource    ../Resources/Common_variables.robot

*** Variables ***
${request_file}    Put_request.json
${request_folder}    Requests
${response_folder}    Response
${response_file}    Put_response.json
&{header}    Content-Type=application/json

*** Test Cases ***
Create new user 
    Create Session    session    ${BASE_URL} 
    ${request_body}    Get Binary File    ${request_folder}/${request_file}
    &{header}    Create Dictionary    Content-Type=application/json    #${header}
    ${response}    Put Request    session    ${PUT_URI}    ${request_body}
    Log    ${response.content}
    Should Be Equal As Strings    ${response.status_code}    200    
    Should Contain    ${response.text}    updatedAt       
    ${pretty_printed_response}    To Json    ${response.text}    true
    Create Binary File    ${response_folder}/Put_response.json    ${pretty_printed_response}           
       