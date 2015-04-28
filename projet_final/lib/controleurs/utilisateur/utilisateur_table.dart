import 'package:polymer/polymer.dart';
//import 'package:projet_final/model/systeme_gestion_patient.dart';
import '../../model/systeme_gestion_patient.dart';
import 'dart:html';

@CustomTag('utilisateur-table')
class UtilisateurTable extends PolymerElement {
  @published ConnexionBase connexionBase;
  @observable Utilisateur utilisateur;

  UtilisateurTable.created() : super.created() {}

//  void afficherDossierPatient(Event e, var detail, Node target) {}
}