import 'package:polymer/polymer.dart';
import 'dart:html';
import 'package:projet_final/model/systeme_gestion_patient.dart';

@CustomTag('connexion-user')
class ConnexionUser extends PolymerElement {
  @published String message;
  @published String infoConnexion;
  @published Utilisateur utilisateurConnecte;

  ConnexionUser.created() : super.created() {}

  authentifierUtilisateur(Event e, var detail, Node target) {
    if (infoConnexion != 'déconnexion') {
      infoConnexion = 'déconnexion';
      message = '';
      utilisateurConnecte.statutConnexion = true;
      utilisateurConnecte.profilMedecin = true;
      utilisateurConnecte.profilAdministrateur = false;
    } else {
      message = 'Veuillez vous connecter svp.';
      infoConnexion = 'Ouvrir une session';
      utilisateurConnecte.statutConnexion = false;
      utilisateurConnecte.profilMedecin = false;
      utilisateurConnecte.profilAdministrateur = false;
     // utilisateurConnecte.patients.clear();
    }
  }
}
