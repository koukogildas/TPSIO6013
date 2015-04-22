import 'package:polymer/polymer.dart';
import 'dart:html';
import 'package:core_elements/core_collapse.dart';
import '../../../model/systeme_gestion_patient.dart';

@CustomTag('ligne-table-probleme')
class LigneTableProbleme extends PolymerElement {
  @published Probleme probleme;
  

  LigneTableProbleme.created() : super.created() {}

  void afficherDossierPatient(Event e, var detail, Node target) {
    (this.shadowRoot.querySelector("core-collapse") as CoreCollapse).toggle();
  }
}
