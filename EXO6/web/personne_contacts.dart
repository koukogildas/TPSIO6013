// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';
import 'package:EXO6/dartlero_contacts_personne.dart';
import 'dart:convert';

Model_contacts_personne model_contacts_personne;
Personnes personnes;
PersonneTable personneTable;



void LoadPersonneData(){
  
  // Recupération de la liste des personnes et des contacts
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
    }
    personnes.order(); 
    
}

main() {  
  
  LoadPersonneData();
  
  personneTable = new PersonneTable();
  personneTable.personnes = personnes;
  personneTable.initialisation();
  personneTable.ShowPeopleList();
}


