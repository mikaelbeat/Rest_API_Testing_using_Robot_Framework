*** Settings ***
Library    RequestsLibrary    
Library    OperatingSystem    
Library    DiffLibrary


*** Variables ***
${base_url}    https://reqres.in
${uri}    /api/users?page=2
${response_folder}    Response
${expected_folder}    Expected


*** Test Cases ***
Get request
    Create Session    get_student_details    ${base_url} 
    ${response}    Get Request    get_student_details    ${uri}
    Log    ${response.status_code}
    Log    ${response.content}
    Should Be Equal As Strings    ${response.status_code}    200    
    ${pretty_printed_response}    To Json    ${response.text}    true  
    Create Binary File    ${response_folder}/get_response.json     ${pretty_printed_response}
    ${response}    Get File    ${response_folder}/get_response.json    encoding=UTF-8    
    ${expected}    Get File    ${expected_folder}/expected_response.json    encoding=UTF-8     
    Diff Outputs    ${response}    ${expected}                          
