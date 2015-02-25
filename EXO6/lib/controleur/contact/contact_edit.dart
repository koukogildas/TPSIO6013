part of dartlero_contacts_personne;
       
class ContactEdit {  
  
  ContactTable contactTable;
  
  DivElement divFormEditContact;
  SpanElement spanTitleFormEditContact;  
  Element message;  
  InputElement email, telephone;
   
  void initialisation(){
    
    divFormEditContact = querySelector("#showContactEditForm");
    spanTitleFormEditContact = querySelector("#ContactOfEdit");
    email = querySelector("#edit-contact-email");
    telephone = querySelector("#edit-contact-telephone");
    message = querySelector("#edit-contact-message"); 
    
    ButtonElement buttonContactEdit = querySelector("#updateContactButton");
    buttonContactEdit.onClick.listen(updateContact);   
  }
  
  void ShowEditFormContact(MouseEvent event){
    
    contactTable.contactAdd.buttonShowaddContactForm.text = 'Hide Add';
    contactTable.ShowAddFormContact(event);
   
    divFormEditContact.style.visibility = "block";  
    spanTitleFormEditContact.text = "Contact de: ${contactTable.personne.prenom} ${contactTable.personne.nom}";
    
    print("visibilité formulaire après modif: ${contactTable.contact.idContact}");
   
    email.value = contactTable.contact.email;
    telephone.value = contactTable.contact.telephone; 
    
  }
   
  void HideEditFormContact(){
    email.value = "";
    telephone.value = "";
    spanTitleFormEditContact.text = "";
    divFormEditContact.style.visibility = "none"; 
  }
  

  updateContact(MouseEvent event){    
     
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
      if (contact.idContact != '${email.value} + ${telephone.value}') {
        var existingContact = personne.contacts.find(contact.idContact);
        if (existingContact != null) {
          message.text = "Le contact n'exiate pas";
        } else {
          var oldContact = contact; 
          personne.contacts.remove(contact);
          contact = new Contact();
          contact.email = email.value;
          contact.telephone = telephone.value;
          contact.idContact = '${email.value} + ${telephone.value}';
          if (personne.contacts.add(contact)) {
            personne.contacts.order(); 
            this.contactTable.load();//removeRow(oldContact.idContact);
           // this.contactTable.addRowData(contact);
            message.text = 'Le contact a été modifié';        
         
            divFormEditContact.style.visibility = "none"; 
          } else {
            
            message.text = "le contact n'a pas été modifié";
          }
        }
      }   
     
    }
  }
}

