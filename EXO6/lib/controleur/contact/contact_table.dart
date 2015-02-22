part of dartlero_contacts_personne.dart;

class ContactTable {
  Personne personne;
 // Contacts contacts;
  Contact contact;
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
   //nombre éléments (children) dans TableElement au lancement de l'application
    nbElementBase =  contactTable.children.length;
    textCaptionContactTable = querySelector("#id-text-caption-contact");
    textCaptionContactTable.text = "";
    buttonShowadd = querySelector("#addContactButton");
    buttonShowadd.onClick.listen(addFormContact);    
  }

  addFormContact(MouseEvent event){
    
    DivElement divFormulaireAddContact = querySelector("#showContactAdd");
    SpanElement spanTitreFormeAddContact = querySelector("#contactOf");
    spanTitreFormeAddContact.text = "contact de: ${personne.prenom} ${personne.nom}";

    if (buttonShowadd.text == 'Show Add') {      
      divFormulaireAddContact.style.display = "block";
      buttonShowadd.text = 'Hide Add';
    } else {
      divFormulaireAddContact.style.display = "none";
      buttonShowadd.text = 'Show Add';
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
       
       var editButonPersonne = new ButtonElement();
       editButonPersonne.text = "Edit";
       editButonPersonne.title= "Modifier";
       editButonPersonne.id = contact.idContact;
       editCell.children.add(editButonPersonne);
           
       var deleteButonPersonne = new ButtonElement();
       deleteButonPersonne.text = "Delete";
       deleteButonPersonne.title= "Supprier";
       deleteButonPersonne.id = contact.idContact;
       deleteCell.children.add(deleteButonPersonne);   
     
       contactRow.children.add(emailCell);
       contactRow.children.add(telephoneCell);
       contactRow.children.add(editCell);
       contactRow.children.add(deleteCell);
       contactRow.id = contact.idContact;
       contactTable.children.add(contactRow);
        
      }
  
}