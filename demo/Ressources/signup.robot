*** Settings ***
Library  DatabaseLibrary
Resource    variables.robot
*** Variables ***

*** Keywords ***

Vérifier qu'il n'existe pas dans la base de donnée
    Connect To Database Using Custom Params  pymysql  database='demo', user='root', password='', host='localhost'
    Row Count Is 0	select id from users where username = '${username}' and password = md5('${password}')

Remplir le formulaire d'inscription
    Click Element    ${sign_up_label}
    Input Text    ${champ_username}    ${username}
    Input Text    ${champ_password}    ${password}
    Input Text    ${champ2_password}    ${password}
    Click Element    ${signup_button}

Vérifier si il'est ajouté dans le status dans JSON
    sleep  2s
    page should contain  "Successfully Signup!"

Vérifier si il'est ajouté sur la base de données

    Row Count Is Equal To X	    select id from users where username = '${username}' and password = md5('${password}')  1

Vérifier Requete Http Post
    Create Session

Suprimmer l'utilisateur de test depuis la base de donnée
    Connect To Database Using Custom Params  pymysql  database='demo', user='root', password='', host='localhost'
    Execute Sql String	DELETE FROM users WHERE username = '${username}' and password = md5('${password}')
    Disconnect from Database