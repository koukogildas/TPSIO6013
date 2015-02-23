part of dartlero_contacts_personne.dart;

class ContactEdit {
  Personne personne;
  
  ContactTable contactTable;
  
  ContactEdit(this.contactTable);
  
  void init(){
    ButtonElement buttonShowContactEdit = querySelector("#updateContactButton");
    buttonShowContactEdit.onClick.listen(updateContact);   
  }
  
  void load(){
    InputElement email = querySelector("#edit-contact-email");
    InputElement telephone = querySelector("#edit-contact-telephone");
    email.value = contactTable.contact.email;
    telephone.value = contactTable.contact.telephone;
  }

  updateContact(MouseEvent event){
    
    InputElement email = querySelector("#edit-contact-email");
    InputElement telephone = querySelector("#edit-contact-telephone");
    Element message = querySelector("#edit-contact-message"); 
    
    var contact = contactTable.contact;
    var personne = contactTable.personne;
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
      if (contact.idContact != '${email} + ${telephone}') {
        var existingContact = personne.contacts.find(contact.idContact);
        if (existingContact != null) {
          message.text = 'Le contact est déjà utilisé';
        } else {
          personne.contacts.remove(contact);
          var oldContact = contact;
          contact = new Contact();
          contact.email = email.value;
          contact.telephone = telephone.value;
          if (personne.contacts.add(contact)) {
            this.contactTable.removeRow(oldContact.idContact);
            this.contactTable.addRowData(contact);
            message.text = 'Le contact a été modifié';
            personne.contacts.order(); 
            
            DivElement divFormulaireEditContact = querySelector("#showContactEdit");
         //   divFormulaireEditContact.style.visibility = "none";
          } else {
            
            message.text = "le contact n'a pas été modifié";
          }
        }
      }/* else {
        contact.email = email.value;
        contact.telephone = telephone.value;
      }*/
     
     
    }
  }
}

