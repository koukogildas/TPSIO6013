import 'package:polymer/polymer.dart';
import 'dart:html';
import 'package:core_elements/core_collapse.dart';
import '../../../model/systeme_gestion_patient.dart';

@CustomTag('ligne-table-patient')
class LigneTablePatient extends PolymerElement {
  @published Patient patient;
  @published ConnexionBase connexionBase;
  @published String message;

  LigneTablePatient.created() : super.created() {}

  void afficherDossierPatient(Event e, var detail, Node target) {
    connexionBase.definirPatientCourant(patient.idPersonne);
    (this.shadowRoot.querySelector("core-collapse") as CoreCollapse).toggle();
  }
} 
