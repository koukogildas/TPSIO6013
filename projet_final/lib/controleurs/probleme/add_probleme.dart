import 'package:polymer/polymer.dart';
import 'dart:html';
//import 'package:projet_final/model/systeme_gestion_patient.dart';
import '../../model/systeme_gestion_patient.dart';

@CustomTag('add-probleme')
class AddProbleme extends PolymerElement {
  @published Probleme probleme;
  @published ConnexionBase connexionBase;
  
  AddProbleme.created() : super.created() {
    probleme = new Probleme();
  }

  ajouterProbleme(Event e, var detail, Node target) {
    probleme.idProbleme = new DateTime.now().toIso8601String();

    if (probleme.diagnostic.isEmpty) {
      connexionBase.message = "Entrer un diagnostic svp.";
    } else {
      if (connexionBase.utilisateurConnecte.patientCourant != null) {
        connexionBase.utilisateurConnecte.patientCourant.problemes
            .add(probleme);
        connexionBase.message = "Diagnostic Ajouté";
      } else {
        connexionBase.message = "Veuillez choisir un patient svp.";
      }
    }
  }
}
