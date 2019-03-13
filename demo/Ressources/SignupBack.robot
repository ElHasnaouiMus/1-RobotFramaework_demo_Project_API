*** Settings ***
Library  SeleniumLibrary
Library  RequestsLibrary
Library  DatabaseLibrary
Resource  variables.robot

*** Keywords ***
Vérifier si l'utilisateur n'existe pas dans la BD
    Connect To Database Using Custom Params  pymysql  database='demo', user='root', password='', host='localhost'
    Row Count Is 0	select id from users where username = '${username}' and password = md5('${password}')

Tester l'inscription de l'utilisateur par une requete Http POST
    Create Session  session2  ${website_link}
    ${data} =   Create Dictionary  username=${username}  password=${password}
    ${headers}=  Create Dictionary  Content-Type=application/x-www-form-urlencoded
    ${response} =  Post Request  session2  signup.php  data=${data}  headers=${headers}
    ${json} =  Set Variable  ${response.json()}
    Log  ${json}
    Should Be Equal As Strings  ${response.status_code}  200
#    ${json}=  To Json  ${response.content}
#    Log  ${json}

Vérifier que l'utilisateur est ajoute dans la BD
    Connect To Database Using Custom Params  pymysql  database='demo', user='root', password='', host='localhost'
    Row Count Is Equal To X	 select id from users where username = '${username}' and password = md5('${password}')   1

Tester l'inscription du meme utilisateur par une requete Http POST
    Create Session  session2  ${website_link}
    ${data} =   Create Dictionary  username=${username}  password=${password}
    ${headers}=  Create Dictionary  Content-Type=application/x-www-form-urlencoded
    ${response} =  Post Request  session2  signup.php  data=${data}  headers=${headers}
    ${json} =  Set Variable  ${response.json()}
    Should Be Equal As Strings  ${response.status_code}  200
    Should Be Equal As Strings  ${json['message']}  Username already exists!

Verifier que l'utilisateur n'est pas duplique dans la BD
    Connect To Database Using Custom Params  pymysql  database='demo', user='root', password='', host='localhost'
    Row Count Is Equal To X	 select id from users where username = '${username}' and password = md5('${password}')   1