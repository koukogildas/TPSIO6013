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
  @observable  bool statutConnexion = false;
  @observable  bool profilMedecin = false;
  @observable  bool profilAdministrateur = false;
  @observable List<Patient> patients = new List<Patient>();
}
