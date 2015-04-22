import 'package:polymer/polymer.dart';
import 'dart:html';
import 'package:core_elements/core_collapse.dart';
import '../../../model/systeme_gestion_patient.dart';

@CustomTag('probleme-table')
class ProblemeTable extends PolymerElement {

  @published Personne patient;
  
  ProblemeTable.created() : super.created(){
//    patient = toObservable(new Personne());
//    patient.problemes.internalList = toObservable(patient.problemes.internalList);
    
//    Probleme p1 = new Probleme();
//                            p1.diagnostic = "testo";
//                            p1.commentaire = "test";
//                            patient = new Personne();
//                            patient.nom = "ppp";
//                            patient.prenom = "xxx";
//                            patient.idPersonne= "test";
//
//                            patient.problemes.add(p1);
  }
  
  
  void afficherUnProbleme(Event e, var detail, Node target){
    
    var a=1;
    a= a+1;
  }

}
