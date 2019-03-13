*** Settings ***

Library  SeleniumLibrary
Resource  ../Ressources/SignupBack.robot
Resource  ../Ressources/variables.robot
Resource  ../Ressources/LoginBack.robot

*** Test Cases ***
Connecter un utilisateur
    [Tags]  First
    LoginBack.Vérifier si l'utilisateur existe dans la base de donnée
    LoginBack.Tester la connexion de l'utilisateur par un GET

Connecter un utilisateur non existant dans la BD
    [Tags]  Second
    LoginBack.Supprimer l'utilisateur de la BD
    LoginBack.Tester la connexion de l'utilisateur non existant par une requete Http GET

Inscrire un nouvel utilisateur
    [Tags]  Third
    SignupBack.Vérifier si l'utilisateur n'existe pas dans la BD
    SignupBack.Tester l'inscription de l'utilisateur par une requete Http POST
    SignupBack.Vérifier que l'utilisateur est ajoute dans la BD

Inscrire un utilisateur deja present dans la BD
    [Tags]  Fourth
    SignupBack.Tester l'inscription du meme utilisateur par une requete Http POST
    SignupBack.Verifier que l'utilisateur n'est pas duplique dans la BD