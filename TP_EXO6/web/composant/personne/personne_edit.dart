import 'dart:html';
import 'package:TP_EXO6/model/dartlero_contacts_personne.dart';
import 'package:web_ui/web_ui.dart';

class PersonneEdit extends WebComponent {
  Personnes personnes;
  Personne personne;

  update() {
    InputElement nom = querySelector('#edit-personne-nom');
    InputElement prenom = querySelector('#edit-personne-prenom');
    personne.nom = nom.value;
    personne.prenom = prenom.value;
    personnes.order(); // to see a new description in the list
    var personneTable = querySelector('#personne-table').xtag;
    personneTable.showPersonneEdit = false;
  }
}