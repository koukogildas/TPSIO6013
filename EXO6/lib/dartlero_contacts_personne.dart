/*
  Titre:     Modèle contact personne fait  avec la librairie Dartlero
  Auteur:    Gildas Kouko
  Influence: Dzenan Ridjanovic 
  Création:  12-02-2015
*/

library dartlero_contacts_personne;

import 'package:dartlero/dartlero.dart';
import 'package:validator/validator.dart';
import 'dart:html';
import 'dart:convert';
// Entité
part 'model/entites_contact.dart';
part 'model/entites_personne.dart';

// Modèle
part 'model/model_contacts_personne.dart';

//Controleur: personne
part 'controleur/personne/personne_add.dart';
part 'controleur/personne/personne_edit.dart';
part 'controleur/personne/personne_table.dart';

//Controleur: personne
part 'controleur/contact/contact_add.dart';
part 'controleur/contact/contact_edit.dart';
part 'controleur/contact/contact_table.dart';



