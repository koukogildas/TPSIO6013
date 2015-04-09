import 'personne_table.dart';
import '../../dartlero_contacts_personne.dart';
import 'package:polymer/polymer.dart';
import 'dart:html';

@CustomTag('personne-edit')
class PersonneEdit extends PolymerElement{

  @published Personnes personnes;
  @published Personne personne;
  
  PersonneTable personneTable;
  SpanElement personneCaptionOfEdit;
  InputElement nom, prenom;

  Element message;
  
  PersonneEdit.created() : super.created(){
    var polymerApp = querySelector('#personne-contact-app');
    personneTable =
     polymerApp.shadowRoot.querySelector('#personne-table');      
  } 
  

  update(Event e, var detail, Node target) {
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
           
          }
        }

      } else {
        message.text = "La personne existe déjà";
      }
    }

  }
   
}
