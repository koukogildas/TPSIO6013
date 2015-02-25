part of dartlero_contacts_personne;

class ContactTable {
  Personnes personnes;
  Personne personne;
  
  ContactEdit contactedit;
  
  Contact contact;  
  
  ContactAdd contactAdd;
  
 TableElement contactTable;
 SpanElement textCaptionContactTable;
 
 int nbElementBase = 0;
 
  void intialisation(){ 
    textCaptionContactTable= querySelector('#id-text-caption-contact'); 
    contactTable = querySelector('#table-contact');   
    contactedit.contactTable = this;
    contactedit.initialisation();    
    contactAdd.contactTable = this;
    contactAdd.intialisation(); 
    nbElementBase =  contactTable.children.length;    
  }
  
  ShowEditFormContact(MouseEvent event){
    contact = personne.contacts.find(event.target.id);  
    contactedit.ShowEditFormContact(event);
  }  

  ShowAddFormContact(MouseEvent event){
  contact = personne.contacts.find(event.target.id);
  contactAdd.ShowAddFormContact(event);  
    
  }
  
  load(){        
    while(contactTable.children.length > nbElementBase){
      contactTable.children.removeLast();  
    }
    
    if(personne == null){
      contactAdd.buttonShowaddContactForm.style.display = "none";
      textCaptionContactTable.text = "";
    }
    else{
      contactAdd.buttonShowaddContactForm.style.display= "block";
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
       editButonConcact.onClick.listen(ShowEditFormContact);
       editCell.children.add(editButonConcact);
     
       
           
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
  
  void removeRow(String idContact){
      var r = 0;
      for (var row in contactTable.children){
        if (row is TableRowElement && r++ > nbElementBase) {
          if (row.id == idContact) {
            contactTable.rows.remove(row);
          }
        }
      }
    }
}