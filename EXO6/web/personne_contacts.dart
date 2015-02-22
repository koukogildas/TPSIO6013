// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';
import 'dart:convert';
import 'package:EXO6/dartlero_contacts_personne.dart';

Model_contacts_personne model_contacts_personne;
Personnes personnes;
PersonneTable personneTable;


savePersonne(){
  window.localStorage['dartlero_contacts_personne'] =
      JSON.encode(personnes.toJson());
}

/*void AfficherContact(ButtonElement boutonContact){    
      // afficher les personnes
      //for (var personneCourant in personnes.internalList){
      //  addRowData(personneCourant);      
      //}
    }
*/

void intialisation(){
  
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
    personneTable = new PersonneTable();
    personneTable.personnes = personnes;
    personneTable.initialisation();
}

main() {  
  intialisation();
  personneTable.load();
}


