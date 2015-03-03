import 'package:unittest/unittest.dart';
import 'package:EXO6/dartlero_contacts_personne.dart';

testPersonnes() {
  Personnes personnes;
  group("Testing Categories: ", () {
    setUp(() {
      Model_contacts_personne personneContactsModel =
          new Model_contacts_personne();
      personneContactsModel.init();
      personnes = personneContactsModel.personnes;
    });
    tearDown(() {
      personnes.clear();
      expect(personnes.isEmpty, isTrue);
    });
    test('Ajouter une personne', () {
      var personne = new Personne();
      personne.idPersonne = 'KoukoGildas';
      personnes.add(personne);
      personnes.display('Ajouter une personne');
    });
    test('Ajouter une personne sans données', () {
      var personne = new Personne();
      expect(personne, isNotNull);
      var added = personnes.add(personne);
      expect(added, isTrue);
      personnes.display('Ajouter une personne sans données');
    });
    test('Ajouter une personne non unique', () {
      var personne = new Personne();
      personne.idPersonne = 'Dart';
      var added = personnes.add(personne);
      expect(added, isFalse);
      personnes.display('Add not unique category');
    });
    test('Trouver une personne par son code', () {
      var searchCode = 'KoukoGildas';
      var personne = personnes.find(searchCode);
      expect(personne, isNotNull);
      expect(personne.idPersonne, equals(searchCode));
      personne.display('Trouver une personne par son code');
    });
    test('Ordonner une liste de personnes par son code', () {
      personnes.order();
      personnes.display('Ordonner une liste de personnes par son code');
    });

    test('Conversion de personnes en JSON', () {
      List<Map<String, Object>> json = personnes.toJson();
      expect(json, isNotNull);
      print(json);
    });
    test('de JSON à personnes', () {
      List<Map<String, Object>> json = personnes.toJson();
      personnes.clear();
      expect(personnes.isEmpty, isTrue);
      personnes.fromJson(json);
      expect(personnes.isEmpty, isFalse);
      personnes.display('From JSON to categories');
    });
  });
}

main() {
  testPersonnes();
}
