part of systeme_gestion_patient;

class Personne {
  String nom;
  String prenom;
  String idPersonne;

  String toString() {
    return '  {\n ' '   nom: ${nom},' '   prenom: ${prenom}\n' '  }\n';
  }
}

class Patient extends Personne {
  String nas;
  Problemes problemes = new Problemes();
}

@observable
class Utilisateur extends Personne {
  String password = '';
  String username = '';
  String type = '';
  @observable Patient patientCourant;
  @observable bool statutConnexion = false;
  @observable bool profilMedecin = false;
  @observable bool profilAdministrateur = false;
  @observable List<Patient> patients = new List<Patient>();

  definirPatientCourant(idPatient) {
    patientCourant = patients.firstWhere(
        (Patient p) => (p.idPersonne == idPatient), orElse: () => null);
  }

  Map<String, Object> toJson() {
    Map<String, Object> entityMap = new Map<String, Object>();
    entityMap['nom'] = nom;
    entityMap['prenom'] = prenom;
    entityMap['idPersonne'] = idPersonne;
    entityMap['password'] = password;
    entityMap['username'] = username;
    entityMap['patients'] = patients;
    entityMap['profilAdministrateur'] = profilAdministrateur;
    entityMap['profilMedecin'] = profilMedecin;
    entityMap['statutConnexion'] = statutConnexion;
    return entityMap;
  }

  fromJson(Map<String, Object> entityMap) {
    nom = entityMap['nom'];
    prenom = entityMap['prenom'];
    idPersonne = entityMap['idPersonne'];
    password = entityMap['password'];
    username = entityMap['username'];
    type = entityMap['type'];
    patients = entityMap['patients'];
    profilAdministrateur = entityMap['profilAdministrateur'];
    profilMedecin = entityMap['profilMedecin'];
    statutConnexion = entityMap['statutConnexion'];
  }
}
