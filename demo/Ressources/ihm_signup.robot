*** Settings ***
Resource    variables.robot
*** Variables ***

*** Keywords ***

Clicker sur le label sign up
    Click Element    ${sign_up_label}

Remplir le formulaire d'inscription
    Input Text    ${champ_username_signup}    ${username}
    Input Text    ${champ_password_signup}    ${password}
    Input Text    ${champ2_password}    ${password}

Clicker sur le button sign up
    Click Element    ${signup_button}

Vérifier que "Successfully Signup!" est affiché dans le status
    sleep  2s
    page should contain  "Successfully Signup!"

Vérifier que "Username already exists!" est affiché dans le status
    sleep  2s
    page should contain  "Username already exists!"