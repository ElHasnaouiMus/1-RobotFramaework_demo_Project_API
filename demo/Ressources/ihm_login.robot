*** Settings ***
Resource    variables.robot
*** Variables ***

*** Keywords ***

Remplir le formulaire avec les coordonnées de test
    Input Text    ${champ_username}    ${username}
    Input Text    ${champ_password}    ${password}
    Click Element    ${login_button}

Vérifier que "Successfully Login!" est affiché dans le status JSON
    sleep  2s
    page should contain  "Successfully Login!"

Vérifier que "Invalid Username or Password!" est affiché dans le status JSON
    sleep  2s
    page should contain  "Invalid Username or Password!"








