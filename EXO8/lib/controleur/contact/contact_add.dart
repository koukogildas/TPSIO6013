import 'package:EXO8/dartlero_contacts_personne.dart';
import 'package:polymer/polymer.dart';
import 'dart:html';
import 'package:validator/validator.dart';

@CustomTag('contact-add')
class ContactAdd extends PolymerElement {

  @published Personne personne;
  @published Contact contact;

  SpanElement message;
  InputElement email, telephone;

  ContactAdd.created() : super.created();

  addContact(Event e, var detail, Node target) {

    var error = false;
    email = email = shadowRoot.querySelector("#add-contact-email");
    telephone = shadowRoot.querySelector("#add-contact-telephone");
    message = shadowRoot.querySelector("#add-contact-message");
    message.text = '';

    if (!isEmail(email.value)) {
      message.text = 'Veuillez saisir un email.';
      error = true;
    }

    if (!matches(telephone.value, telephone.pattern)) {
      if (error) {
        message.text =
            'Veuillez saisir un email et un télephone dans ce format: 111-555-4444 svp.';
      } else {
        message.text =
            'Veuillez saisir un téléphone dans ce format: 111-555-4444 svp.';
        error = true;
      }
    }

    if (!error) {
      contact = new Contact();
      contact.email = email.value;
      contact.telephone = telephone.value;
      contact.idContact = '${email.value} + ${telephone.value}';
      if (personne.contacts.add(contact)) {
        message.text = 'Le contact a été ajouté';
        personne.contacts.order();
        email.value = "";
        telephone.value = "";
      } else {
        message.text = 'Le contact existe déjà';
      }
    }
  }
}
