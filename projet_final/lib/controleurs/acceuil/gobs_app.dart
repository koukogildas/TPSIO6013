import 'package:polymer/polymer.dart';
import 'dart:html';
import 'dart:js';
import '../../model/systeme_gestion_patient.dart';
//import '../../model/connexion_bd.dart';

//import 'acceuil_elements.dart';


@CustomTag('gobs-app')
class GobsApp extends PolymerElement {

//  @observable Utilisateur utilisateurConnecte;
  @observable bool showTiteTablePatient = false;
  @observable Patient patientCourant;
  @observable String message;
  @observable String infoConnexion;  
  @observable ConnexionBase connexionBase;
  
  
  GobsApp.created() : super.created(){   
    
    connexionBase = new ConnexionBase();
//    utilisateurConnecte = connexionBase.utilisateurConnecte;
    message = connexionBase.message;
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
