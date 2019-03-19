*** Settings ***
Library  SeleniumLibrary
Resource  ../Ressources/variables.robot
Resource  ../Ressources/ihm_signup.robot
Resource  ../Ressources/ihm_login.robot
Resource  ../Ressources/SignupBack.robot
Resource  ../Ressources/LoginBack.robot
Suite Setup  open browser  http://localhost/demo/    gc
Test Setup  go to  http://localhost/demo/
Suite Teardown  close browser

*** Test Cases ***
Inscrire un utilisateur
    SignupBack.Vérifier si l'utilisateur n'existe pas dans la BD
    ihm_signup.Cliquez sur le champ sign up
    ihm_signup.Remplir le formulaire d'inscription
    ihm_signup.Cliquez sur le button sign up
    ihm_signup.Vérifier que "Successfully Signup!" est affiché dans le status
    SignupBack.Vérifier que l'utilisateur est ajoute dans la BD

Réinscrire encore une fois le mème utilisateur
    SignupBack.vérifier que l'utilisateur est ajoute dans la BD
    ihm_signup.Cliquez sur le champ sign up
    ihm_signup.Remplir le formulaire d'inscription
    ihm_signup.Cliquez sur le button sign up
    ihm_signup.Vérifier que "Username already exists!" est affiché dans le status
    SignupBack.Verifier que l'utilisateur n'est pas duplique dans la BD

Connecter l'utilisateur inscri
    ihm_login.Remplir le formulaire avec les coordonnées de test
    ihm_login.clicker sur le button sign in
    ihm_login.Vérifier que "Successfully Login!" est affiché dans le status
hhhhhhhhhhhhh
Connecter un utilisateur invalide
    LoginBack.Supprimer l'utilisateur de la BD
    ihm_login.Remplir le formulaire avec les coordonnées de test
    ihm_login.clicker sur le button sign in
    ihm_login.Vérifier que "Invalid Username or Password!" est affiché dans le status