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

Connecter un utilisateur
    [Tags]  First
    LoginBack.Verifier Utilisateur Dans BD
    LoginBack.Test Login Utilisateur Existant


Connecter un utilisateur non existant dans la BD
    [Tags]  First
    LoginBack.Supprimer Utilisateur De BD
    LoginBack.Test Login Utilisateur Non Existant




Inscrire un nouvel utilisateur
    [Tags]  Second
    SignupBack.Utilisateur Non Existant BD
    SignupBack.Requete Http POST

Tester l'ajout du nouvel utilisateur dans la BD
    [Tags]  Second
    SignupBack.Ajout Utilisateur dans la BD

Inscrire un utilisateur deja present dans la BD
    [Tags]  Third
    SignupBack.Requete POST Utilisateur dupliqué
    SignupBack.Test Utilisateur non duplique BD






