part of dartlero_contacts_personne;

class PersonneTable{
  
  Personnes personnes;
  Personne personne;
  
  PersonneAdd personneAdd;  
  ContactTable contactTable;
  
  int nbPersonneBase = 0;
 
  // Table pour afficher la liste des personnes
  TableElement personneTable;
  ButtonElement buttonPersonneSaveData;
  
  showPeopleList(){    
         
      while(personneTable.children.length > nbPersonneBase){
        personneTable.children.removeLast();  
       }
       
       if(personnes.length == 0){
         buttonPersonneSaveData.style.display = "none";
       }
       else{
         buttonPersonneSaveData.style.display= "block";
         for (var personneCourant in personnes.internalList){
               addRowData(personneCourant);      
         }
       }
    }
  
  savePersonne(MouseEvent event){
    window.localStorage['dartlero_contacts_personne'] =
        JSON.encode(personnes.toJson());
  }
  
  void initialisation(){
    
    personneTable = querySelector('#table-Personne'); 
    nbPersonneBase = personneTable.children.length;
    buttonPersonneSaveData = querySelector("#savePersonnesData");
    buttonPersonneSaveData.onClick.listen(savePersonne);
    
    contactTable= new ContactTable();
    contactTable.personnes = personnes;    
    contactTable.contactedit = new ContactEdit();    
    contactTable.contactAdd = new ContactAdd();
    contactTable.intialisation(); 
    
    personneAdd =  new PersonneAdd();
    personneAdd.personneTable = this;
    personneAdd.intialisation();
        
  }
  
  showAddFormPersonne(MouseEvent event){
    personne = personnes.find(event.target.id);  
        personneAdd.showAddFormPersonne(event);
  }
  
  
  addRowData(Personne personne){ 
     var personneRow = new Element.tr();
     var nomCell = new Element.td();
     var prenomCell = new Element.td();
     var editCell = new Element.td();
     var deleteCell = new Element.td();
     var contactCell = new Element.td();
     
     nomCell.text = personne.nom;
     prenomCell.text = personne.prenom;
     
     var ContactButonPersonne = new ButtonElement();
     ContactButonPersonne.text = "Contacts";
     ContactButonPersonne.title= "Afficher les contacts";
     ContactButonPersonne.id = personne.idPersonne;
     ContactButonPersonne.onClick.listen(showContactPersonList);
     contactCell.children.add(ContactButonPersonne);
     
     var editButonPersonne = new ButtonElement();
     editButonPersonne.text = "Edit";
     editButonPersonne.title= "Modifier";
     editButonPersonne.id = personne.code;
     editCell.children.add(editButonPersonne);
         
     var deleteButonPersonne = new ButtonElement();
     deleteButonPersonne.text = "Delete";
     deleteButonPersonne.title= "Supprier";
     deleteButonPersonne.id = personne.idPersonne;
     deleteButonPersonne.onClick.listen(deletePersonne);
     deleteCell.children.add(deleteButonPersonne);   
   
     personneRow.children.add(nomCell);
     personneRow.children.add(prenomCell);
     personneRow.children.add(editCell);
     personneRow.children.add(deleteCell);
     personneRow.children.add(contactCell);
     personneRow.id = personne.idPersonne;
     personneTable.children.add(personneRow);      
    }
  
  void deletePersonne(MouseEvent event){
    contactTable.contactAdd.divFormAddContact.style.display = "none";
    contactTable.contactedit.divFormEditContact.style.display = "none";
    personne = personnes.find(event.target.id);
         personne.contacts.clear();
         personnes.remove(personne);
         personne = null;
         this.showContactPersonList(null);
         this.showPeopleList();          
   personnes.order();
     
  }
  
  showContactPersonList(MouseEvent event){ 
    if(event!= null)
     personne = personnes.find(event.target.id);     
      
     contactTable.personne = personne;
     contactTable.showContactList();
     
   }
  
}