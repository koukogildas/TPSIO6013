import 'dart:html';
import 'package:TP_EXO6/model/dartlero_contacts_personne.dart';
import 'package:web_ui/web_ui.dart';

class Contacttable extends WebComponent {
  Personne personne;
  Contacts contacts;
  Contact contact;
  @observable
  bool showContactAdd = false;
  @observable
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