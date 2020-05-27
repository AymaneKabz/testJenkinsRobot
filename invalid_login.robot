*** Settings ***

Suite Setup       Open Browser To Login Page                   #once
Suite Teardown    Close Browser                                #once
Test Setup        Go To Login Page                             #many / every test
Test Template     Login With Invalid Credentials Should Fail   #To repeat test with different data
Resource          ressources.robot
Force Tags        Invalid Login

*** Test Cases ***               USER NAME        PASSWORD               
Invalid Username                 invalid          ${VALID PASSWORD}
Invalid Password                 ${VALID USER}    invalid
Invalid Username And Password    invalid          whatever
Empty Username                   ${EMPTY}         ${VALID PASSWORD}
Empty Password                   ${VALID USER}    ${EMPTY}
Empty Username And Password      ${EMPTY}         ${EMPTY}

*** Keywords ***
Login With Invalid Credentials Should Fail
    [Tags]      test
    [Arguments]    ${username}    ${password}     #Arguments in test cases
    Input Username    ${username}
    Input Password    ${password}
    Submit Credentials
    Login Should Have Failed

Login Should Have Failed
    Location Should Be    ${ERROR URL}
    Title Should Be    Error Page
    #Page Should Contain    Error Page
