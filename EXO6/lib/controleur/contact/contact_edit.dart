part of dartlero_contacts_personne;

class ContactEdit {

  ContactTable contactTable;

  Element message;
  DivElement divFormEditContact;
  InputElement email, telephone;
  SpanElement spanTitleFormEditContact;

  void initialisation() {

    divFormEditContact = querySelector("#showContactEditForm");
    spanTitleFormEditContact = querySelector("#ContactOfEdit");
    email = querySelector("#edit-contact-email");
    telephone = querySelector("#edit-contact-telephone");
    message = querySelector("#edit-contact-message");

    ButtonElement buttonContactEdit = querySelector("#updateContactButton");
    buttonContactEdit.onClick.listen(updateContact);
  }

  void ShowEditFormContact(MouseEvent event) {

    contactTable.contactAdd.buttonShowaddContactForm.text = 'Hide Add';
    contactTable.ShowAddFormContact(event);
    divFormEditContact.style.display = "block";
    spanTitleFormEditContact.text =
        "Contact de: ${contactTable.personne.prenom} ${contactTable.personne.nom}";
    email.value = contactTable.contact.email;
    telephone.value = contactTable.contact.telephone;
    message.text = '';

  }

  void HideEditFormContact() {
    email.value = "";
    telephone.value = "";
    spanTitleFormEditContact.text = "";
    divFormEditContact.style.visibility = "none";
  }

  updateContact(MouseEvent event) {

    var contact = contactTable.contact;
    var personne = contactTable.personne;
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

          if (personne.contacts.find('${email.value}${telephone.value}') !=
              null) {
            message.text = "le contact existe déjà";
          } else {
            contactTable.contact.email = email.value;
            contactTable.contact.telephone = telephone.value;
            contactTable.contact.idContact = '${email.value}${telephone.value}';

            personne.contacts.order();
            this.contactTable.showContactList();
            message.text = 'Le contact a été modifié';

            divFormEditContact.style.display = "none";
          }
        }

      } else {
        message.text = "le contact existe déjà";
      }
    }
  }
}
