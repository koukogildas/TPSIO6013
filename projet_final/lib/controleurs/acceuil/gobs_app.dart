import 'package:polymer/polymer.dart';
import 'dart:html';
import 'dart:js';
import 'patient/add_patient.dart';
import '../../model/systeme_gestion_patient.dart';
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
      var formConDialog = shadowRoot
          .querySelector('#core-tooltip-connexion')
          .querySelector('connexion-user');
      formConDialog =
          formConDialog.shadowRoot.querySelector('#paper-action-dialog');
      if (formConDialog == null) return;
      formConDialog.toggle();
    } else {
      connexionBase.authentificationDeconnexion();
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
