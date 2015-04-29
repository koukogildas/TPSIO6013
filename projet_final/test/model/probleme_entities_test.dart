import 'package:unittest/unittest.dart';
import '../../lib/model/systeme_gestion_patient.dart';

testProblemePatients() {
  Patient personne;
  ConnexionBase model;

  group("Test Personne Contacts: ", () {
    setUp(() {
      model = new ConnexionBase();
      model.ouvrirUneConnexionBd();
      personne = model
          .trouverUnUtilisateurById('GildasKouko')
          .trouverUnPatient("prblemetest");
    });

    tearDown(() {
      personne.problemes.clear();
      expect(personne.problemes.isEmpty, isTrue);
    });

    test('Add personne probleme', () {
      var probleme = new Probleme();
      probleme.idProbleme = 'kougil2@yahoo.fr418-268-7458';
      personne.problemes.add(probleme);
      personne.problemes.display('Add personne contact');
    });

    test('Ajouter un problème sans données', () {
      var probleme = new Probleme();
      expect(probleme, isNotNull);
      var added = personne.problemes.add(probleme);
      expect(added, isTrue);
      personne.problemes.display('Ajout de problème sans données');
    });

    test('Ajouter un probleme qui n\'est pas unique', () {
      var probleme = new Probleme();
      probleme.idProbleme = 'kougil2@yahoo.fr418-268-5897';
      personne.problemes.add(probleme);
      var added = personne.problemes.add(probleme);
      expect(added, isFalse);
      personne.problemes.display('Ajout d\'un contact qui n\'est pas unique');
    });

    test('Trouver un contact par son code', () {
      var searchCode = 'kougil2@yahoo.fr418-268-5897';
      var probleme = personne.problemes.find(searchCode);
      expect(probleme, isNotNull);
      expect(probleme.idProbleme, equals(searchCode));
      probleme.display('Contact retrouvé par son code');
    });

    test('Contacts triés par code', () {
      personne.problemes.order();
      personne.problemes.display('Contacts triés par code');
    });
  });
}

main() {
  testProblemePatients();
}
