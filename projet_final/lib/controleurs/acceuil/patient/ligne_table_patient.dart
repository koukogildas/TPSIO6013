import 'package:polymer/polymer.dart';
import 'dart:html';
import 'package:core_elements/core_collapse.dart';
import '../../../model/systeme_gestion_patient.dart';

@CustomTag('ligne-table-patient')
class LigneTablePatient extends PolymerElement {
  @published Personne patient;

  LigneTablePatient.created() : super.created() {}

  void afficherDossierPatient(Event e, var detail, Node target) {
    (this.shadowRoot.querySelector("core-collapse") as CoreCollapse).toggle();
  }
}
