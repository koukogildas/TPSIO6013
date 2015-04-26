import 'package:polymer/polymer.dart';
import 'package:core_elements/core_input.dart';
import 'dart:html';
//import 'package:projet_final/model/systeme_gestion_patient.dart';
import '../../../model/systeme_gestion_patient.dart';

@CustomTag('connexion-user')
class ConnexionUser extends PolymerElement {
  @published String message;
  @published String infoConnexion;
  @published ConnexionBase connexionBase;

//  inInputElement username;
//
//  inInputElement passeword;

  ConnexionUser.created() : super.created() {}

  void connexion() {
    CoreInput username = this.$["username"];
    CoreInput password = this.$["password"];
    Utilisateur user =
        connexionBase.trouverUnUtilisateur(username.value, password.value);
    if (user == null) {
      connexionBase.utilisateurConnecte.statutConnexion = false;
    } else {
      message = 'Bienvenu ${user.prenom} ${user.nom}';
      user.statutConnexion = true;
      connexionBase.utilisateurConnecte = user;
    }
  }

  void deconnexion() {
    Utilisateur user = new Utilisateur();
    user.nom = "";
    user.prenom = "";
    user.statutConnexion = false;
    user.profilMedecin = false;
    user.profilAdministrateur = false;
    connexionBase.utilisateurConnecte = user;
    message = 'Veuillez vous connecter svp.';
    infoConnexion = 'Ouvrir une session';
    connexionBase.utilisateurConnecte = user;
  }

  authentifierUtilisateur(Event e, var detail, Node target) {
    if (infoConnexion != 'déconnexion') {
      connexion();
    } else {
      deconnexion();
    }
  }
}
