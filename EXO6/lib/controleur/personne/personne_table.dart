part of dartlero_contacts_personne.dart;

class PersonneTable{
  Personnes personnes;
  Personne personne;
  //@observable
  bool showPersonneAdd = false;
  //@observable
  bool showPersonneEdit = false;
  //@observable
  bool showPersonneContacts = false;

  addPersonneTable() {
    ButtonElement addPersonne = querySelector('#addPersonneButton');
    if (addPersonne.text == 'Show Add') {
      showPersonneAdd = true;
      addPersonne.text = 'Hide Add';
    } else {
      showPersonneAdd = false;
      addPersonne.text = 'Show Add';
    }
  }

  editPersonneTable(Personne personne) {
    showPersonneEdit = true;
    this.personne = personne;
  }

  deletePersonneTable(Personne personne) {
    this.personnes.remove(personne);
    showPersonneContacts = false;
  }

  showContactsPersonneTable(Personne personne) {
    ButtonElement personneContacts = querySelector('#${personne.code}');
    if (!showPersonneContacts && personneContacts.text == 'Show') {
      showPersonneContacts = true;
      this.personne = personne;
     // this.personne.contacts.internalList = toObservable(this.personne.contacts.internalList);
      this.personne.contacts.order();
      personneContacts.text = 'Hide';
    } else if (showPersonneContacts && personneContacts.text == 'Hide') {
      showPersonneContacts = false;
      personneContacts.text = 'Show';
    }
  }
}