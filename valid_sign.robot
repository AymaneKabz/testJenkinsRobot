*** Settings ***

Suite Setup       Open Browser To Sign Page
Resource          ressource_sign.robot


*** Test Cases ***
Valid Sign
    
    Input Pass1      ${SAME PASS}
    Input Pass2      ${SAME PASS}
    Submit Credentials
    Welcome Page Should Be Open
    Close Browser