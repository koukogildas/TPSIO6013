//part of systeme_gestion_patient;

import 'package:polymer/polymer.dart';
import 'dart:html';
//import 'package:projet_final/model/systeme_gestion_patient.dart';
import '../../../model/systeme_gestion_patient.dart';



@CustomTag('add-patient')
class AddPatient extends PolymerElement {
  @published Patient patient; 

  // @published String infoConnexion;
  @published ConnexionBase connexionBase;

//  inInputElement username;
//
//  inInputElement passeword;

//  Patient get monPatient => patient;
//  set monPatient(Patient monPatient ) {
//    patient = monPatient;
//    }
  
  
  AddPatient.created() : super.created() {
    patient = new Patient();
//    patient.nom = "";
//    patient.prenom = "";
  }

  ajouterPatient(Event e, var detail, Node target) {
    patient.idPersonne = patient.prenom + patient.nom;

    var error = false;
    String messageErr = "";
    if (patient.prenom.isEmpty) {
      error = true;
      messageErr = "Entrer un prénom svp.";
    }
    if (patient.nom.isEmpty) {
      if (error) {
        messageErr = "Entrer un nom et un prénom svp.";
      } else {
        error = true;
        messageErr = "Entrer un nom svp.";
      }
    }
    if (!error) {
      if (connexionBase.utilisateurConnecte
              .trouverUnPatient(patient.idPersonne) ==
          null) {
        connexionBase.utilisateurConnecte.patients.add(patient);
        connexionBase.message = "Patient Ajouté";
      } else {
        connexionBase.message = "Un dossier existe déjà pour le patient";
      }
    } else {
      connexionBase.message = messageErr;
    }
  }
}
