*** Settings ***
Library  SeleniumLibrary
Resource  ../Ressources/variables.robot
Resource  ../Ressources/ihm_signup.robot
Resource  ../Ressources/ihm_login.robot
Suite Setup  open browser  http://localhost/demo/    gc
Suite Teardown  close browser

*** Variables ***



*** Keywords ***


*** Test Cases ***

#Vérifier la connection au site web
#    login.Vérifier la réponse HTTP

Inscrire un utilisateur
    #signup.Vérifier qu'il n'existe pas dans la base de donnée
    ihm_signup.Remplir le formulaire d'inscription
    ihm_signup.Vérifier que "Successfully Signup!" est affiché dans le status JSON
#    signup.Vérifier si il'est ajouté sur la base de données

R'inscrire encore une fois le mème utilisateur
    go to  http://localhost/demo/
#    ihm_signup.Vérifier qu'il existe déja dans la base de donnée
    ihm_signup.Remplir le formulaire d'inscription
    ihm_signup.Vérifier que "Username already exists!" est affiché dans le status JSON
#    Vérifier qu'il est déjà ajouté dans la base de donnée

Connecter l'utilisateur inscri
    go to  http://localhost/demo/
    ihm_login.Remplir le formulaire avec les coordonnées de test
    ihm_login.Vérifier que "Successfully Login!" est affiché dans le status JSON

Connecter un utilisateur invalide
#   Suprimmer l'utilisateur de test depuis la base de donnée
    go to  http://localhost/demo/
    ihm_login.Remplir le formulaire avec les coordonnées de test
    ihm_login.Vérifier que "Invalid Username or Password!" est affiché dans le status JSON
