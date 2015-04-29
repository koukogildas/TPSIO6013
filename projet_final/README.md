Système de gestion de patients

Le projet est un mini système de gestion de patients et supporte deux (2) types
de profil utilisateur: on peut se connecter au système en tant que médecin
ou en tant qu'administrateur. 
 
 Le profil médecin permet d'accomplir les actions suivantes:
 
    - créer le dossier d'un patient;
    - modifier le dossier d'un patient;
    - supprimer le dossier d'un patient;
    
    - ajouter un diagnostic au dossier d'un patient;
    - supprimer un diagnostic du dossier d'un patient
    - modifier un diagnostic dans le dossier d'un patient.

 Le profil admiministrateur permet de:
    
    - Creer un compte pour un médecin ou pour un administrateur;
    - Supprimer le compte d'un utilisateur;
    - Consulter la liste de tous les  utilisateurs du système.
    
 Pour permettre de démarrer et tester l'application, nous avons créer par defaut 
 un super-utilisateur qui est à la fois un médecin et un administrateur du système.
 Voici ses informations d'authentification:
 
    - Nom d'utilisateur: kougil
    - Mot de passe: Kougil
  
 Le système est conçu de  telle manière qu'un utilisateur qui est connecté ne voit
 que les données dont-il est responsable.
  
Toutes les informations manipulées dans le système sont sauvegarder automatiquement 
 si et seulement si l'utilisateur connecté prend le soin de se déconnecter 
 (appui sur le bouton déconnexion ) à la fin de ses activités dans les système.
  Autrmenet dit, un utilisateur authentifié perdra toutes ses  modifications s'il 
 ferme sa page web sans se déconnecter avant.
 
 NB: Nous avons travaillé et testé l'application avec darteditor version 64 bit.