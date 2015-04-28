import 'package:polymer/polymer.dart';
import 'dart:html';
//import 'package:core_elements/core_collapse.dart';
import '../../model/systeme_gestion_patient.dart';
//import 'package:core_elements/core_input.dart';
//import 'package:paper_elements/paper_input.dart';

@CustomTag('ligne-table-utilisateur')
class LigneTableUtilisateurt extends PolymerElement {
  @published Utilisateur utilisateur;
  @published ConnexionBase connexionBase;
  @published String profil = "";
  // @published String StrDossierPatient;

  LigneTableUtilisateurt.created() : super.created() {
//    if (utilisateur.profilAdministrateur){
//      profil = "Administrateur";
//    } else {
//      profil = "Médecin";
//    }
  }

//  void afficherDossierPatient(Event e, var detail, Node target) {
//    connexionBase.definirPatientCourant(patient.idPersonne);
//    (this.shadowRoot.querySelector("core-collapse") as CoreCollapse).toggle();
//    connexionBase.message= "";
//  }
  
  supprimerUnUtilisateur(Event e, var detail, Node target) {
    if (utilisateur.idPersonne !=
        connexionBase.utilisateurConnecte.idPersonne) {
      connexionBase.utilisateurs.remove(utilisateur);
      connexionBase.message = "L'utilisateur est supprimé";
    }
    else{
      connexionBase.message = "Vous êtes actuellement connecté";
    }
  }
}
