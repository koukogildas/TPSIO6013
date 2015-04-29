import 'package:unittest/unittest.dart';
import '../../lib/model/systeme_gestion_patient.dart';

testUtilisateur() {
  ConnexionBase model;
  group("Testing Personnes: ", () {
    setUp(() {
      model = new ConnexionBase();
      model.ouvrirUneConnexionBd();
    });
    tearDown(() {
      model.utilisateurs.clear();
      expect(model.utilisateurs.isEmpty, isTrue);
    });
    test('Ajouter un utilisateur', () {
      var personne = new Utilisateur();
      personne.idPersonne = 'KoukoGildas';
      var patient = new Patient();
      personne.patients.add(patient);
      model.utilisateurs.add(personne);
      print("Ajouter un utilisateur et un  patient a l'utilisateur");
    });

    test('Trouver une personne par son code', () {
      var searchCode = 'GildasKouko';
      var personne = model.trouverUnUtilisateurById(searchCode);
      expect(personne, isNotNull);
      expect(personne.idPersonne, equals(searchCode));
      print('Trouver une personne par son code');
    });

    test('Trouver une personne par son username et son mot de passe', () {
      var personne = model.trouverUnUtilisateur('kougil', 'kougil');
      expect(personne, isNotNull);
      expect(personne.username, equals('kougil'));
      expect(personne.password, equals('kougil'));
      print('Trouver une personne par son username et son mot de passe');
    });

    test("Ordonner une liste d'utilisateur par son code", () {
      model.order();
      print('Ordonner une liste de personnes par son code');
    });

    test('Conversion de personnes en JSON', () {
      List<Map<String, Object>> json = model.toJson();
      expect(json, isNotNull);
      print(json);
    });
    test('de JSON à personnes', () {
      List<Map<String, Object>> json = model.toJson();
      model.utilisateurs.clear();
      expect(model.utilisateurs.isEmpty, isTrue);
      model.fromJson(json);
      expect(model.utilisateurs.isEmpty, isFalse);
      print('From JSON to categories');
    });
  });
}

main() {
  testUtilisateur();
}
