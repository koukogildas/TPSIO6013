import 'package:polymer/polymer.dart';
import 'package:projet_final/model/systeme_gestion_patient.dart';
import 'dart:html';

@CustomTag('patient-table')
class PatientTable extends PolymerElement {
  
  @published Utilisateur utilisateurConnecte;
  
  @observable  Patient patient;
  
  PatientTable.created() : super.created(){
  
  
  }
  
  void afficherDossierPatient(Event e, var detail, Node target){
    

  }

}
