*** Settings ***
Library  Collections
Library  RequestsLibrary
Resource  ../Ressources/variables.robot
*** Keywords ***

Vérifier la réponse HTTP
    Create Session	demo	${website_link}
    ${resp}=	Get Request	demo  /
    Should Be Equal As Strings	${resp.status_code}	200

conecter l'utilisateur de test
     ${resp}=	Get Request  demo  /login.php?username=${username}&password=${password}
     log  ${resp.json()}
     Dictionary Should Contain Value  ${resp.json()}  Successfully Login!