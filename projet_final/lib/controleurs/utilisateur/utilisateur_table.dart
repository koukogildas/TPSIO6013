import 'package:polymer/polymer.dart';
//import 'package:projet_final/model/systeme_gestion_patient.dart';
import '../../model/systeme_gestion_patient.dart';
import 'dart:html';
import 'package:core_elements/core_icon_button.dart';

@CustomTag('utilisateur-table')
class UtilisateurTable extends PolymerElement {
  @published ConnexionBase connexionBase;

  UtilisateurTable.created() : super.created() {}

  supprimerUnUtilisateur(Event e, var detail, CoreIconButton target) {
    if (target.id != connexionBase.utilisateurConnecte.idPersonne) {
      connexionBase.utilisateurs
          .remove(connexionBase.trouverUnUtilisateurById(target.id));
      connexionBase.message = "L'utilisateur est supprimé";
    } else {
      connexionBase.message = "L'utilisateur est actuellement connecté";
    }
  }
}
