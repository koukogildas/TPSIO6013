import 'package:unittest/unittest.dart';
import 'package:EXO6/dartlero_contacts_personne.dart';

testPersonneContacts() {
  Personne personne;
  group("Test Personne Contacts: ", () {
    setUp(() {
      Model_contacts_personne personneContactsModel =
          new Model_contacts_personne();
      personneContactsModel.init();
      Personnes personnes = personneContactsModel.personnes;
      personne = personnes.find('KoukoGildas');
    });
    tearDown(() {
      personne.contacts.clear();
      expect(personne.contacts.isEmpty, isTrue);
    });
    test('Add personne contact', () {
      var contact = new Contact();
      contact.idContact = 'kougil2@yahoo.fr418 268 7458';
      personne.contacts.add(contact);
      personne.contacts.display('Add personne contact');
    });
    test('Ajouter un contact sans données', () {
      var contact = new Contact();
      expect(contact, isNotNull);
      var added = personne.contacts.add(contact);
      expect(added, isTrue);
      personne.contacts.display('Ajout de contact sans données');
    });
    test('Ajouter un contact qui n\'est pas unique', () {
      var contact = new Contact();
      contact.idContact = 'kougil2@yahoo.fr418 268 7458';
      var added = personne.contacts.add(contact);
      expect(added, isFalse);
      personne.contacts.display('Ajout d\'un contact qui n\'est pas unique');
    });
    test('Trouver un contact par son code', () {
      var searchCode = 'kougil2@yahoo.fr418 268 7458';
      var contact = personne.contacts.find(searchCode);
      expect(contact, isNotNull);
      expect(contact.idContact, equals(searchCode));
      contact.display('Contact retrouvé par son code');
    });
    test('Contacts triés par code', () {
      personne.contacts.order();
      personne.contacts.display('Contacts triés par code');
    });
  });
}

main() {
  testPersonneContacts();
}
