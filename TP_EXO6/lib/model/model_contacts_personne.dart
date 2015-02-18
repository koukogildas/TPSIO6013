part of dartlero_contacts_personne;

class Model_contacts_personne extends ConceptModel {

  static final String personne = 'personne';

  Map<String, ConceptEntities> newEntries() {
    var personnes = new Personnes();
    var map = new Map<String, ConceptEntities>();
    map[personne] = personnes;
    return map;
  }

  Personnes get personnes => getEntry(personne);

  init() {
    
    var webPersonne1 = new Personne();    
    webPersonne1.nom = 'Kouko';
    webPersonne1.prenom = 'Gildas';
    webPersonne1.code = 'KoukoGildas';
    
    var webPersonne2 = new Personne();    
    webPersonne2.nom = 'Emmanuelle';
    webPersonne2.prenom = 'Valin';  
    webPersonne2.code ='EmmanuelleValin';
   
    var webPersonneContacts1 = webPersonne1.contacts;
    
    var webPersonneContact1 = new Contact(); 
    webPersonneContact1.email = 'kougil@yahoo.fr';
    webPersonneContact1.telephone = '418 268 7458';
    webPersonneContact1.idContact = "kougil@yahoo.fr418 268 7458";
    
    var webPersonneContact2 = new Contact();   
    webPersonneContact2.email = 'kougil@yahoo.fr';
    webPersonneContact2.telephone = '418 268 7458';
    webPersonneContact2.code = 'kougil@yahoo.fr418 268 7458';
    
    webPersonneContacts1.add(webPersonneContact1);
    webPersonneContacts1.add(webPersonneContact2);
    
    var webPersonneContacts2 = webPersonne2.contacts;
    
    var webPersonneContact3 = new Contact(); 
    webPersonneContact3.email = 'kougil@yahoo.fr';
    webPersonneContact3.telephone = '418 268 7458';
    webPersonneContact3.code = 'kougil@yahoo.fr418 268 7458';
        
    var webPersonneContact4 = new Contact();   
    webPersonneContact4.email = 'kougil@yahoo.fr';
    webPersonneContact4.telephone = '418 268 7458';
    webPersonneContact4.code = 'kougil@yahoo.fr418 268 7458';
        
    webPersonneContacts2.add(webPersonneContact3);
    webPersonneContacts2.add(webPersonneContact4);    
    personnes.add(webPersonne1);
    personnes.add(webPersonne2);
    
  }

  display() {
    print('Model contacts personne');
    print('====================');
    for (var personne in personnes) {
      print('  Personne');
      print('  -----');
      print(personne.toString());
      print('    Contacts');
      print('    -----');
      for (var contact in personne.contacts) {
        print(contact.toString());
      }
    }
    print(
      '============= ============= ============= '
      '============= ============= ============= '
    );
  }

}
