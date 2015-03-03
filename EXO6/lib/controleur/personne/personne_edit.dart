part of dartlero_contacts_personne;

class PersonneEdit {

  PersonneTable personneTable;
  ButtonElement buttonEditPersonne;
  DivElement divFormulaireEditPersonne;
  SpanElement personneCaptionOfEdit;
  InputElement nom, prenom;
  Element message;

  void intialisation(){
    
    divFormulaireEditPersonne = querySelector("#showPersonneEditForm");
    personneCaptionOfEdit = querySelector("#personneCaptionOfEdit");
    message = querySelector("#edit-personne-message");
    nom = querySelector("#edit-personne-name");
    prenom = querySelector("#edit-personne-prenom");

    buttonEditPersonne = querySelector("#updatePersonneButton");
    buttonEditPersonne.onClick.listen(UpdatePersonne);

  }

  showEditFormPersonne(MouseEvent event) {
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
  }
  
  UpdatePersonne(MouseEvent event) {

    var personne = personneTable.personnes.find(buttonEditPersonne.name);
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
        var existingContact = personneTable.personnes.find(personne.idPersonne);
        if (existingContact != null) {
          var oldPersonne = personne;
          if (personneTable.personnes.find('${nom.value}${prenom.value}') !=
              null) {
            message.text = "La personne existe déjà";
          } else {
            personneCaptionOfEdit.text = "";
            personne.nom = nom.value;
            personne.prenom = prenom.value;
            personneTable.personnes.order();
            personneTable.showPeopleList();
            personneTable.contactTable.showContactList();
            divFormulaireEditPersonne.style.display = "none";
          }
        }

      } else {
        message.text = "le contact existe déjà";
      }
    }

  }
}
