part of dartlero_contacts_personne.dart;

class PersonneEdit{
  Personnes personnes;
  Personne personne;

  UpdatePersonne() {
    InputElement nom = querySelector('#edit-personne-nom');
    InputElement prenom = querySelector('#edit-personne-prenom');
    personne.nom = nom.value;
    personne.prenom = prenom.value;
    personnes.order(); // to see a new description in the list
    var personneTable = querySelector('#personne-table').xtag;
    personneTable.showPersonneEdit = false;
  }
}