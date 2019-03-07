*** Settings ***
library    SeleniumLibrary    

*** Test Cases ***
test
    open browser    http://www.robotframeworktutorial.com/front-office/    gc
    sleep    5s
    Click Button    xpath=//*[@id="bs-example-navbar-collapse-1"]/ul/li[5]/a