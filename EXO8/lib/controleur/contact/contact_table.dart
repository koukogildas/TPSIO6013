import '../../dartlero_contacts_personne.dart';
import 'package:polymer/polymer.dart';
import 'dart:html';

@CustomTag('contact-table')
class ContactTable extends PolymerElement {

  @published Contacts contacts;
  @observable bool showContactAdd = false;
  @observable bool showContactEdit = false;
  @observable Personnes personnes;
  @published Personne personne;
  @observable Contact contact;
  @published ButtonElement showAddContactFormButton;

  ContactTable.created() : super.created();

  showEditFormContact(Event e, var detail, Node target) {
    showAddContactFormButton =
        shadowRoot.querySelector('#showAddContactFormButton');
    String code = target.attributes['idContact'];
    contact = toObservable(contacts.find(code));
    showContactAdd = false;
    showContactEdit = true;
    showAddContactFormButton.text = 'Show Add';
  }

  showAddFormContact(Event e, var detail, Node target) {

    showAddContactFormButton =
        shadowRoot.querySelector('#showAddContactFormButton');
    if (showAddContactFormButton.text == 'Show Add') {
      showContactAdd = true;
      showContactEdit = false;
      showAddContactFormButton.text = 'Hide Add';
    } else {
      showContactAdd = false;
      showAddContactFormButton.text = 'Show Add';
    }
  }

  void deleteContact(Event e, var detail, Node target) {
    String code = target.attributes['idContact'];
    if(contact.idContact == code ){
      showContactEdit = false; 
    }
    contact = contacts.find(code);
    contacts.remove(contact);
    

  }
}
