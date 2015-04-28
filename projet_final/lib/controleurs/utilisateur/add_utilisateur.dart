import 'package:polymer/polymer.dart';
import 'package:core_elements/core_input.dart';
import 'package:paper_elements/paper_radio_group.dart';
import 'dart:html';
//import 'package:projet_final/model/systeme_gestion_patient.dart';
import '../../model/systeme_gestion_patient.dart';

@CustomTag('add-utilisateur')
class AddUtilisateur extends PolymerElement {
  @published ConnexionBase connexionBase;
  @published CoreInput username = new CoreInput();
  @published CoreInput password = new CoreInput();
  @published CoreInput nomUtilisateur = new CoreInput();
  @published CoreInput prenomUtilisateur = new CoreInput();
  @published CoreInput nasUtilisateur = new CoreInput();
  @published CoreInput nomFamille = new CoreInput();
  @published PaperRadioGroup paperRadioGroup = new PaperRadioGroup();

  AddUtilisateur.created() : super.created() {
    InitialiserValeurChamp();
  }

  void InitialiserValeurChamp() {
    password.value = "";
    username.value = "";
    nomUtilisateur.value = "";
    prenomUtilisateur.value = "";
    nasUtilisateur.value = "";
    nomFamille.value = "";
    paperRadioGroup.selected = "Médecin";
  }

  void AjouterUtilisateur(Event e, var detail, Node target) {
    if ((password.value.isEmpty) ||
        (username.value.isEmpty) ||
        (nomUtilisateur.value.isEmpty) ||
        (prenomUtilisateur.value.isEmpty) ||
        (nomFamille.value.isEmpty)) {
      connexionBase.message = "Veuillez remplir le(s) champ(s) obligatoire(s).";
    } else {
      if (connexionBase.trouverUnUtilisateurById(
              nomUtilisateur.value + prenomUtilisateur.value) ==
          null) {
        Utilisateur user = new Utilisateur();
        user.idPersonne = nomUtilisateur.value + prenomUtilisateur.value;
        user.nom = nomFamille.value;
        user.prenom = prenomUtilisateur.value;
        user.username = nomUtilisateur.value;
        user.password = password.value;
        user.profilAdministrateur =
            (paperRadioGroup.selected == "Administrateur") ? true : false;
        user.profilMedecin =
            (paperRadioGroup.selected == "Médecin") ? true : false;

        connexionBase.utilisateurs.add(user);
        connexionBase.message = "L'utilisateur est Ajouté";
      } else {
        connexionBase.message = "L'utilisateur existe déjà";
      }
    }
  }
}
