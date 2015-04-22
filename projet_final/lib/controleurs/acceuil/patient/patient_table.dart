import 'package:polymer/polymer.dart';
import '../../../model/systeme_gestion_patient.dart';
import 'dart:js';
import 'dart:html';

@CustomTag('patient-table')
class PatientTable extends PolymerElement {
  
  @published Personnes patients;
  
  @observable  Personne patient;
  
  PatientTable.created() : super.created(){
  
  
  }
  
  void afficherDossierPatient(Event e, var detail, Node target){
    

  }

}
