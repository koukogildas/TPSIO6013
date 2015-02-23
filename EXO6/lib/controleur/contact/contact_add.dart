part of dartlero_contacts_personne.dart;

class ContactAdd{
 // Personnes personnes;
 // Personne personne;
  ContactTable contactTable;
  
  ContactAdd(this.contactTable);
  
  void intialisation(){
    ButtonElement buttonContactAdd = querySelector("#addContact");
    buttonContactAdd.onClick.listen(addContact);
  }
  
  addContact(MouseEvent event) {
    //ButtonElement buttonShowContactAdd = querySelector("#addContactButton");
    // personne = contactTable.personnes.find(buttonShowContactAdd.name);
    InputElement email = querySelector("#add-contact-email");
    InputElement telephone = querySelector("#add-contact-telephone");
    Element message = querySelector("#add-contact-message");
    var error = false;
    message.text = '';
    if (email.value.trim() == '') {
      message.text = 'Veuillez saisir le email.';
      error = true;
    }

    if (telephone.value.trim() == '') {
      if (error) {
        message.text = 'Veuillez saisir le email et le téléphone svp.';
      } else {
        message.text = 'Veuillez saisir le téléphone svp.';
        error = true;
      }
    }

    if (!error) {
      var contact = new Contact();      
      contact.email = email.value;
      contact.telephone = telephone.value;
      contact.idContact = '${email.value} + ${telephone.value}';
      if (contactTable.personne.contacts.add(contact)) {
        message.text = 'Le contact a été ajouté';
        contactTable.personne.contacts.order();
        contactTable.addRowData(contact);
        email.value = "";
        telephone.value = "";
      } else {
        message.text = 'Le contact existe déjà';
      }
    }
  }
}
