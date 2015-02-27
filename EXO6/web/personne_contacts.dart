// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';
import 'package:EXO6/dartlero_contacts_personne.dart';
import 'dart:convert';

Model_contacts_personne model_contacts_personne;
PersonneTable personneTable;

void LoadPersonneData(){
  
   personneTable = new PersonneTable();
  // Recupération de la liste des personnes et des contacts
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


