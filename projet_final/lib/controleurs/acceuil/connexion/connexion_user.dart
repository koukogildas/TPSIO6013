import 'package:polymer/polymer.dart';
import 'package:core_elements/core_input.dart';
import 'dart:html';
//import 'package:projet_final/model/systeme_gestion_patient.dart';
import '../../../model/systeme_gestion_patient.dart';

@CustomTag('connexion-user')
class ConnexionUser extends PolymerElement {
 // @published String message;
 // @published String infoConnexion;
  @published ConnexionBase connexionBase;

//  inInputElement username;
//
//  inInputElement passeword;

  ConnexionUser.created() : super.created() {} 

  authentifierUtilisateur(Event e, var detail, Node target) {
    CoreInput username = this.$["username"];
    CoreInput password = this.$["password"];
    if (connexionBase.infoConnexion != 'déconnexion') {
      connexionBase.authentificationConnexion(username.value,password.value);
    } else {
      connexionBase.authentificationDeconnexion();
    }
 //   message = connexionBase.message;
  }
}
