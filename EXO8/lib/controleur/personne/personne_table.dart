//part of dartlero_contacts_personne;
import 'package:EXO8/dartlero_contacts_personne.dart';
import 'package:polymer/polymer.dart';
import 'dart:html';
import 'package:EXO8/controleur/contact/contact_table.dart';
import 'dart:convert';

@CustomTag('personne-table')
class PersonneTable extends PolymerElement {

  @published Personnes personnes;
  @observable Personne personne;
  @observable bool showAdd = false;
  @observable bool showEdit = false;
  @observable bool showPersonneContacts = false;
  ContactTable contactTable;
  ButtonElement showAddPersonneForm;

  PersonneTable.created() : super.created();

  void hideFormAnEditdAddOfContact() {
    if (showPersonneContacts) {
      contactTable = shadowRoot.querySelector('#contact-table');
      contactTable.showContactEdit = false;
      contactTable.showContactAdd = false;
      if (contactTable.showAddContactFormButton != null) contactTable.showAddContactFormButton.text =
          'Show Add';
    }
  }

  showAddFormPersonne(Event e, var detail, Node target) {
    showAddPersonneForm =
        shadowRoot.querySelector('#showPersonneAddFormButton');
    if (showAddPersonneForm.text == 'Show Add') {
      showAdd = true;
      showAddPersonneForm.text = 'Hide Add';
      showEdit = false;
    } else {
      showAdd = false;
      showAddPersonneForm.text = 'Show Add';
    }
  }

  savePersonne(Event e, var detail, Element target) {
    window.localStorage['dartlero_contacts_personne'] =
        JSON.encode(personnes.toJson());
  }

  showEditFormPersonne(Event e, var detail, Element target) {
    showAddPersonneForm =
        shadowRoot.querySelector('#showPersonneAddFormButton');
    String code = target.attributes['idPersonne'];
    personne = toObservable(personnes.find(code));
    personne.contacts.internalList =
        toObservable(personne.contacts.internalList);
    showEdit = true;
    showAddPersonneForm.text = 'Show Add';
    showAdd = false;
    hideFormAnEditdAddOfContact();
  }

  deletePersonne(Event e, var detail, Element target) {
    String code = target.attributes['idPersonne'];
    if(personne.idPersonne == code){
      showPersonneContacts = false;
      showEdit = false;
    }
    personnes.remove(personnes.find(code));
   
  }

  showContactPersonList(Event e, var detail, Element target) {

    String code = target.attributes['idPersonne'];
    personne = personnes.find(code);
    personne.contacts.internalList =
        toObservable(personne.contacts.internalList);
    hideFormAnEditdAddOfContact();
    showPersonneContacts = true;
  }

}
