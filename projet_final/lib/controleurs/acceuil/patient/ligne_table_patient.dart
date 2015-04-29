import 'package:polymer/polymer.dart';
import 'dart:html';
import 'package:core_elements/core_collapse.dart';
import '../../../model/systeme_gestion_patient.dart';

@CustomTag('ligne-table-patient')
class LigneTablePatient extends PolymerElement {
  @published Patient patient;
  @published ConnexionBase connexionBase;

  LigneTablePatient.created() : super.created() {}

  void afficherDossierPatient(Event e, var detail, Node target) {
    connexionBase.definirPatientCourant(patient.idPersonne);
    patient = connexionBase.utilisateurConnecte.patientCourant;
    (this.shadowRoot.querySelector("core-collapse") as CoreCollapse).toggle();
    connexionBase.message = "";
  }
  supprimerUnPatient(Event e, var detail, Node target) {
    connexionBase.utilisateurConnecte.patients.remove(patient);
    connexionBase.message = "Le dossier du patient est supprimé.";
  }
}
