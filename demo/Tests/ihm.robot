*** Settings ***
Library  SeleniumLibrary
Resource  ../Ressources/signup.robot
Resource  ../Ressources/variables.robot
Resource  ../Ressources/already_exist.robot
Resource  ../Ressources/login.robot
Suite Setup  open browser  http://localhost/demo/    gc
Suite Teardown  close browser

*** Variables ***



*** Keywords ***


*** Test Cases ***

Vérifier la connection au site web
    login.Vérifier la réponse HTTP

Inscrire un utilisateur
    #signup.Vérifier qu'il n'existe pas dans la base de donnée
    signup.Remplir le formulaire d'inscription
    signup.Vérifier si il'est ajouté dans le status dans JSON
    signup.Vérifier si il'est ajouté sur la base de données

Connecter l'utilisateur inscri
    login.conecter l'utilisateur de test

Ce nom d'utilisateur existe déjà!
    go to  http://localhost/demo/
    already_exist.Vérifier qu'il existe déja dans la base de donnée
    already_exist.Remplir le formulaire d'inscription
    already_exist.Vérifier que ça donne déja inscri dans le status JSON
    Vérifier qu'il est déjà ajouté dans la base de donnée

Supprimer l'utilisateur de test
    [Tags]  deleteuser
    Suprimmer l'utilisateur de test depuis la base de donnée

#nom utilisateur ou mot de passe incorrect
#    ${resp}=	Get Request	demo  /user/login.php?username=${username}&password=${password}
#    Dictionary Should Contain Value	${resp.json()}	Invalid Username or Password!
