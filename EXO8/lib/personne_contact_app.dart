import 'dart:html';
import 'dart:convert';
import 'package:polymer/polymer.dart';
import 'package:EXO8/dartlero_contacts_personne.dart';

@CustomTag('personne-contact-app')
class personneContactApp extends PolymerElement {

  @observable Personnes personnes;
  Model_contacts_personne model_contacts_personne;

  personneContactApp.created() : super.created() {
    loadPersonneData();
  }

  void loadPersonneData() {
    model_contacts_personne = new Model_contacts_personne();
    personnes = model_contacts_personne.personnes;
    String json = window.localStorage['dartlero_contacts_personne'];
    if (json == null) {
      model_contacts_personne.init();
    } else {
      personnes.fromJson(JSON.decode(json));
      if (personnes.length == 0) {
        model_contacts_personne.init();
      }
      personnes.order();
      personnes.internalList = toObservable(personnes.internalList);
    }
  }
}
