*** Settings ***
Library  DatabaseLibrary
Resource    variables.robot
*** Variables ***

*** Keywords ***

Vérifier qu'il existe déja dans la base de donnée
    Connect To Database Using Custom Params  pymysql  database='demo', user='root', password='', host='localhost'
    Row Count Is Equal To X	select id from users where username = '${username}' and password = md5('${password}')   1

Remplir le formulaire d'inscription
    Click Element    ${sign_up_label}
    Input Text    ${champ_username}    ${username}
    Input Text    ${champ_password}    ${password}
    Input Text    ${champ2_password}    ${password}
    Click Element    ${signup_button}

Vérifier que ça donne déja inscri dans le status JSON
    sleep  2s
    page should contain  "Username already exists!"

Vérifier qu'il est déjà ajouté dans la base de donnée
    Row Count Is Equal To X	    select id from users where username = '${username}' and password = md5('${password}')   1
    # Teardown
    Disconnect from Database

