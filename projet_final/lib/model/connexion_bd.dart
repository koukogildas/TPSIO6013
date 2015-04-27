part of systeme_gestion_patient;
//import 'dart:html';
//import '../../packages/projet_final/model/systeme_gestion_patient.dart';
//import 'package:projet_final/model/systeme_gestion_patient.dart';

class ConnexionBase {
  @observable List<Utilisateur> utilisateurs = new List<Utilisateur>();
  @observable  Utilisateur utilisateurConnecte;
  @observable  String message = "Veuillez vous connecter svp.";
  @observable  String infoConnexion = 'Ouvrir une session';

   ConnexionBase() {
    ouvrirUneConnexionBd();
  }
   
   
   Utilisateur trouverUnUtilisateur(String username, String passeWord){
     return utilisateurs.firstWhere(
         (Utilisateur u) => ((u.username == username)&& (u.password==passeWord)), orElse: () => null);
   }
   
   void authentificationConnexion(String username, String password) {

       Utilisateur user =
           trouverUnUtilisateur(username, password);
       if (user == null) {
         utilisateurConnecte.statutConnexion = false;
         message = "Non d'utilisateur ou mot de passe incorrecte";
       } else {
         message = 'Bienvenu ${user.prenom} ${user.nom}';
         user.statutConnexion = true;
         utilisateurConnecte = user;
         infoConnexion = 'déconnexion';
       }
     }
   
   void authentificationDeconnexion() {
      Utilisateur user = new Utilisateur();
      user.nom = "";
      user.prenom = "";
      user.idPersonne="";
      user.statutConnexion = false;
      user.profilMedecin = false;
      user.profilAdministrateur = false;
      utilisateurConnecte = user;
      message = 'Veuillez vous connecter svp.';
      infoConnexion = 'Ouvrir une session';
      utilisateurConnecte = user;
    }
   
  void ouvrirUneConnexionBd() {
    String json = window.localStorage['projet_final'];
    if (json == null) {
      initialiserModel();
    } else {
      fromJson(JSON.decode(json));
      if (utilisateurs.length == 0) {
        initialiserModel();
      }
      utilisateurs.sort();
      utilisateurs = toObservable(utilisateurs);
    }
  }

  fromJson(Map<String, Object> entityList) {
    if (entityList.length > 0) {
      throw new JsonError("La base de données n'est pas vide");
    }
    for (Map<String, Object> entityMap in entityList) {
      Utilisateur utilisateur = new Utilisateur();
      utilisateur.fromJson(entityMap);
      utilisateurs.add(utilisateur);
    }
  }

  void initialiserModel() {
    
    Utilisateur utilisateur = new Utilisateur();
    utilisateur.nom =  "Kouko";
    utilisateur.prenom = "Gildas";
    utilisateur.idPersonne =  utilisateur.prenom+utilisateur.nom;
    utilisateur.statutConnexion= false;
    utilisateur.profilAdministrateur = true;
    utilisateur.profilMedecin = true;
    utilisateur.username = "kougil";
    utilisateur.password = "kougil";
    utilisateur = toObservable(utilisateur);
    utilisateur.patients = toObservable(utilisateur.patients);

    Patient patient = new Patient();
    Patient patient1 = new Patient();

    Probleme p = new Probleme();
    p.diagnostic = "sida";
    p.commentaire = "prendre medicament";
    p.idProbleme = p.commentaire+p.diagnostic;

    patient.nom = "exe";
    patient.prenom = "exe";
    patient.idPersonne = patient.prenom+patient.nom;
    patient.problemes.internalList =
        toObservable(patient.problemes.internalList);
    patient.problemes.add(p);
    utilisateur.patients.add(patient);

    Probleme p1 = new Probleme();
    p1.diagnostic = "testo";
    p1.commentaire = "test";
    p1.idProbleme = p1.commentaire+p1.diagnostic;

    patient1.nom = "ppp";
    patient1.prenom = "xxx";
    patient1.idPersonne = patient1.prenom+patient1.nom;
    patient1.problemes.internalList =
        toObservable(patient1.problemes.internalList);
    patient1.problemes.add(p1);
    utilisateur.patients.add(patient1);

    utilisateurs.add(utilisateur);
    authentificationDeconnexion();
  //  infoConnexion = 'Ouvrir une session';
    //utilisateurConnecte = utilisateur;    
    //definirPatientCourant(patient.prenom+patient.nom);    
  }
  
  
  void definirPatientCourant(idPatient) {
    utilisateurConnecte.definirPatientCourant(idPatient);
  }
}
