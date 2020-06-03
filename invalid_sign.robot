*** Settings ***
Suite Setup       Open Browser To Sign Page
Resource          ressource_sign.robot
Suite Teardown    Close Browser 
Test Setup        Go To Sign Page  
Test Template     Sign Should Fail


*** Test Cases ***             Pass             Pass2
Pass1 != Pass2                 ${PASSWORD}      whatever
Empty Pass1                    ${EMPTY}         ${PASSWORD} 
Empty Pass2                    ${PASSWORD}      ${EMPTY}



*** Keywords ***
Sign Should Fail
    [Arguments]             ${Pass}    ${Pass2}     #Arguments in test cases
   
    Input Pass1             ${Pass}
    Input Pass2             ${Pass2}
    Submit Credentials
    Error Page Should Be Open
