import 'package:unittest/unittest.dart';
import '../../lib/model/systeme_gestion_patient.dart';

testModel() {
  ConnexionBase model;
  group("Testing Model: ", () {
    setUp(() {
      model = new ConnexionBase();
      model.ouvrirUneConnexionBd();
    });

    tearDown(() {
      model.utilisateurs.clear();
      expect(model.utilisateurs.isEmpty, isTrue);
    });

    test('Display model', () {
      print(model.toJson());
    });
  });
}

main() {
  testModel();
}
