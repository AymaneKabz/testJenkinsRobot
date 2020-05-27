*** Settings ***
Resource          ressources.robot
#Library           SeleniumLibrary
Suite Setup       Open Browser To Login Page    
#Suite Teardown    Close Browser
Force Tags        Valid Login
Documentation    *Bold* _italic_ _*bold italic*_ ``code``

#A suite setup runs exactly once at the start of a suite. 
#A test setup runs at the start of a test case.
*** Test Cases ***
Valid Login
    #Open Browser To Login Page        #Using suite setup and suite teardown
    
   
    Input Username    test
    Input Password    test
    Submit Credentials
    Welcome Page Should Be Open
    #Capture Page Screenshot            #capture whole page
    #Capture Element Screenshot  Welcome        #capture 1 element
    #Log     running tests on %{OS}         OS Env var
    #Execute Javascript  alert("ok"); 
    #Handle Alert   DISMISS  #to dismiss the alert
    [Teardown]    Close Browser