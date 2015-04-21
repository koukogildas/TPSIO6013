import 'package:polymer/polymer.dart';
import 'dart:html';
import 'dart:js';
import 'package:core_elements/core_collapse.dart';
import '../../../model/systeme_gestion_patient.dart';

@CustomTag('ligne-table-patient')
class LigneTablePatient extends PolymerElement{
  @published Personne patient;
  
  LigneTablePatient.created() : super.created();

  void afficherDossierPatient(Event e, detail, sender) {
    (querySelector('#collapse-{{$e.id}}') as CoreCollapse).toggle();
  }
}
