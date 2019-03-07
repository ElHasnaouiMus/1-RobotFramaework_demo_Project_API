*** Settings ***
Library  Collections
Library  RequestsLibrary
Library  SeleniumLibrary

Suite Setup    log    test statred
Suite Teardown    log    test ended

*** Variables ***

${username} =	Mustaph
${password} =   ml

*** Keywords ***


*** Test Cases ***

verifier la connection
    Create Session	demo	http://localhost/demo/api/user
    ${resp}=	Get Request	demo  /
    Should Be Equal As Strings	${resp.status_code}	200

s'inscrire
    post request  demo  /signup.php
    Post  demo  /Signup.php    { "username": "${username}", "password": "${password}" }
    log  ${resp.text}
    Dictionary Should Contain Value  ${resp.json()}  Successfully Signup!

# se connecter
    # ${resp}=	Get Request  demo  /login.php?username=${username}&password=${password}
    # log  ${resp.json()}
    # Dictionary Should Contain Value  ${resp.json()}  Successfully Login!

#Deja inscrit
#    post request  demo  /demo/api/user/signup.php
#    ${resp}=	Get Request	demo  /user/login.php?username=${username}&password=${password}
#    Dictionary Should Contain Value	${resp.json()}	Successfully Signup!
#
#supprimer l'utilisateur
#nom utilisateur ou mot de passe incorrect
#    ${resp}=	Get Request	demo  /user/login.php?username=${username}&password=${password}
#    Dictionary Should Contain Value	${resp.json()}	Invalid Username or Password!
#
