part of systeme_gestion_patient;

class Personne {
  @observable String nom = "";
  @observable String prenom = "";
  String idPersonne;

  String toString() {
    return '  {\n ' '   nom: ${nom},' '   prenom: ${prenom}\n' '  }\n';
  }
}

class Patient extends Personne {
  @observable String nas = "";
  @observable Problemes problemes = new Problemes();

  Map<String, Object> toJson() {
    Map<String, Object> entityMap = new Map<String, Object>();
    entityMap['nom'] = nom;
    entityMap['prenom'] = prenom;
    entityMap['idPersonne'] = idPersonne;
    entityMap['nas'] = nas;
    entityMap['problemes'] = problemes.toJson();
    return entityMap;
  }

  fromJson(Map<String, Object> entityMap) {
    nom = entityMap['nom'];
    prenom = entityMap['prenom'];
    idPersonne = entityMap['idPersonne'];
    nas = entityMap['nas'];
    problemes = problemes.fromJson(entityMap['problemes']);
  }
}

//@observable
class Utilisateur extends Personne {
  @observable String password = '';
  @observable String username = '';
  @observable String type = '';
  @observable Patient patientCourant;
  @observable bool statutConnexion = false;
  @observable bool profilMedecin = false;
  @observable bool profilAdministrateur = false;
  @observable String profil = "Médecin";
  @observable List<Patient> patients = new List<Patient>();

  definirPatientCourant(String idPatient) {
    patientCourant = patients.firstWhere(
        (Patient p) => (p.idPersonne == idPatient), orElse: () => null);
//    if( patientCourant== null){
//
//    }
  }
  int compareTo(Utilisateur utlisateur) {
      if (utlisateur.idPersonne != null) {
        return idPersonne.compareTo(utlisateur.idPersonne);
      }
  }
  Patient trouverUnPatient(String idPatient) {
    return patients.firstWhere((Patient p) => (p.idPersonne == idPatient),
        orElse: () => null);
  }

  Map<String, Object> toJson() {
    Map<String, Object> entityMap = new Map<String, Object>();
    entityMap['nom'] = nom;
    entityMap['prenom'] = prenom;
    entityMap['idPersonne'] = idPersonne;
    entityMap['password'] = password;
    entityMap['username'] = username;
    entityMap['patients'] = PatientToJson();
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
    PatientFromJson(entityMap['patients']);
    profilAdministrateur = entityMap['profilAdministrateur'];
    profilMedecin = entityMap['profilMedecin'];
    statutConnexion = entityMap['statutConnexion'];
  }

  List<Map<String, Object>> PatientToJson() {
    List<Map<String, Object>> entityList = new List<Map<String, Object>>();
    for (Patient patient in patients) {
      entityList.add(patient.toJson());
    }
    return entityList;
  }

  PatientFromJson(List<Map<String, Object>> entityList) {
    for (Map<String, Object> entityMap in entityList) {
      Patient patient = toObservable(new Patient());
      patient.fromJson(entityMap);
      patients.add(patient);
    }
  }
}
