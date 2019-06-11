*** Settings ***
Library    RequestsLibrary    
Resource    Common_variables.robot


*** Keywords ***
Create connection
    Create Session    session    ${BASE_URL} 