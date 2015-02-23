part of dartlero_contacts_personne.dart;

class PersonneTable{
  
  Personnes personnes;
  Personne personne;
  ContactTable contactTable;  
  //@observable
  bool showPersonneAdd = false;
  //@observable
  bool showPersonneEdit = false;
  //@observable
  bool showPersonneContacts = false;
  
  // Table pour afficher la liste des personnes
  TableElement personneTable = querySelector('#table-Personne');
  
  load(){    
    // afficher les personnes
    for (var personneCourant in personnes.internalList){
      addRowData(personneCourant);      
    }
  }
  
  void initialisation(){
    contactTable= new ContactTable();
    contactTable.personnes = personnes;
    contactTable.intialisation();    
  }
 
  afficherContact(MouseEvent event){  
    personne = personnes.find(event.target.id);
    contactTable.personne = personne;
    contactTable.load();
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
     ContactButonPersonne.onClick.listen(afficherContact);
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
     deleteCell.children.add(deleteButonPersonne);   
   
     personneRow.children.add(nomCell);
     personneRow.children.add(prenomCell);
     personneRow.children.add(editCell);
     personneRow.children.add(deleteCell);
     personneRow.children.add(contactCell);
     personneRow.id = personne.idPersonne;
     personneTable.children.add(personneRow);
      
    }
    
  
  addPersonneTable() {
    ButtonElement addPersonne = querySelector('#addPersonneButton');
    if (addPersonne.text == 'Show Add') {
      showPersonneAdd = true;
      addPersonne.text = 'Hide Add';
    } else {
      showPersonneAdd = false;
      addPersonne.text = 'Show Add';
    }
  }

  editPersonneTable(Personne personne) {
    showPersonneEdit = true;
    this.personne = personne;
  }

  deletePersonneTable(Personne personne) {
    this.personnes.remove(personne);
    showPersonneContacts = false;
  }

  showContactsPersonneTable(Personne personne) {
    ButtonElement personneContacts = querySelector('#${personne.code}');
    if (!showPersonneContacts && personneContacts.text == 'Show') {
      showPersonneContacts = true;
      this.personne = personne;
     // this.personne.contacts.internalList = toObservable(this.personne.contacts.internalList);
      this.personne.contacts.order();
      personneContacts.text = 'Hide';
    } else if (showPersonneContacts && personneContacts.text == 'Hide') {
      showPersonneContacts = false;
      personneContacts.text = 'Show';
    }
  }
}