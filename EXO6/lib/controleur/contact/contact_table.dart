part of dartlero_contacts_personne;

class ContactTable {
  Personnes personnes;
  Personne personne;

  Contact contact;
  ContactAdd contactAdd;
  ContactEdit contactedit;
  int nbContactBase = 0;

  TableElement contactTable;
  SpanElement textCaptionContactTable;

  void intialisation() {
    textCaptionContactTable = querySelector('#id-text-caption-contact');
    contactTable = querySelector('#table-contact');
    contactedit.contactTable = this;
    contactedit.initialisation();
    contactAdd.contactTable = this;
    contactAdd.intialisation();
    nbContactBase = contactTable.children.length;
  }

  ShowEditFormContact(MouseEvent event) {
    contact = personne.contacts.find(event.target.id);
    contactedit.ShowEditFormContact(event);
  }

  ShowAddFormContact(MouseEvent event) {
    contact = personne.contacts.find(event.target.id);
    contactAdd.ShowAddFormContact(event);

  }

  showContactList() {
    while (contactTable.children.length > nbContactBase) {
      contactTable.children.removeLast();
    }

    if (personne == null) {
      contactAdd.buttonShowaddContactForm.style.display = "none";
      contactAdd.buttonShowaddContactForm.text = 'Show Add';
      contactedit.divFormEditContact.style.display = "none";
      textCaptionContactTable.text = "";
    } else {
      contactAdd.buttonShowaddContactForm.style.display = "block";
      textCaptionContactTable.text =
          "contacts de: ${personne.prenom} ${personne.nom}";
      contactAdd.spanTitleFormeAddContact.text =
          "contact de: ${personne.prenom} ${personne.nom}";
      contactedit.divFormEditContact.style.display = "none";
      for (var contactsCourant in personne.contacts.internalList) {
        addRowData(contactsCourant);
      }
    }
  }
  addRowData(Contact contact) {
    var contactRow = new Element.tr();
    var emailCell = new Element.td();
    var telephoneCell = new Element.td();
    var editCell = new Element.td();
    var deleteCell = new Element.td();

    emailCell.text = contact.email;
    telephoneCell.text = contact.telephone;

    var editButonConcact = new ButtonElement();
    editButonConcact.text = "Edit";
    editButonConcact.title = "Modifier";
    editButonConcact.id = contact.idContact;
    editButonConcact.onClick.listen(ShowEditFormContact);
    editCell.children.add(editButonConcact);

    var deleteButonConcact = new ButtonElement();
    deleteButonConcact.text = "Delete";
    deleteButonConcact.title = "Supprier";
    deleteButonConcact.id = contact.idContact;
    deleteButonConcact.onClick.listen(deleteContact);
    deleteCell.children.add(deleteButonConcact);

    contactRow.children.add(emailCell);
    contactRow.children.add(telephoneCell);
    contactRow.children.add(editCell);
    contactRow.children.add(deleteCell);
    contactRow.id = contact.idContact;
    contactTable.children.add(contactRow);
  }

  void deleteContact(MouseEvent event) {
    contact = personne.contacts.find(event.target.id);
    personne.contacts.remove(contact);
    personne.contacts.order();
    this.showContactList();
  }
}
