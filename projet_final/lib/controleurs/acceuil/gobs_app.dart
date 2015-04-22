import 'package:polymer/polymer.dart';
import 'dart:html';
import 'dart:js';
import '../../model/systeme_gestion_patient.dart';

import 'acceuil_elements.dart';

/// Simple class which maps page names to paths.
class Page {
  final String name;
  final String path;
  final bool isDefault;
  const Page(this.name, this.path, {this.isDefault: false});

  String toString() => '$name';
}

@CustomTag('gobs-app')
class GobsApp extends PolymerElement {

  @observable Personnes patients;
  
  
  
  GobsApp.created() : super.created(){
    
    loadPersonneData();
  }

  void loadPersonneData() {
     patients =  new Personnes();
     patients.internalList = toObservable(patients.internalList);
     
        var patient = new Personne();
        var patient1 = new Personne();
        
        patient.nom = "exe";
        patient.prenom = "exe";
        patient.idPersonne= (patients.length + 1).toString();
        patients.add(patient);
      
        patient1.nom = "ppp";
                patient1.prenom = "xxx";
                patient1.idPersonne= (patients.length + 1).toString();
                patients.add(patient1);
    }

 
  void toggleDialog1(e) {
    /*  if (e.target.localName != 'core-icon-button') {
        return;
      }*/
    
    var formConDialog = shadowRoot
        .querySelector('#core-tooltip-connexion')
        .querySelector('connexion-user');
    formConDialog =
        formConDialog.shadowRoot.querySelector('#paper-action-dialog');
    if (formConDialog == null) 
      return;
    formConDialog.toggle();
  }


}
