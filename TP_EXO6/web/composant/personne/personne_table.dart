import 'dart:html';
import 'package:TP_EXO6/model/dartlero_contacts_personne.dart';
import 'package:web_ui/web_ui.dart';

class PersonneTable extends WebComponent {
  Personnes personnes;
  Personne personne;
  @observable
  bool showPersonneAdd = false;
  @observable
  bool showPersonneEdit = false;
  @observable
  bool showPersonneContacts = false;

  add() {
    ButtonElement addPersonne = querySelector('#addPersonneButton');
    if (addPersonne.text == 'Show Add') {
      showPersonneAdd = true;
      addPersonne.text = 'Hide Add';
    } else {
      showPersonneAdd = false;
      addPersonne.text = 'Show Add';
    }
  }

  edit(Personne personne) {
    showPersonneEdit = true;
    this.personne = personne;
  }

  delete(Personne personne) {
    this.personnes.remove(personne);
    showPersonneContacts = false;
  }

  showContacts(Personne personne) {
    ButtonElement personneContacts = querySelector('#${personne.code}');
    if (!showPersonneContacts && personneContacts.text == 'Show') {
      showPersonneContacts = true;
      this.personne = personne;
      this.personne.contacts.internalList = toObservable(this.personne.contacts.internalList);
      this.personne.contacts.order();
      personneContacts.text = 'Hide';
    } else if (showPersonneContacts && personneContacts.text == 'Hide') {
      showPersonneContacts = false;
      personneContacts.text = 'Show';
    }
  }
}