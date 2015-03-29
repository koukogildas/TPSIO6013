//part of dartlero_contacts_personne;
import 'package:EXO8/controleur/personne/personne_table.dart';
import 'package:EXO8/dartlero_contacts_personne.dart';
import 'package:polymer/polymer.dart';
import 'dart:html';

@CustomTag('personne-edit')
class PersonneEdit extends PolymerElement{

  @published Personnes personnes;
  @published Personne personne;
  
  
  static PersonneEdit myself;
  PersonneTable personneTable;
//  ButtonElement buttonEditPersonne;
//  DivElement divFormulaireEditPersonne;
  SpanElement personneCaptionOfEdit;
  InputElement nom, prenom;
 // @published String nom, prenom;
  Element message;
  
  PersonneEdit.created() : super.created(){
    var polymerApp = querySelector('#personne-contact-app');
    personneTable =
     polymerApp.shadowRoot.querySelector('#personne-table');    
    
   // nom = personneTable.shadowRoot.querySelector("personne-edit").querySelector("#edit-personne-name");
    //prenom = shadowRoot.querySelector("#edit-personne-prenom");
    
  }
      
    

  /*void intialisation(){
    
    divFormulaireEditPersonne = querySelector("#showPersonneEditForm");
    personneCaptionOfEdit = querySelector("#personneCaptionOfEdit");
    message = querySelector("#edit-personne-message");
    nom = querySelector("#edit-personne-name");
    prenom = querySelector("#edit-personne-prenom");

    buttonEditPersonne = querySelector("#updatePersonneButton");
    buttonEditPersonne.onClick.listen(UpdatePersonne);

  }*/
  
  
  

 /* showEditFormPersonne(MouseEvent event) {
    var personne =  personneTable.personnes.find(event.target.id);
    buttonEditPersonne.name = personne.idPersonne;
    personneCaptionOfEdit.text =
        "Personne courante: ${personne.prenom} ${personne.nom}";    
    personneTable.personneAdd.buttonPersonneShowaddForm.text = 'Hide Add';
    personneTable.showAddFormPersonne(event);
    divFormulaireEditPersonne.style.display = "block";
    personneTable.personneAdd.divFormulaireAddPersonne.style.display = "none";
    nom.value = personneTable.personne.nom;
    prenom.value = personneTable.personne.prenom;
    message.text = '';
  }*/
  
 
  
//  enteredView() {
//     super.enteredView();
//     nom = personne.nom;
//     prenom = personne.prenom;
//   }
  
  //UpdatePersonne(MouseEvent event) {
  update(Event e, var detail, Node target) {

  //  var personne = personneTable.personnes.find(buttonEditPersonne.name);
    nom = shadowRoot.querySelector("#edit-personne-name");
    prenom = shadowRoot.querySelector("#edit-personne-prenom");
    message = shadowRoot.querySelector("#edit-personne-message");
    personneCaptionOfEdit = shadowRoot.querySelector("#personneCaptionOfEdit");
    var error = false;
    message.text = '';
    if (nom.value.trim() == '') {
      message.text = 'Veuillez saisir un nom svp.';
      error = true;
    }
    if (prenom.value.trim() == '') {
      if (error) {
        message.text = 'Veuillez saisir un nom et un prenom svp.';
      } else {
        message.text = 'Veuillez saisir un prénom svp.';
        error = true;
      }
    }
    if (!error) {
      if (personne.idPersonne != '${nom.value}${prenom.value}') {
        var existingContact = personnes.find(personne.idPersonne);
        if (existingContact != null) {
          var oldPersonne = personne;
          if (personnes.find('${nom.value}${prenom.value}') !=
              null) {
            message.text = "La personne existe déjà";
          } else { 
            personne = new Personne();
            personne.nom = nom.value;
            personne.prenom = prenom.value;
            personne.idPersonne = '${nom.value}${prenom.value}';
            personne.contacts = oldPersonne.contacts;
            personnes.remove(oldPersonne);
            personnes.add(personne);
            personnes.order();
            personneTable.showEdit = false;
            personneCaptionOfEdit.text = "";
            //personneTable.showPeopleList();
            //personneTable.contactTable.showContactList();
            //divFormulaireEditPersonne.style.display = "none";
          }
        }

      } else {
        message.text = "La personne existe déjà";
      }
    }

  }
   
}
