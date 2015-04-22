part of systeme_gestion_patient;

class Personne extends ConceptEntity<Personne> {

  String nom;
  String prenom;
  Problemes problemes = new Problemes();

  String get idPersonne => super.code;
  set idPersonne(String idPersonne) {
    if (code == null) {
      code = idPersonne;
    }
  }

  Personne newEntity() => new Personne();

  String toString() {
    return '  {\n ' '   nom: ${nom},' '   prenom: ${prenom}\n' '  }\n';
  }

  Map<String, Object> toJson() {
    Map<String, Object> entityMap = super.toJson();
    entityMap['nom'] = nom;
    entityMap['prenom'] = prenom;
    entityMap['idPersonne'] = idPersonne;
    entityMap['problemes'] = problemes.toJson();
    return entityMap;
  }

  fromJson(Map<String, Object> entityMap) {
    super.fromJson(entityMap);
    nom = entityMap['nom'];
    prenom = entityMap['prenom'];
    idPersonne = entityMap['idPersonne'];
    problemes.fromJson(entityMap['contacts']);
  }

}

class Personnes extends ConceptEntities<Personne> {

  Personnes newEntities() => new Personnes();
  Personne newEntity() => new Personne();

}
