import 'package:polymer/polymer.dart';
import 'dart:html';
import 'dart:js';
import 'patient/add_patient.dart';
import '../probleme/add_probleme.dart';
import '../../model/systeme_gestion_patient.dart';
import 'connexion/connexion_user.dart';
//import '../../model/connexion_bd.dart';

//import 'acceuil_elements.dart';

@CustomTag('gobs-app')
class GobsApp extends PolymerElement {

//  @observable Utilisateur utilisateurConnecte;
  @observable bool showTiteTablePatient = false;
  @observable Patient patientCourant;
//  @observable String message;
  @observable String infoConnexion;
  @observable ConnexionBase connexionBase;

  GobsApp.created() : super.created() {
    connexionBase = toObservable(new ConnexionBase());
//    utilisateurConnecte = connexionBase.utilisateurConnecte;
    //  message = toObservable(connexionBase.message);
  }

  void afficherFenetreConnexion(e) {
    if (connexionBase.infoConnexion == "Ouvrir une session") {
      ConnexionUser connexionUser = shadowRoot
          .querySelector('#core-tooltip-connexion')
          .querySelector('connexion-user');
   //   ConnexionUser.
      var formConDialog =
        ConnexionUser.shadowRoot.querySelector('#paper-action-dialog');
      if (formConDialog == null) return;
      formConDialog.toggle();
    } else {
      connexionBase.authentificationDeconnexion();
    }
  }  
  
  void afficherFenetreAjouterDiagnostic(e) {
      if (!(connexionBase.utilisateurConnecte.patientCourant == null)) {
        AddProbleme addProbleme = shadowRoot
            .querySelector('#core-tooltip-diagnostic')
            .querySelector('add-probleme');

        addProbleme.probleme = new Probleme();  
//      addPatient.patient.nom = "";
//      addPatient.patient.prenom = "";

        var formConDialog =
            addProbleme.shadowRoot.querySelector('#paper-action-dialog');
        if (formConDialog == null) return;
        formConDialog.toggle();
      } else {
        connexionBase.message = "Veuillez choisir un patient svp.";
      }
    }
  
  
  
  void afficherFenetreAjouterPatient(e) {
    if (connexionBase.utilisateurConnecte != null) {
      AddPatient addPatient = shadowRoot
          .querySelector('#core-tooltip-dossier')
          .querySelector('add-patient');

      addPatient.patient = new Patient();
//      addPatient.patient.nom = "";
//      addPatient.patient.prenom = "";

      var formConDialog =
          addPatient.shadowRoot.querySelector('#paper-action-dialog');
      if (formConDialog == null) return;
      formConDialog.toggle();
    } else {
      connexionBase.message = "Veuillez vous connecter svp.";
    }
  }
}
