part of systeme_gestion_patient;

class Probleme extends ConceptEntity<Probleme> {
  @observable String diagnostic = "";
  @observable String commentaire = "";

  String get idProbleme => super.code;
  set idProbleme(String idProbleme) {
    if (code == null) {
      code = idProbleme;
    }
  }

  Probleme newEntity() => toObservable(new Probleme());

  String toString() {
    return '  {\n ' '   diagnostic: ${diagnostic},' '   commentaire: ${commentaire}\n' '  }\n';
  }

  Map<String, Object> toJson() {
    Map<String, Object> entityMap = super.toJson();
    entityMap['diagnostic'] = diagnostic;
    entityMap['commentaire'] = commentaire;
    entityMap['idPersonne'] = idProbleme;
    return entityMap;
  }

  fromJson(Map<String, Object> entityMap) {
    super.fromJson(entityMap);
    diagnostic = entityMap['diagnostic'];
    commentaire = entityMap['commentaire'];
    idProbleme = entityMap['idProbleme'];
  }
}

class Problemes extends ConceptEntities<Probleme> {
  Problemes newEntities() => toObservable(new Problemes());
  Probleme newEntity() => toObservable(new Probleme());
}
