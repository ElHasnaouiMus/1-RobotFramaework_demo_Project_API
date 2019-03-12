*** Settings ***
Library  Collections
Library  RequestsLibrary
Resource  ../Ressources/variables.robot
*** Keywords ***

Vérifier la réponse HTTP
    Create Session	demo	${WEBSITE_LINK}
    ${response}=	Get Request	demo  /
    Should Be Equal As Strings	${response.status_code}	200

connecter l'utilisateur de test
     ${resp}=	Get Request  demo  /login.php?username=${username}&password=${password}
     log  ${resp.json()}
     Dictionary Should Contain Value  ${resp.json()}  Successfully Login!