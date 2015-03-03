import 'dart:html';
import 'dart:convert';
import 'package:EXO6/dartlero_contacts_personne.dart';

Model_contacts_personne model_contacts_personne;
PersonneTable personneTable;

void LoadPersonneData() {

  personneTable = new PersonneTable();
  model_contacts_personne = new Model_contacts_personne();
  personneTable.personnes = model_contacts_personne.personnes;
  String json = window.localStorage['dartlero_contacts_personne'];
  if (json == null) {
    model_contacts_personne.init();
  } else {
    personneTable.personnes.fromJson(JSON.decode(json));
    if (personneTable.personnes.length == 0) {
      model_contacts_personne.init();
    }
  }

  personneTable.personnes.order();
  personneTable.initialisation();
  personneTable.showPeopleList();

}

main() {
  LoadPersonneData();
}

