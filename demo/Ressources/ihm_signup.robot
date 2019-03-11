*** Settings ***
Resource    variables.robot
*** Variables ***

*** Keywords ***

Remplir le formulaire d'inscription
    Click Element    ${sign_up_label}
    Input Text    ${champ_username}    ${username}
    Input Text    ${champ_password}    ${password}
    Input Text    ${champ2_password}    ${password}
    Click Element    ${signup_button}

Vérifier que "Successfully Signup!" est affiché dans le status JSON
    sleep  2s
    page should contain  "Successfully Signup!"

Vérifier que "Username already exists!" est affiché dans le status JSON
    sleep  2s
    page should contain  "Username already exists!"
