import 'package:polymer/polymer.dart';
import '../../../model/systeme_gestion_patient.dart';
import 'dart:js';
import 'dart:html';

@CustomTag('patient-table')
class PatientTable extends PolymerElement {
  
  @published Personnes patients;
  
  @observable  Personne patient;
  
  PatientTable.created() : super.created(){
  
    var a = 1;
    a = a+1;
  }
  
  void ajouterUnPatient(Event e, detail, sender) {
    patient = new Personne();
    
    patient.nom = "kouko";
    patient.prenom = "gildas";
    patient.nas = (patients.length + 1).toString();
    patients.add(patient);
  }

}
