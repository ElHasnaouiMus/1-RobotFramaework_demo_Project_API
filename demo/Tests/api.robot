*** Settings ***

Library  SeleniumLibrary
Resource  ../Ressources/SignupBack.robot
Resource  ../Ressources/variables.robot
Resource  ../Ressources/LoginBack.robot
#Suite Setup  open browser  http://localhost/demo/    gc
#Suite Teardown  close browser

*** Variables ***



*** Keywords ***


*** Test Cases ***

Vérifier la connection au site web
    [Tags]  First
    LoginBack.Verifier Utilisateur Dans BD
    LoginBack.Test Login Utilisateur Existant


Connexion apres suppression Utilisateur
    [Tags]  First
    LoginBack.Supprimer Utilisateur De BD
    LoginBack.Test Login Utilisateur Non Existant




Vérifier la requete POST
    [Tags]  Second
    SignupBack.Utilisateur Non Existant BD
    SignupBack.Requete Http POST

Ajout de Utilisateur dans la BD
    [Tags]  Second
    SignupBack.Ajout Utilisateur dans la BD

Tester Duplication
    [Tags]  Third
    SignupBack.Requete POST Utilisateur dupliqué
    SignupBack.Test Utilisateur non duplique BD






