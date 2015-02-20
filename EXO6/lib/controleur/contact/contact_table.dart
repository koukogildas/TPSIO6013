part of dartlero_contacts_personne.dart;

class Contacttable {
  Personne personne;
  Contacts contacts;
  Contact contact;
 // @observable
  bool showContactAdd = false;
 // @observable
  bool showContactEdit = false;

  add() {
    ButtonElement addContact = querySelector("#addContactButton");
    if (addContact.text == 'Show Add') {
      showContactAdd = true;
      addContact.text = 'Hide Add';
    } else {
      showContactAdd = false;
      addContact.text = 'Show Add';
    }
  }

  edit(contact) {
    showContactEdit = true;
    this.contact = contact;
  }

  delete(contact) {
    contacts.remove(contact);
  }
}