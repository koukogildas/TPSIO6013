part of dartlero_contacts_personne.dart;

class ContactTable {
  Personnes personnes;
  Personne personne;
  Contact contact;  
  
  ContactAdd contactAdd;
  ContactEdit contactedit;
  
 // @observable
  bool showContactAdd = false;
 // @observable
  bool showContactEdit = false;
  
 // Table pour afficher la liste des personnes
 TableElement contactTable;
 SpanElement textCaptionContactTable;
 ButtonElement buttonShowadd;
 int nbElementBase = 0;
 
  void intialisation(){
    
    contactTable = querySelector('#table-contact');    
    
    contactAdd = new ContactAdd(this);
    contactAdd.intialisation();
    
    contactedit = new ContactEdit(this);
    contactedit.init();   
   
    nbElementBase =  contactTable.children.length;
    
    textCaptionContactTable = querySelector("#id-text-caption-contact");
    textCaptionContactTable.text = "";
    
    buttonShowadd = querySelector("#addContactButton");
    buttonShowadd.onClick.listen(addFormContact);    
  }
  
  editFormContact(MouseEvent event){
    DivElement divFormulaireEditContact = querySelector("#showContactEdit");
    divFormulaireEditContact.style.visibility = "block";
    SpanElement spanTitreFormeEditContact = querySelector("#contactOf");
//    spanTitreFormeEditContact.text = "contact de: ${personne.prenom} ${personne.nom}";
//    contact = personne.contacts.find(event.target.id);  
//    contactedit.load();
  }
  

  addFormContact(MouseEvent event){
    
    DivElement divFormulaireAddContact = querySelector("#showContactAdd");
    SpanElement spanTitreFormeAddContact = querySelector("#contactOfAdd");
    spanTitreFormeAddContact.text = "contact de: ${personne.prenom} ${personne.nom}";

    if (buttonShowadd.text == 'Show Add') {      
      divFormulaireAddContact.style.display = "block";
      buttonShowadd.text = 'Hide Add';
      buttonShowadd.name = personne.idPersonne;
    } else {
      divFormulaireAddContact.style.display = "none";
      buttonShowadd.text = 'Show Add';
      buttonShowadd.name = "";
      
      // on vide les champs;
      Element message = querySelector("#add-contact-message");
      InputElement email = querySelector("#add-contact-email");
      InputElement telephone = querySelector("#add-contact-telephone");
      
      message.text = "";
      email.value = "";      
      telephone.value = "";      
      
    }
    
  }

  editContact(contact) {
    showContactEdit = true;
    this.contact = contact;
  }

  deleteContact(contact) {
    personne.contacts.remove(contact);
  }
  
  load(){        
    while(contactTable.children.length > nbElementBase){
      contactTable.children.removeLast();  
    }
    
    if(personne == null){
      buttonShowadd.style.display = "none";
      textCaptionContactTable.text = "";
    }
    else{
      buttonShowadd.style.display= "block";
      textCaptionContactTable.text= "contacts de: ${personne.prenom} ${personne.nom}";
      for (var contactsCourant in personne.contacts.internalList){
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
       editButonConcact.title= "Modifier";
       editButonConcact.id = contact.idContact;
       editCell.children.add(editButonConcact);
       editButonConcact.onClick.listen(editFormContact);
       
           
       var deleteButonConcact = new ButtonElement();
       deleteButonConcact.text = "Delete";
       deleteButonConcact.title= "Supprier";
       deleteButonConcact.id = contact.idContact;
       deleteCell.children.add(deleteButonConcact);   
     
       contactRow.children.add(emailCell);
       contactRow.children.add(telephoneCell);
       contactRow.children.add(editCell);
       contactRow.children.add(deleteCell);
       contactRow.id = contact.idContact;
       contactTable.children.add(contactRow);        
      } 
  
  void  removeRow(String idContact){
      var r = 0;
      for (var row in contactTable.children) {
        if (row is TableRowElement && r++ > nbElementBase) {
          if (row.id.text == idContact) {
            contactTable.rows.remove(row);
          }
        }
      }
    }
}