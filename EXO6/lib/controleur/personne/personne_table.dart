part of dartlero_contacts_personne;

class PersonneTable{
  
  Personnes personnes;
  Personne personne;
  ContactTable contactTable;  
  ButtonElement buttonPersonneShowaddForm;

  
  // Table pour afficher la liste des personnes
  TableElement personneTable;
  
  ShowPeopleList(){    
    for (var personneCourant in personnes.internalList){
      addRowData(personneCourant);      
    }
  }
  
  void initialisation(){
    
    personneTable = querySelector('#table-Personne');    
    buttonPersonneShowaddForm = querySelector("#showPersonneAddFormButton");
    buttonPersonneShowaddForm.onClick.listen(ShowAddFormPersonne);
    
    contactTable= new ContactTable();
    contactTable.personnes = personnes;    
    contactTable.contactedit = new ContactEdit();    
    contactTable.contactAdd = new ContactAdd();
    contactTable.intialisation();         
  }
  
  ShowAddFormPersonne(MouseEvent event){
      DivElement divFormulaireAddPersonne = querySelector("#showPersonneAddForm");
      if (buttonPersonneShowaddForm.text == 'Show Add') {      
        divFormulaireAddPersonne.style.display = "block";
        buttonPersonneShowaddForm.text = 'Hide Add';
      } 
      else {
        divFormulaireAddPersonne.style.display = "none";
        buttonPersonneShowaddForm.text = 'Show Add';
        
        Element message = querySelector("#add-personne-message");
        InputElement nom = querySelector("#add-personne-nom");
        InputElement prenom = querySelector("#add-personne-prenom");
        
        message.text = "";
        nom.value = "";      
        prenom.value = "";      
        
      }
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
     ContactButonPersonne.onClick.listen(ShowContactPersonList);
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
  
  ShowContactPersonList(MouseEvent event){  
     personne = personnes.find(event.target.id);
     contactTable.personne = personne;
     contactTable.load();
   }
  
}