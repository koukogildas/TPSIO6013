//part of dartlero_contacts_personne;

import 'package:EXO8/dartlero_contacts_personne.dart';
import 'package:polymer/polymer.dart';
import 'package:EXO8/controleur/personne/personne_table.dart';
import 'package:EXO8/controleur/contact/contact_table.dart';
import 'package:validator/validator.dart';
import 'dart:html';

@CustomTag('contact-edit')
class ContactEdit extends PolymerElement {
  
  ContactTable contactTable;
  @published Personne personne;
  @published Contact contact;
  PersonneTable personneTable;
  InputElement email, telephone;
  SpanElement spanTitleFormEditContact, message;

  ContactEdit.created() : super.created() {
    var polymerApp = querySelector('#personne-contact-app');
    personneTable = polymerApp.shadowRoot.querySelector('#personne-table');
  }

  updateContact(Event e, var detail, Node target) {
    message = shadowRoot.querySelector("#edit-contact-message");
    email = shadowRoot.querySelector("#edit-contact-email");
    telephone = shadowRoot.querySelector("#edit-contact-telephone");
    var error = false;
    message.text = '';

    if (!isEmail(email.value)) {
      message.text = 'Veuillez saisir un email svp.';
      error = true;
    }

    if (!matches(telephone.value, telephone.pattern)) {
      if (error) {
        message.text =
            'Veuillez saisir un email et un télephone dans ce format: 111-555-4444 svp.';
      } else {
        message.text =
            'Veuillez saisir un télephone dans ce format: 111-555-4444 svp.';
        error = true;
      }
    }

    if (!error) {
      if (contact.idContact != '${email.value}${telephone.value}') {
        var existingContact = personne.contacts.find(contact.idContact);
        if (existingContact != null) {
          var oldContact = contact;

          if (personne.contacts.find('${email.value}${telephone.value}') != null) {
            message.text = "le contact existe déjà";
          } else {
            var contact = toObservable(new Contact());
            contact.email = email.value;
            contact.telephone = telephone.value;
            contact.idContact = '${email.value}${telephone.value}';
            personne.contacts.remove(oldContact);
            personne.contacts.add(contact);
            personne.contacts.order();
            message.text = 'Le contact a été modifié';
            ContactTable contactTable =
                personneTable.shadowRoot.querySelector('#contact-table');
            contactTable.showContactEdit = false;
          }
        }
      } else {
        message.text = "le contact existe déjà";
      }
    }
  }
}
