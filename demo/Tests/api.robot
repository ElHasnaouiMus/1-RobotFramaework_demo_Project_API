*** Settings ***

Library  SeleniumLibrary
Resource  ../Ressources/SignupBack.robot
Resource  ../Ressources/variables.robot
Resource  ../Ressources/LoginBack.robot

*** Test Cases ***
Inscrire un nouvel utilisateur
    [Tags]  First
    SignupBack.Vérifier si l'utilisateur n'existe pas dans la BD
    SignupBack.Tester l'inscription de l'utilisateur par une requete Http POST
    SignupBack.Vérifier que l'utilisateur est ajoute dans la BD

Inscrire un utilisateur deja present dans la BD
    [Tags]  Second
    SignupBack.Tester l'inscription du meme utilisateur par une requete Http POST
    SignupBack.Verifier que l'utilisateur n'est pas duplique dans la BD

Connecter un utilisateur
    [Tags]  Third
    LoginBack.Vérifier si l'utilisateur existe dans la base de donnée
    LoginBack.Tester la connexion de l'utilisateur par un GET

Connecter un utilisateur non existant dans la BD
    [Tags]  Fourth
    LoginBack.Supprimer l'utilisateur de la BD
    LoginBack.Tester la connexion de l'utilisateur non existant par une requete Http GET