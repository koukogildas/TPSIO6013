part of systeme_gestion_patient;

class Probleme extends ConceptEntity<Probleme> {

  String diagnostic;
  String commentaire;
 

  String get idPersonne => super.code;
  set idProbleme(String idPersonne) {
    if (code == null) {
      code = idPersonne;
    }
  }

  Personne newEntity() => new Personne();

  String toString() {
    return '  {\n ' '   nom: ${diagnostic},' '   commentaire: ${commentaire}\n' '  }\n';
  }

  Map<String, Object> toJson() {
    Map<String, Object> entityMap = super.toJson();
    entityMap['diagnostic'] = diagnostic;
    entityMap['commentaire'] = commentaire;
    entityMap['idPersonne'] = idPersonne;
//    entityMap['problemes'] = problemes.toJson();
    return entityMap;
  }

  fromJson(Map<String, Object> entityMap){
    super.fromJson(entityMap);
    diagnostic = entityMap['diagnostic'];
    commentaire = entityMap['commentaire'];
    idPersonne = entityMap['idPersonne'];
//    problemes.fromJson(entityMap['problemes']);
  }

}

class Problemes extends ConceptEntities<Probleme> {

  Problemes newEntities() => new Problemes();
  Probleme newEntity() => new Probleme();

}
