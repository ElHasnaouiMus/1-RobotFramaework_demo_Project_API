*** Settings ***
Library  SeleniumLibrary
Library  RequestsLibrary
Library  DatabaseLibrary
Resource  variables.robot
*** Variables ***

*** Keywords ***
Tester la connexion de l'utilisateur par un GET

    Create Session  session1  ${website_link}

    ${response}=	Get Request	 session1  login.php?username=${username}&password=${password}

    ${json} =  Set Variable  ${response.json()}

    Log  ${json}

    Should Be Equal As Strings  ${response.status_code}	200

    Should Be Equal As Strings  ${json['message']}  Successfully Login!

Vérifier si l'utilisateur existe dans la base de donnée

    Connect To Database Using Custom Params  pymysql  database='demo', user='root', password='', host='localhost'

    Row Count Is Equal To X	 select id from users where username = '${username}' and password = md5('${password}')   1

#Trying to Login after the user have been deleted

#We first delete the user
Supprimer l'utilisateur de la BD

    Connect To Database Using Custom Params  pymysql  database='demo', user='root', password='', host='localhost'

    Execute Sql String	DELETE FROM users WHERE username = '${username}' and password = md5('${password}')

    Disconnect from Database

#Then we try to Login
Tester la connexion de l'utilisateur non existant par une requete Http GET

    Create Session  session1  ${website_link}

    ${response}=	Get Request	 session1  login.php?username=${username}&password=${password}

    ${json} =  Set Variable  ${response.json()}

    Should Be Equal As Strings  ${response.status_code}	200

    Should Be Equal As Strings  ${json['message']}  Invalid Username or Password!



