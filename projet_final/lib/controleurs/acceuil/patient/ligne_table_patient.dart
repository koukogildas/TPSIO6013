import 'package:polymer/polymer.dart';
import 'dart:html';
import 'dart:js';
import 'package:core_elements/core_collapse.dart';
import '../../../model/systeme_gestion_patient.dart';

@CustomTag('ligne-table-patient')
class LigneTablePatient extends PolymerElement {
  @published Personne patient;

  LigneTablePatient.created() : super.created() {}

  void afficherDossierPatient(Event e, var detail, Node target) {
//    (querySelector('#collapse-{{$e.id}}') as CoreCollapse).toggle();
    //var x = querySelector('#collapse-{{$e.id}}') as CoreCollapse)

//    var ligne = querySelector("gobs-app").shadowRoot
//                .querySelector("core-scaffold")
//                .querySelector("patient-table").shadowRoot
//            .querySelector("ligne-table-patient").shadowRoot
//        .querySelector("core-collapse");
//    ligne = ligne.querySelector("#${patient.idPersonne}");
    
    String id = patient.idPersonne;
    
    var ligne = querySelector("gobs-app").shadowRoot
                    .querySelector("core-scaffold")
                    .querySelector("patient-table").shadowRoot
                .querySelector("#$id").shadowRoot
            .querySelector("core-collapse");
    
        ligne = ligne.querySelector("#${patient.idPersonne}");
  }
}
