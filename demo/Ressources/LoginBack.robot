*** Settings ***
Library  SeleniumLibrary
Library  RequestsLibrary
Library  DatabaseLibrary
Resource  variables.robot
*** Variables ***

*** Keywords ***
Verify Successful Login Request

    Create Session  session1  ${website_url}

    ${response}=	Get Request	 session1  login.php?username=${username}&password=${password}

    ${json} =  Set Variable  ${response.json()}

    Should Be Equal As Strings  ${response.status_code}	200

    Should Be Equal As Strings  ${json['message']}  Successfully Login!

Verify Successfull Login DataBase

    Connect To Database Using Custom Params  pymysql  database='demo', user='root', password='', host='localhost'

    Row Count Is Equal To X	 select id from users where username = '${USERNAME}' and password = md5('${PASSWORD}')   1



