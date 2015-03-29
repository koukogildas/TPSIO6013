import 'package:EXO8/dartlero_contacts_personne.dart';
import 'package:polymer/polymer.dart';
import 'dart:html';

@CustomTag('personne-add')
class PersonneAdd extends PolymerElement {

  @published Personnes personnes;
  @published Personne personne;

  InputElement nom, prenom;
  Element message;

  PersonneAdd.created() : super.created();

  addPersonne(Event e, var detail, Node target) {
    var error = false;
    message = shadowRoot.querySelector("#add-personne-message");
    nom = shadowRoot.querySelector("#add-personne-nom");
    prenom = shadowRoot.querySelector("#add-personne-prenom");
    message.text = '';

    if (nom.value.isEmpty) {
      message.text = 'Veuillez saisir un nom svp.';
      error = true;
    }

    if (prenom.value.isEmpty) {
      if (error) {
        message.text = 'Veuillez saisir un nom et un prénom svp.';
      } else {
        message.text = 'Veuillez saisir un prénom svp.';
        error = true;
      }
    }

    if (!error) {
      var personne = new Personne();
      personne.nom = nom.value;
      personne.prenom = prenom.value;
      personne.idPersonne = '${nom} + ${prenom}';
      personne.contacts = new Contacts();
      if (personnes.add(personne)) {
        message.text = 'La personne est ajoutée.';
        personnes.order();
        message.text = "";
        nom.value = "";
        prenom.value = "";
      } else {
        message.text = 'La personne existe déjà.';
      }
    }
  }
}
