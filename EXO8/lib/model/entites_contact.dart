part of dartlero_contacts_personne;

class Contact extends ConceptEntity<Contact> {

  String email;
  String telephone;

  String get idContact => super.code;
  set idContact(String idContact) {
    if (code == null) {
      code = '$email$telephone';
    }
  }

  Contact newEntity() => new Contact();

  String toString() {
    return '{\n email: ${email},' 'telephone: ${telephone}\n}\n';
  }

  Map<String, Object> toJson() {
    Map<String, Object> entityMap = super.toJson();
    entityMap['email'] = email;
    entityMap['telephone'] = telephone;
    entityMap['idContact'] = idContact;
    return entityMap;
  }

  fromJson(Map<String, Object> entityMap) {
    super.fromJson(entityMap);
    email = entityMap['email'];
    telephone = entityMap['telephone'];
    idContact = entityMap['idContact'];
  }
}

class Contacts extends ConceptEntities<Contact> {

  Contacts newEntities() => new Contacts();
  Contact newEntity() => new Contact();

}
