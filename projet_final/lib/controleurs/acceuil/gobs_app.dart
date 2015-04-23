import 'package:polymer/polymer.dart';
import 'dart:html';
import 'dart:js';
import '../../model/systeme_gestion_patient.dart';

//import 'acceuil_elements.dart';

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

  @observable Utilisateur utilisateurConnecte;
  @observable bool showTiteTablePatient = false;
  @observable Patient patientCourant;
  @observable String message;
  @observable String infoConnexion;

  
//  ConnexionDb connexionDb;
  
  
  GobsApp.created() : super.created(){   
    //connexionDb.ouvrirUneConnexion();
    loadPersonneData();
  }

  void loadPersonneData() {
     //patients = connexionDb.listePatients(); 
    
    message = 'Veuillez vous connecter svp.';
    infoConnexion= 'Ouvrir une session';
   // utilisateurConnecte = null;
    
//     patients = new Personnes();
     utilisateurConnecte = toObservable(new Utilisateur());
     utilisateurConnecte.patients = toObservable(utilisateurConnecte.patients);
     
        var patient = new Patient();
        var patient1 = new Patient();
        
        Probleme p = new Probleme();
                p.diagnostic = "sida";
                p.commentaire = "prendre medicament";
                
        patient.nom = "exe";
        patient.prenom = "exe";
        patient.idPersonne= (utilisateurConnecte.patients.length + 1).toString();
        patient.problemes.internalList = toObservable(patient.problemes.internalList);
        patient.problemes.add(p);
        utilisateurConnecte.patients.add(patient);
        
        
        Probleme p1 = new Probleme();
                        p1.diagnostic = "testo";
                        p1.commentaire = "test";
      
        patient1.nom = "ppp";
                patient1.prenom = "xxx";
                patient1.idPersonne= (utilisateurConnecte.patients.length + 1).toString();
                patient1.problemes.internalList = toObservable(patient1.problemes.internalList);
                patient1.problemes.add(p1);
                utilisateurConnecte.patients.add(patient1);
                
                patientCourant = patient1;
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
