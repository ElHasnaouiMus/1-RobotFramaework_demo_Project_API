*** Settings ***
Library  SeleniumLibrary
Library  RequestsLibrary
Library  DatabaseLibrary
Resource  variables.robot

*** Keywords ***
Verify User Not In Database
    Connect To Database Using Custom Params  pymysql  database='demo', user='root', password='', host='localhost'

    Row Count Is 0	select id from users where username = '${username}' and password = md5('${password}')

Verify Post Request
    Create Session  session2  ${website_link}

    &{data} =   Create Dictionary  username=${username}  password=${password}

    &{headers}=  Create Dictionary  Content-Type=application/x-www-form-urlencoded

    ${response} =  Post Request  session2  signup.php  data=${data}  headers=${headers}

    Should Be Equal As Strings  ${response.status_code}  200

#    ${json}=  To Json  ${response.content}

#    Log  ${json}

Verify User Added Successfully To Database
    Connect To Database Using Custom Params  pymysql  database='demo', user='root', password='', host='localhost'

    Row Count Is Equal To X	 select id from users where username = '${username}' and password = md5('${password}')   1