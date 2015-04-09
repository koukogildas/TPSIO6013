import 'package:unittest/unittest.dart';
import '../../lib/dartlero_contacts_personne.dart';

testModel() {
  Model_contacts_personne personneContactsModel = new Model_contacts_personne();
  Personnes personnes;
  group("Testing Model: ", () {
    
    setUp(() {
      personneContactsModel = new Model_contacts_personne();
      personneContactsModel.init();
      personnes = personneContactsModel.personnes;
    });
    
    tearDown(() {
      personnes.clear();
      expect(personnes.isEmpty, isTrue);
    });
    
    test('Display model', () {
      personneContactsModel.display();
    });
    
  });
}

main() {
  testModel();
}
