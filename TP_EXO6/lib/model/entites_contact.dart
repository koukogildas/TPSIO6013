/*
  Titre:     Entité Contact
  Auteur:    Gildas Kouko
  Influence: Dzenan Ridjanovic 
  Création:  12-02-2015
*/

part of dartlero_contacts_personne;

class Contact extends ConceptEntity<Contact> {
  
  // Attributs
  String email;
  String telephone;
  
  // Propriétés 
  String get idContact => super.code;
  set idContact(String idContact){
    if(code == null){
      code = '$email$telephone';
    }
  }

  // Constructeur
  Contact newEntity() => new Contact(); 
  
  // Surchage de la fonction ToString()
  String toString() {
     return '{\n email: ${email},'
              'telephone: ${telephone}\n}\n';
   }
  
   Map<String, Object> toJson() {
      Map<String, Object> entityMap = super.toJson();
      entityMap['email'] = email;
      entityMap['telephone'] = telephone;
      return entityMap;
    }
   
   fromJson(Map<String, Object> entityMap) {
      super.fromJson(entityMap);
      email = entityMap['email'];
      telephone = entityMap['telephone'];
    }
 
}

class Contacts extends ConceptEntities<Contact> {
  
  Contacts newEntities() => new Contacts();
  Contact newEntity() => new Contact();

}
