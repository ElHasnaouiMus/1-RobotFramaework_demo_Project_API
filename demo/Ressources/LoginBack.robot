*** Settings ***
Library  SeleniumLibrary
Library  RequestsLibrary
Library  DatabaseLibrary
Resource  variables.robot
*** Variables ***

*** Keywords ***
Verify Successfull Login Request

    Create Session  session1  ${website_link}

    ${response}=	Get Request	 session1  login.php?username=${username}&password=${password}

    ${json} =  Set Variable  ${response.json()}

    Log  ${json}

    Should Be Equal As Strings  ${response.status_code}	200

    Should Be Equal As Strings  ${json['message']}  Successfully Login!

Verify Successfull Login DataBase

    Connect To Database Using Custom Params  pymysql  database='demo', user='root', password='', host='localhost'

    Row Count Is Equal To X	 select id from users where username = '${username}' and password = md5('${password}')   1

#Trying to Login after the user have been deleted

#We first delete the user
Delete User From DataBase

    Connect To Database Using Custom Params  pymysql  database='demo', user='root', password='', host='localhost'

    Execute Sql String	DELETE FROM users WHERE username = '${username}' and password = md5('${password}')

    Disconnect from Database

#Then we try to Login
Verify Login Request After Delete

    Create Session  session1  ${website_link}

    ${response}=	Get Request	 session1  login.php?username=${username}&password=${password}

    ${json} =  Set Variable  ${response.json()}

    Should Be Equal As Strings  ${response.status_code}	200

    Should Be Equal As Strings  ${json['message']}  Successfully Login!



