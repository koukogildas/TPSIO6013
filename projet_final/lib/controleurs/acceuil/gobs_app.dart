import 'package:polymer/polymer.dart';
import 'package:paper_elements/paper_action_dialog.dart';
import 'dart:html';
import 'dart:js';
import 'patient/add_patient.dart';
import '../probleme/add_probleme.dart';
import '../../model/systeme_gestion_patient.dart';
import 'connexion/connexion_user.dart';
import '../utilisateur/add_utilisateur.dart';
import '../utilisateur/utilisateur_table.dart';

@CustomTag('gobs-app')
class GobsApp extends PolymerElement {
  @observable bool showTiteTablePatient = false;
  @observable Patient patientCourant;

  @observable String infoConnexion;
  @observable ConnexionBase connexionBase;

  GobsApp.created() : super.created() {
    connexionBase = toObservable(new ConnexionBase());
  }

  void afficherFenetreConnexion(e) {
    if (connexionBase.infoConnexion == "Ouvrir une session") {
      ConnexionUser connexionUser = shadowRoot
          .querySelector('#core-tooltip-connexion')
          .querySelector('connexion-user');
      connexionUser.username.value = "";
      connexionUser.password.value = "";

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
      var formConDialog =
          utilisateurTable.shadowRoot.querySelector('#paper-action-dialog');
      if (formConDialog == null) return;
      formConDialog.toggle();
    } else {
      connexionBase.message = "Veuillez vous connecter svp.";
    }
  }
}
