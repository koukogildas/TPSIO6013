import 'package:polymer/polymer.dart';
import 'dart:html';
import 'package:core_elements/core_collapse.dart';
import '../../../model/systeme_gestion_patient.dart';
import 'package:core_elements/core_input.dart';
import 'package:paper_elements/paper_input.dart';

@CustomTag('ligne-table-patient')
class LigneTablePatient extends PolymerElement {
  @published Patient patient;
  @published ConnexionBase connexionBase;
  @published String StrDossierPatient;

  LigneTablePatient.created() : super.created() {

  }

  void afficherDossierPatient(Event e, var detail, Node target) {
    connexionBase.definirPatientCourant(patient.idPersonne);
    (this.shadowRoot.querySelector("core-collapse") as CoreCollapse).toggle();
  }
  supprimerUnPatient(Event e, var detail, Node target) {
    patient.problemes.clear();
    patient.nom  = "";
    patient.prenom = "";
    connexionBase.utilisateurConnecte.patients.remove(patient);
    connexionBase.message = "Le dossier du patient est supprimé";
  }
}
