*** Settings ***
Library    RequestsLibrary    
Library    OperatingSystem    
Library    DiffLibrary
Library    JSONLibrary
Library    Collections    


*** Variables ***
${base_url}    https://reqres.in
${uri}    /api/users?page=2
${expected_first_name}    Eve
${expectes_last_name}    Holt

${response_folder}    Response
${expected_folder}    Expected


*** Test Cases ***
Get request for specific student
    Create Session    fetch_data    ${base_url} 
    ${response}    Get Request    fetch_data    ${uri}
    Log    ${response.status_code}
    Log    ${response.content}
    ${json_response}    To Json    ${response.content}    
    @{first_name_list}    Get Value From Json    ${json_response}    $.data[0].first_name
    ${first_name}    Get From List    ${first_name_list}    0
    Should Be Equal    ${first_name}    ${expected_first_name}
    @{lastname_list}    Get Value From Json    ${json_response}    $.data[0].last_name
    ${lastname}    Get From List    ${lastname_list}    0   
    Should Be Equal    ${lastname}    ${expectes_last_name}     


# SIVOA KOODIA

    # ${pretty_printed_response}    To Json    ${response.text}    true  
    # Create Binary File    ${response_folder}/get_response.json     ${pretty_printed_response}
    # ${response}    Get File    ${response_folder}/get_response.json    encoding=UTF-8    
    # ${expected}    Get File    ${expected_folder}/expected_response.json    encoding=UTF-8     
    # Diff Outputs    ${response}    ${expected}                          
