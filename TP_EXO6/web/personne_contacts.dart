// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';
import 'dart:convert';
import 'package:dartlero/dartlero.dart';
import 'package:TP_EXO6/model/dartlero_contacts_personne.dart';
import 'package:web_ui/web_ui.dart';

Model_contacts_personne model_contacts_personne;
Personnes personnes;

load() {
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

save() {
  window.localStorage['dartlero_contacts_personne'] =
      JSON.encode(personnes.toJson());
}

main() {
  model_contacts_personne = new Model_contacts_personne();
  personnes = model_contacts_personne.personnes;
  load();
  personnes.internalList = toObservable(personnes.internalList);
}


