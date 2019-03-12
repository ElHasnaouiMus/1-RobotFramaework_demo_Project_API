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
    LoginBack.Verify Successfull Login Request

Vérifier l'existence du nom d'utilisateur et mot de passe
    [Tags]  First
    LoginBack.Verify Successfull Login DataBase

Vérifier connexion apres suppression du User
    [Tags]  First
    LoginBack.Delete User From DataBase
    LoginBack.Verify Login Request After Delete



Vérifier l'existence du user dans la BD
    [Tags]  Second
    SignupBack.Verify User Not In Database

Vérifier la requete POST
    [Tags]  Second
    SignupBack.Verify Post Request

Vérifier la BD
    [Tags]  Second
    SignupBack.Verify User Added Successfully To Database


