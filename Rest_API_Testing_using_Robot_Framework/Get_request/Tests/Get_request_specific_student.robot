*** Settings ***
Library    RequestsLibrary    
Library    OperatingSystem    
Library    DiffLibrary


*** Variables ***
${base_url}    http://thetestingworldapi.com/
${uri}    api/studentsDetails/
${student_id}    28
${response_folder}    Response
${expected_folder}    Expected


*** Test Cases ***
Get request for specific student
    Create Session    fetch_data    ${base_url} 
    ${response}    Get Request    fetch_data    ${uri}${student_id}
    Log    ${response.status_code}
    Log    ${response.content}
    # ${pretty_printed_response}    To Json    ${response.text}    true  
    # Create Binary File    ${response_folder}/get_response.json     ${pretty_printed_response}
    # ${response}    Get File    ${response_folder}/get_response.json    encoding=UTF-8    
    # ${expected}    Get File    ${expected_folder}/expected_response.json    encoding=UTF-8     
    # Diff Outputs    ${response}    ${expected}                          
