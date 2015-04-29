import 'package:polymer/polymer.dart';
import 'package:core_elements/core_input.dart';
import 'dart:html';
//import 'package:projet_final/model/systeme_gestion_patient.dart';
import '../../../model/systeme_gestion_patient.dart';

@CustomTag('connexion-user')
class ConnexionUser extends PolymerElement {
  @published ConnexionBase connexionBase;
  @published CoreInput username = new CoreInput();
  @published CoreInput password = new CoreInput();

  ConnexionUser.created() : super.created() {
    password.value = "";
    username.value = "";
  }

  authentifierUtilisateur(Event e, var detail, Node target) {
    username = this.$["username"];
    password = this.$["password"];
    if (connexionBase.infoConnexion != 'déconnexion') {
      connexionBase.authentificationConnexion(username.value, password.value);
    } else {
      connexionBase.authentificationDeconnexion();
    }
  }
}
