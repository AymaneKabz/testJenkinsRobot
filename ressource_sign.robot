*** Settings ***

Library           SeleniumLibrary


*** Variables ***
${SERVER}           127.0.0.1:5500/html
${BROWSER}          chrome
${SAME PASS}        test
${SIGN URL}         http://${SERVER}/sign.html 
${ERROR URL}        http://${SERVER}/error.html
${WELCOME URL}      http://${SERVER}/welcome.html
${PASSWORD}         password




*** Keywords ***
Open Browser To Sign Page
    
    Open Browser    ${SIGN URL}     ${BROWSER}
    Maximize Browser Window
    Sign Page Should Be Open

    
Sign Page Should Be Open
    Title Should Be   Sign 


Go To Sign Page
    Go To    ${SIGN URL}  
    Sign Page Should Be Open


Input Pass1
    [Arguments]     ${pass}
    Input Text      pass    ${pass}


Input Pass2
    [Arguments]    ${pass2}
    Input Text     pass2    ${pass2}


Submit Credentials
    Click Button    Sign  

Welcome Page Should Be Open
    Location Should Be    ${WELCOME URL}


Error Page Should Be Open
    Location Should Be    ${ERROR URL} 