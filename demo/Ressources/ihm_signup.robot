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

Vérifier qu'il est bien ajouté dans le statut JSON
    sleep  2s
    page should contain  "Successfully Signup!"

Remplir encore une fois le formulaire d'inscription avec les mèmes les coordonnées
    Remplir le formulaire d'inscription

Vérifier que ça donne déja inscri dans le status JSON
    sleep  2s
    page should contain  "Username already exists!"
