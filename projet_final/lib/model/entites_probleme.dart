part of systeme_gestion_patient;

class Probleme extends ConceptEntity<Probleme> {

  @observable String diagnostic = "";
  @observable String commentaire = "";
 

  String get idProbleme => super.code;
  set idProbleme(String idProbleme ) {
    if (code == null) {
      code = idProbleme ;
    }
  }

  Probleme newEntity() => new Probleme();

  String toString() {
    return '  {\n ' '   diagnostic: ${diagnostic},' '   commentaire: ${commentaire}\n' '  }\n';
  }

  Map<String, Object> toJson() {
    Map<String, Object> entityMap = super.toJson();
    entityMap['diagnostic'] = diagnostic;
    entityMap['commentaire'] = commentaire;
    entityMap['idPersonne'] = idProbleme;
//    entityMap['problemes'] = problemes.toJson();
    return entityMap;
  }

  fromJson(Map<String, Object> entityMap){
    super.fromJson(entityMap);
    diagnostic = entityMap['diagnostic'];
    commentaire = entityMap['commentaire'];
    idProbleme  = entityMap['idProbleme'];
//    problemes.fromJson(entityMap['problemes']);
  }

}

class Problemes extends ConceptEntities<Probleme> {

  Problemes newEntities() => new Problemes();
  Probleme newEntity() => new Probleme();

}
