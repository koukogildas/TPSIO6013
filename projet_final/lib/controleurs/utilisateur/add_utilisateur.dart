import 'package:polymer/polymer.dart';
import 'package:core_elements/core_input.dart';
import 'package:paper_elements/paper_radio_group.dart';
import 'package:paper_elements/paper_radio_button.dart';
import 'dart:html';
//import 'package:projet_final/model/systeme_gestion_patient.dart';
import '../../model/systeme_gestion_patient.dart';

@CustomTag('add-utilisateur')
class AddUtilisateur extends PolymerElement {
  @published ConnexionBase connexionBase;
  @published CoreInput username = toObservable(new CoreInput());
  @published CoreInput password = toObservable(new CoreInput());
  @published CoreInput prenomUtilisateur = toObservable(new CoreInput());
  @published CoreInput nasUtilisateur = toObservable(new CoreInput());
  @published CoreInput nomFamille = toObservable(new CoreInput());
  @published PaperRadioGroup paperRadioGroup =
      toObservable(new PaperRadioGroup());

  AddUtilisateur.created() : super.created() {
    InitialiserValeurChamp();
  }

  void InitialiserValeurChamp() {
    password.value = "";
    username.value = "";
    prenomUtilisateur.value = "";
    nasUtilisateur.value = "";
    nomFamille.value = "";
  }

  void changerChoixMedecin(Event e, var detail, PaperRadioButton radio) {
    paperRadioGroup.selected = "Médecin";
  }

  void changerChoixAdmin(Event e, var detail, PaperRadioButton radio) {
    paperRadioGroup.selected = "Administrateur";
  }

  void AjouterUtilisateur(Event e, var detail, Node target) {
    if ((password.value.isEmpty) ||
        (username.value.isEmpty) ||
        (prenomUtilisateur.value.isEmpty) ||
        (nomFamille.value.isEmpty)) {
      connexionBase.message = "Veuillez remplir le(s) champ(s) obligatoire(s).";
    } else {
      if (connexionBase.trouverUnUtilisateur(username.value, password.value) !=
          null) {
        connexionBase.message =
            "Le assword et le username existe déjà. Changés les svp.";
      } else {
        if (connexionBase.trouverUnUtilisateurById(
                nomFamille.value + prenomUtilisateur.value) ==
            null) {
          Utilisateur user = toObservable(new Utilisateur());
          user.idPersonne = nomFamille.value + prenomUtilisateur.value;
          user.nom = nomFamille.value;
          user.prenom = prenomUtilisateur.value;
          user.username = username.value;
          user.password = password.value;
          user.profilAdministrateur =
              (paperRadioGroup.selected == "Administrateur") ? true : false;
          user.profilMedecin =
              (paperRadioGroup.selected == "Médecin") ? true : false;
          connexionBase.utilisateurs.add(user);
          connexionBase.message = "L'utilisateur est Ajouté";
          InitialiserValeurChamp();
        } else {
          connexionBase.message = "L'utilisateur existe déjà";
          InitialiserValeurChamp();
        }
      }
    }
  }
}
