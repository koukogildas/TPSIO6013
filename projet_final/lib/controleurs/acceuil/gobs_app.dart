import 'package:polymer/polymer.dart';
import 'dart:html';
import 'dart:js';
import 'patient/add_patient.dart';
import '../probleme/add_probleme.dart';
import '../../model/systeme_gestion_patient.dart';
import 'connexion/connexion_user.dart';

import '../utilisateur/add_utilisateur.dart';
import '../utilisateur/utilisateur_table.dart';
//import '../../model/connexion_bd.dart';

//import 'acceuil_elements.dart';

@CustomTag('gobs-app')
class GobsApp extends PolymerElement {

//@observable Utilisateur utilisateurConnecte;
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
      connexionUser.username.value="";
      connexionUser.password.value="";
      
      var formConDialog =
          connexionUser.shadowRoot.querySelector('#paper-action-dialog');
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
        var formConDialog =
            addProbleme.shadowRoot.querySelector('#paper-action-dialog');
        if (formConDialog == null) return;
        formConDialog.toggle();
      } else {
        connexionBase.message = "Veuillez choisir un patient svp.";
      }
    }
  
  void afficherFenetreAjouterCompte(e) {
        if (connexionBase.utilisateurConnecte.profilAdministrateur) {
          AddUtilisateur addUtilisateur = shadowRoot
              .querySelector('#core-tooltip-compte')
              .querySelector('add-utilisateur');        
          addUtilisateur.InitialiserValeurChamp();  
          var formConDialog =
              addUtilisateur.shadowRoot.querySelector('#paper-action-dialog');
          if (formConDialog == null) return;
          formConDialog.toggle();
        } else {
          connexionBase.message = "Vous n'avez pas le droit d'administrateur.";
        }
      }
  
  
  void afficherFenetreAjouterPatient(e) {
      if (connexionBase.utilisateurConnecte != null) {
        AddPatient addPatient = shadowRoot
            .querySelector('#core-tooltip-dossier')
            .querySelector('add-patient');
        
        addPatient.patient = new Patient();

        var formConDialog =
            addPatient.shadowRoot.querySelector('#paper-action-dialog');
        if (formConDialog == null) return;
        formConDialog.toggle();
      } else {
        connexionBase.message = "Veuillez vous connecter svp.";
      }
    }
  
  
  
  void afficherFenetreListeCompte(e) {
    if (connexionBase.utilisateurConnecte != null) {
      UtilisateurTable utilisateurTable = shadowRoot
          .querySelector('#core-tooltip-listeUtilisateur')
          .querySelector('utilisateur-table');
      
    //  utilisateurTable.patient = new Patient();

      var formConDialog =
          utilisateurTable.shadowRoot.querySelector('#paper-action-dialog');
      if (formConDialog == null) return;
      formConDialog.toggle();
    } else {
      connexionBase.message = "Veuillez vous connecter svp.";
    }
  }
  
  
  
  
}
