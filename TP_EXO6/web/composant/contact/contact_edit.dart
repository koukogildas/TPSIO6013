import 'dart:html';
import 'package:TP_EXO6/model/dartlero_contacts_personne.dart';
import 'package:web_ui/web_ui.dart';

class ContactEdit extends WebComponent {
  Personne personne;
  Contacts contacts;
  Contact contact;

  update() {
    InputElement email = querySelector("#edit-contact-email");
    InputElement telephone = querySelector("#edit-contact-telephone");
    Element message = querySelector("#edit-contact-message");
    var error = false;
    message.text = '';
    if (email.value.trim() == '') {
      message.text = 'Veuillez saisir un email svp.';
      error = true;
    }
    if (telephone.value.trim() == '') {
      if(error){
        message.text = 'Veuillez saisir un email et un télephone svp.';
      }
      else{
        message.text = 'Veuillez saisir un télephone svp.';
        error = true;
      }
    }
    if (!error) {
      if (contact.code != '${email} + ${telephone}') {
        var existingContact = contacts.find(code.value);
        if (existingContact != null) {
          message.text = 'Le contact est déjà utilisé';
        } else {
          contacts.remove(contact);
          contact = new Link();
          contact.email = email.value;
          contact.telephone = telephone.value;
          if (contacts.add(contact)) {
            message.text = 'added';
          } else {
            message.text = 'not added';
          }
        }
      } else {
        contact.email = email.value;
        contact.telephone = telephone.value;
      }
      contacts.order(); // even if code not changed, to see the updated list
      var contactTable = querySelector('#contact-table').xtag;
      contactTable.showContactEdit = false;
    }
  }
}

