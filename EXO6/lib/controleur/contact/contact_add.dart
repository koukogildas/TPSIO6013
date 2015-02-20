part of dartlero_contacts_personne.dart;

class ContactAdd{
  Personne personne;
  Contacts contacts;

  addContact() {
    InputElement code = querySelector("#add-contact-code");
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
      contact.idContact = '${email} + ${telephone}';
      contact.email = email.value;
      contact.telephone = telephone.value;
      if (contacts.add(contact)) {
        message.text = 'Ajouté';
        contacts.order();
      } else {
        message.text = 'Le contact existe déjà';
      }
    }
  }
}
