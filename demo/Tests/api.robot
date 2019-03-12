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
    LoginBack.Vérifier si l'utilisateur existe dans la base de donnée
    LoginBack.Tester la connexion de l'utilisateur par un GET


Connecter un utilisateur non existant dans la BD
    [Tags]  First
    LoginBack.Supprimer l'utilisateur de la BD
    LoginBack.Tester la connexion de l'utilisateur non existant par une requete Http GET




Inscrire un nouvel utilisateur
    [Tags]  Second
    SignupBack.Vérifier si l'utilisateur n'existe pas dans la BD
    SignupBack.Tester l'inscription de l'utilisateur par une requete Http POST

Tester l'ajout du nouvel utilisateur dans la BD
    [Tags]  Second
    SignupBack.Vérifier que l'utilisateur est ajoute dans la BD

Inscrire un utilisateur deja present dans la BD
    [Tags]  Third
    SignupBack.Tester l'inscription du meme utilisateur par une requete Http POST
    SignupBack.Verifier que l'utilisateur n'est pas duplique dans la BD







