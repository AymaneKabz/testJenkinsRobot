*** Settings ***
Documentation     *A resource* file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary
#different libs   Collections Screenshot String DateTime BuiltIn OperatingSystem 
#see http://robotframework.org/robotframework/ for more

*** Variables ***
${SERVER}         127.0.0.1:5500/html
${BROWSER}        chrome
#${DELAY}          0  
${VALID USER}        test
${VALID PASSWORD}    test
${LOGIN URL}      http://${SERVER}/index.html
${WELCOME URL}    http://${SERVER}/welcome.html
${ERROR URL}      http://${SERVER}/error.html
${value}          test   #passing a var using command line: robot -v value:differentvalue    google_search.robot
#@{testarray}      1 2   3   4   5


*** Keywords ***
Open Browser To Login Page
    #[Tags]    you    probably    do    not    have    this    many
    #...       tags    in    real   life
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    #Execute Javascript  alert("ok"); to execute js
    #Set Selenium Speed    ${DELAY}  #to set the speed
    Login Page Should Be Open
    #Log Many  @{testarray}
    #Log  @{testarray}[1]
    #Execute Javascript  alert("ok"); 
    #Handle Alert   action=DISMISS#to accept alert 
    

Login Page Should Be Open
    Page Should Contain   Login 

Go To Login Page
    Go To    ${LOGIN URL}
    Login Page Should Be Open

Input Username
    [Arguments]     ${username}
    Input Text      username    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    password    ${password}

Submit Credentials
    Click Button    login_button  #We can use the value of the Button (LOGIN) or the id given to it id=login_button or also the attribute

Welcome Page Should Be Open
    Location Should Be    ${WELCOME URL}
    #Title Should Be    Welcome Page
    #Page Should Contain  Login succeeded
    #Page Should Contain Link  logout   #Match also based on link text and href.
    #Page Should Contain Button  Test 
    #Page Should Contain Element  container  #check element by id
    Page Should Contain Image   ../tests/selenium-screenshot-1.png  #check image given by src=../tests/selenium-screenshot-1.png
    #Page Should Contain List    testlist 
    Element Should Be Visible  testlist 
    
    #Open Context Menu   id=Welcome   right click
    #Double Click Element    id=Welcome  #double click
    ${value}=   Get Text       id=Welcome
    
    
    #Press Keys    None    	CTRL+c  #copy
    #Press Keys    here    	CTRL+v  #paste
    Input text    here    	${value}  #paste
    Sleep   2

Google search
    Open Browser     http://www.google.com    chrome
    Input Text       q    ${value}
    Click Button     Recherche Google