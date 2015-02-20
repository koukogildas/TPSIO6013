part of dartlero_contacts_personne.dart;

class PersonneAdd{
  Personnes personnes;

  AddPersonne() {
    InputElement nom = querySelector('#add-personne-nom');
    InputElement prenom = querySelector('#add-personne-prenom');
    Element message = querySelector("#add-personne-message");
    var error = false;
    message.text = '';
    if (nom.value.trim() == '') {
      message.text = 'Veuillez saisir le nom svp.';
      error = true;
    }
    
    if (prenom.value.trim() == '') {
      if(error){
          message.text = 'Veuillez saisir le nom et le prénom svp.';
      }
      else{
        message.text = 'Veuillez saisir le prénom svp.';
        error = true;
      }         
   }   
    
   if (!error) {
    var personne = new Personne();
      personne.nom = nom.value;
      personne.prenom = prenom.value;
      personne.idPersonne = '${nom} + ${prenom}';
      if (personnes.add(personne)) {
        message.text = 'added';
        personnes.order();
      } else {
        message.text = 'La personne existe déjà.';
      }
   }
  }
}